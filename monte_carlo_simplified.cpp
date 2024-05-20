#include <random>
#include <ctime>
#include <cassert>

#include "Timer.h"
#include "vandermonde_det.h"
#include "opencl/vandermonde_det_opencl.h"

using namespace std;

constexpr const int N = 1024 * 1024;
constexpr const int iterations = 1;

// fills array x with random values in (a,b)
void init_random_positions(std::mt19937_64& gen, const long int N, const double a, const double b, double * x) {
  std::uniform_real_distribution<double> distu(0.0, 1.0);
  for (int j=0; j<N; j++) {
    x[j]=distu(gen)*(b-a)+a;
  }
}

class MonteCarlo {
    std::uniform_real_distribution<double> distu;
    std::mt19937_64 random;
    double avgstepsize;
    double a;
    double* x;

public:
    MonteCarlo(int seed, double avgstepsize, double a):
      distu(0.0, 1.0),
      random(seed),
      avgstepsize(avgstepsize),
      a(a) {
      x = new_double_array(N);
      init_random_positions(random, N,0,1, x);
    }

    ~MonteCarlo() {
      delete[] x;
    }

    double random_step() { // mean of |random_step()| must be _avgstepsize
      const double maxstepsize = 4 * avgstepsize;
      return (distu(random) - 0.5) * maxstepsize;  // one could also use another random distribution
    }

    double potential_energy_combi(const double posold, const double posnew) {
      // gives deltaE = -N (V(posnew)-V(posold))
      return posold - posnew;
    }

    bool decide_metropolis(const int k, const double delta_e, const double newpos, const double deltapos) {
      return false;
      if (delta_e >= 0) {
        return true;
      } else {
        // Boltzmann weight: exp(delta_e), delta_e is negative if the new position has higher energy
//        double r = distu(random);
//        if (r<exp(delta_e)) {
//          return true;
//        }
      }
      return false;
    }

    double* apply_random_step(int N, double* x) {
      double* xNew = new_double_array(N);
      for(int i=0; i<N; ++i) {
        xNew[i] = x[i] + random_step();
      }
      return xNew;
    }

    void run_iteration_cpu() {
      Timer timer;
      timer.start();

      double* xNew = apply_random_step(N, x);

      int moved = 0;
      int skipped = 0;

      for(int k = 0; k< N; k += 1) {
        const double oldpos = x[k];
        const double newpos = xNew[k];


        if (newpos < 0) {
          //cout << "k: " << k << ", skipping due to negative newpos" << newpos << endl;
          skipped += 1;
          continue;
        }

        LargeExponentFloat prodOld(1.0);
        LargeExponentFloat prodNew(1.0);

        prod_diff_realrealvec(N, k, newpos, oldpos, x, prodNew, prodOld);

        double division = std::abs(prodNew.significand / prodOld.significand);
        double logdivision = log(division) + (prodNew.exponent - prodOld.exponent)*VANDERMONDE_DET_EXPONENT_BASIS_LOG;
        double logfactor = log(newpos / oldpos);
        double delta_e = potential_energy_combi(oldpos, newpos) + a * logfactor + logdivision * 2.0; // factor 2 to square the Vandermonde
        assert(!isnan(delta_e));
        bool should_move_particle = decide_metropolis(k, delta_e, newpos, newpos - oldpos);

//        cout << "oldpos " << oldpos<< "newpos " << newpos <<",divison " << division << ", logdivison " << logdivision << ", logfactor" << logfactor <<endl;
//        cout << "k: " << k << ", delta_e = " << delta_e << ", move: " << should_move_particle << endl;

        if (should_move_particle) {
          x[k] = xNew[k];
          moved += 1;
        }

        if (k % 1024 == 0) {
          cout << k << "\t" << timer.getTimeElapsed() << "prodOld = " << prodOld << ", prodNew = " << prodNew << endl ;
        }
      }

      double checksum = 0;
      for (int i=0; i<N ; i++) {
        if (i<100 || i> N-100) {
          cout << "x[" << i << "] = " << x[i] << endl;
        }
        checksum += x[i];
      }

      cout << "checksum: " << checksum << endl;
      cout << "skipped k: " << skipped << endl;
      cout << "moved particles: " << moved << endl;
      cout << "total time" << timer.getTimeElapsed() << endl;

      delete[] xNew;
    }

    void run_iteration_gpu(OpenClContext& context) {
      VandermondeDetOpenCl vandermonde_det_opencl(context);

      Timer timer;
      timer.start();

      double* xNew = apply_random_step(N, x);

      std::vector<double> x_vec(x, x  + N);
      std::vector<double> x_vec_new(xNew, xNew + N);

      vandermonde_det_opencl.run(N, x_vec, x_vec_new);

      delete[] xNew;
    }


};


int main() {
  const double dx = 0.5;
  const double a = -0.5;
  const bool runOnGpu = true;

  OpenClConfig config;
  config.platform = 0;
  config.deviceId = 0;

  OpenClContext context(config);

  MonteCarlo monteCarlo(42, dx, a);
  for(int iteration = 0; iteration < iterations; iteration += 1) {
    if (runOnGpu) {
      monteCarlo.run_iteration_gpu(context);
    } else {
      monteCarlo.run_iteration_cpu();
    }
  }
}