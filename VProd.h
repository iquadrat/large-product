#ifndef __VPROD_H
#define __VPROD_H

#include <iostream>
#include <immintrin.h>
#include <math.h>
#include <random>


using namespace std;

std::ostream& operator<<(std::ostream& os, __m256d v) {
  double x[4];
  _mm256_store_pd(x, v);
  return os << "<" <<  x[0] << "," << x[1] << "," << x[2] << "," << x[3]  << ">";
}

std::ostream& operator<<(std::ostream& os, __m128i v) {
  union {
    __m128i v;
    int32_t a[4];
  } x;
  _mm_store_si128(&x.v, v);
  return os << "<" << x.a[0] << "," << x.a[1] << "," << x.a[2] << "," << x.a[3]  << ">";
}


std::ostream& operator<<(std::ostream& os, __m256i v) {
  union {
    __m256i v;
    int64_t a[4];
  } x;
  _mm256_store_si256(&x.v, v);
  return os << "<" << x.a[0] << "," << x.a[1] << "," << x.a[2] << "," << x.a[3]  << ">";
}

double extract_double(__m256d v, int index) {
    double x[4];
    _mm256_store_pd(x, v);
    return x[index];
}

double* new_double_array(int64_t size) {
  // round up size to be a multiple of 4
  int64_t rounded_size = (size + 3) & ~3;
  return static_cast<double*>(_mm_malloc(sizeof(double) * rounded_size, 64));
}

__m128i emulate_cvt_epi64_epi32(__m256i vec)
{
  __m128i low = _mm256_castsi256_si128(vec);          // Extract the low 128 bits
  __m128i high = _mm256_extractf128_si256(vec, 1);    // Extract the high 128 bits

  __m128i low_shifted = _mm_shuffle_epi32(low, 0xD8);  // Shift the low 64-bit values
  __m128i high_shifted = _mm_shuffle_epi32(high, 0xD8); // Shift the high 64-bit values

  __m128i result = _mm_unpacklo_epi64(low_shifted, high_shifted); // Interleave the low and high parts

  return result;
}

__m128i extract_and_clear_exponent(__m256d& v) {
    const __m256d exponent_mask = _mm256_castsi256_pd(_mm256_set1_epi64x(      0x7ff0000000000000ULL));
    const __m256d exponent_reset_mask = _mm256_castsi256_pd(_mm256_set1_epi64x(0x3ff0000000000000ULL));

    __m256d exponent_pd = _mm256_and_pd(exponent_mask, v);
    __m256d cleared_exponent = _mm256_andnot_pd(exponent_mask, v);

    __m256 exponent_ps = _mm256_castpd_ps(exponent_pd);
    exponent_ps = _mm256_shuffle_ps(exponent_ps, exponent_ps, 0b10110001);

    __m128i x = emulate_cvt_epi64_epi32(_mm256_castps_si256(exponent_ps));
    __m128i exponent = _mm_srli_epi32(x, 20);
    v = _mm256_or_pd(cleared_exponent, exponent_reset_mask);
    return exponent;
}

__m256d abs(__m256d a) {
  const __m256d mask = _mm256_set1_pd(-0.);
  return _mm256_andnot_pd(mask, a); 
}


//int64_t horizontal_sum(__m256i v) {
//  __m256i hi = _mm256_unpackhi_epi64(v, v);
//  __m256i sumlohi = _mm256_add_epi64(v, hi);
//  return _mm256_extract_epi64(sumlohi, 0) + _mm256_extract_epi64(sumlohi, 2);
//}


int32_t horizontal_sum(__m128i vec)
{
  __m128i permute = _mm_shuffle_epi32(vec, _MM_SHUFFLE(2, 3, 0, 1)); // Permute the elements
  __m128i sum1 = _mm_add_epi32(vec, permute); // Add the original and permuted vectors

  __m128i permute2 = _mm_shuffle_epi32(sum1, _MM_SHUFFLE(1, 0, 3, 2)); // Permute the elements
  __m128i sum2 = _mm_add_epi32(sum1, permute2); // Add the previous sum and permuted vector

  int32_t sum;
  _mm_store_ss(reinterpret_cast<float*>(&sum), _mm_castsi128_ps(sum2)); // Store the result in a variable

  return sum;
}

static const __m256d M256D_ONE = _mm256_set1_pd(1);

constexpr const int EXPONENT_BIAS = 1023;

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

std::ostream& operator<<(std::ostream& os, const LargeExponentFloat& v_raw) {
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


class VProd {
  private:
    __m256d prod1;
    __m256d prod2;
    __m256d prod3;
    __m256d prod4;

    // Stores extra exponents for each product. Exponents are stored biased, so to get the actual exponent, you need
    // to sum the 4 values and subtract exponent_bias_count * EXPONENT_BIAS.
    __m128i exponent;
    int64_t exponent_bias_count;

    static void normalize_exponent(__m256d &prod, __m128i& exponent) {
      __m128i delta_exponent = extract_and_clear_exponent(prod);
      exponent = _mm_add_epi32(exponent, delta_exponent);
    }

    static __m256d save_mul(__m256d prod1, __m256d prod2, __m128i& exponents) {
      __m256d prod = _mm256_mul_pd(prod1, prod2);
      normalize_exponent(prod, exponents);
      exponents = _mm_sub_epi32(exponents, _mm_set1_epi32(EXPONENT_BIAS));
      return prod;
    }

public:
    VProd(double fraction = 1.0, int64_t exponent = 0):
      prod1(_mm256_set_pd(1, 1, 1, fraction)),
      prod2(M256D_ONE),
      prod3(M256D_ONE),
      prod4(M256D_ONE),
      exponent(_mm_set_epi32(0, 0, 0, exponent)),
      exponent_bias_count(0)
    {
    }

    void mul_no_overflow(__m256d mul1, __m256d mul2, __m256d mul3, __m256d mul4) {
      prod1 = _mm256_mul_pd(prod1, mul1);
      prod2 = _mm256_mul_pd(prod2, mul2);
      prod3 = _mm256_mul_pd(prod3, mul3);
      prod4 = _mm256_mul_pd(prod4, mul4);
    }

    void mul_mask_no_overflow(__m256d mul, __m256d mask) {
      prod1 = _mm256_blendv_pd(_mm256_mul_pd(prod1, mul), prod1, mask);
    }

    void check_overflow() {
      normalize_exponent();
    }

    void normalize_exponent() {
      normalize_exponent(prod1, exponent);
      normalize_exponent(prod2, exponent);
      normalize_exponent(prod3, exponent);
      normalize_exponent(prod4, exponent);
      exponent_bias_count += 16;
    }
    
    void mul(const VProd& other) {
      prod1 = save_mul(prod1, other.prod1, exponent);
      prod2 = save_mul(prod2, other.prod2, exponent);
      prod3 = save_mul(prod3, other.prod3, exponent);
      prod4 = save_mul(prod4, other.prod4, exponent);
      exponent += other.exponent;
      exponent_bias_count += other.exponent_bias_count;
    }

    LargeExponentFloat get() const {
      __m128i local_exponent = exponent;

      __m256d prod12 = save_mul(prod1, prod2, local_exponent);
      __m256d prod34 = save_mul(prod3, prod4, local_exponent);
      __m256d prod = save_mul(prod12, prod34, local_exponent);

      int64_t combined_exponent = horizontal_sum(local_exponent) - EXPONENT_BIAS * exponent_bias_count;
      double significand = horizontal_product(prod);
      return LargeExponentFloat(significand, combined_exponent);
    }

	static double horizontal_product(__m256d vec) {
    __m128d hi = _mm256_extractf128_pd(vec, 1);
    __m128d lo = _mm256_castpd256_pd128(vec);

    __m128d mul_lo = _mm_mul_pd(lo, hi);
    __m128d mul_hi = _mm_unpackhi_pd(mul_lo, mul_lo);
    __m128d result = _mm_mul_sd(mul_lo, mul_hi);

    return _mm_cvtsd_f64(result);
	}
};



template<typename T>
void assert_eq(T a, T b) {
  if (a == b) {
    return;
  }
  cerr << "Expected a == b but " << a << " != " << b << endl;
  throw "assertion failed";
}

void assert_approx(double a, double b) {
  const double ratio = abs(abs(a/b) - 1);
  if (ratio > 1e-5) {
    cerr << "Expected a ~= b but " << a << " != " << b << endl;
    throw "assertion failed";
  } 
}



inline void test_vprod() {
  {
    __m256i v64 = _mm256_set_epi64x(-4,3,2,1);
    __m128i v32 = emulate_cvt_epi64_epi32(v64);
    assert_eq(1, _mm_extract_epi32(v32, 0));
    assert_eq(2, _mm_extract_epi32(v32, 1));
    assert_eq(3, _mm_extract_epi32(v32, 2));
    assert_eq(-4, _mm_extract_epi32(v32, 3));
  }

  {
    assert_eq(horizontal_sum(_mm_set_epi32(1,3,7,11)), 22);
    assert_eq(horizontal_sum(_mm_set_epi32(10000, -3000, 70, 5500)), 12570);
  }

  {
    __m256d v = _mm256_set_pd(2, 1e20, 1e-20, -5e189);
    __m128i exp = extract_and_clear_exponent(v);
    assert_eq(EXPONENT_BIAS +  1, _mm_extract_epi32(exp, 3));
    assert_eq(EXPONENT_BIAS + 66, _mm_extract_epi32(exp, 2));
    assert_eq(EXPONENT_BIAS - 67, _mm_extract_epi32(exp, 1));
    assert_eq(EXPONENT_BIAS +630, _mm_extract_epi32(exp, 0));

    assert_eq(1.0, extract_double(v, 3));
    assert_approx(1.35525271561, extract_double(v, 2));
    assert_approx(1.4757395259, extract_double(v, 1));
    assert_approx(-1.12220638669, extract_double(v, 0));
  }

  {
    __m256d x = _mm256_set_pd(2e+26, 5.0, 3e+50, 2.98334e+46);
    double prod = VProd::horizontal_product(x);
    assert_approx(8.95002e+123, prod);
  }

  {
    LargeExponentFloat f5(1.0, 50);
    f5.normalize_exponent();
    assert_eq(0.5, f5.significand);
    assert_eq(51L, f5.exponent);

    LargeExponentFloat f4(-1536.0, -100);
    f4.normalize_exponent();
    assert_eq(-0.75, f4.significand);
    assert_eq(-89L, f4.exponent);

    LargeExponentFloat f6(9.56257e-99, -1533);
    f6.normalize_exponent();
    assert_approx(0.6536168176, f6.significand);
    assert_eq(-1533L -325 , f6.exponent);

    LargeExponentFloat f1(1536.0);
    LargeExponentFloat f2(1536.0, 0);
    LargeExponentFloat f3(0.75, 11);

    assert_eq(f1, f2);
    assert_eq(f1, f3);
  }

  {
    VProd prod(2.0); // 2
    prod.mul_no_overflow(_mm256_set_pd(2.0, 3.0, 5.0, 10.0), M256D_ONE, M256D_ONE, M256D_ONE);  // 2 * 2 * 3 * 5 * 10 = 600
    auto actual = prod.get();
    assert_eq(LargeExponentFloat(600.), actual);

    prod.mul_no_overflow(M256D_ONE, _mm256_set_pd(1e100, -1e50, 1e25, 1e25), M256D_ONE, M256D_ONE);
    actual = prod.get().normalized();
    assert_approx(0.76548066825 , actual.significand);
    assert_eq(511L + 163L, actual.exponent);

    prod.mul_no_overflow(_mm256_set_pd(1e100, -1e150, -1e125, -1e-200), M256D_ONE, M256D_ONE, M256D_ONE);
    prod.check_overflow();

    actual = prod.get().normalized();
    assert_approx(0.96717876383 , actual.significand);
    assert_eq(1022L + 233L, actual.exponent);

    VProd prod2(1.0);
    prod2.mul_no_overflow(_mm256_set_pd(-1e-80, 1e-75, 1e-90, 1e-120), M256D_ONE, M256D_ONE, M256D_ONE);
  }

//  {
//    VProd prod(100.0);
//    __m256i mask = _mm256_cmpeq_epi64(_mm256_set1_epi64x(2), _mm256_set1_epi64x(2));
//    prod.mul_mask_no_overflow(_mm256_set1_pd(10.0), _mm256_castsi256_pd(mask));
//
//    auto actual = prod.get().normalized();
//    assert_eq(LargeExponentFloat(100.0), actual);
//
//    mask = _mm256_cmpeq_epi64(_mm256_set1_epi64x(2), _mm256_set1_epi64x(3));
//    prod.mul_mask_no_overflow(_mm256_set_pd(5.0, 2.0, 10.0, 0.1), _mm256_castsi256_pd(mask));
//    actual = prod.get().normalized();
//    assert_approx(0.9765625, actual.significand);
//    assert_eq(10L, actual.exponent);
//
//    mask = _mm256_cmpeq_epi64(_mm256_set_epi64x(3,2,1,0), _mm256_set1_epi64x(2));
//    prod.mul_mask_no_overflow(_mm256_set_pd(2.0, 3.0, 4.0, 5.0), _mm256_castsi256_pd(mask));
//    actual = prod.get().normalized();
//    assert_approx(0.6103515625 , actual.significand);
//    assert_eq(16L, actual.exponent);
//  }

  cout << "vprod tests passed" << endl;
}




#endif
