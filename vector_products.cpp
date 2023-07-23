#include "vector_products.h"

#include <cassert>

inline double sqr(const double x) {
  return x*x;
}

inline void checkoverflow(double &prod, long int &exponent) {
  constexpr long int exponent_low_high=511;
  const double toohigh=pow(2,exponent_low_high);
  const double toolow=pow(2,-exponent_low_high);
  if (prod>toohigh) {
    prod*=toolow;
    exponent += 511;
  } else if (prod<toolow)  {
    prod*=toohigh;
    exponent -= 511;
  }
}

__m256d sqr(__m256d v) {
  return _mm256_mul_pd(v,v);
}

__m256d sqr_diff(__m256d x, __m256d y, __m256d u, __m256d v) {
  return _mm256_add_pd(
          sqr(_mm256_sub_pd(u, x)),
          sqr(_mm256_sub_pd(v, y))
  );
}

void prod_realreal(
        const long int N,
        const long int k,
        const double u1,
        const double u2,
        const double* x,
        LargeExponentFloat& prod1,
        LargeExponentFloat& prod2
) {
  const int64_t ELEMENTS_PER_LOOP = 4 * 4;
  assert(k >= 0);
  assert(reinterpret_cast<uintptr_t>(x) % 32 == 0);

  LargeProduct vprod1(prod1);
  LargeProduct vprod2(prod2);

  __m256d u1_vec = _mm256_set1_pd(u1);
  __m256d u2_vec = _mm256_set1_pd(u2);

  int64_t skipj = k & (-ELEMENTS_PER_LOOP);
  int64_t lastj = N & (-ELEMENTS_PER_LOOP);

  // prod of u-x[j] for all j!=k
  for (int64_t j=0; j<lastj; j += ELEMENTS_PER_LOOP) [[likely]] {
    if (j != skipj) [[likely]] {
      const __m256d x0 = _mm256_load_pd(&x[j +  0]);
      const __m256d x1 = _mm256_load_pd(&x[j +  4]);
      const __m256d x2 = _mm256_load_pd(&x[j +  8]);
      const __m256d x3 = _mm256_load_pd(&x[j + 12]);

      vprod1.mul_no_overflow(
              _mm256_sub_pd(u1_vec, x0),
              _mm256_sub_pd(u1_vec, x1),
              _mm256_sub_pd(u1_vec, x2),
              _mm256_sub_pd(u1_vec, x3)
      );
      vprod2.mul_no_overflow(
              _mm256_sub_pd(u2_vec, x0),
              _mm256_sub_pd(u2_vec, x1),
              _mm256_sub_pd(u2_vec, x2),
              _mm256_sub_pd(u2_vec, x3)
      );
    }

    if ((j / ELEMENTS_PER_LOOP) % 16 == 0)  {
      vprod1.normalize_exponent();
      vprod2.normalize_exponent();
    }
  }

  __m256i four = _mm256_set1_epi64x(4);
  __m256i vk = _mm256_set1_epi64x(k);

  // Process the skipped block
  if (skipj < lastj) {
    vprod1.normalize_exponent();
    vprod2.normalize_exponent();

    __m256i vj = _mm256_set1_epi64x(skipj);
    vj = _mm256_add_epi64(vj, _mm256_set_epi64x(3, 2, 1, 0));
    for (int j = skipj; j < skipj + ELEMENTS_PER_LOOP; j += 4) {
      const __m256d x0 = _mm256_load_pd(&x[j]);
      __m256d mask = _mm256_castsi256_pd(_mm256_cmpeq_epi64(vj, vk));
      vprod1.mul_mask_no_overflow(_mm256_sub_pd(u1_vec, x0), mask);
      vprod2.mul_mask_no_overflow(_mm256_sub_pd(u2_vec, x0), mask);
      vj = _mm256_add_epi64(vj, four);
    }
  }

  vprod1.normalize_exponent();
  vprod2.normalize_exponent();

  // Process the remaining elements
  __m256i vn = _mm256_set1_epi64x(N - 1);
  __m256i vj = _mm256_set1_epi64x(lastj);
  vj = _mm256_add_epi64(vj, _mm256_set_epi64x(3,2,1,0));
  for (int j=lastj; j<N; j += 4) {
    const __m256d x0 = _mm256_load_pd(&x[j]);
    __m256d mask = _mm256_castsi256_pd(_mm256_or_si256(_mm256_cmpgt_epi64(vj, vn), _mm256_cmpeq_epi64(vj, vk)));
    vprod1.mul_mask_no_overflow(_mm256_sub_pd(u1_vec, x0), mask);
    vprod2.mul_mask_no_overflow(_mm256_sub_pd(u2_vec, x0), mask);
    vj = _mm256_add_epi64(vj, four);
  }

  prod1 = vprod1.get();
  prod2 = vprod2.get();
}

void prod_realcomplex(
        const long int N,
        const double u,
        const double u0,
        const double* x,
        const double* y,
        double &prod,
        long int &exponent,
        double &prod0,
        long int &exponent0
) {

  for (int j=0; j<N; j++) {
    prod*=sqr(u-x[j])+sqr(y[j]);
    prod0*=sqr(u0-x[j])+sqr(y[j]);
    checkoverflow(prod,exponent);
    checkoverflow(prod0,exponent0);
  }

}


void prod_complexreal(
        const long int N,
        const double u,
        const double u0,
        const double v,
        const double v0,
        const double* x,
        double &prod,
        long int &exponent,
        double &prod0,
        long int &exponent0
) {
  const double v2=sqr(v);
  const double v02=sqr(v0);
  for (int j=0; j<N; j++) {
    prod*=sqr(u-x[j])+v2;
    prod0*=sqr(u0-x[j])+v02;
    checkoverflow(prod,exponent);
    checkoverflow(prod0,exponent0);
  }
}


void prod_complexcomplex(
        const long int N,
        const long int k,
        const double u1,
        const double u2,
        const double v1,
        const double v2,
        const double* x,
        const double* y,
        LargeExponentFloat& prod1,
        LargeExponentFloat& prod2
) {

  const int64_t ELEMENTS_PER_LOOP = 4 * 4;
  assert(k >=0 && k < N);
  assert(reinterpret_cast<uintptr_t>(x) % 32 == 0);

  LargeProduct vprod1(prod1.significand, prod1.exponent);
  LargeProduct vprod2(prod2.significand, prod2.exponent);

  const __m256d u1_vec = _mm256_set1_pd(u1);
  const __m256d u2_vec = _mm256_set1_pd(u2);
  const __m256d v1_vec = _mm256_set1_pd(v1);
  const __m256d v2_vec = _mm256_set1_pd(v2);

  const int64_t skipj = k & (-ELEMENTS_PER_LOOP);
  const int64_t lastj = N & (-ELEMENTS_PER_LOOP);

  // prod of u-x[j] for all j!=k
  for (int64_t j=0; j<lastj; j += ELEMENTS_PER_LOOP) [[likely]] {
    if (j != skipj) [[likely]] {
      const __m256d x0 = _mm256_load_pd(&x[j +  0]);
      const __m256d x1 = _mm256_load_pd(&x[j +  4]);
      const __m256d x2 = _mm256_load_pd(&x[j +  8]);
      const __m256d x3 = _mm256_load_pd(&x[j + 12]);

      const __m256d y0 = _mm256_load_pd(&y[j +  0]);
      const __m256d y1 = _mm256_load_pd(&y[j +  4]);
      const __m256d y2 = _mm256_load_pd(&y[j +  8]);
      const __m256d y3 = _mm256_load_pd(&y[j + 12]);

      vprod1.mul_no_overflow(
              sqr_diff(x0, y0, u1_vec, v1_vec),
              sqr_diff(x1, y1, u1_vec, v1_vec),
              sqr_diff(x2, y2, u1_vec, v1_vec),
              sqr_diff(x3, y3, u1_vec, v1_vec)
      );
      vprod2.mul_no_overflow(
              sqr_diff(x0, y0, u2_vec, v2_vec),
              sqr_diff(x1, y1, u2_vec, v2_vec),
              sqr_diff(x2, y2, u2_vec, v2_vec),
              sqr_diff(x3, y3, u2_vec, v2_vec)
      );
    }

    if ((j / ELEMENTS_PER_LOOP) % 16 == 0) {
      vprod1.normalize_exponent();
      vprod2.normalize_exponent();
    }
  }

  const __m256i four = _mm256_set1_epi64x(4);
  const __m256i vk = _mm256_set1_epi64x(k);

  // Process the skipped block
  if (skipj < lastj) [[likely]] {
    vprod1.normalize_exponent();
    vprod2.normalize_exponent();

    __m256i vj = _mm256_set1_epi64x(skipj);
    vj = _mm256_add_epi64(vj, _mm256_set_epi64x(3, 2, 1, 0));
    for (int j = skipj; j < skipj + ELEMENTS_PER_LOOP; j += 4) {
      const __m256d x0 = _mm256_load_pd(&x[j]);
      const __m256d y0 = _mm256_load_pd(&y[j]);
      __m256d mask = _mm256_castsi256_pd(_mm256_cmpeq_epi64(vj, vk));
      vprod1.mul_mask_no_overflow(sqr_diff(x0, y0, u1_vec, v1_vec), mask);
      vprod2.mul_mask_no_overflow(sqr_diff(x0, y0, u2_vec, v2_vec), mask);
      vj = _mm256_add_epi64(vj, four);
    }
  }

  vprod1.normalize_exponent();
  vprod2.normalize_exponent();

  // Process the remaining elements
  __m256i vn = _mm256_set1_epi64x(N - 1);
  __m256i vj = _mm256_set1_epi64x(lastj);
  vj = _mm256_add_epi64(vj, _mm256_set_epi64x(3,2,1,0));
  for (int j=lastj; j<N; j += 4) {
    const __m256d x0 = _mm256_load_pd(&x[j]);
    const __m256d y0 = _mm256_load_pd(&y[j]);
    __m256d mask = _mm256_castsi256_pd(_mm256_or_si256(_mm256_cmpgt_epi64(vj, vn), _mm256_cmpeq_epi64(vj, vk)));
    vprod1.mul_mask_no_overflow(sqr_diff(x0, y0, u1_vec, v1_vec), mask);
    vprod2.mul_mask_no_overflow(sqr_diff(x0, y0, u2_vec, v2_vec), mask);
    vj = _mm256_add_epi64(vj, four);
  }

  prod1 = vprod1.get();
  prod2 = vprod2.get();
}