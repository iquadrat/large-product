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




inline void checkoverflow(double &prod, long int &exponent) {
  const long int exponent_low_high=511;
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

/*
inline void checkoverflow(double &prod, long int &exponent) {
  const long int exponent_low_high=511;
  const double toohigh=pow(2,exponent_low_high);
  const double toolow=pow(2,-exponent_low_high);
  
  
  
  
  if (prod>toohigh) {
    prod*=toolow;
    exponent++;
  } else if (prod<toolow)  {
    prod*=toohigh;
    exponent--;
  }
}*/


double horizontal_product(__m256d v) {
  __m128d vlow  = _mm256_castpd256_pd128(v);
  __m128d vhigh = _mm256_extractf128_pd(v, 1); // high 128
  __m128d prod1  = _mm_mul_pd(vlow, vhigh);     // reduce down to 128
  __m128d high64 = _mm_unpackhi_pd(prod1, prod1);
  return  _mm_cvtsd_f64(_mm_mul_sd(vlow, high64));  // reduce to scalar
}

__m256d mul_if_index_not_k(__m256d prod, __m256d u, __m256d x, int64_t index_base, int64_t k) {
  __m256i index = _mm256_add_epi64(_mm256_set1_epi64x(index_base), _mm256_set_epi64x(3,2,1,0));
  __m256i mask = _mm256_cmpeq_epi64(_mm256_set1_epi64x(k), index);
  
  __m256d mul = _mm256_mul_pd(prod, _mm256_sub_pd(u, x));
  return _mm256_blendv_pd(mul, prod, _mm256_castsi256_pd(mask));
}

__m256d mul_if_not_zero(__m256d prod, __m256d u, __m256d x) {
  __m256d mask = _mm256_cmp_pd(prod, u, _CMP_EQ_OQ);
  __m256d mul = _mm256_mul_pd(prod, _mm256_sub_pd(u, x));
  return _mm256_blendv_pd(mul, prod, mask);
}


// **************************************************************************
// Simple code to optimize: 4 variantes. 
// Most important 1. (prod_realreal) and 2. (prod_complexcomplex), 3. and 4. should be simply modification of 2. 
// There should not be more than 32 (better 16) multiplication between factors without balancing the exponent OR not more than 16 (8) multiplication when only checking against a overflowing exponent
// N=1000..100000

void prod_realreal(const long int N, const long int k, const double u, const double * x, double &prod_ref, long int &exponent_ref) {
  __m256d prod1 = _mm256_set_pd(1, 1, 1, prod_ref);
  __m256d prod2 = _mm256_set_pd(1, 1, 1, 1);
  __m256d prod3 = _mm256_set_pd(1, 1, 1, 1);
  __m256d prod4 = _mm256_set_pd(1, 1, 1, 1);
  __m256d u_vec = _mm256_set1_pd(u);
  
  int64_t exponent = exponent_ref;
  
// prod of u-x[j] for all j!=k
  for (int64_t j=0; j<N; j += 16) { 
  
    prod1 = mul_if_index_not_k(prod1, u_vec, _mm256_load_pd(&x[j]),     j,   k);
    prod2 = mul_if_index_not_k(prod2, u_vec, _mm256_load_pd(&x[j + 4]), j+4, k);
    prod3 = mul_if_index_not_k(prod3, u_vec, _mm256_load_pd(&x[j + 8]), j+8, k);
    prod4 = mul_if_index_not_k(prod4, u_vec, _mm256_load_pd(&x[j + 12]),j+12,k);
  /*  
    prod1 = mul_if_not_zero(prod1, u_vec, _mm256_load_pd(&x[j]));
    prod2 = mul_if_not_zero(prod2, u_vec, _mm256_load_pd(&x[j + 4]));
    prod3 = mul_if_not_zero(prod3, u_vec, _mm256_load_pd(&x[j + 8]));
    prod4 = mul_if_not_zero(prod4, u_vec, _mm256_load_pd(&x[j + 12]));
 */  
    
//      prod*=u-x[j];
//    prod *= abs(u-x[j]);
    //checkoverflow(prod,exponent); 
  }
  /*
  for (int j=k+1; j<N; j++) {
//    prod*=u-x[j];
    prod*=abs(u-x[j]);
    //checkoverflow(prod,exponent);
  }*/
  
  prod_ref = horizontal_product(prod1) * horizontal_product(prod2) * horizontal_product(prod3) * horizontal_product(prod4);
  exponent_ref = exponent;
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




int main(int argc, char *argv[]) {
  if (argc!=3) {
    cout << argv[0] << "M N\n";
    cout << "M number of runs, N number of particles\n";
    cout << "example: " << argv[0] << " 10 10000\n";
    return 1;
  }

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

