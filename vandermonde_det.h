#ifndef VANDERMONDE_DET_H
#define VANDERMONDE_DET_H

#include <mm_malloc.h>
#include "large_product.h"

inline double* new_double_array(int64_t size) {
  // round up size to be a multiple of 4
  int64_t rounded_size = (size + 3) & ~3;
  return static_cast<double*>(_mm_malloc(sizeof(double) * rounded_size, 64));
}


void prod_diff_realrealvec(
        const long int N,
        const long int k,
        const double u1,
        const double u2,
        const double* x,
        LargeExponentFloat& prod1,
        LargeExponentFloat& prod2
) __attribute__((optimize("-fno-tree-pre")));

void prod_dist2_realcomplexvec(
        const long int N,
        const double u1,
        const double u2,
        const double* x,
        const double* y,
        LargeExponentFloat& prod1,
        LargeExponentFloat& prod2
) __attribute__((optimize("-fno-tree-pre")));

void prod_dist2_realcomplexvec_optm2(
        const long int N,
        const double u1,
        const double u2,
        const double* x,
        const double* y,
        LargeExponentFloat& prod1,
        LargeExponentFloat& prod2
) __attribute__((optimize("-fno-tree-pre")));

void prod_dist2_complexrealvec(
        const long int N,
        const double u1,
        const double u2,
        const double v1,
        const double v2,
        const double* x,
        LargeExponentFloat& prod1,
        LargeExponentFloat& prod2
) __attribute__((optimize("-fno-tree-pre")));

void prod_dist2_complexcomplexvec(
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
) __attribute__((optimize("-fno-tree-pre")));


void vandermonde_real(
        const long int N,
        const double* x,
        LargeExponentFloat& prod
);

void vandermonde_abs2_complex(
        const long int N,
        const double* x,
        const double* y,
        LargeExponentFloat& prod
);

void vandermonde_abs2_mixed_terms(
        const long int Nreal,
	const long int Ncomplex,
        const double* lambda,
        const double* x,
        const double* y,
        LargeExponentFloat& prod
);

void vandermonde_abs2_mixed_terms_small_Nreal(
        const long int Nreal,
        const long int Ncomplex,
        const double* lambda,
        const double* x,
        const double* y,
        LargeExponentFloat& prod
);

void vandermonde_abs2_mixed(
        const long int Nreal,
        const long int Ncomplex,
        const double* lambda,
        const double* x,
        const double* y,
        LargeExponentFloat& prod
);

#endif
