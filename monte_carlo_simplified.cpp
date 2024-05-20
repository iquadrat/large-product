#include <random>
#include <ctime>
#include <cassert>

#include "Timer.h"
#include "vandermonde_det.h"
#include "opencl/vandermonde_det_opencl.h"

using namespace std;

// fills array x with random values in (a,b)
void init_random_positions(std::mt19937_64& gen, const long int N, const double a, const double b, double * x) {
  std::uniform_real_distribution<double> distu(0.0, 1.0);
  for (int j=0; j<N; j++) {
    x[j]=distu(gen)*(b-a)+a;
  }
}

enum class RunMode {
    CPU,
    GPU,
};

class MonteCarlo {
    int32_t N;
    std::uniform_real_distribution<double> distu;
    std::unique_ptr<VandermondeDetOpenCl> vandermonde_det_opencl;
    std::mt19937_64 random;
    double avgstepsize;
    double a;
    double* x;
    Timer timer;

public:
    MonteCarlo(int N, int seed, double avgstepsize, double a, std::unique_ptr<OpenClContext> context):
      N(N),
      distu(0.0, 1.0),
      vandermonde_det_opencl(context == nullptr ? nullptr: new VandermondeDetOpenCl(std::move(context), N)),
      random(seed),
      avgstepsize(avgstepsize),
      a(a)
    {
      x = new_double_array(N);
      init_random_positions(random, N,0,1, x);
      if (vandermonde_det_opencl != nullptr) {
        vandermonde_det_opencl->setup();
      }
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

    bool decide_metropolis(const int k, const double delta_e, const double newpos, const double deltapos, const double r) {
      if (delta_e >= 0) {
        return true;
      } else {
        // Boltzmann weight: exp(delta_e), delta_e is negative if the new position has higher energy
        if (r<exp(delta_e)) {
          return true;
        }
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

    bool should_move_particle(
            int32_t k,
            double oldpos,
            double newpos,
            const LargeExponentFloat& prodOld,
            const LargeExponentFloat& prodNew,
            double r,
            double& deltaE
    ) {
      const double division = std::abs(prodNew.significand / prodOld.significand);
      double logdivision = log(division) + (prodNew.exponent - prodOld.exponent)*VANDERMONDE_DET_EXPONENT_BASIS_LOG;
      double logfactor = log(newpos / oldpos);
      double delta_e = potential_energy_combi(oldpos, newpos) + a * logfactor + logdivision * 2.0; // factor 2 to square the Vandermonde
      assert(!isnan(delta_e));
      deltaE = delta_e;
      return  decide_metropolis(k, delta_e, newpos, newpos - oldpos, r);
    }

    void run_iteration_cpu(const double* xNew, const double* uRandom) {
      int moved = 0;
      int skipped = 0;

      vector<double> deltaE(N);

      for(int k = 0; k< N; k += 1) {
        const double oldpos = x[k];
        const double newpos = xNew[k];

        if (newpos <= 0) {
          cout << "x[" << k << "] = " << x[k] << "\t" << 0 << endl;
          //cout << "k: " << k << ", skipping due to negative newpos" << newpos << endl;
          skipped += 1;
          continue;
        }

        LargeExponentFloat prodOld(1.0);
        LargeExponentFloat prodNew(1.0);

        prod_diff_realrealvec(N, k, newpos, oldpos, x, prodNew, prodOld);

        prodNew.normalize_exponent();
        prodOld.normalize_exponent();

        double delta_e;
        bool shouldMoveParticle = should_move_particle(k, oldpos, newpos, prodOld, prodNew, uRandom[k], delta_e);

//        cout << "oldpos " << oldpos<< "newpos " << newpos <<",divison " << division << ", logdivison " << logdivision << ", logfactor" << logfactor <<endl;
//        cout << "k: " << k << ", delta_e = " << delta_e << ", move: " << should_move_particle << endl;

        if (shouldMoveParticle) {
          x[k] = xNew[k];
          moved += 1;
        }

        int i=k;
        cout << "x[" << i << "] = " << x[i] << "\t" << delta_e << endl;
//        cout << i << "\t" << prodOld << "\t" << prodNew << endl;


        if (k % 1024 == 0) {
          cout << k << "\t" << timer.getTimeElapsed() << "prodOld = " << prodOld << ", prodNew = " << prodNew << endl ;
        }
      }
    }

    void run_iteration_gpu(const double* xNew, const double* uRandom) {
      vandermonde_det_opencl->run(x, xNew, uRandom);
    }

    void run_iteration(RunMode runMode) {
      Timer timer;
      timer.start();

      double* xNew = apply_random_step(N, x);
      double* uRandom = new_double_array(N);

      if (runMode == RunMode::GPU) {
        run_iteration_gpu(xNew, uRandom);
      } else {
        run_iteration_cpu(xNew, uRandom);
      }

      double checksum = 0;
      for (int i=0; i<N ; i++) {
        checksum += x[i];
      }

      cout << "checksum: " << checksum << endl;
      cout << "total time: " << timer.getTimeElapsed() << endl;

      delete[] xNew;
      delete[] uRandom;
    }

};


int main(int argc, char** argv) {
  const double dx = 0.5;
  const double a = -0.5;
  RunMode runMode = RunMode::CPU;

  if(argc > 1){
    try {
      if (std::stoi(argv[1]) == 1) {
        runMode = RunMode::GPU;
      }
    } catch(const std::invalid_argument& e) {
      std::cerr << "Invalid argument for 'runOnGpu'. Expected 0 or 1. Defaulting to 1.\n";
    }
  }

  constexpr const int N = 1024 * 1024;
  constexpr const int iterations = 4;

  OpenClConfig config;
  config.platform = 0;
  config.deviceId = 0;

  std::unique_ptr<OpenClContext> context(runMode == RunMode::GPU ? new OpenClContext(config) : nullptr);

  MonteCarlo monteCarlo(N, 42, dx, a, std::move(context));
  for(int iteration = 0; iteration < iterations; iteration += 1) {
    monteCarlo.run_iteration(runMode);
  }
}