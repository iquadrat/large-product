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

#if WORKGROUP_SIZE > 128
  // local memory reduction
  if (lid >= 128) {
    exponents[lid - 128] = exponent;
    products[lid - 128] = product;
  }
  barrier(CLK_LOCAL_MEM_FENCE);
#endif

#if WORKGROUP_SIZE > 64
  if(lid < 128) {
    exponents[lid] = exponent + exponents[lid];
    products[lid]  = product * products[lid];
  }
  barrier(CLK_LOCAL_MEM_FENCE);
#endif

  // wavefront reduction
  int i = 64;
  for(; i > 0; i /= 2) {
    if (lid < i) {
      exponents[lid] += exponents[lid + i];
      products[lid]  *= products[lid + i];
    }
  }
}


__kernel
//__attribute__((reqd_work_group_size(256, 1, 1)))
void prod_diff_realrealvec(
        const int32_t offset,
        __global const double *x,
        __global const double *y,
        __global struct LargeProduct *g_prodX,
        __global struct LargeProduct *g_prodY
) {
  if (get_group_id(0) == offset / BLOCK_SIZE) {
    // This block is skipped and processed by separate kernel in the next iteration.
    return;
  }

  const uint32_t r = get_global_id(0);
  const uint32_t lid = get_local_id(0);

  double prodX = 1.0;
  double prodY = 1.0;
  int32_t exponentX = 0;
  int32_t exponentY = 0;

  prodX *= x[r] - x[offset];
  prodY *= y[r] - x[offset];

  exponentX += normalize_exponent(&prodX);
  exponentY += normalize_exponent(&prodY);

  __local int32_t exponents[WORKGROUP_SIZE / 2];
  __local double products[WORKGROUP_SIZE / 2];

  horizontal_reduce(exponents, products, exponentX, prodX);
  if (lid == 0) {
    exponentX = exponents[0];
    prodX = products[0];
  }
  barrier(CLK_LOCAL_MEM_FENCE);

  horizontal_reduce(exponents, products, exponentY, prodY);
  if (lid == 0) {
    exponentY = exponents[0];
    prodY = products[0];

    exponentX += normalize_exponent(&prodX);
    exponentY += normalize_exponent(&prodY);

    atomic_mul(&g_prodX[offset].prod, prodX);
    atomic_mul(&g_prodY[offset].prod, prodY);
    atomic_add(&g_prodX[offset].exponent, exponentX);
    atomic_add(&g_prodY[offset].exponent, exponentY);
  }
}