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

__kernel void prod_diff_realrealvec(
        const int32_t k,
        const double u1,
        const double u2,
        __global const double *x,
        __global struct LargeProduct *g_prod1,
        __global struct LargeProduct *g_prod2
) {
  int32_t group_offset = get_group_id(0) * get_local_size(0) * MULS_PER_EXPONENT_EXTRACTION;

  double prod1 = 1.0;
  double prod2 = 1.0;

  // TODO: Handle case where N is not a multiple of MULS_PER_EXPONENT_EXTRACTION
  for(int i = 0; i < 1; i++) {
      int64_t offset = group_offset + i * get_local_size(0) + get_local_id(0);
      if (offset != k) {
          prod1 *= u1 - x[offset];
          prod2 *= u2 - x[offset];
      }
  }

  int32_t exponent1 = normalize_exponent(&prod1);
  int32_t exponent2 = normalize_exponent(&prod2);

  if (get_global_id(0) == 0) {
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