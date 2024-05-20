typedef uchar  uint8_t;
typedef char   int8_t;
typedef ushort uint16_t;
typedef short  int16_t;
typedef uint   uint32_t;
typedef int    int32_t;
typedef ulong  uint64_t;
typedef long   int64_t;

#define ATOMIC_GLOBAL_UPDATE

#define VANDERMONDE_DET_EXPONENT_BASIS_LOG (log(2.0))

const uint64_t EXPONENT_MASK = 0x7ff0000000000000ULL;
const uint64_t EXPONENT_RESET_MASK = 0x3ff0000000000000ULL;
const int32_t EXPONENT_BIAS = 1023;
const uint32_t WAVEFRONT_SIZE = 64;

typedef union {
    uint64_t u64;
    double f64;
} double_cast;

#define NORMALIZE_EXPONENT_USING_FREXP

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

  double prod = g_prod1->significand / g_prod2->significand;
  int32_t exponent = g_prod1->exponent - g_prod2->exponent;
  exponent += normalize_exponent(&prod);

  g_prod1->significand = prod;
  g_prod1->exponent = exponent;

  g_prod2->significand = 1.0;
  g_prod2->exponent = 0;
}

#pragma OPENCL EXTENSION cl_khr_int64_base_atomics : enable
int32_t atomic_mul_normalize(volatile __global double *source, const double mul) {
#ifdef ATOMIC_GLOBAL_UPDATE
  double_cast prev, updated;
  int32_t exponent;
  do {
    prev.f64 = *source;
    double tmp = prev.f64 * mul;
    exponent = normalize_exponent(&tmp);
    updated.f64 = tmp;
  } while(atom_cmpxchg((volatile __global uint64_t*)source, prev.u64, updated.u64) != prev.u64);
  return exponent;
#else
  double tmp = *source * mul;
  int32_t exponent = normalize_exponent(&tmp);
  *source = tmp;
  return exponent;
#endif
}

#define SPECIAL_GROUPS 1


bool decide_metropolis(const double delta_e, const double newpos, const double deltapos) {
  if (delta_e >= 0) {
    return true;
  } else {
    // Boltzmann weight: exp(delta_e), delta_e is negative if the new position has higher energy
//        double r = distu(random);
//        if (r<exp(delta_e)) {
//          return true;
//        }
  }
  return false;
}

double potential_energy_combi(const double posold, const double posnew) {
    // gives deltaE = -N (V(posnew)-V(posold))
    return posold - posnew;
}

bool should_move_particle(int32_t v, double oldpos, double newpos, const struct LargeProduct prodOld, const struct LargeProduct prodNew, __global double* deltaE) {
    if (newpos <= 0) {
      deltaE[v] = 0;
      return false;
    }

    double division = fabs(prodNew.significand / prodOld.significand);
    double logdivision = log(division) + (prodNew.exponent - prodOld.exponent) * VANDERMONDE_DET_EXPONENT_BASIS_LOG;
    double logfactor = log(newpos / oldpos);
    double delta_e = potential_energy_combi(oldpos, newpos) + PARAM_A * logfactor + logdivision * 2.0; // factor 2 to square the Vandermonde
    deltaE[v] = delta_e;
    return decide_metropolis(delta_e, newpos, newpos - oldpos);
}

void horizontal_reduce(__local int32_t* exponents, __local double* products, int32_t exponent, double product) {
  const uint32_t lid = get_local_id(0);

  // local memory reduction
  if (lid >= BLOCK_V/2) {
    exponents[lid - BLOCK_V/2] = exponent;
    products[lid - BLOCK_V/2] = product;
  }
  barrier(CLK_LOCAL_MEM_FENCE);

  if (lid < BLOCK_V/2) {
    exponents[lid] = exponent + exponents[lid];
    products[lid]  = product * products[lid];
  }
  barrier(CLK_LOCAL_MEM_FENCE);

  // wavefront reduction
  int i = BLOCK_V / 4;
  for(; i > 0; i /= 2) {
    if (lid < i) {
      exponents[lid] += exponents[lid + i];
      products[lid]  *= products[lid + i];
    }
  }
}


void finish_block_processing(
    const int32_t v_start,
    __global double *x,
    __global const double *y,
    __global struct LargeProduct *g_prodX,
    __global struct LargeProduct *g_prodY,
    __global double* deltaE
) {
    const uint32_t lid = get_local_id(0);

    __local double x_local[BLOCK_V];
    x_local[lid] = x[v_start + lid];
    barrier(CLK_LOCAL_MEM_FENCE);

    __local int32_t exponents[BLOCK_V / 2];
    __local double products[BLOCK_V / 2];

    for(int v_i = 0; v_i < BLOCK_V; v_i++) {
      int32_t v = v_start + v_i;

      double prodX = 1.0;
      double prodY = 1.0;
      int32_t exponentX = 0;
      int32_t exponentY = 0;

      double x_v = x_local[v_i];
      double y_v = y[v];

      if (lid != v_i) {
        prodX = x_local[lid] - x_v;
        prodY = x_local[lid] - y_v;
        exponentX = normalize_exponent(&prodX);
        exponentY = normalize_exponent(&prodY);
      }

      struct LargeProduct lpX;
      struct LargeProduct lpY;

      horizontal_reduce(exponents, products, exponentX, prodX);
      if (lid == 0) {
        double prod = g_prodX[v].significand * products[0];
        double exponent = g_prodX[v].exponent + normalize_exponent(&prod) + exponents[0];
        lpX.significand = prod;
        lpX.exponent = exponent;
        g_prodX[v] = lpX;
      }

      barrier(CLK_LOCAL_MEM_FENCE);

      horizontal_reduce(exponents, products, exponentY, prodY);
      if (lid == 0) {
        double prod = g_prodY[v].significand * products[0];
        double exponent =  g_prodY[v].exponent + normalize_exponent(&prod) + exponents[0];
        lpY.significand = prod;
        lpY.exponent = exponent;
        g_prodY[v] = lpY;

        bool should_move = should_move_particle(v, x[v], y[v], lpX, lpY, deltaE);
        if (should_move) {
         x[v] = y[v];
         x_local[v] = y[v];
        }
      }

      barrier(CLK_LOCAL_MEM_FENCE);
    }
}

void process_large_product_block_parallel(
        const int32_t v_start,
        const int32_t h_startX,
        const int32_t h_blocks,
        __global const double *x,
        __global const double *y,
        __global struct LargeProduct *g_prodX,
        __global struct LargeProduct *g_prodY
) {
  const uint32_t lid = get_local_id(0);

  __local double x_r[BLOCK_V];

  double prodX = 1.0;
  double prodY = 1.0;
  int32_t exponentX = 0;
  int32_t exponentY = 0;

  uint32_t v = v_start + lid;
  double x_v = x[v];
  double y_v = y[v];

  for(int j = 0; j < h_blocks; ++j) {
    uint32_t h_start_block = h_startX + j * BLOCK_V;

    if (h_start_block == v_start || h_start_block == v_start - BLOCK_V) {
      // This block is skipped and processed by separate kernel in the next iteration.
      continue;
    }

    x_r[lid] = x[h_start_block + lid];
    barrier(CLK_LOCAL_MEM_FENCE);

    for(int i = 0; i < BLOCK_V; ++i) {
      prodX *= x_r[i] - x_v;
      prodY *= x_r[i] - y_v;

      if ((i+1) % MULS_PER_EXPONENT_EXTRACTION == 0) {
        exponentX += normalize_exponent(&prodX);
        exponentY += normalize_exponent(&prodY);
      }
    }
    barrier(CLK_LOCAL_MEM_FENCE);
  }

  exponentX += atomic_mul_normalize(&g_prodX[v].significand, prodX);
  exponentY += atomic_mul_normalize(&g_prodY[v].significand, prodY);
  atomic_add(&g_prodX[v].exponent, exponentX);
  atomic_add(&g_prodY[v].exponent, exponentY);
}

__kernel
__attribute__((reqd_work_group_size(BLOCK_V, 1, 1)))
void prod_diff_realrealvec(
        const int32_t v_start,
        __global double *x,
        __global const double *y,
        __global struct LargeProduct *g_prodX,
        __global struct LargeProduct *g_prodY,
        __global double* deltaE
) {
  const uint32_t lid = get_local_id(0);
  const int32_t gid = get_group_id(0) - SPECIAL_GROUPS;

  if (gid < 0) {
    const int32_t v_start_skipped = v_start - 2 * BLOCK_V;
    const int32_t v_start_final = v_start - BLOCK_V;

    // Process previously skipped block.
    if (v_start_skipped >= 0) {
      process_large_product_block_parallel(v_start_final, v_start_skipped, 1, x, y, g_prodX, g_prodY);
      barrier(CLK_LOCAL_MEM_FENCE);
    }

    // Process final block.
    if (v_start_final >= 0) {
      finish_block_processing(v_start_final, x, y, g_prodX, g_prodY, deltaE);
    }

    return;
  }

  const int32_t h_start = gid * BLOCK_H;
  const int32_t h_blocks = BLOCK_H / BLOCK_V;
  process_large_product_block_parallel(v_start, h_start, h_blocks, x, y, g_prodX, g_prodY);

}