#include <random>
#include <ctime>

#include "vector_products.h"

using namespace std;

static std::mt19937_64 gen;
static std::uniform_real_distribution<double> distu(0.0, 1.0);

// fills array x with random values in (a,b)
void init_random_positions(const long int N, const double a, const double b, double * x) {
  for (int j=0; j<N; j++) {
    x[j]=distu(gen)*(b-a)+a;
  }
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

constexpr const int REPETITIONS = 5;

int main(int argc, char *argv[]) {
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


  stopwatch timing;

  for(int rep = 0; rep < REPETITIONS; ++rep) {
    LargeExponentFloat prod(1.0);
    LargeExponentFloat prod0(1.0);

    timing.start();
    for (long int i=0; i<M; i++) for (long int k=0; k<N; k++) {
        double u=distu(gen)*2-1;
        double u0=distu(gen)*2-1;
        prod_realreal(N,k,u,u0,x,prod,prod0);
      }
    timing.stop();
    cout << "prod_realreal: prod=" << prod.significand/prod0.significand << " exponent=" << prod.exponent-prod0.exponent << " timing=" << timing.get_time() << " seconds\n";
    timing.reset();
  }

  for(int rep = 0; rep < REPETITIONS; ++rep) {
    LargeExponentFloat prod(1.0);
    LargeExponentFloat prod0(1.0);

    timing.start();
    for (long int i = 0; i < M; i++)
      for (long int k = 0; k < N; k++) {
        double u = distu(gen) * 2 - 1;
        double v = distu(gen) * 2 - 1;
        double u0 = distu(gen) * 2 - 1;
        double v0 = distu(gen) * 2 - 1;
        prod_complexcomplex(N, k, u, u0, v, v0, x, y, prod, prod0);
      }
    timing.stop();
    cout << "prod_complexcomplex: prod=" << prod.significand / prod0.significand << " exponent="
         << prod.exponent - prod0.exponent << " timing=" << timing.get_time() << " seconds\n";
    timing.reset();
  }

  for(int rep = 0; rep < REPETITIONS; ++rep) {
    LargeExponentFloat prod(1.0);
    LargeExponentFloat prod0(1.0);

    timing.start();
    for (long int i = 0; i < M; i++)
      for (long int k = 0; k < N; k++) {
        double u = distu(gen) * 2 - 1;
        double u0 = distu(gen) * 2 - 1;
        prod_realcomplex(N, u, u0, x, y, prod, prod0);
      }
    timing.stop();
    cout << "prod_realcomplex: prod=" << prod.significand / prod0.significand << " exponent="
         << prod.exponent - prod0.exponent << " timing=" << timing.get_time() << " seconds\n";
    timing.reset();
  }

  for(int rep = 0; rep < REPETITIONS; ++rep) {
    LargeExponentFloat prod(1.0);
    LargeExponentFloat prod0(1.0);

    timing.start();
    for (long int i = 0; i < M; i++)
      for (long int k = 0; k < N; k++) {
        double u = distu(gen) * 2 - 1;
        double v = distu(gen) * 2 - 1;
        double u0 = distu(gen) * 2 - 1;
        double v0 = distu(gen) * 2 - 1;
        prod_complexreal(N, u, v, u0, v0, x, prod, prod0);
      }
    timing.stop();
    cout << "prod_complexreal: prod=" << prod.significand / prod0.significand << " exponent="
         << prod.exponent - prod0.exponent << " timing=" << timing.get_time() << " seconds\n";
    timing.reset();
  }

  delete[] x;
  delete[] y;
  return 0;
}
