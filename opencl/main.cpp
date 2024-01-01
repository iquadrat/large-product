#include <stdint.h>
#include <vector>
#include <random>
#include <iostream>
#include <sstream>
#include "OpenClContext.h"
#include "large_product.h"
#include "Timer.h"

using std::size_t;

void expect_prod(LargeProduct actual, LargeProduct expected) {
    if ((actual.exponent == expected.exponent) && (abs(actual.prod - expected.prod) < 1e-5)) {
      std::cout << "Result matches expectation :-)" << std::endl;
    } else {
      std::cerr << "Invalid result!" << std::endl;
      exit(1);
    }
}

class LargeProductOpenCl {

public:
    LargeProductOpenCl(OpenClContext& context): context(context) {

    }

    void run(int32_t N, const std::vector<double>& x, const std::vector<double>& y) {
      this->N = N;
      this->blockCount = (N + BLOCK_SIZE - 1)  / BLOCK_SIZE;
      setup();

//      copyInputBuffers(x, y);
//      benchmark_iteration();

      copyInputBuffers(x, y);
      timer.restart();
      for(int32_t b = 0; b < blockCount; b++) {
        schedule_compute_products(b);

        if ((b * BLOCK_SIZE) % (1 << 14) == 0) {
          print_intermediate_result(b * BLOCK_SIZE);
        }
      }

      queue.finish();
      timer.stopAndAddTime();

      print_result();
    }

private:
    const int32_t BLOCK_SIZE = 64;
//    const size_t workgroupSize = 256;
    const int32_t MULS_PER_EXPONENT_EXTRACTION = 16;
    //const int32_t ELEMENTS_PER_WORKITEM = MULS_PER_EXPONENT_EXTRACTION * 4;

    OpenClContext& context;

    int32_t N;
    int32_t blockCount;

    cl::Buffer bufferX;
    cl::Buffer bufferY;
    cl::Buffer bufferProdX;
    cl::Buffer bufferProdY;

    cl::Program program;
    cl::Kernel kernel_prod_diff_realrealvec;
    cl::Kernel kernel_prod_divide;

    cl::CommandQueue queue;

    Timer timer;

    void setup() {
      std::cout << "sizeof(LargeProduct) = " << sizeof(LargeProduct) << std::endl;
      bufferX = context.createBuffer("x", sizeof(double) * blockCount * BLOCK_SIZE, CL_MEM_READ_WRITE);
      bufferY = context.createBuffer("y", sizeof(double) * blockCount * BLOCK_SIZE, CL_MEM_READ_ONLY);
      bufferProdX = context.createBuffer("prodX", sizeof(LargeProduct) * blockCount * BLOCK_SIZE, CL_MEM_READ_WRITE);
      bufferProdY = context.createBuffer("prodY", sizeof(LargeProduct) * blockCount * BLOCK_SIZE, CL_MEM_READ_WRITE);

      std::vector<std::string> files;
      files.push_back("large_product.h");
      files.push_back("vandermonde_det.cl");

      std::stringstream options_stream;
      options_stream << " -DMULS_PER_EXPONENT_EXTRACTION=" << MULS_PER_EXPONENT_EXTRACTION;
      options_stream << " -DWORKGROUP_SIZE=" << BLOCK_SIZE;
      options_stream << " -DBLOCK_SIZE=" << BLOCK_SIZE;
      options_stream << " -DVECTOR_SIZE=" << N;
      options_stream << " -cl-std=CL2.0 ";
//      options_stream << " -cl-denorms-are-zero -cl-fast-relaxed-math -cl-mad-enable -cl-no-signed-zeros -cl-uniform-work-group-size";
      std::string common_options = options_stream.str();

      program = context.createProgram("vandermonde", files, common_options);
      kernel_prod_diff_realrealvec = context.createKernel(program, "prod_diff_realrealvec");

      queue = context.createQueue();
    }

    void copyInputBuffers(const std::vector<double>& x, const std::vector<double>& y) {
      std::cout << "Copy input buffers to device.." << std::endl;
      std::vector<LargeProduct> prod_init(N, { 1.0, 0 });
      queue.enqueueWriteBuffer(bufferX, true, 0, sizeof(double) * N, &x[0]);
      queue.enqueueWriteBuffer(bufferY, true, 0, sizeof(double) * N, &y[0]);
      queue.enqueueWriteBuffer(bufferProdX, true, 0, sizeof(LargeProduct) * N, &prod_init[0]);
      queue.enqueueWriteBuffer(bufferProdY, true, 0, sizeof(LargeProduct) * N, &prod_init[0]);
    }

    void benchmark_iteration() {
        const int32_t runs = 10;
        const int32_t blocksPerRun = 32;

        run_benchmark(blocksPerRun);

        timer.reset();
        double sum = 0;
        double sumSq = 0;
        for(int32_t run = 0; run < runs; run++) {
          double t = run_benchmark(blocksPerRun) / blocksPerRun;
          sum += t;
          sumSq += t*t;
        }

        double mean = sum / runs;
        double stddev = sqrt(sumSq / runs + mean * mean);

        std::cout << "Benchmark results: \n  Iteration time: " << mean << " stddev: " << stddev << std::endl;
        double bytesRead = 1.0 * sizeof(double) * ((N - BLOCK_SIZE) + blockCount * 2 * BLOCK_SIZE);
        double flops = 1.0 * (N - BLOCK_SIZE) * BLOCK_SIZE * 2.0; /* 2 ops per vector element */
        std::cout << "  Memory read rate: " << bytesRead / mean / 1e9 << " GB/s" << std::endl;
        std::cout << "  64bit flops: " << flops / mean / 1e9 << " /s" << std::endl;
    }

    double run_benchmark(int32_t blocks) {
      queue.finish();

      if (blocks * BLOCK_SIZE > N) {
        blocks = N / BLOCK_SIZE;
      }

      timer.start();
      for(int b = 0; b < blocks; ++b) {
        schedule_compute_products(b);
      }

      queue.finish();
      timer.stopAndAddTime();
      return timer.getTimeElapsed();
    }

    void schedule_compute_products(int32_t blockOffset) {
      int32_t offset = blockOffset * BLOCK_SIZE;
      kernel_prod_diff_realrealvec.setArg(0, offset);
      kernel_prod_diff_realrealvec.setArg(1, bufferX);
      kernel_prod_diff_realrealvec.setArg(2, bufferY);
      kernel_prod_diff_realrealvec.setArg(3, bufferProdX);
      kernel_prod_diff_realrealvec.setArg(4, bufferProdY);

      cl_int err = queue.enqueueNDRangeKernel(
              kernel_prod_diff_realrealvec, cl::NullRange, cl::NDRange(N), cl::NDRange(BLOCK_SIZE, 1), nullptr, nullptr);
      context.checkErr(err, "kernel");
    }

    void print_intermediate_result(int32_t i) {
      queue.finish();
      LargeProduct prodX, prodY;
      queue.enqueueReadBuffer(bufferProdX, CL_TRUE, i, sizeof(LargeProduct), &prodX);
      queue.enqueueReadBuffer(bufferProdY, CL_TRUE, i, sizeof(LargeProduct), &prodY);

      std::cout << "iteration " << i << " (" << timer.getTimeElapsed() << "s): ";
      std::cout << prodX.prod << " * 2^" << prodX.exponent << "\t / ";
      std::cout << prodY.prod << " * 2^" << prodY.exponent << std::endl;
    }

    void print_result() {
      std::cout << "N= " << N << std::endl;
      std::cout << "Total time: " << timer.getTimeElapsed() << std::endl;

      std::vector<LargeProduct> prodX(N);
      std::vector<LargeProduct> prodY(N);
      queue.enqueueReadBuffer(bufferProdX, CL_TRUE, 0, sizeof(LargeProduct) * N, &prodX[0]);
      queue.enqueueReadBuffer(bufferProdX, CL_TRUE, 0, sizeof(LargeProduct) * N, &prodY[0]);

      for(int i=0; i<N; ++i) {
        if (i > 100 && i< (N-100)) {
          continue;
        }
        std::cout << i << ":\t" << prodX[i].prod << " * 2^" << prodX[i].exponent;
        std::cout << "\t / " << prodY[i].prod << " * 2^" << prodY[i].exponent << std::endl;
      }

      double bytesRead = 1.0 * sizeof(double) * N * N / BLOCK_SIZE;
      double flops =(1.0 * N * (N - BLOCK_SIZE * BLOCK_SIZE)) * 2.0; /* 2 ops per vector element */
      std::cout << "Memory read rate: " << bytesRead / timer.getTimeElapsed() / 1e9 << " GB/s" << std::endl;
      std::cout << "64bit flops: " << flops / timer.getTimeElapsed() / 1e9 << " Gflops/s" << std::endl;

//      if (N == 131072) {
//        expect_prod(prod, {1.34437, 16862534 });
//      } else if (N == 1048576) {
//        expect_prod(prod, {-1.99591, 351275623 });
//      }
    }

};



void run_prod_diff_realrealvec(OpenClContext& context, int32_t N, const std::vector<double>& x, const std::vector<double>& y) {
  LargeProductOpenCl runner(context);
  runner.run(N, x, y);
}

// Creates vector with random values in (a,b)
std::vector<double> init_random_positions(const long int N, const double a, const double b, std::mt19937_64& gen) {
  std::vector<double> result(N);
  std::uniform_real_distribution<double> distu(0.0, 1.0);
  for (int j=0; j<N; j++) {
    result[j] = distu(gen)*(b-a)+a;
  }
  return result;
}

int main(int argc, char** argv) {
  if (argc != 2) {
    std::cout << argv[0] << " N\n";
    std::cout << "N number of particles\n";
    std::cout << "example: " << argv[0] << " 1048576\n";
    return 1;
  }
  long int N = atoi(argv[1]);

  OpenClConfig config;
  config.platform = 0;
  config.deviceId = 0;

  OpenClContext context(config);

  std::mt19937_64 init_gen(42);
  std::vector x = init_random_positions(N, -1, 1, init_gen);
  std::vector y = init_random_positions(N, -1, 1, init_gen);

  run_prod_diff_realrealvec(context, N, x, y);
}
