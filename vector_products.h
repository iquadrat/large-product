#ifndef __VECTOR_PRODUCTS_H
#define __VECTOR_PRODUCTS_H

#include <mm_malloc.h>
#include "large_product.h"

inline double* new_double_array(int64_t size) {
  // round up size to be a multiple of 4
  int64_t rounded_size = (size + 3) & ~3;
  return static_cast<double*>(_mm_malloc(sizeof(double) * rounded_size, 64));
}


// **************************************************************************
// Simple code to optimize: 4 variantes. 
// Most important 1. (prod_realreal) and 4. (prod_complexcomplex), 2. and 3. should be simply modification of 4. 
// There should not be more than 32 (better 16) multiplication between factors without balancing the exponent OR not more than 16 (8) multiplication when only checking against a overflowing exponent
// N=1000..100000

void prod_realreal(
        const long int N,
        const long int k,
        const double u1,
        const double u2,
        const double* x,
        LargeExponentFloat& prod1,
        LargeExponentFloat& prod2
);

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
);

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
);


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
);

#endif