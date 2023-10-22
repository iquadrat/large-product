typedef uchar  uint8_t;
typedef char   int8_t;
typedef ushort uint16_t;
typedef short  int16_t;
typedef uint   uint32_t;
typedef int    int32_t;
typedef ulong  uint64_t;
typedef long   int64_t;


const uint64_t EXPONENT_MASK = 0x7ff0000000000000ULL;
const uint64_t EXPONENT_RESET_MASK = 0x3ff0000000000000ULL;
const int32_t EXPONENT_BIAS = 1023;
const uint32_t WAVEFRONT_SIZE = 64;

typedef union {
    uint64_t u64;
    double f64;
} double_cast;

//#define NORMALIZE_EXPONENT_USING_FREXP

int32_t normalize_exponent(double* prod) {
#ifdef NORMALIZE_EXPONENT_USING_FREXP
  int32_t exponent;
  *prod = frexp(*prod, &exponent);
#else
  double_cast* cast_prod = (double_cast*)prod;
  int32_t exponent = (((*cast_prod).u64 & EXPONENT_MASK) >> 52) - EXPONENT_BIAS;
  (*cast_prod).u64 = ((*cast_prod).u64 & ~EXPONENT_MASK) | EXPONENT_RESET_MASK;
#endif
  return exponent;
}

__kernel void prod_divide(
        __global struct LargeProduct *g_prod1_array,
        __global struct LargeProduct *g_prod2_array
) {
  int32_t gid = get_global_id(0);
  __global struct LargeProduct* g_prod1 = &g_prod1_array[gid];
  __global struct LargeProduct* g_prod2 = &g_prod2_array[gid];

  double prod = g_prod1->prod / g_prod2->prod;
  int32_t exponent = g_prod1->exponent - g_prod2->exponent;
  exponent += normalize_exponent(&prod);

  g_prod1->prod = prod;
  g_prod1->exponent = exponent;

  g_prod2->prod = 1.0;
  g_prod2->exponent = 0;
}

#pragma OPENCL EXTENSION cl_khr_int64_base_atomics : enable
void atomic_mul(volatile __global double *source, const double mul) {
  double_cast prev, updated;
  do {
    prev.f64 = *source;
    updated.f64 = prev.f64 * mul;
  } while(atom_cmpxchg((volatile __global uint64_t*)source, prev.u64, updated.u64) != prev.u64);
}

void horizontal_reduce(__local int32_t* exponents, __local double* products, int32_t exponent, double product) {
  const uint32_t lid = get_local_id(0);

  // local memory reduction
  if (lid >= 128) {
    exponents[lid - 128] = exponent;
    products[lid - 128] = product;
  }
  barrier(CLK_LOCAL_MEM_FENCE);

  if(lid < 128) {
    exponents[lid] = exponent + exponents[lid];
    products[lid]  = product * products[lid];
  }
  barrier(CLK_LOCAL_MEM_FENCE);

  // wavefront reduction
  int i = 64;
  for(; i>0; i /= 2) {
    if(lid < i) {
      exponents[lid] += exponents[lid + i];
      products[lid]  *= products[lid + i];
    }
  }
}


__kernel __attribute__((reqd_work_group_size(256, 1, 1)))
void prod_diff_realrealvec(
        const int32_t k,
        const double u1,
        const double u2,
        __global const double *x,
        __global struct LargeProduct *g_prod1,
        __global struct LargeProduct *g_prod2,
        int32_t kWorkGroup
) {
  int32_t m = get_global_id(1);
  int32_t group_offset = VECTOR_SIZE * m + get_group_id(0) * WORKGROUP_SIZE * ELEMENTS_PER_WORKITEM;
  const uint32_t lid = get_local_id(0);

  double prod1 = 1.0;
  double prod2 = 1.0;
  int32_t exponent1 = 0;
  int32_t exponent2 = 0;

  // TODO: Handle case where N is not a multiple of MULS_PER_EXPONENT_EXTRACTION
  if (get_group_id(0) != kWorkGroup) {
    for (int j = 0; j < ELEMENTS_PER_WORKITEM / MULS_PER_EXPONENT_EXTRACTION; ++j) {
      for (int i = 0; i < MULS_PER_EXPONENT_EXTRACTION; i++) {
        int32_t offset = group_offset + j * MULS_PER_EXPONENT_EXTRACTION * WORKGROUP_SIZE + i * WORKGROUP_SIZE + lid;
        prod1 *= u1 - x[offset];
        prod2 *= u2 - x[offset];
        offset += WORKGROUP_SIZE;
      }

      exponent1 += normalize_exponent(&prod1);
      exponent2 += normalize_exponent(&prod2);
    }
  } else {
    for (int j = 0; j < ELEMENTS_PER_WORKITEM / MULS_PER_EXPONENT_EXTRACTION; ++j) {
      for (int i = 0; i < MULS_PER_EXPONENT_EXTRACTION; i++) {
        int32_t offset = group_offset + j * MULS_PER_EXPONENT_EXTRACTION * WORKGROUP_SIZE + i * WORKGROUP_SIZE + lid;
        if (offset != k) {
          prod1 *= u1 - x[offset];
          prod2 *= u2 - x[offset];
        }
        offset += WORKGROUP_SIZE;
      }

      exponent1 += normalize_exponent(&prod1);
      exponent2 += normalize_exponent(&prod2);
    }
  }


  __local int32_t exponents[WORKGROUP_SIZE / 2];
  __local double products[WORKGROUP_SIZE / 2];

  horizontal_reduce(exponents, products, exponent1, prod1);
  if (lid == 0) {
    exponent1 = exponents[0];
    prod1 = products[0];
  }
  barrier(CLK_LOCAL_MEM_FENCE);

  horizontal_reduce(exponents, products, exponent2, prod2);
  if (lid == 0) {
    exponent2 = exponents[0];
    prod2 = products[0];

    exponent1 += normalize_exponent(&prod1);
    exponent2 += normalize_exponent(&prod2);

    atomic_mul(&g_prod1[m].prod, prod1);
    atomic_mul(&g_prod2[m].prod, prod2);
    atomic_add(&g_prod1[m].exponent, exponent1);
    atomic_add(&g_prod2[m].exponent, exponent2);
  }
}