# Large Product Library

## large_product.h

The class LargeProduct can be used to compute a product that is calculated from multiplying 1000s of multiplicands.
Multiplying such large products tend to over- or underflow. To protect against that, LargeProduct has a method to
normalize the exponents. Calling this methods normalizes the exponents of the internal double precision (sub)products
to a value in the range [0.5, 1.0).

The resulting product is stored as a LargeExponentFloat which stores the exponent (as a power of two) in a separate
integer field.

## vector_products.h

Specialized functions using LargeProduct to compute large products of complex differences.

## Usage

./run_tests.sh runs all the unit tests.
./run_benchmark.sh runs all the benchmarks.

To use vector_products.h in your own code, include the header file and add vector_products.cpp to your source code.
Make sure the headers are in your include path.
