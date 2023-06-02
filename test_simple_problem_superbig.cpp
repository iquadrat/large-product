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


struct SuperBig {
  double prod;
  long int exponent;
}

inline void checkoverflow(SuperBig& value) {
  const long int exponent_low_high=511;
  const double toohigh=pow(2, exponent_low_high);
  const double toolow=pow(2, -exponent_low_high);
  if (value.prod>toohigh) {
    value.prod*=toolow;
    value.exponent++;
  } else if (value.prod<toolow)  {
    value.prod*=toohigh;
    value.exponent--;
  }
}




// **************************************************************************
// Simple code to optimize: 4 variantes. 
// Most important 1. (prod_realreal) and 2. (prod_complexcomplex), 3. and 4. should be simply modification of 2. 
// There should not be more than 32 (better 16) multiplication between factors without balancing the exponent OR not more than 16 (8) multiplication when only checking against a overflowing exponent
// N=1000..100000



void prod_realreal(const long int N, const long int k, const double u, const double * x, const SuperBig big_prod): SuperBig { 

// prod of u-x[j] for all j!=k
  for (int j=0; j<k; j++) { 
//      prod*=u-x[j];
    big_prod.prod *= abs(u-x[j]);
    checkoverflow(prod,exponent); 
  }
  for (int j=k+1; j<N; j++) {
//    prod*=u-x[j];
    big_prod.prod *= abs(u-x[j]);
    checkoverflow(prod,exponent);
  }
  return prod;
} 

void prod_realcomplex(const long int N, const double u, const double * x, const double * y, const SuperBig big_prod): SuperBig {
  
  for (int j=0; j<N; j++) {
    prod*=sqr(u-x[j])+sqr(y[j]);
    checkoverflow(prod,exponent);
  }
  return;
}


void prod_complexreal(const long int N, const double u, const double v, const double * x, const SuperBig big_prod): SuperBig {
  
  const double v2=sqr(v);
  for (int j=0; j<N; j++) {
    prod*=sqr(u-x[j])+v2;
    checkoverflow(prod,exponent);
  }
  return;
}



void prod_complexcomplex(const long int N, const long int k, const double u, const double v, const double * x, const double * y, const SuperBig big_prod): SuperBig {

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

