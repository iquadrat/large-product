typedef uchar uint8_t ;
typedef char int8_t ;
typedef ushort uint16_t;
typedef short int16_t;
typedef uint  uint32_t;
typedef int   int32_t;
typedef ulong uint64_t;
typedef long  int64_t;




const int64_t MULS_PER_EXPONENT_EXTRACTION = 16;
const uint64_t EXPONENT_MASK = 0x7ff0000000000000ULL;
const unit64_t EXPONENT_RESET_MASK = 0x3ff0000000000000ULL;
const int32_t EXPONENT_BIAS = 1023;

void normalize_exponent(double& prod, int32_t& exponent) {
    uint64_t i_prod = ((uint64_t)prod);
    double cleared_exponent = (i_prod & ~EXPONENT_MASK);
    exponent += ((i_prod & EXPONENT_MASK) >> 52) - EXPONENT_BIAS;
    prod = (double)(cleared_exponent | EXPONENT_RESET_MASK);
}

#pragma OPENCL EXTENSION cl_khr_int64_base_atomics : enable
void atomic_mul(volatile __global double *source, const double mul) {
    union {
        unsigned uint64_t u64;
        double f64;
    } prev, updated;
    do {
        prev.f64 = *source;
        updated.f64 = prev.f64 * mul;
    } while(atom_cmpxchg((volatile __global uint64_t*)source, prev.u64, updated.u64) != prev.u64);
}

__kernel void prod_diff_realrealvec_reference(
        const int32_t k,
        const double u1,
        const double u2,
        __global const double *x,
        __global double *g_prod1,
        __global double *g_prod2,
        __global int32_t int *g_exponent1,
        __global int32_t int *g_exponent2
) {
  int32_t group_offset = get_group_id(0) * get_local_size(0) * MULS_PER_EXPONENT_EXTRACTION;

  double prod1 = 1.0;
  double prod2 = 1.0;
  int32_t exponent1 = 0;
  int32_t exponent2 = 0;

  // TODO: Handle case where N is not a multiple of MULS_PER_EXPONENT_EXTRACTION
  for(int i = 0; i < MULS_PER_EXPONENT_EXTRACTION; i++) {
      int64_t offset = group_offset + i * get_local_size(0) + get_local_id(0);
      if (offset != k) {
          prod1 *= u1 - x[offset];
          prod2 *= u2 - x[offset];
      }
  }

  normalize_exponent(prod1, exponent1);
  normalize_exponent(prod2, exponent2);

  atomic_mul(g_prod1, prod1);
  atomic_mul(g_prod2, prod2);
  atomic_add(g_exponent1, exponent1);
  atomic_add(g_exponent2, exponent2);
}