/* compile with:

g++ -std=c++11 -O3 -funroll-loops -march=native -lm -o test_simple_problem2 test_simple_problem2.cpp  

*/

#include <iostream>
#include <string>
#include <vector>
#include <stdio.h>
#include <new>
#include <random>
#include <math.h>
#include <cstring>
#include <algorithm>    // std::swap
#include <ctime>
#include <unistd.h>
#include <gnu/libc-version.h>
#include <cassert>
#include <mm_malloc.h>
#include "VProd.h"

using namespace std;


static std::mt19937_64 gen;
static std::uniform_real_distribution<double> distu(0.0, 1.0);

inline double sqr(const double x) {
  return x*x;
}

void init_random_positions(const long int N, const double a, const double b, double * x) { // fills array x with random values in (a,b)
  for (int j=0; j<N; j++) x[j]=distu(gen)*(b-a)+a;
  return;
}

class stopwatch {
  private:
  std::clock_t c_equil = std::clock();
  double time_start;
  double time_lap=0;
  double time_total=0;
  bool running=false;
  const double inv_cps=(double)1 / (double)CLOCKS_PER_SEC;
  public:
  stopwatch() { reset(); }
  void reset() {
    running=false;
    time_total=0;
    time_lap=0;
    return;
  }
  void start() { 
    if (~running) {
      running=true;
      time_start=(double)std::clock();
    }
    return;
  }
  void stop() { 
    if (running) {
      running=false;
      double time_stop=(double)std::clock();
      time_total+=(time_stop-time_start)*inv_cps;
    }
    return;
  }
  void lap() { 
    time_lap=get_time(); 
    return;
  }
  double get_time() { // gives total running time
    double time_current=time_total;
    if (running) {
      double time_stop_current=(double)std::clock();
      time_current+=(time_stop_current-time_start)*inv_cps;
    }
    return time_current;
  } 
  double get_lap() {    // gives running time since last call of lap
    return get_time()-time_lap;
  }
};




// **************************************************************************
// Simple code to optimize: 4 variantes. 
// Most important 1. (prod_realreal) and 4. (prod_complexcomplex), 2. and 3. should be simply modification of 4. 
// There should not be more than 32 (better 16) multiplication between factors without balancing the exponent OR not more than 16 (8) multiplication when only checking against a overflowing exponent
// N=1000..100000

void prod_realreal(const long int N, const long int k, const double u1, const double u2, const double * x, LargeExponentFloat& prod1, LargeExponentFloat& prod2) {
  const int64_t ELEMENTS_PER_LOOP = 4 * 4;
  assert(N % ELEMENTS_PER_LOOP == 0);
  assert(reinterpret_cast<uintptr_t>(x) % 32 == 0);

  VProd vprod1(prod1.significand, prod1.exponent);
  VProd vprod2(prod2.significand, prod2.exponent);
  
  __m256d u1_vec = _mm256_set1_pd(u1);
  __m256d u2_vec = _mm256_set1_pd(u2);
  
  int64_t skipj = k & (-ELEMENTS_PER_LOOP);
  
  // prod of u-x[j] for all j!=k
  for (int64_t j=0; j<N; j += ELEMENTS_PER_LOOP) [[likely]] {
    if (j != skipj) [[likely]] {
      const __m256d x0 = _mm256_load_pd(&x[j +  0]);
      const __m256d x1 = _mm256_load_pd(&x[j +  4]);
      const __m256d x2 = _mm256_load_pd(&x[j +  8]);
      const __m256d x3 = _mm256_load_pd(&x[j + 12]);
      vprod1.mul_no_overflow(
        _mm256_sub_pd(u1_vec, x0),
        _mm256_sub_pd(u1_vec, x1),
        _mm256_sub_pd(u1_vec, x2),
        _mm256_sub_pd(u1_vec, x3)
      );
      vprod2.mul_no_overflow(
        _mm256_sub_pd(u2_vec, x0),
        _mm256_sub_pd(u2_vec, x1),
        _mm256_sub_pd(u2_vec, x2),
        _mm256_sub_pd(u2_vec, x3)
      );
    }
   
    if ((j / ELEMENTS_PER_LOOP) % 8 == 0) { 
      vprod1.check_overflow();
      vprod2.check_overflow();
    }
  }

  vprod1.check_overflow();
  vprod2.check_overflow();
    
  prod1 = vprod1.get();
  prod2 = vprod2.get();

  for (int j=skipj; j<skipj + ELEMENTS_PER_LOOP; j++) {
    if (j == k) {
      continue;
    }
    prod1 = save_mul(prod1, abs(u1 - x[j]));
    prod2 = save_mul(prod2, abs(u2 - x[j]));
  }

} 

void prod_realcomplex(const long int N, const double u, const double u0, const double * x, const double * y, double &prod, long int &exponent, double &prod0, long int &exponent0) {
  
  for (int j=0; j<N; j++) {
    prod*=sqr(u-x[j])+sqr(y[j]);
    prod0*=sqr(u0-x[j])+sqr(y[j]);
    checkoverflow(prod,exponent);
    checkoverflow(prod0,exponent0);
  }
  return;
}


void prod_complexreal(const long int N, const double u, const double u0, const double v, const double v0, const double * x, double &prod, long int &exponent, double &prod0, long int &exponent0) {
  
  const double v2=sqr(v);
  const double v02=sqr(v0);
  for (int j=0; j<N; j++) {
    prod*=sqr(u-x[j])+v2;
    prod0*=sqr(u0-x[j])+v02;
    checkoverflow(prod,exponent);
    checkoverflow(prod0,exponent0);
  }
  return;
}

__m256d sqr(__m256d v) {
  return _mm256_mul_pd(v,v);
}

__m256d sqr_diff(__m256d x, __m256d y, __m256d u, __m256d v) {
   return _mm256_add_pd(
       sqr(_mm256_sub_pd(u, x)),
       sqr(_mm256_sub_pd(v, y))
     );
}


void prod_complexcomplex(const long int N, const long int k, const double u1, const double u2, const double v1, const double v2, const double * x, const double * y, LargeExponentFloat& prod1, LargeExponentFloat& prod2) {
  const int64_t ELEMENTS_PER_LOOP = 4 * 4;
  assert(N % ELEMENTS_PER_LOOP == 0);
  assert(reinterpret_cast<uintptr_t>(x) % 32 == 0);

  VProd vprod1(prod1.significand, prod1.exponent);
  VProd vprod2(prod2.significand, prod2.exponent);

  __m256d u1_vec = _mm256_set1_pd(u1);
  __m256d u2_vec = _mm256_set1_pd(u2);
  __m256d v1_vec = _mm256_set1_pd(v1);
  __m256d v2_vec = _mm256_set1_pd(v2);

  int64_t skipj = k & (-ELEMENTS_PER_LOOP);

  // prod of u-x[j] for all j!=k
  for (int64_t j=0; j<N; j += ELEMENTS_PER_LOOP) [[likely]] {
    if (j != skipj) [[likely]] {
      const __m256d x0 = _mm256_load_pd(&x[j +  0]);
      const __m256d x1 = _mm256_load_pd(&x[j +  4]);
      const __m256d x2 = _mm256_load_pd(&x[j +  8]);
      const __m256d x3 = _mm256_load_pd(&x[j + 12]);

      const __m256d y0 = _mm256_load_pd(&y[j +  0]);
      const __m256d y1 = _mm256_load_pd(&y[j +  4]);
      const __m256d y2 = _mm256_load_pd(&y[j +  8]);
      const __m256d y3 = _mm256_load_pd(&y[j + 12]);

      vprod1.mul_no_overflow(
        sqr_diff(x0, y0, u1_vec, v1_vec),
        sqr_diff(x1, y1, u1_vec, v1_vec),
        sqr_diff(x2, y2, u1_vec, v1_vec),
        sqr_diff(x3, y3, u1_vec, v1_vec)
      );
      vprod2.mul_no_overflow(
        sqr_diff(x0, y0, u2_vec, v2_vec),
        sqr_diff(x1, y1, u2_vec, v2_vec),
        sqr_diff(x2, y2, u2_vec, v2_vec),
        sqr_diff(x3, y3, u2_vec, v2_vec)
      );
    }

    if ((j / ELEMENTS_PER_LOOP) % 8 == 0) {
      vprod1.check_overflow();
      vprod2.check_overflow();
    }
  }

  vprod1.check_overflow();
  vprod2.check_overflow();

  prod1 = vprod1.get();
  prod2 = vprod2.get();

  for (int j=skipj; j<skipj + ELEMENTS_PER_LOOP; j++) {
    if (j == k) {
      continue;
    }
    prod1 = save_mul(prod1, sqr(u1-x[j])+sqr(v1-y[j]));
    prod2 = save_mul(prod2, sqr(u2-x[j])+sqr(v2-y[j]));
  }
 }

// **************************************************************************

void test_realreal() {
  
  {
    constexpr int64_t N = 16000;
    double* x = new_double_array(N);
    gen = std::mt19937_64(42);
    init_random_positions(N,-1,1,x);
    
    LargeExponentFloat prod1(7.1, 42 * 511);
    LargeExponentFloat prod2(0.02, -2 * 511);
    
    prod_realreal(N, 61, 0.0521, 1.213, x, prod1, prod2);
    assert_approx(9.56257e-99, prod1.significand);
    assert_eq(-1533L, prod1.exponent);
    assert_approx(5.14096e+09, prod2.significand);
    assert_eq(0L, prod2.exponent);

    
    prod_realreal(N, 256, -10.23, 0.021, x, prod1, prod2);
    assert_approx(1.06159e+50, prod1.significand);
    assert_eq(101 * 511L, prod1.exponent);
    assert_approx(2.11219e-81, prod2.significand);
    assert_eq(-45 * 511L, prod2.exponent);
   
    delete[] x;
  }

}

void test_complexcomplex() {

 {
    constexpr int64_t N = 16000;
    double* x = new_double_array(N);
    double* y = new_double_array(N);
    gen = std::mt19937_64(42);
    init_random_positions(N,-1,1,x);
    init_random_positions(N,-1,1,y);

    LargeExponentFloat prod1(7.1, 42 * 511);
    LargeExponentFloat prod2(0.02, -2 * 511);

    prod_complexcomplex(N, 2122, 1.4334, 0.1233, -2.13, 0.111, x, y, prod1, prod2);

    cout << prod1 << endl;

    assert_approx(161.905, prod1.significand);
    assert_eq(127 * 511L, prod1.exponent);
    assert_approx(6.29374e-112, prod2.significand);
    assert_eq(-34 * 511L, prod2.exponent);

    delete[] x;
    delete[] y;
  }

}


void test_all() {
  test_vprod();
  test_realreal();
  test_complexcomplex();
}


int main(int argc, char *argv[]) {
  test_all();
  gen = std::mt19937_64();
  
  if (argc!=3) {
    cout << argv[0] << "M N\n";
    cout << "M number of runs, N number of particles\n";
    cout << "example: " << argv[0] << " 10 10000\n";
    return 1;
  }

  long int M = atoi(argv[1]);
  long int N = atoi(argv[2]);

  double * x = new_double_array(N);
  double * y = new_double_array(N);

  init_random_positions(N,-1,1,x);
  init_random_positions(N,-1,1,y);
  
  LargeExponentFloat prod(1.0);
  LargeExponentFloat prod0(1.0);

  stopwatch timing;
  
  timing.start();
  for (long int i=0; i<M; i++) for (long int k=0; k<N; k++) {
    double u=distu(gen)*2-1;
    double u0=distu(gen)*2-1;
    prod_realreal(N,k,u,u0,x,prod,prod0);
  }
  timing.stop();
  cout << "prod_realreal: prod=" << prod.significand/prod0.significand << " exponent=" << prod.exponent-prod0.exponent << " timing=" << timing.get_time() << " seconds\n";
  timing.reset();
  
  prod=LargeExponentFloat(1.0);
  //prod0=LargeExponentFloat(1.0);

  timing.start();
  for (long int i=0; i<M; i++) for (long int k=0; k<N; k++) {
    double u=distu(gen)*2-1;
    double v=distu(gen)*2-1;
    double u0=distu(gen)*2-1;
    double v0=distu(gen)*2-1;
    prod_complexcomplex(N,k,u,u0,v,v0,x,y,prod,prod0);
  }
  timing.stop();
  cout << "prod_complexcomplex: prod=" << prod.significand/prod0.significand << " exponent=" << prod.exponent-prod0.exponent << " timing=" << timing.get_time() << " seconds\n";
  timing.reset();

  prod=LargeExponentFloat(1.0);
  //prod0=LargeExponentFloat(1.0);
  timing.start();
  for (long int i=0; i<M; i++) for (long int k=0; k<N; k++) {
    double u=distu(gen)*2-1;
    double u0=distu(gen)*2-1;
    prod_realcomplex(N,u,u0,x,y,prod.significand,prod.exponent,prod0.significand,prod0.exponent);
  }
  timing.stop();
  cout << "prod_realcomplex: prod=" << prod.significand/prod0.significand << " exponent=" << prod.exponent-prod0.exponent << " timing=" << timing.get_time() << " seconds\n";
  timing.reset();

  prod=LargeExponentFloat(1.0);
  //prod0=LargeExponentFloat(1.0);
  timing.start();
  for (long int i=0; i<M; i++) for (long int k=0; k<N; k++) {
    double u=distu(gen)*2-1;
    double v=distu(gen)*2-1;
    double u0=distu(gen)*2-1;
    double v0=distu(gen)*2-1;
    prod_complexreal(N,u,v,u0,v0,x,prod.significand,prod.exponent,prod0.significand,prod0.exponent);
  }
  timing.stop();
  cout << "prod_complexreal: prod=" << prod.significand/prod0.significand << " exponent=" << prod.exponent-prod0.exponent << " timing=" << timing.get_time() << " seconds\n";

  delete[] x;
  delete[] y;
  return 0;
}

