#include <cmath>
#include "vandermonde_det_reference.h"

const double vandermonde_factor_ln = std::log(static_cast<double>(2)) * vandermonde_exponent_low_high;
const double vandermonde_toohigh = std::pow(2, vandermonde_exponent_low_high);
const double vandermonde_toolow = std::pow(2, -vandermonde_exponent_low_high);


inline void vandermonde_check_overflow(double &prod, long int &exponent) {
  if (prod > vandermonde_toohigh) [[unlikely]] {
    prod *= vandermonde_toolow;
    exponent++;
  } else if (prod < vandermonde_toolow) [[unlikely]] {
    prod *= vandermonde_toohigh;
    exponent--;
  }
}

inline void vandermonde_check_abs_overflow(double &prod, long int &exponent) {
  const double proda = std::abs(prod);
  if (proda > vandermonde_toohigh) [[unlikely]] {
    prod *= vandermonde_toolow;
    exponent++;
  } else if (proda < vandermonde_toolow) [[unlikely]] {
    prod *= vandermonde_toohigh;
    exponent--;
  }
}


inline double sqr(const double x) {
  return x * x;
}


void prod_diff_realrealvec_reference(
        const long int N,
        const long int k,
        const double u1,
        const double u2,
        const double *x,
        double &prod1,
        double &prod2,
        long int &exponent1,
        long int &exponent2
) {
  for (long int j = 0; j < N; j++) [[likely]] {
    if (j != k) [[likely]] {
      prod1 *= u1 - x[j];
      prod2 *= u2 - x[j];
      vandermonde_check_abs_overflow(prod1, exponent1);
      vandermonde_check_abs_overflow(prod2, exponent2);
    }
  }
}

void prod_dist2_realcomplexvec_reference(
        const long int N,
        const double u1,
        const double u2,
        const double *x,
        const double *y,
        double &prod1,
        double &prod2,
        long int &exponent1,
        long int &exponent2
) {
  for (long int j = 0; j < N; j++) [[likely]] {
    const double y_sqr = sqr(y[j]);
    prod1 *= sqr(u1 - x[j]) + y_sqr;
    prod2 *= sqr(u2 - x[j]) + y_sqr;
    vandermonde_check_overflow(prod1, exponent1);
    vandermonde_check_overflow(prod2, exponent2);
  }
}


void prod_dist2_complexrealvec_reference(
        const long int N,
        const double u1,
        const double u2,
        const double v1,
        const double v2,
        const double *x,
        double &prod1,
        double &prod2,
        long int &exponent1,
        long int &exponent2
) {
  const double v1_sqr = sqr(v1);
  const double v2_sqr = sqr(v2);
  for (long int j = 0; j < N; j++) [[likely]] {
    prod1 *= sqr(u1 - x[j]) + v1_sqr;
    prod2 *= sqr(u2 - x[j]) + v2_sqr;;
    vandermonde_check_overflow(prod1, exponent1);
    vandermonde_check_overflow(prod2, exponent2);
  }
}


void prod_dist2_complexcomplexvec_reference(
        const long int N,
        const long int k,
        const double u1,
        const double u2,
        const double v1,
        const double v2,
        const double *x,
        const double *y,
        double &prod1,
        double &prod2,
        long int &exponent1,
        long int &exponent2
) {
  for (long int j = 0; j < N; j++) [[likely]] {
    if (j != k) [[likely]] {
      prod1 *= sqr(u1 - x[j]) + sqr(v1 - y[j]);
      prod2 *= sqr(u2 - x[j]) + sqr(v2 - y[j]);
      vandermonde_check_overflow(prod1, exponent1);
      vandermonde_check_overflow(prod2, exponent2);
    }
  }
}


void vandermonde_real_reference(
        const long int N,
        const double *x,
        double &prod,
        long int &exponent
) {
  for (int64_t j = 1; j < N; j++) [[likely]] {
    for (int64_t k = 0; k < j; k++) [[likely]] {
      prod *= x[j] - x[k];
      vandermonde_check_abs_overflow(prod, exponent);
    }
  }
}


void vandermonde_abs2_complex_reference(
        const long int N,
        const double *x,
        const double *y,
        double &prod,
        long int &exponent
) {
  for (int64_t j = 1; j < N; j++) [[likely]] {
    for (int64_t k = 0; k < j; k++) [[likely]] {
      prod *= sqr(x[k] - x[j]) + sqr(y[k] - y[j]);
      vandermonde_check_overflow(prod, exponent);
    }
  }
}


void vandermonde_abs2_mixed_terms_reference(
        const long int Nreal,
        const long int Ncomplex,
        const double *lambda,
        const double *x,
        const double *y,
        double &prod,
        long int &exponent
) {
  for (int64_t j = 0; j < Ncomplex; j++) [[likely]] {
    double y2 = sqr(y[j]);
    for (int64_t k = 0; k < Nreal; k++) [[likely]] {
      prod *= sqr(x[j] - lambda[k]) + y2;
      vandermonde_check_overflow(prod, exponent);
    }
  }
}



