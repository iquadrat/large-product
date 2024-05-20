#ifndef LARGE_PRODUCT_H
#define LARGE_PRODUCT_H


#ifndef __OPENCL_VERSION__

#include <math.h>

#endif // __OPENCL_VERSION__

struct LargeProduct {
    double prod;
    int exponent;

#ifndef __OPENCL_VERSION__
    void normalize_exponent() {
      int delta_exponent;
      double mantissa = frexp(prod, &delta_exponent);
      prod = ldexp(mantissa, 0);
      exponent += delta_exponent;
    }
#endif // __OPENCL_VERSION__
};

#endif
