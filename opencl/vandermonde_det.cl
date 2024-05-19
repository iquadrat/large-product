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


__kernel
__attribute__((reqd_work_group_size(BLOCK_V, 1, 1)))
void prod_diff_realrealvec(
        const int32_t v_start,
        __global const double *x,
        __global const double *y,
        __global struct LargeProduct *g_prodX,
        __global struct LargeProduct *g_prodY
) {
  uint32_t gid = get_global_id(0);
  const uint32_t lid = get_local_id(0);

  __local double x_r[BLOCK_V];
  __local double y_r[BLOCK_V];

  uint32_t h_start = get_group_id(0) * BLOCK_H;

  if (get_group_id(0) == v_start / BLOCK_H) {
    // This block is skipped and processed by separate kernel in the next iteration.
    return;
  }


  x_r[lid] = x[h_start + lid];
  y_r[lid] = y[h_start + lid];

  barrier(CLK_LOCAL_MEM_FENCE);

  double prodX = 1.0; // TODO: directly assign to x[offset]
  double prodY = 1.0;
  int32_t exponentX = 0;
  int32_t exponentY = 0;

  uint32_t v = v_start + lid;
  double x_v = x[v];
  double y_v = y[v];

  for(int i = 0; i < BLOCK_H; ++i) {
    prodX *= x_r[i] - x_v;
    prodY *= x_r[i] - y_v;

    if ((i+1) % MULS_PER_EXPONENT_EXTRACTION == 0) {
      exponentX += normalize_exponent(&prodX);
      exponentY += normalize_exponent(&prodY);
    }
  }

  exponentX += atomic_mul_normalize(&g_prodX[v].prod, prodX);
  exponentY += atomic_mul_normalize(&g_prodY[v].prod, prodY);
  atomic_add(&g_prodX[v].exponent, exponentX);
  atomic_add(&g_prodY[v].exponent, exponentY);
}