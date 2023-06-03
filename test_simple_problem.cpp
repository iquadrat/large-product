/* compile with:

g++ -std=c++11 -O3 -funroll-loops -march=native -lm -o test_simple_problem test_simple_problem.cpp  

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
#include <immintrin.h>

#include <cassert>


using namespace std;


class stopwatch;

inline double sqr(const double x);
void init_random_positions(const long int N, const double a, const double b, double * x);
inline void checkoverflow(double &prod, long int &exponent);
void prod_realreal(const long int N, const long int k, const double u, const double * x, double &prod, long int &exponent);
void prod_realcomplex(const long int N, const double u, const double * x, const 
double * y, double &prod, long int &exponent);
void prod_complexreal(const long int N, const double u, const double v, const double * x, double &prod, long int &exponent);
void prod_complexcomplex(const long int N, const long int k, const double u, const double v, const double * x, const double * y, double &prod, long int &exponent);


static std::mt19937_64 gen;
static std::uniform_real_distribution<double> distu(0.0, 1.0);

inline double sqr(const double x) {
  return x*x;
}

void init_random_positions(const long int N, const double a, const double b, double * x) { // fills array x with random values in (a,b)
  for (int j=0; j<N; j++) x[j]=distu(gen)*(b-a)+a;
  return;
}


void debug(__m256d v) {
  double x[4];
  _mm256_store_pd(x, v);
  cout << x[0] << " " << x[1] << " " << x[2] << " " << x[3] << endl;
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


void print(__m256d v) {
  double x[4];
  _mm256_store_pd(x, v);
  cout << x[0] << "," << x[1] << "," << x[2] << "," << x[3] << endl;
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
  int high_mask_bits = _mm256_movemask_pd(high_mask);
  int low_mask_bits  = _mm256_movemask_pd(low_mask);
  
  if ((high_mask_bits ==0) && (low_mask_bits == 0)) [[likely]] {
    return;
  }
  
  exponent += _mm_popcnt_u32(high_mask_bits) - _mm_popcnt_u32(low_mask_bits);
  
  abs_prod = _mm256_blendv_pd(abs_prod, _mm256_mul_pd(abs_prod, toolow), high_mask);
  prod = _mm256_blendv_pd(abs_prod, _mm256_mul_pd(abs_prod, toohigh), low_mask);
}

__m256d mul_diff(__m256d prod, __m256d u, __m256d x) {
  return _mm256_mul_pd(prod, _mm256_sub_pd(u, x));
}

__m256d save_mul(__m256d prod1, __m256d prod2, int64_t& exponent) {
  __m256d prod = _mm256_mul_pd(prod1, prod2);
  checkoverflow(prod, exponent);
  return prod; 
}

double horizontal_product(__m256d v, int64_t& exponent) {
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


// To get acutal value is represented by fraction * 2 ^ (511 * exponent).
// There is no guarantee that fraction is a value close to 1.0, hence the samee value can be represented in different ways.
struct LargeExponentValue {
  double fraction;
  int64_t exponent;
};

static const __m256d _MM256_ONE = _mm256_set1_pd(1);

class VProd {
  private:
    __m256d prod1;
    __m256d prod2;
    __m256d prod3;
    __m256d prod4;
    
    int64_t exponent;
    
    void check_overflow_single(__m256d& prod) {
      const __m256d toohigh = _mm256_set1_pd(pow(2, exponent_low_high));
      const __m256d toolow  = _mm256_set1_pd(pow(2,-exponent_low_high));
      
      prod = abs(prod);
      
      __m256d high_mask = _mm256_cmp_pd(prod, toohigh, _CMP_GE_OS);
      __m256d low_mask  = _mm256_cmp_pd(prod, toolow,  _CMP_LE_OS);      
      int high_mask_bits = _mm256_movemask_pd(high_mask);
      int low_mask_bits  = _mm256_movemask_pd(low_mask);
  
      if (high_mask_bits) {
        exponent += _mm_popcnt_u32(high_mask_bits);
        prod = _mm256_blendv_pd(prod, _mm256_mul_pd(prod, toolow), high_mask);
      }
      
      if (low_mask_bits) {
        exponent -= _mm_popcnt_u32(low_mask_bits);
        prod = _mm256_blendv_pd(prod, _mm256_mul_pd(prod, toohigh), low_mask);
      }  
    }
    
  public:
    VProd(double fraction = 1.0, int64_t exponent_ = 0): 
      prod1(_mm256_set_pd(1, 1, 1, fraction)),
      prod2(_MM256_ONE),
      prod3(_MM256_ONE),
      prod4(_MM256_ONE),
      exponent(exponent_)
    {
    }

    void mul_no_overflow(__m256d mul1, __m256d mul2, __m256d mul3, __m256d mul4) {
      prod1 = _mm256_mul_pd(prod1, mul1);
      prod2 = _mm256_mul_pd(prod2, mul2);
      prod3 = _mm256_mul_pd(prod3, mul3);
      prod4 = _mm256_mul_pd(prod4, mul4);
    }
    
    void check_overflow() {
      check_overflow_single(prod1);
      check_overflow_single(prod2);
      check_overflow_single(prod3);
      check_overflow_single(prod4);
    }
    
    void mul(const VProd& other) {
      prod1 = save_mul(prod1, other.prod1, exponent);
      prod2 = save_mul(prod2, other.prod2, exponent);
      prod3 = save_mul(prod3, other.prod3, exponent);
      prod4 = save_mul(prod4, other.prod4, exponent);
      exponent += other.exponent;
    }

    LargeExponentValue get() const {
      LargeExponentValue result;
      result.exponent = exponent;

      __m256d prod12 = save_mul(prod1, prod2, result.exponent);
      __m256d prod34 = save_mul(prod3, prod4, result.exponent);
      __m256d prod = save_mul(prod12, prod34, result.exponent);
    
      result.fraction = horizontal_product(prod, result.exponent);
      return result;
    }
    
    void debug() {
      cout << "prod1=";
      ::debug(prod1);
      cout << "prod2=";
      ::debug(prod2);
      cout << ", exponent=" << exponent << endl;
    }
    

};


// **************************************************************************
// Simple code to optimize: 4 variantes. 
// Most important 1. (prod_realreal) and 2. (prod_complexcomplex), 3. and 4. should be simply modification of 2. 
// There should not be more than 32 (better 16) multiplication between factors without balancing the exponent OR not more than 16 (8) multiplication when only checking against a overflowing exponent
// N=1000..100000

void prod_realreal(const long int N, const long int k, const double u, const double * x, double &prod_ref, long int &exponent_ref) {
  const int64_t ELEMENTS_PER_LOOP = 8 * 4;
  assert(N % ELEMENTS_PER_LOOP == 0);
  assert(reinterpret_cast<uintptr_t>(x) % 8 == 0);

  VProd prod1(prod_ref, exponent_ref);
  VProd prod2;
  
  __m256d u_vec = _mm256_set1_pd(u);
  
  int64_t skipj = k & (-ELEMENTS_PER_LOOP);
  
  // prod of u-x[j] for all j!=k
  for (int64_t j=0; j<N; j += ELEMENTS_PER_LOOP) [[likely]] {
    if (j != skipj) [[likely]] {
      prod1.mul_no_overflow(
        _mm256_sub_pd(u_vec, _mm256_load_pd(&x[j +  0])),
        _mm256_sub_pd(u_vec, _mm256_load_pd(&x[j +  4])),
        _mm256_sub_pd(u_vec, _mm256_load_pd(&x[j +  8])),
        _mm256_sub_pd(u_vec, _mm256_load_pd(&x[j + 12]))
      );
      prod2.mul_no_overflow(
        _mm256_sub_pd(u_vec, _mm256_load_pd(&x[j + 16])),
        _mm256_sub_pd(u_vec, _mm256_load_pd(&x[j + 20])),
        _mm256_sub_pd(u_vec, _mm256_load_pd(&x[j + 24])),
        _mm256_sub_pd(u_vec, _mm256_load_pd(&x[j + 28]))
      );
    }
   
    if ((j / ELEMENTS_PER_LOOP) % 8 == 0) { 
      prod1.check_overflow();
      prod2.check_overflow();
    }
  }

  prod1.check_overflow();
  prod2.check_overflow();
  
  prod1.mul(prod2);
  
  auto prod = prod1.get();
  prod_ref = abs(prod.fraction);
  exponent_ref = prod.exponent;
  
  for (int j=skipj; j<skipj + ELEMENTS_PER_LOOP; j++) { 
    if (j == k) {
      continue;
    } 
    prod_ref *= abs(u - x[j]);
    checkoverflow(prod_ref, exponent_ref); 
  }

  //cout << "prod=" << prod_ref << ", exponent=" << exponent_ref << endl;  
} 

void prod_realcomplex(const long int N, const double u, const double * x, const double * y, double &prod, long int &exponent) {
  
  for (int j=0; j<N; j++) {
    prod*=sqr(u-x[j])+sqr(y[j]);
    checkoverflow(prod,exponent);
  }
  return;
}


void prod_complexreal(const long int N, const double u, const double v, const double * x, double &prod, long int &exponent) {
  
  const double v2=sqr(v);
  for (int j=0; j<N; j++) {
    prod*=sqr(u-x[j])+v2;
    checkoverflow(prod,exponent);
  }
  return;
}



void prod_complexcomplex(const long int N, const long int k, const double u, const double v, const double * x, const double * y, double &prod, long int &exponent) {

// prod over all j!=k
  for (int j=0; j<k; j++) {
    prod*=sqr(u-x[j])+sqr(v-y[j]);
    checkoverflow(prod,exponent);
  }
  for (int j=k+1; j<N; j++) {
    prod*=sqr(u-x[j])+sqr(v-y[j]);
    checkoverflow(prod,exponent);
  }
  return;
}






// **************************************************************************

template<typename T>
void assert_eq(T a, T b) {
  if (a != b) {
    cerr << "Expected a == b but " << a << " != " << b << endl;
    throw "assertion failed";
  } 
}

void assert_approx(double a, double b) {
  const double ratio = abs(abs(a/b) - 1);
  if (ratio > 1e-5) {
    cerr << "Expected a ~= b but " << a << " != " << b << endl;
    throw "assertion failed";
  } 
}


void test_all() {

  {
    __m256d x = _mm256_set_pd(2e+26, 5e+150, 3e+50, 2.98334e+46);
    int64_t e = 0;
    double prod = horizontal_product(x, e);
    assert_approx(1.335046e+120, prod);
    assert_eq(1L, e);
  }
  
  {
  VProd prod(2.0); // 2
  prod.mul_no_overflow(_mm256_set_pd(2.0, 3.0, 5.0, 10.0), _MM256_ONE, _MM256_ONE, _MM256_ONE);  // 2 * 2 * 3 * 5 * 10 = 600
  
  auto actual = prod.get();
  assert_eq(600., actual.fraction);
  assert_eq(0L, actual.exponent);
  
  prod.mul_no_overflow(_MM256_ONE, _mm256_set_pd(1e100, -1e50, 1e25, 1e25), _MM256_ONE, _MM256_ONE);

  actual = prod.get();
  assert_approx(8.95001e48, actual.fraction);
  assert_eq(1L, actual.exponent);

  prod.mul_no_overflow(_mm256_set_pd(1e100, -1e150, -1e125, -1e-200), _MM256_ONE, _MM256_ONE, _MM256_ONE);
  prod.check_overflow();
  
  actual = prod.get();
  assert_approx(1.3350445e+70, actual.fraction);
  assert_eq(2L, actual.exponent);
  
  VProd prod2(1.0);
  prod2.mul_no_overflow(_mm256_set_pd(-1e-80, 1e-75, 1e-90, 1e-120), _MM256_ONE, _MM256_ONE, _MM256_ONE);
  
  /*
  prod.mul(prod2);
  actual = prod.get();
  assert_approx(6e12, actual.fraction);
  assert_eq(0L, actual.exponent);
 */ }
  
  {
    constexpr int64_t N = 16000;
    double* x = new double[N];
    gen = std::mt19937_64(42);
    init_random_positions(N,-1,1,x);
    double prod = 7.1;
    int64_t exponent = 42;
    
    prod_realreal(N, 61, 0.0521, x, prod, exponent);    
    assert_approx(9.56257e-99, prod);
    assert_eq(-3L, exponent);
    
    prod_realreal(N, 256, -10.23, x, prod, exponent);    
    assert_approx(1.06159e+50, prod);
    assert_eq(101L, exponent);   
  }
  
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

  int64_t e = 0;
  __m256d xx = _mm256_set_pd(1,2,3,4);
  cout << " product: " << horizontal_product(xx, e) << endl;
  cout << " exponent: " << e << endl;

  long int M = atoi(argv[1]);
  long int N = atoi(argv[2]);

  double * x;
  double * y;
  x=new double[N];
  y=new double[N];

  init_random_positions(N,-1,1,x);
  init_random_positions(N,-1,1,y);
  
  double prod=1;
  long int exponent=0;
  stopwatch timing;
  
  timing.start();
  for (long int i=0; i<M; i++) for (long int k=0; k<N; k++) {
    double u=distu(gen)*2-1;
    prod_realreal(N,k,u,x,prod,exponent);
  }
  timing.stop();
  cout << "prod_realreal: orod=" << prod << " exponent=" << exponent << " timing=" << timing.get_time() << " seconds\n";

  timing.reset();
  prod=1;
  exponent=0;
  timing.start();
  for (long int i=0; i<M; i++) for (long int k=0; k<N; k++) {
    double u=distu(gen)*2-1;
    double v=distu(gen)*2-1;
    prod_complexcomplex(N,k,u,v,x,y,prod,exponent);
  }
  timing.stop();
  cout << "prod_complexcomplex: orod=" << prod << " exponent=" << exponent << " timing=" << timing.get_time() << " seconds\n";
  
  timing.reset();
  prod=1;
  exponent=0;
  timing.start();
  for (long int i=0; i<M; i++) for (long int k=0; k<N; k++) {
    double u=distu(gen)*2-1;
    prod_realcomplex(N,u,x,y,prod,exponent);
  }
  timing.stop();
  cout << "prod_realcomplex: orod=" << prod << " exponent=" << exponent << " timing=" << timing.get_time() << " seconds\n";

  timing.reset();
  prod=1;
  exponent=0;
  timing.start();
  for (long int i=0; i<M; i++) for (long int k=0; k<N; k++) {
    double u=distu(gen)*2-1;
    double v=distu(gen)*2-1;
    prod_complexreal(N,u,v,x,prod,exponent);
  }
  timing.stop();
  cout << "prod_complexreal: orod=" << prod << " exponent=" << exponent << " timing=" << timing.get_time() << " seconds\n";





  delete[] x;
  delete[] y;
  return 0;
}

