#ifndef __VPROD_H
#define __VPROD_H

#include <iostream>
#include <immintrin.h>
#include <math.h>
#include <random>


using namespace std;

void print(__m256d v) {
  double x[4];
  _mm256_store_pd(x, v);
  cout << x[0] << "," << x[1] << "," << x[2] << "," << x[3] << endl;
}


void debug(__m256d v) {
  print(v);
}

double* new_double_array(int64_t size) {
  return static_cast<double*>(_mm_malloc(sizeof(double) * size, 32));
}

constexpr long int exponent_low_high=511;

inline void checkoverflow(double &prod, long int &exponent) {
  const double toohigh=pow(2,exponent_low_high);
  const double toolow=pow(2,-exponent_low_high);
  if (prod>toohigh) {
    prod*=toolow;
    exponent++;
  } else if (prod<toolow)  {
    prod*=toohigh;
    exponent--;
  }
}

__m256d abs(__m256d a) {
  const __m256d mask = _mm256_set1_pd(-0.);
  return _mm256_andnot_pd(mask, a); 
}

inline void checkoverflow(__m256d &prod, int64_t &exponent) {
  const __m256d toohigh = _mm256_set1_pd(pow(2,exponent_low_high));
  double p = pow(2,-exponent_low_high);
  const __m256d toolow  = _mm256_set1_pd(p);
  
  __m256d abs_prod = abs(prod);
  __m256d high_mask = _mm256_cmp_pd(abs_prod, toohigh, _CMP_GE_OS);
  __m256d low_mask  = _mm256_cmp_pd(abs_prod, toolow,  _CMP_LE_OS);

  if (!_mm256_testz_pd(high_mask, high_mask)) [[unlikely]] {
    int high_mask_bits = _mm256_movemask_pd(high_mask);
    exponent += _mm_popcnt_u32(high_mask_bits);
    abs_prod = _mm256_blendv_pd(abs_prod, _mm256_mul_pd(abs_prod, toolow), high_mask);  
  }
  
  if (!_mm256_testz_pd(low_mask, low_mask)) [[unlikely]] {
    int low_mask_bits  = _mm256_movemask_pd(low_mask);
    exponent -= _mm_popcnt_u32(low_mask_bits);
    abs_prod = _mm256_blendv_pd(abs_prod, _mm256_mul_pd(abs_prod, toohigh), low_mask);
  }
  
  prod = abs_prod;
}

inline void checkoverflow(__m256d &prod, __m256d& exponent) {
  const __m256d toohigh = _mm256_set1_pd(pow(2,exponent_low_high));
  double p = pow(2,-exponent_low_high);
  const __m256d toolow  = _mm256_set1_pd(p);
  const __m256d convert_mask = _mm256_castsi256_pd(_mm256_set1_epi64x(0x3ff0000000000000ULL));

  __m256d abs_prod = abs(prod);

  __m256d high_mask = _mm256_cmp_pd(abs_prod, toohigh, _CMP_GE_OS);
  if (!_mm256_testz_pd(high_mask, high_mask)) [[unlikely]] {
    __m256d inc = _mm256_and_pd(high_mask, convert_mask);
    exponent = _mm256_add_pd(exponent, inc);
    abs_prod = _mm256_blendv_pd(abs_prod, _mm256_mul_pd(abs_prod, toolow), high_mask);
  }


  __m256d low_mask  = _mm256_cmp_pd(abs_prod, toolow,  _CMP_LE_OS);
  if (!_mm256_testz_pd(low_mask, low_mask)) [[unlikely]] {
    __m256d dec = _mm256_and_pd(low_mask, convert_mask);
    exponent = _mm256_sub_pd(exponent, dec);
    abs_prod = _mm256_blendv_pd(abs_prod, _mm256_mul_pd(abs_prod, toohigh), low_mask);
  }

  prod = abs_prod;
}

__m256d mul_diff(__m256d prod, __m256d u, __m256d x) {
  return _mm256_mul_pd(prod, _mm256_sub_pd(u, x));
}

__m256d save_mul(__m256d prod1, __m256d prod2, int64_t& exponent) {
  __m256d prod = _mm256_mul_pd(prod1, prod2);
  checkoverflow(prod, exponent);
  return prod; 
}

__m256d save_mul(__m256d prod1, __m256d prod2, __m256d& exponent) {
  __m256d prod = _mm256_mul_pd(prod1, prod2);
  checkoverflow(prod, exponent);
  return prod;
}




static const __m256d _MM256_ONE = _mm256_set1_pd(1);  


constexpr const int EXPONENT_BIAS = 1023;

class LargeExponentFloat {
  private:

    typedef union {
      double f;
      struct {
        int64_t significand : 52;
        unsigned int exponent : 11;
        unsigned int sign : 1;
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

  void normalize() {
    float_cast& c = reinterpret_cast<float_cast&>(significand);
    exponent += c.parts.exponent - EXPONENT_BIAS;
    c.parts.exponent = EXPONENT_BIAS;
  }

  LargeExponentFloat normalized() const {
    LargeExponentFloat f(*this);
    f.normalize();
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

void checkoverflow(LargeExponentFloat& f) {
  const double toohigh = pow(2,exponent_low_high);
  const double toolow = pow(2,-exponent_low_high);
  if (f.significand>toohigh) {
    f.significand *= toolow;
    f.exponent += exponent_low_high;
  } else if (f.significand<toolow)  {
    f.significand *= toohigh;
    f.exponent -= exponent_low_high;
  }
}

inline LargeExponentFloat save_mul(const LargeExponentFloat& a, const LargeExponentFloat& b) {
  double prod = a.significand * b.significand;
  int64_t exponent = a.exponent + b.exponent;
  LargeExponentFloat result(prod, exponent);
  checkoverflow(result);
  return result;
}





class VProd {
  private:
    __m256d prod1;
    __m256d prod2;
    __m256d prod3;
    __m256d prod4;
    
    __m256d exponent; // Must be multiplied by 511 to get actual exponent
 
  public:  
    VProd(double fraction = 1.0, int64_t exponent = 0):
      prod1(_mm256_set_pd(1, 1, 1, fraction * pow(2, exponent % 511) )),
      prod2(_MM256_ONE),
      prod3(_MM256_ONE),
      prod4(_MM256_ONE),
      exponent(_mm256_set_pd(0, 0, 0, exponent / 511))
    {
    }

    void mul_no_overflow(__m256d mul1, __m256d mul2, __m256d mul3, __m256d mul4) {
      prod1 = _mm256_mul_pd(prod1, mul1);
      prod2 = _mm256_mul_pd(prod2, mul2);
      prod3 = _mm256_mul_pd(prod3, mul3);
      prod4 = _mm256_mul_pd(prod4, mul4);
    }
    
    void check_overflow() {
      ::checkoverflow(prod1, exponent);
      ::checkoverflow(prod2, exponent);
      ::checkoverflow(prod3, exponent);
      ::checkoverflow(prod4, exponent);
    }
    
    void mul(const VProd& other) {
      prod1 = save_mul(prod1, other.prod1, exponent);
      prod2 = save_mul(prod2, other.prod2, exponent);
      prod3 = save_mul(prod3, other.prod3, exponent);
      prod4 = save_mul(prod4, other.prod4, exponent);
      exponent += other.exponent;
    }

    LargeExponentFloat get() const {
      __m128i ints = _mm256_cvtpd_epi32(exponent);
      ints = _mm_hadd_epi32(ints, ints);
      ints = _mm_hadd_epi32(ints, ints);
      int64_t combined_exponent = _mm_extract_epi32(ints, 0);

      __m256d prod12 = save_mul(prod1, prod2, combined_exponent);
      __m256d prod34 = save_mul(prod3, prod4, combined_exponent);
      __m256d prod = save_mul(prod12, prod34, combined_exponent);

      double significand = horizontal_product(prod, combined_exponent);
      return LargeExponentFloat(significand, combined_exponent * 511);
    }

	static double horizontal_product(__m256d v, int64_t& exponent) {
	  __m256d one = _mm256_set1_pd(1);
	  __m256d vhigh = _mm256_permute2f128_pd(v, one, 0b0100000);
	  __m256d vlow  = _mm256_permute2f128_pd(v, one, 0b0100001);
	  __m256d x = save_mul(vlow, vhigh, exponent);

	  __m128d prod1 = _mm256_castpd256_pd128(x);

	  __m128d high64 = _mm_unpackhi_pd(prod1, prod1);
	  double result = abs(_mm_cvtsd_f64(_mm_mul_sd(prod1, high64)));  // reduce to scalar
	  checkoverflow(result, exponent);
	  return result;
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



void test_vprod() {
  {
    __m256d x = _mm256_set_pd(2e+26, 5e+150, 3e+50, 2.98334e+46);
    int64_t e = 0;
    double prod = VProd::horizontal_product(x, e);
    assert_approx(1.335046e+120, prod);
    assert_eq(1L, e);
  }
  
  {
    LargeExponentFloat f1(1536.0);
    LargeExponentFloat f2(1536.0, 0);
    LargeExponentFloat f3(0.75, 11);

    assert_eq(f1, f2);
    assert_eq(f1, f3);

    LargeExponentFloat f4(-1536.0, -100);
    f4.normalize();
    assert_eq(-1.5, f4.significand);
    assert_eq(-90L, f4.exponent);

    LargeExponentFloat f5(1.0, 50);
    f5.normalize();
    assert_eq(1.0, f5.significand);
    assert_eq(50L, f5.exponent);
  }


  {
  VProd prod(2.0); // 2
  prod.mul_no_overflow(_mm256_set_pd(2.0, 3.0, 5.0, 10.0), _MM256_ONE, _MM256_ONE, _MM256_ONE);  // 2 * 2 * 3 * 5 * 10 = 600
  
  auto actual = prod.get();
  assert_eq(LargeExponentFloat(600.), actual);
  
  prod.mul_no_overflow(_MM256_ONE, _mm256_set_pd(1e100, -1e50, 1e25, 1e25), _MM256_ONE, _MM256_ONE);
  actual = prod.get().normalized();
  assert_approx(1.53096133651, actual.significand);
  assert_eq(511L + 162L, actual.exponent);

  prod.mul_no_overflow(_mm256_set_pd(1e100, -1e150, -1e125, -1e-200), _MM256_ONE, _MM256_ONE, _MM256_ONE);
  prod.check_overflow();
  
  actual = prod.get().normalized();
  assert_approx(1.93435752767, actual.significand);
  assert_eq(1022L + 232L, actual.exponent);
  
  VProd prod2(1.0);
  prod2.mul_no_overflow(_mm256_set_pd(-1e-80, 1e-75, 1e-90, 1e-120), _MM256_ONE, _MM256_ONE, _MM256_ONE);
  }

  cout << "vprod tests passed" << endl;
}




#endif
