#include "large_product.h"

#include <iostream>
#include "gtest/gtest.h"

using namespace std;

double extract_double(__m256d v, int index) {
    double x[4];
    _mm256_storeu_pd(x, v);
    return x[index];
}

TEST(AvxUtils, horizontal_sum) {
  ASSERT_EQ(horizontal_sum(_mm256_set_epi64x(1,3,7,11)), 22L);
  ASSERT_EQ(horizontal_sum(_mm256_set_epi64x(10000, -3000, 70, 5500)), 12570L);
}

TEST(AvxUtils, horizontal_product) {
  __m256d x = _mm256_set_pd(2e+26, 5.0, 3e+50, 2.98334e+46);
  double prod = horizontal_product(x);
  ASSERT_DOUBLE_EQ(8.95002e+123, prod);
}

TEST(LargeProduct, extract_and_clear_exponent) {
  __m256d v = _mm256_set_pd(2, 1e20, 1e-20, -5e189);
  __m256i exp = extract_and_clear_exponent(v);
  ASSERT_EQ(EXPONENT_BIAS +  1LL, _mm256_extract_epi64(exp, 3));
  ASSERT_EQ(EXPONENT_BIAS + 66LL, _mm256_extract_epi64(exp, 2));
  ASSERT_EQ(EXPONENT_BIAS - 67LL, _mm256_extract_epi64(exp, 1));
  ASSERT_EQ(EXPONENT_BIAS +630LL, _mm256_extract_epi64(exp, 0));

  ASSERT_EQ(1.0, extract_double(v, 3));
  ASSERT_DOUBLE_EQ(1.3552527156068805, extract_double(v, 2));
  ASSERT_DOUBLE_EQ(1.475739525896764, extract_double(v, 1));
  ASSERT_DOUBLE_EQ(-1.1222063866923024, extract_double(v, 0));
}

TEST(LargeExponentFloat, normalize_exponent) {
  LargeExponentFloat f5(1.0, 50);
  f5.normalize_exponent();
  ASSERT_EQ(0.5, f5.significand);
  ASSERT_EQ(51L, f5.exponent);

  LargeExponentFloat f4(-1536.0, -100);
  f4.normalize_exponent();
  ASSERT_EQ(-0.75, f4.significand);
  ASSERT_EQ(-89L, f4.exponent);

  LargeExponentFloat f6(9.56257e-99, -1533);
  f6.normalize_exponent();
  ASSERT_DOUBLE_EQ(0.65361681760275891, f6.significand);
  ASSERT_EQ(-1533L -325 , f6.exponent);

  LargeExponentFloat f1(1536.0);
  LargeExponentFloat f2(1536.0, 0);
  LargeExponentFloat f3(0.75, 11);

  ASSERT_EQ(f1, f2);
  ASSERT_EQ(f1, f3);
}

TEST(LargeProduct, mul_no_overflow) {
  LargeProduct prod(2.0); // 2
  prod.mul_no_overflow(_mm256_set_pd(2.0, 3.0, 5.0, 10.0), M256D_ONE, M256D_ONE, M256D_ONE);  // 2 * 2 * 3 * 5 * 10 = 600
  auto actual = prod.get();
  ASSERT_EQ(LargeExponentFloat(600.), actual);

  prod.mul_no_overflow(M256D_ONE, _mm256_set_pd(1e100, -1e50, 1e25, 1e25), M256D_ONE, M256D_ONE);
  actual = prod.get().normalized();
  ASSERT_DOUBLE_EQ(-0.76548057224429333 , actual.significand);
  ASSERT_EQ(511L + 163L, actual.exponent);

  prod.mul_no_overflow(_mm256_set_pd(1e100, -1e150, -1e125, -1e-200), M256D_ONE, M256D_ONE, M256D_ONE);
  prod.normalize_exponent();

  actual = prod.get().normalized();
  ASSERT_DOUBLE_EQ(0.96717862988773895 , actual.significand);
  ASSERT_EQ(1022L + 233L, actual.exponent);
}

TEST(LargeProduct, mul_mask_no_overflow) {
  LargeProduct prod(100.0);
  __m256i mask = _mm256_cmpeq_epi64(_mm256_set1_epi64x(2), _mm256_set1_epi64x(2));
  prod.mul_mask_no_overflow(_mm256_set1_pd(10.0), _mm256_castsi256_pd(mask));

  auto actual = prod.get().normalized();
  ASSERT_EQ(LargeExponentFloat(100.0), actual);

  mask = _mm256_cmpeq_epi64(_mm256_set1_epi64x(2), _mm256_set1_epi64x(3));
  prod.mul_mask_no_overflow(_mm256_set_pd(5.0, 2.0, 10.0, 0.1), _mm256_castsi256_pd(mask));
  actual = prod.get().normalized();
  ASSERT_DOUBLE_EQ(0.9765625, actual.significand);
  ASSERT_EQ(10L, actual.exponent);

  mask = _mm256_cmpeq_epi64(_mm256_set_epi64x(3,2,1,0), _mm256_set1_epi64x(2));
  prod.mul_mask_no_overflow(_mm256_set_pd(2.0, 3.0, 4.0, 5.0), _mm256_castsi256_pd(mask));
  actual = prod.get().normalized();
  ASSERT_DOUBLE_EQ(0.6103515625 , actual.significand);
  ASSERT_EQ(16L, actual.exponent);
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
