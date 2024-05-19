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
int32_t atomic_mul_normalize(volatile __global double *source, const double mul) {
  double_cast prev, updated;
  int32_t exponent;
  do {
    prev.f64 = *source;
    double tmp = prev.f64 * mul;
    exponent = normalize_exponent(&tmp);
    updated.f64 = tmp;
  } while(atom_cmpxchg((volatile __global uint64_t*)source, prev.u64, updated.u64) != prev.u64);
  return exponent;
}

void horizontal_reduce(__local int32_t* exponents, __local double* products, int32_t exponent, double product) {
  const uint32_t lid = get_local_id(0);

  // local memory reduction
  if (lid >= WORKGROUP_SIZE/2) {
    exponents[lid - WORKGROUP_SIZE/2] = exponent;
    products[lid - WORKGROUP_SIZE/2] = product;
  }
  barrier(CLK_LOCAL_MEM_FENCE);

  if (lid < WORKGROUP_SIZE/2) {
    exponents[lid] = exponent + exponents[lid];
    products[lid]  = product * products[lid];
  }
  barrier(CLK_LOCAL_MEM_FENCE);

  // wavefront reduction
  int i = WORKGROUP_SIZE / 4;
  for(; i > 0; i /= 2) {
    if (lid < i) {
      exponents[lid] += exponents[lid + i];
      products[lid]  *= products[lid + i];
    }
  }
}


__kernel
__attribute__((reqd_work_group_size(BLOCK_SIZE, 1, 1)))
void prod_diff_realrealvec(
        const int32_t start_offset,
        __global const double *x,
        __global const double *y,
        __global struct LargeProduct *g_prodX,
        __global struct LargeProduct *g_prodY
) {
  if (get_group_id(0) == start_offset / BLOCK_SIZE) {
    // This block is skipped and processed by separate kernel in the next iteration.
    return;
  }

  uint32_t gid = get_global_id(0);
  const uint32_t lid = get_local_id(0);

//  __local int32_t exponents[WORKGROUP_SIZE / 2];
//  __local double products[WORKGROUP_SIZE / 2];

  __local double x_r[WORKGROUP_SIZE];
  __local double y_r[WORKGROUP_SIZE];

  x_r[lid] = x[gid];
  y_r[lid] = y[gid];

  barrier(CLK_LOCAL_MEM_FENCE);

  double prodX = 1.0;
  double prodY = 1.0;
  int32_t exponentX = 0;
  int32_t exponentY = 0;

  uint32_t offset = start_offset + lid;

  double x_offset = x[offset];
  double y_offset = y[offset];

  for(int i = 0; i < BLOCK_SIZE; ++i) {
    prodX *= x_r[i] - x_offset;
    prodY *= x_r[i] - y_offset;

    if ((i+1) % MULS_PER_EXPONENT_EXTRACTION == 0) {
      exponentX += normalize_exponent(&prodX);
      exponentY += normalize_exponent(&prodY);
    }
  }

  exponentX += atomic_mul_normalize(&g_prodX[offset].prod, prodX);
  exponentY += atomic_mul_normalize(&g_prodY[offset].prod, prodY);
  atomic_add(&g_prodX[offset].exponent, exponentX);
  atomic_add(&g_prodY[offset].exponent, exponentY);
}