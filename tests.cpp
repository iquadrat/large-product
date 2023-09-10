#include "large_product.h"
#include "vandermonde_det.h"

#include <iostream>
#include "gtest/gtest.h"

using namespace std;

double extract_double(__m256d v, int index) {
    double x[4];
    _mm256_storeu_pd(x, v);
    return x[index];
}

#ifdef __AVX2__
TEST(AvxUtils, horizontal_sum_256i) {
  ASSERT_EQ(horizontal_sum(_mm256_set_epi64x(1,3,7,11)), 22L);
  ASSERT_EQ(horizontal_sum(_mm256_set_epi64x(10000, -3000, 70, 5500)), 12570L);
}
#endif

TEST(AvxUtils, horizontal_sum_128i) {
  __m256i v64 = _mm256_set_epi64x(1024L << 52,3L << 52,2L << 52,1L << 52);
  __m128i v32 = shl52_and_extract_high32bit_from_epi64(v64);
  ASSERT_EQ(1, _mm_extract_epi32(v32, 0));
  ASSERT_EQ(2, _mm_extract_epi32(v32, 2));
  ASSERT_EQ(3, _mm_extract_epi32(v32, 1));
  ASSERT_EQ(1024, _mm_extract_epi32(v32, 3));
}

TEST(AvxUtils, horizontal_product) {
  __m256d x = _mm256_set_pd(2e+26, 5.0, 3e+50, 2.98334e+46);
  double prod = horizontal_product(x);
  ASSERT_DOUBLE_EQ(8.95002e+123, prod);
}

TEST(LargeProduct, extract_and_clear_exponent) {
  __m256d v = _mm256_set_pd(2, 1e20, 1e-20, -5e189);

#ifdef __AVX2__
  const int EXPONENT_BIAS = 1023;
  __m256i exp = extract_and_clear_exponent(v);
  ASSERT_EQ(EXPONENT_BIAS +  1LL, _mm256_extract_epi64(exp, 3));
  ASSERT_EQ(EXPONENT_BIAS + 66LL, _mm256_extract_epi64(exp, 2));
  ASSERT_EQ(EXPONENT_BIAS - 67LL, _mm256_extract_epi64(exp, 1));
  ASSERT_EQ(EXPONENT_BIAS +630LL, _mm256_extract_epi64(exp, 0));
#else // __AVX__
  __m128i exp = extract_and_clear_exponent(v);
  ASSERT_EQ(  1, _mm_extract_epi32(exp, 3));
  ASSERT_EQ( 66, _mm_extract_epi32(exp, 1));
  ASSERT_EQ(-67, _mm_extract_epi32(exp, 2));
  ASSERT_EQ(630, _mm_extract_epi32(exp, 0));
#endif

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
  prod.mul_no_overflow1234(_mm256_set_pd(2.0, 3.0, 5.0, 10.0), M256D_ONE, M256D_ONE, M256D_ONE);  // 2 * 2 * 3 * 5 * 10 = 600
  auto actual = prod.get();
  ASSERT_EQ(LargeExponentFloat(600.), actual);

  prod.mul_no_overflow1234(M256D_ONE, _mm256_set_pd(1e100, -1e50, 1e25, 1e25), M256D_ONE, M256D_ONE);
  actual = prod.get().normalized();
  ASSERT_DOUBLE_EQ(-0.76548057224429333 , actual.significand);
  ASSERT_EQ(511L + 163L, actual.exponent);

  prod.mul_no_overflow1234(_mm256_set_pd(1e100, -1e150, -1e125, -1e-200), M256D_ONE, M256D_ONE, M256D_ONE);
  prod.normalize_exponent1234();

  actual = prod.get().normalized();
  ASSERT_DOUBLE_EQ(0.96717862988773895 , actual.significand);
  ASSERT_EQ(1022L + 233L, actual.exponent);
}

TEST(LargeProduct, mul_mask_no_overflow) {
  LargeProduct prod(100.0);
  __m256d mask = _mm256_cmp_pd(_mm256_set1_pd(2), _mm256_set1_pd(2), _CMP_EQ_OQ);
  prod.mul_mask_no_overflow(_mm256_set1_pd(10.0), mask);

  auto actual = prod.get().normalized();
  ASSERT_EQ(LargeExponentFloat(100.0), actual);

  mask = _mm256_cmp_pd(_mm256_set1_pd(2), _mm256_set1_pd(3), _CMP_EQ_OQ);
  prod.mul_mask_no_overflow(_mm256_set_pd(5.0, 2.0, 10.0, 0.1), mask);
  actual = prod.get().normalized();
  ASSERT_DOUBLE_EQ(0.9765625, actual.significand);
  ASSERT_EQ(10L, actual.exponent);

  mask = _mm256_cmp_pd(_mm256_set_pd(3,2,1,0), _mm256_set1_pd(2), _CMP_EQ_OQ);
  prod.mul_mask_no_overflow(_mm256_set_pd(2.0, 3.0, 4.0, 5.0), mask);
  actual = prod.get().normalized();
  ASSERT_DOUBLE_EQ(0.6103515625 , actual.significand);
  ASSERT_EQ(16L, actual.exponent);
}

// fills array x with random values in (a,b)
void init_random_positions(std::mt19937_64& gen, const long int N, const double a, const double b, double * x) {
  std::uniform_real_distribution<double> distu(0.0, 1.0);
  for (int j=0; j<N; j++) {
    x[j]=distu(gen)*(b-a)+a;
  }
}

TEST(prod_diff_realrealvec, nice_N) {
  constexpr int64_t N = 16000;
  double* x = new_double_array(N);
  std::mt19937_64 gen(42);
  init_random_positions(gen,N,-1,1,x);

  LargeExponentFloat prod1(7.1, 42 * 511);
  LargeExponentFloat prod2(0.02, -2 * 511);

  prod_diff_realrealvec(N, 61, 0.0521, 1.213, x, prod1, prod2);
  prod1.normalize_exponent();
  prod2.normalize_exponent();
  ASSERT_NEAR(0.65361705616912014, prod1.significand, 1e-8);
  ASSERT_EQ(-1533L - 325, prod1.exponent);
  ASSERT_NEAR(0.5984860745221855, prod2.significand, 1e-8);
  ASSERT_EQ(33L, prod2.exponent);

  prod_diff_realrealvec(N, 256, -10.23, 0.021, x, prod1, prod2);
  prod1.normalize_exponent();
  prod2.normalize_exponent();
  ASSERT_NEAR(-0.56747763050434163, prod1.significand, 1e-8);
  ASSERT_EQ(101 * 511L + 167, prod1.exponent);
  ASSERT_NEAR(-0.50089024186954312, prod2.significand, 1e-8);
  ASSERT_EQ(-23262L, prod2.exponent);

  delete[] x;
}

TEST(prod_diff_realrealvec, n1000)  {
  constexpr int64_t N = 1000;
  double* x = new_double_array(N);
  std::mt19937_64 gen(42);
  init_random_positions(gen,N,-1,1,x);

  LargeExponentFloat prod1(7.1, 42 * 511);
  LargeExponentFloat prod2(0.02, -2 * 511);

  prod_diff_realrealvec(N, 61, 0.0521, 1.213, x, prod1, prod2);
  prod1.normalize_exponent();
  prod2.normalize_exponent();

  ASSERT_NEAR(0.897775, prod1.significand, 1e-6);
  ASSERT_EQ(19932L, prod1.exponent);
  ASSERT_NEAR(0.992222 , prod2.significand, 1e-6);
  ASSERT_EQ(-932L, prod2.exponent);

  delete[] x;
}

TEST(prod_diff_realrealvec, odd_N) {
  constexpr int64_t N = 999;
  double* x = new_double_array(N);
  std::mt19937_64 gen(42);
  init_random_positions(gen,N,-1,1,x);

  LargeExponentFloat prod1(7.1, 42 * 511);
  LargeExponentFloat prod2(0.02, -2 * 511);

  prod_diff_realrealvec(N, 995, 0.0521, 1.213, x, prod1, prod2);
  prod1.normalize_exponent();
  prod2.normalize_exponent();

  ASSERT_NEAR(-0.534702, prod1.significand, 1e-6);
  ASSERT_EQ(19931L, prod1.exponent);
  ASSERT_NEAR(0.552373 , prod2.significand, 1e-6);
  ASSERT_EQ(-931L, prod2.exponent);

  delete[] x;
}

TEST(prod_dist2_complexcomplexvec, nice_N) {
  constexpr int64_t N = 16000;
  double* x = new_double_array(N);
  double* y = new_double_array(N);
  std::mt19937_64 gen(42);
  init_random_positions(gen,N,-1,1,x);
  init_random_positions(gen,N,-1,1,y);

  LargeExponentFloat prod1(7.1, 42 * 511);
  LargeExponentFloat prod2(0.02, -2 * 511);

  prod_dist2_complexcomplexvec(N, 2122, 1.4334, 0.1233, -2.13, 0.111, x, y, prod1, prod2);
  prod1.normalize_exponent();
  prod2.normalize_exponent();

  ASSERT_NEAR(0.632441, prod1.significand, 1e-6);
  ASSERT_EQ(64905L, prod1.exponent);
  ASSERT_NEAR(0.756793, prod2.significand, 1e-6);
  ASSERT_EQ(-17743L, prod2.exponent);

  delete[] x;
  delete[] y;
}

TEST(prod_dist2_complexcomplexvec, odd_N) {
  constexpr int64_t N = 999;
  double* x = new_double_array(N);
  double* y = new_double_array(N);
  std::mt19937_64 gen(11);
  init_random_positions(gen,N,-1,1,x);
  init_random_positions(gen,N,-1,1,y);

  LargeExponentFloat prod1(7.1, 42 * 511);
  LargeExponentFloat prod2(0.02, -2 * 511);

  prod_dist2_complexcomplexvec(N, 997, 1.4334, 0.1233, -2.13, 0.111, x, y, prod1, prod2);
  prod1.normalize_exponent();
  prod2.normalize_exponent();

  ASSERT_NEAR(0.518394, prod1.significand, 1e-6);
  ASSERT_EQ(24163L, prod1.exponent);
  ASSERT_NEAR(0.742441, prod2.significand, 1e-6);
  ASSERT_EQ(-2072L, prod2.exponent);

  delete[] x;
  delete[] y;
}

TEST(prod_dist2_realcomplexvec, nice_N) {
  constexpr int64_t N = 1024;
  double* x = new_double_array(N);
  double* y = new_double_array(N);
  std::mt19937_64 gen(11);
  init_random_positions(gen,N,-1,1,x);
  init_random_positions(gen,N,-1,1,y);

  LargeExponentFloat prod1(5.6);
  LargeExponentFloat prod2(0.23);

  prod_dist2_realcomplexvec(N, 0.4434, -0.1234, x, y, prod1, prod2);
  prod1.normalize_exponent();
  prod2.normalize_exponent();

  ASSERT_NEAR(0.86773718708223435, prod1.significand, 1e-8);
  ASSERT_EQ(-876L, prod1.exponent);
  ASSERT_NEAR(0.70912090279846229, prod2.significand, 1e-6);
  ASSERT_EQ(-1114L, prod2.exponent);

  delete[] x;
  delete[] y;
}

TEST(prod_dist2_realcomplexvec, odd_N) {
  constexpr int64_t N = 999;
  double* x = new_double_array(N);
  double* y = new_double_array(N);
  std::mt19937_64 gen(11);
  init_random_positions(gen,N,-1,1,x);
  init_random_positions(gen,N,-1,1,y);

  LargeExponentFloat prod1(5.6);
  LargeExponentFloat prod2(0.23);

  prod_dist2_realcomplexvec(N, 50.4434, -0.001234, x, y, prod1, prod2);
  prod1.normalize_exponent();
  prod2.normalize_exponent();

  ASSERT_NEAR(0.87622155391709977, prod1.significand, 1e-8);
  ASSERT_EQ(11305L, prod1.exponent);
  ASSERT_NEAR(0.88896091384513432, prod2.significand, 1e-6);
  ASSERT_EQ(-1086L, prod2.exponent);

  delete[] x;
  delete[] y;
}

TEST(prod_dist2_complexrealvec, nice_N) {
  constexpr int64_t N = 1024;
  double* x = new_double_array(N);
  std::mt19937_64 gen(11);
  init_random_positions(gen,N,-1,1,x);

  LargeExponentFloat prod1(5.6);
  LargeExponentFloat prod2(0.23);

  prod_dist2_complexrealvec(N, 0.481, -1.22, 120.051, 0.683, x, prod1, prod2);

  prod1.normalize_exponent();
  prod2.normalize_exponent();

  ASSERT_NEAR(0.54009349550881158, prod1.significand, 1e-8);
  ASSERT_EQ(14150L, prod1.exponent);
  ASSERT_NEAR(0.50290573150432916, prod2.significand, 1e-8);
  ASSERT_EQ(868L, prod2.exponent);

  delete[] x;
}

TEST(prod_dist2_complexrealvec, odd_N) {
  constexpr int64_t N = 999;
  double* x = new_double_array(N);
  std::mt19937_64 gen(11);
  init_random_positions(gen,N,-1,1,x);

  LargeExponentFloat prod1(5.6);
  LargeExponentFloat prod2(0.23);

  prod_dist2_complexrealvec(N, 0.481, -1.22, 1.051, -10.00001, x, prod1, prod2);

  prod1.normalize_exponent();
  prod2.normalize_exponent();

  ASSERT_NEAR(0.77449635212666623, prod1.significand, 1e-8);
  ASSERT_EQ(655L, prod1.exponent);
  ASSERT_NEAR(0.77864037280040022, prod2.significand, 1e-8);
  ASSERT_EQ(6661L, prod2.exponent);

  delete[] x;
}

TEST(prod_dist2_complexcomplexvec, small) {
  std::mt19937_64 gen = std::mt19937_64();

  const long int M = 1000;

  double * x = new_double_array(M);
  double * y = new_double_array(M);

  const double b=1e-5;

  init_random_positions(gen, M,-b,b,x);
  init_random_positions(gen, M,-b,b,y);

  const long int j=262;
  const long int N=261;

  const double u=x[j-1];
  const double u0=x[j];
  const double v=y[j-1];
  const double v0=y[j];

  LargeExponentFloat prod1(1.0);
  LargeExponentFloat prod2(1.0);

  prod_dist2_complexcomplexvec(N,0,u,u0,v,v0,x,y,prod1,prod2);

  LargeExponentFloat expectedProd1(1.01701e-43, -8687);
  prod1.normalize_exponent();
  expectedProd1.normalize_exponent();

  EXPECT_EQ(-8829, expectedProd1.exponent);
  EXPECT_NEAR(0.56700202185894077, expectedProd1.significand, 1e-6);

  delete[] x;
  delete[] y;
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
