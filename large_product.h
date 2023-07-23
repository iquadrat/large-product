#ifndef __LARGE_PRODUCT_H
#define __LARGE_PRODUCT_H

#include <iostream>
#include <immintrin.h>
#include <math.h>
#include <random>

#ifndef __AVX__
#error "This code needs AVX support. Compile with -mavx"
#endif

#ifdef __AVX2__
typedef __m256i __exponent_t;
#else
typedef __m128i __exponent_t;
#endif

inline std::ostream& operator<<(std::ostream& os, __m256d v) {
  double x[4];
  _mm256_storeu_pd(x, v);
  return os << "<" << x[0] << "," << x[1] << "," << x[2] << "," << x[3] << ">";
}

inline std::ostream& operator<<(std::ostream& os, __m128i v) {
  union {
      __m128i v;
      int32_t a[4];
  } x;
  _mm_storeu_si128(&x.v, v);
  return os << "<" << x.a[0] << "," << x.a[1] << "," << x.a[2] << "," << x.a[3]  << ">";
}

inline std::ostream& operator<<(std::ostream& os, __m256i v) {
  union {
    __m256i v;
    int64_t a[4];
  } x;
  _mm256_storeu_si256(&x.v, v);
  return os << "<" << x.a[0] << "," << x.a[1] << "," << x.a[2] << "," << x.a[3] << ">";
}

inline __m128i shl52_and_extract_high32bit_from_epi64(__m256i vec)
{
  __m128i low  = _mm256_castsi256_si128(vec);
  __m128i high = _mm256_extractf128_si256(vec, 1);
  low = _mm_srli_epi64(low, 32);
  return _mm_srli_epi32(_mm_or_si128(low, high), 20);
}

#ifdef __AVX2__

inline __m256i extract_and_clear_exponent(__m256d& v) {
    const __m256d exponent_mask = _mm256_castsi256_pd(_mm256_set1_epi64x(      0x7ff0000000000000ULL));
    const __m256d exponent_reset_mask = _mm256_castsi256_pd(_mm256_set1_epi64x(0x3ff0000000000000ULL));

    __m256d exponent_pd = _mm256_and_pd(exponent_mask, v);
    __m256d cleared_exponent = _mm256_andnot_pd(exponent_mask, v);
    __m256i exponent = _mm256_srli_epi64(_mm256_castpd_si256(exponent_pd), 52);
    v = _mm256_or_pd(cleared_exponent, exponent_reset_mask);
    return exponent;
}

#else // __AVX__

inline __m128i extract_and_clear_exponent(__m256d& v) {
  const __m256d exponent_mask = _mm256_castsi256_pd(_mm256_set1_epi64x(      0x7ff0000000000000ULL));
  const __m256d exponent_reset_mask = _mm256_castsi256_pd(_mm256_set1_epi64x(0x3ff0000000000000ULL));

  __m256d exponent_pd = _mm256_and_pd(exponent_mask, v);
  __m256d cleared_exponent = _mm256_andnot_pd(exponent_mask, v);

  __m128i exponent = shl52_and_extract_high32bit_from_epi64(_mm256_castpd_si256(exponent_pd));
  exponent = _mm_sub_epi32(exponent, _mm_set1_epi32(1023));
  v = _mm256_or_pd(cleared_exponent, exponent_reset_mask);
  return exponent;
}

#endif

inline __m256d abs(__m256d a) {
  const __m256d mask = _mm256_set1_pd(-0.);
  return _mm256_andnot_pd(mask, a); 
}

inline int32_t horizontal_sum(__m128i vec)
{
  vec = _mm_hadd_epi32(vec, vec);
  vec = _mm_hadd_epi32(vec, vec);
  return _mm_extract_epi32(vec, 0);
}

#ifdef __AVX2__
inline int64_t horizontal_sum(__m256i v) {
  __m256i hi = _mm256_unpackhi_epi64(v, v);
  __m256i sumlohi = _mm256_add_epi64(v, hi);
  return _mm256_extract_epi64(sumlohi, 0) + _mm256_extract_epi64(sumlohi, 2);
}
#endif

inline double horizontal_product(__m256d vec) {
  __m128d hi = _mm256_extractf128_pd(vec, 1);
  __m128d lo = _mm256_castpd256_pd128(vec);

  __m128d mul_lo = _mm_mul_pd(lo, hi);
  __m128d mul_hi = _mm_unpackhi_pd(mul_lo, mul_lo);
  __m128d result = _mm_mul_sd(mul_lo, mul_hi);

  return _mm_cvtsd_f64(result);
}

static const __m256d M256D_ONE = _mm256_set1_pd(1);

/**
 * Floating point with 52-bit significant and 64bit exponent.
 *
 * Note: This class is not optimized for speed. It is used as input/output for LargeProduct.
 */
class LargeExponentFloat {
  private:
    typedef union {
      double f;
      struct {
        uint64_t significand : 52;
        unsigned int exponent : 11;
        int sign : 1;
      } parts;
    } float_cast;

  public:
    double significand;
    int64_t exponent;

    LargeExponentFloat(double initial_value):
      significand(initial_value),
      exponent(0) {}

    LargeExponentFloat(double significand, int64_t exponent):
      significand(significand),
      exponent(exponent) {}

    LargeExponentFloat(const LargeExponentFloat& f):
      significand(f.significand),
      exponent(f.exponent) {}

  void normalize_exponent() {
    int delta_exponent;
    double mantissa = std::frexp(significand, &delta_exponent);
    significand = std::ldexp(mantissa, 0);
    exponent += delta_exponent;
  }

  LargeExponentFloat normalized() const {
    LargeExponentFloat f(*this);
    f.normalize_exponent();
    return f;
  }

  bool operator==(const LargeExponentFloat& other) const {
    LargeExponentFloat f1 = this->normalized();
    LargeExponentFloat f2 = other.normalized();
    return (f1.significand == f2.significand) && (f1.exponent == f2.exponent);
  }

};

inline std::ostream& operator<<(std::ostream& os, const LargeExponentFloat& v_raw) {
  LargeExponentFloat v = v_raw.normalized();
  return os << v.significand << " * 2^ " << v.exponent;
}

// Note: This is very slow!
inline LargeExponentFloat save_mul(const LargeExponentFloat& a, const LargeExponentFloat& b) {
  LargeExponentFloat a_normalized = a;
  a_normalized.normalize_exponent();

  LargeExponentFloat b_normalized = b;
  b_normalized.normalize_exponent();

  double prod = a_normalized.significand * b_normalized.significand;
  int64_t exponent = a_normalized.exponent + b_normalized.exponent;
  return LargeExponentFloat(prod, exponent);
}

/**
 * Class for computing large products built from many multiplicands.
 *
 * Uses a floating point with 52-bit significant and separated integer exponent to store the product.
 *
 * Note:
 * - if AVX2 is supported, the exponent is stored as 64bit integer but for each normalization a bias of 1023 is added
 * - if AVX2 is not supported, the exponent is stored as 32bit integer without bias
 */
class LargeProduct {
  private:
#ifdef __AVX2__
    constexpr static int EXPONENT_BIAS = 1023;
#endif

    __m256d prod1;
    __m256d prod2;
    __m256d prod3;
    __m256d prod4;

    // Stores extra exponents for each product. Exponents are stored biased, so to get the actual exponent, you need
    // to sum the 4 values and subtract exponent_bias_count * EXPONENT_BIAS.
    __exponent_t exponent;
#ifdef __AVX2__
    int64_t exponent_bias_count;
#endif

    static void normalize_exponent(__m256d &prod, __exponent_t& exponent) {
      __exponent_t delta_exponent = extract_and_clear_exponent(prod);
#ifdef __AVX2__
      exponent = _mm256_add_epi64(exponent, delta_exponent);
#else // __AVX__
      exponent = _mm_add_epi32(exponent, delta_exponent);
#endif
    }

    static __m256d save_mul(__m256d prod1, __m256d prod2, __exponent_t& exponents) {
      __m256d prod = _mm256_mul_pd(prod1, prod2);
      normalize_exponent(prod, exponents);
      return prod;
    }

public:
    LargeProduct(const LargeExponentFloat& initial_value):
      LargeProduct(initial_value.significand, initial_value.exponent) {}

    LargeProduct(double significand = 1.0, int64_t exponent = 0):
      prod1(_mm256_set_pd(1, 1, 1, significand)),
      prod2(M256D_ONE),
      prod3(M256D_ONE),
      prod4(M256D_ONE),
#ifdef __AVX2__
      exponent(_mm256_set_epi64x(0, 0, 0, exponent)),
      exponent_bias_count(0)
#else
      exponent(_mm_set_epi32(0, 0, 0, exponent))
#endif
    {
    }

    void mul_no_overflow1(__m256d mul1) {
      prod1 = _mm256_mul_pd(prod1, mul1);
    }

    void mul_no_overflow2(__m256d mul2) {
      prod2 = _mm256_mul_pd(prod2, mul2);
    }

    void mul_no_overflow3(__m256d mul3) {
      prod3 = _mm256_mul_pd(prod3, mul3);
    }

    void mul_no_overflow4(__m256d mul4) {
      prod4 = _mm256_mul_pd(prod4, mul4);
    }

    void mul_no_overflow(__m256d mul1, __m256d mul2, __m256d mul3, __m256d mul4) {
      mul_no_overflow1(mul1);
      mul_no_overflow2(mul2);
#ifdef SUB_PRODUCT_COUNT_8
      mul_no_overflow1(mul3);
      mul_no_overflow2(mul4);
#else
      mul_no_overflow3(mul3);
      mul_no_overflow4(mul4);
#endif
    }

    void mul_mask_no_overflow(__m256d mul, __m256d mask) {
      prod1 = _mm256_blendv_pd(_mm256_mul_pd(prod1, mul), prod1, mask);
    }

    void normalize_exponent() {
      normalize_exponent(prod1, exponent);
      normalize_exponent(prod2, exponent);
      normalize_exponent(prod3, exponent);
      normalize_exponent(prod4, exponent);
#ifdef __AVX2__
      exponent_bias_count += 16;
#endif
    }
    
    void mul(const LargeProduct& other) {
      prod1 = save_mul(prod1, other.prod1, exponent);
      prod2 = save_mul(prod2, other.prod2, exponent);
      prod3 = save_mul(prod3, other.prod3, exponent);
      prod4 = save_mul(prod4, other.prod4, exponent);
      exponent += other.exponent;
#ifdef __AVX2__
      exponent_bias_count += 16;
      exponent_bias_count += other.exponent_bias_count;
#endif
    }

    LargeExponentFloat get() const {
      __exponent_t local_exponent = exponent;

      __m256d prod12 = save_mul(prod1, prod2, local_exponent);
      __m256d prod34 = save_mul(prod3, prod4, local_exponent);
      __m256d prod = save_mul(prod12, prod34, local_exponent);

      int64_t combined_exponent = horizontal_sum(local_exponent);
#ifdef __AVX2__
      combined_exponent -= EXPONENT_BIAS * (exponent_bias_count + 12);
#endif
      double significand = horizontal_product(prod);
      return LargeExponentFloat(significand, combined_exponent);
    }

};

#endif
