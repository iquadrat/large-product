#include "vandermonde_det.h"

#include <cassert>

inline double sqr(const double x) {
  return x*x;
}

__m256d sqr(__m256d v) {
  return _mm256_mul_pd(v,v);
}

constexpr const int64_t MULS_PER_EXPONENT_EXTRACTION = 16;

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

      vprod1.mul_no_overflow1234(
              _mm256_sub_pd(u1_vec, x0),
              _mm256_sub_pd(u1_vec, x1),
              _mm256_sub_pd(u1_vec, x2),
              _mm256_sub_pd(u1_vec, x3)
      );
      vprod2.mul_no_overflow1234(
              _mm256_sub_pd(u2_vec, x0),
              _mm256_sub_pd(u2_vec, x1),
              _mm256_sub_pd(u2_vec, x2),
              _mm256_sub_pd(u2_vec, x3)
      );
    }

    if ((j / ELEMENTS_PER_LOOP) % MULS_PER_EXPONENT_EXTRACTION == 0)  {
      vprod1.normalize_exponent1234();
      vprod2.normalize_exponent1234();
    }
  }

  __m256d four = _mm256_set1_pd(4);
  __m256d vk = _mm256_set1_pd(k);

  // Process the skipped block
  if (skipj < lastj) {
    vprod1.normalize_exponent1234();
    vprod2.normalize_exponent1234();

    __m256d vj = _mm256_set1_pd(skipj);
    vj = _mm256_add_pd(vj, _mm256_set_pd(3, 2, 1, 0));
    for (int j = skipj; j < skipj + ELEMENTS_PER_LOOP; j += 4) {
      const __m256d x0 = _mm256_load_pd(&x[j]);
      __m256d mask = _mm256_cmp_pd(vj, vk, _CMP_EQ_OS);
      vprod1.mul_mask_no_overflow(_mm256_sub_pd(u1_vec, x0), mask);
      vprod2.mul_mask_no_overflow(_mm256_sub_pd(u2_vec, x0), mask);
      vj = _mm256_add_pd(vj, four);
    }
  }

  vprod1.normalize_exponent1234();
  vprod2.normalize_exponent1234();

  // Process the remaining elements
  __m256d vn = _mm256_set1_pd(N - 1);
  __m256d vj = _mm256_set1_pd(lastj);
  vj = _mm256_add_pd(vj, _mm256_set_pd(3,2,1,0));
  for (int j=lastj; j<N; j += 4) {
    const __m256d x0 = _mm256_load_pd(&x[j]);
    __m256d mask = _mm256_or_pd(_mm256_cmp_pd(vj, vn, _CMP_GT_OS), _mm256_cmp_pd(vj, vk, _CMP_EQ_OS));
    vprod1.mul_mask_no_overflow(_mm256_sub_pd(u1_vec, x0), mask);
    vprod2.mul_mask_no_overflow(_mm256_sub_pd(u2_vec, x0), mask);
    vj = _mm256_add_pd(vj, four);
  }

  prod1 = vprod1.get();
  prod2 = vprod2.get();
}

void prod_realcomplex(
        const long int N,
        const double u1,
        const double u2,
        const double* x,
        const double* y,
        LargeExponentFloat& prod1,
        LargeExponentFloat& prod2
) {

  prod_complexcomplex(N, N, u1, u2, 0, 0, x, y, prod1, prod2);

//  for (int j=0; j<N; j++) {
//    prod1.significand *= sqr(u1-x[j])+sqr(y[j]);
//    prod2.significand *= sqr(u2-x[j])+sqr(y[j]);
//    checkoverflow(prod1.significand,prod1.exponent);
//    checkoverflow(prod2.significand,prod2.exponent);
//  }

}

__m256d sqr_diff1(__m256d x, __m256d y2, __m256d u) {
  return _mm256_add_pd(
          sqr(_mm256_sub_pd(u, x)),
          y2
  );
}

void prod_complexreal(
        const long int N,
        const double u1,
        const double u2,
        const double v1,
        const double v2,
        const double* x,
        LargeExponentFloat& prod1,
        LargeExponentFloat& prod2
) {

//  const double v1_sqr=sqr(v1);
//  const double v2_sqr=sqr(v2);
//  for (int j=0; j<N; j++) {
//    prod1.significand *= sqr(u1-x[j])+v1_sqr;
//    prod2.significand *= sqr(u2-x[j])+v2_sqr;
//    checkoverflow(prod1.significand,prod1.exponent);
//    checkoverflow(prod2.significand,prod2.exponent);
//  }

  const int64_t ELEMENTS_PER_LOOP = 4 * 4;
  assert(reinterpret_cast<uintptr_t>(x) % 32 == 0);

  LargeProduct vprod1(prod1);
  LargeProduct vprod2(prod2);

  const __m256d u1_vec = _mm256_set1_pd(u1);
  const __m256d u2_vec = _mm256_set1_pd(u2);
  const __m256d v1_sqr = sqr(_mm256_set1_pd(v1));
  const __m256d v2_sqr = sqr(_mm256_set1_pd(v2));

  const int64_t lastj = N & (-ELEMENTS_PER_LOOP);

  for (int64_t j=0; j<lastj; j += ELEMENTS_PER_LOOP) [[likely]] {
    const __m256d x0 = _mm256_load_pd(&x[j +  0]);
    const __m256d x1 = _mm256_load_pd(&x[j +  4]);
    const __m256d x2 = _mm256_load_pd(&x[j +  8]);
    const __m256d x3 = _mm256_load_pd(&x[j + 12]);

    vprod1.mul_no_overflow12(
            sqr_diff1(x0, v1_sqr, u1_vec),
            sqr_diff1(x1, v1_sqr, u1_vec)
    );
    vprod1.mul_no_overflow12(
            sqr_diff1(x2, v1_sqr, u1_vec),
            sqr_diff1(x3, v1_sqr, u1_vec)
    );
    vprod2.mul_no_overflow12(
            sqr_diff1(x0, v2_sqr, u2_vec),
            sqr_diff1(x1, v2_sqr, u2_vec)
    );
    vprod2.mul_no_overflow12(
            sqr_diff1(x2, v2_sqr, u2_vec),
            sqr_diff1(x3, v2_sqr, u2_vec)
    );

    if ((j / ELEMENTS_PER_LOOP) % (MULS_PER_EXPONENT_EXTRACTION / 2) == 0) {
      vprod1.normalize_exponent12();
      vprod2.normalize_exponent12();
    }
  }

  __m256d four = _mm256_set1_pd(4);

  vprod1.normalize_exponent12();
  vprod2.normalize_exponent12();

  // Process the remaining elements
  __m256d vn = _mm256_set1_pd(N - 1);
  __m256d vj = _mm256_set1_pd(lastj);
  vj = _mm256_add_pd(vj, _mm256_set_pd(3,2,1,0));
  for (int j=lastj; j<N; j += 4) {
    const __m256d x0 = _mm256_load_pd(&x[j]);
    __m256d mask = _mm256_cmp_pd(vj, vn, _CMP_GT_OS);
    vprod1.mul_mask_no_overflow(sqr_diff1(x0, v1_sqr, u1_vec), mask);
    vprod2.mul_mask_no_overflow(sqr_diff1(x0, v2_sqr, u2_vec), mask);
    vj = _mm256_add_pd(vj, four);
  }

  prod1 = vprod1.get();
  prod2 = vprod2.get();
}

__m256d sqr_diff2(__m256d x, __m256d y, __m256d u, __m256d v) {
  return _mm256_add_pd(
          sqr(_mm256_sub_pd(u, x)),
          sqr(_mm256_sub_pd(v, y))
  );
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
  assert(k >=0);
  assert(reinterpret_cast<uintptr_t>(x) % 32 == 0);

  LargeProduct vprod1(prod1);
  LargeProduct vprod2(prod2);

  const __m256d u1_vec = _mm256_set1_pd(u1);
  const __m256d u2_vec = _mm256_set1_pd(u2);
  const __m256d v1_vec = _mm256_set1_pd(v1);
  const __m256d v2_vec = _mm256_set1_pd(v2);

  const int64_t skipj = k & (-ELEMENTS_PER_LOOP);
  const int64_t lastj = N & (-ELEMENTS_PER_LOOP);

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

      vprod1.mul_no_overflow1234(
              sqr_diff2(x0, y0, u1_vec, v1_vec),
              sqr_diff2(x1, y1, u1_vec, v1_vec),
              sqr_diff2(x2, y2, u1_vec, v1_vec),
              sqr_diff2(x3, y3, u1_vec, v1_vec)
      );
      vprod2.mul_no_overflow1234(
              sqr_diff2(x0, y0, u2_vec, v2_vec),
              sqr_diff2(x1, y1, u2_vec, v2_vec),
              sqr_diff2(x2, y2, u2_vec, v2_vec),
              sqr_diff2(x3, y3, u2_vec, v2_vec)
      );
    }

    if ((j / ELEMENTS_PER_LOOP) % MULS_PER_EXPONENT_EXTRACTION == 0) {
      vprod1.normalize_exponent1234();
      vprod2.normalize_exponent1234();
    }
  }

  const __m256d vk = _mm256_set1_pd(k);
  const __m256d four = _mm256_set1_pd(4);

  // Process the skipped block
  if (skipj < lastj) [[likely]] {
    vprod1.normalize_exponent12();
    vprod2.normalize_exponent12();

    __m256d vj = _mm256_set1_pd(skipj);
    vj = _mm256_add_pd(vj, _mm256_set_pd(3, 2, 1, 0));
    for (int j = skipj; j < skipj + ELEMENTS_PER_LOOP; j += 4) {
      const __m256d x0 = _mm256_load_pd(&x[j]);
      const __m256d y0 = _mm256_load_pd(&y[j]);
      __m256d mask = _mm256_cmp_pd(vj, vk, _CMP_EQ_OQ);
      vprod1.mul_mask_no_overflow(sqr_diff2(x0, y0, u1_vec, v1_vec), mask);
      vprod2.mul_mask_no_overflow(sqr_diff2(x0, y0, u2_vec, v2_vec), mask);
      vj = _mm256_add_pd(vj, four);
    }
  }

  vprod1.normalize_exponent12();
  vprod2.normalize_exponent12();

  // Process the remaining elements
  __m256d vn = _mm256_set1_pd(N - 1);
  __m256d vj = _mm256_set1_pd(lastj);
  vj = _mm256_add_pd(vj, _mm256_set_pd(3,2,1,0));
  for (int j=lastj; j<N; j += 4) {
    const __m256d x0 = _mm256_load_pd(&x[j]);
    const __m256d y0 = _mm256_load_pd(&y[j]);
    __m256d mask = _mm256_or_pd(_mm256_cmp_pd(vj, vn, _CMP_GT_OQ), _mm256_cmp_pd(vj, vk, _CMP_EQ_OQ));
    vprod1.mul_mask_no_overflow(sqr_diff2(x0, y0, u1_vec, v1_vec), mask);
    vprod2.mul_mask_no_overflow(sqr_diff2(x0, y0, u2_vec, v2_vec), mask);
    vj = _mm256_add_pd(vj, four);
  }

  prod1 = vprod1.get();
  prod2 = vprod2.get();
}
