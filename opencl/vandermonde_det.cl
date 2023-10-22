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
//const uint32_t WAVEFRONT_SIZE = 64;

typedef union {
    uint64_t u64;
    double f64;
} double_cast;

int32_t normalize_exponent(double* prod) {
  double_cast* cast_prod = (double_cast*)prod;
  int32_t exponent = (((*cast_prod).u64 & EXPONENT_MASK) >> 52) - EXPONENT_BIAS;
  (*cast_prod).u64 = ((*cast_prod).u64 & ~EXPONENT_MASK) | EXPONENT_RESET_MASK;
  return exponent;
//return 0;
}

#pragma OPENCL EXTENSION cl_khr_int64_base_atomics : enable
void atomic_mul(volatile __global double *source, const double mul) {
    double_cast prev, updated;
    do {
        prev.f64 = *source;
        updated.f64 = prev.f64 * mul;
    } while(atom_cmpxchg((volatile __global uint64_t*)source, prev.u64, updated.u64) != prev.u64);
}

__kernel void prod_normalize(
        __global struct LargeProduct *g_prod1,
        __global struct LargeProduct *g_prod2
) {
  double prod1 = g_prod1->prod;
  double prod2 = g_prod2->prod;

  int32_t exponent1 = normalize_exponent(&prod1);
  int32_t exponent2 = normalize_exponent(&prod2);

  g_prod1->prod = prod1;
  g_prod1->exponent += exponent1;

  g_prod2->prod = prod2;
  g_prod2->exponent += exponent2;
}


__kernel __attribute__((reqd_work_group_size(WORKGROUP_SIZE, 1, 1)))
void prod_diff_realrealvec(
        const int32_t k,
        const double u1,
        const double u2,
        __global const double *x,
        __global struct LargeProduct *g_prod1,
        __global struct LargeProduct *g_prod2
) {
  const uint32_t lid = get_local_id(0);

  int32_t group_offset = get_group_id(0) * WORKGROUP_SIZE * MULS_PER_EXPONENT_EXTRACTION;

  double prod1 = 1.0;
  double prod2 = 1.0;

  // TODO: Handle case where N is not a multiple of MULS_PER_EXPONENT_EXTRACTION
  for(int i = 0; i < MULS_PER_EXPONENT_EXTRACTION; i++) {
      int64_t offset = group_offset + i * WORKGROUP_SIZE + lid;
//    int64_t offset = group_offset + lid * MULS_PER_EXPONENT_EXTRACTION + i;
      if (offset != k) {
          prod1 *= u1 - x[offset];
          prod2 *= u2 - x[offset];
      }
  }

  int32_t exponent1 = normalize_exponent(&prod1);
  int32_t exponent2 = normalize_exponent(&prod2);

  __local int32_t exponents[WORKGROUP_SIZE];
  __local double products[WORKGROUP_SIZE];
  exponents[lid] = exponent1;
  products[lid] = prod1;

  barrier(CLK_LOCAL_MEM_FENCE);

  // local memory reduction
  int i = WORKGROUP_SIZE/2;
  for(; i>/*WAVEFRONT_SIZE*/0; i /= 2) {
    if(lid < i) {
      exponents[lid] += exponents[lid + i];
      products[lid]  *= products[lid + i];
    }
    barrier(CLK_LOCAL_MEM_FENCE);
  }
//  int32_t e = exponents[lid] + exponents[lid + 1];
//  double p = products[lid] * products[lid + 1];

  // wavefront reduction
//  for(; i>0; i /= 2) {
//    if(lid < i)
//      localBuffer[lid] = res = res + localBuffer[lid + i];
//  }

  if (lid == 0 && get_group_id(0) == 0) {
    prod1 = products[0];
    exponent1 = exponents[0] + normalize_exponent(&prod1);

//    g_prod1->prod = prod1;
//    g_prod2->prod = prod2;
//    g_prod1->exponent = exponent1;
//    g_prod2->exponent = exponent2;
    atomic_mul(&g_prod1->prod, prod1);
    atomic_mul(&g_prod2->prod, prod2);
    atomic_add(&g_prod1->exponent, exponent1);
    atomic_add(&g_prod2->exponent, exponent2);
  }
}