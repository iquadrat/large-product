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

    void run(int32_t M, int32_t N, const std::vector<double>& x) {
      this->M = M;
      this->N = N;
      setup();
      copyReadOnlyBuffers(x);

      benchmark_iteration();

      std::mt19937_64 gen(2023);
      std::uniform_real_distribution<double> distu(0.0, 1.0);

      reset();
      timer.start();

      for(int32_t i = 0; i < N; ++i) {
        double u1 = distu(gen) * 2 - 1; // TODO: Pass one u1/u2 for each M
        double u2 = distu(gen) * 2 - 1;

        schedule_iteration(i, u1, u2);

        if (i % 1024*16 == 0) {
          print_intermediate_result(i);
        }
      }

      queue.finish();
      timer.stopAndAddTime();

      print_result();
    }

private:
    const size_t workgroupSize = 256;
    const int32_t MULS_PER_EXPONENT_EXTRACTION = 16;
    const int32_t ELEMENTS_PER_WORKITEM = MULS_PER_EXPONENT_EXTRACTION * 8;

    OpenClContext& context;

    int32_t M;
    int32_t N;

    cl::Buffer bufferX;
    cl::Buffer bufferProd1;
    cl::Buffer bufferProd2;
    std::vector<LargeProduct> prod_init;

    cl::Program program;
    cl::Kernel kernel_prod_diff_realrealvec;
    cl::Kernel kernel_prod_divide;

    cl::CommandQueue queue;

    Timer timer;

    void setup() {
      bufferX = context.createBuffer("x", sizeof(double) * N * M + 10000, CL_MEM_READ_ONLY);
      bufferProd1 = context.createBuffer("prod1", sizeof(LargeProduct) * M, CL_MEM_READ_WRITE);
      bufferProd2 = context.createBuffer("prod2", sizeof(LargeProduct) * M, CL_MEM_READ_WRITE);

      std::vector<std::string> files;
      files.push_back("large_product.h");
      files.push_back("vandermonde_det.cl");

      std::stringstream options_stream;
      options_stream << " -DMULS_PER_EXPONENT_EXTRACTION=" << MULS_PER_EXPONENT_EXTRACTION;
      options_stream << " -DELEMENTS_PER_WORKITEM=" << ELEMENTS_PER_WORKITEM;
      options_stream << " -DWORKGROUP_SIZE=" << workgroupSize;
      options_stream << " -DVECTOR_SIZE=" << N;
      options_stream << " -cl-std=CL2.0 ";
      std::string common_options = options_stream.str();

      program = context.createProgram("vandermonde", files, common_options);
      kernel_prod_diff_realrealvec = context.createKernel(program, "prod_diff_realrealvec");

      kernel_prod_divide = context.createKernel(program, "prod_divide");
      kernel_prod_divide.setArg(0, bufferProd1);
      kernel_prod_divide.setArg(1, bufferProd2);

      queue = context.createQueue();

      prod_init = std::vector<LargeProduct>(M, { 1.0, 0 });
    }

    void copyReadOnlyBuffers(const std::vector<double>& x) {
      queue.enqueueWriteBuffer(bufferX, true, 0, sizeof(double) * N * M, &x[0]);
    }

    void reset() {
      queue.enqueueWriteBuffer(bufferProd1, true, 0, sizeof(LargeProduct) * M, &prod_init);
      queue.enqueueWriteBuffer(bufferProd2, true, 0, sizeof(LargeProduct) * M, &prod_init);
      timer.reset();
    }

    void benchmark_iteration() {
        const int32_t runs = 10;
        const int32_t iterationsPerRun = 1000;

        run_benchmark(iterationsPerRun);

        double sum = 0;
        double sumSq = 0;
        for(int32_t run = 0; run < runs; run++) {
          double t = run_benchmark(iterationsPerRun) / iterationsPerRun;
          sum += t;
          sumSq += t*t;
        }

        double mean = sum / runs;
        double stddev = sqrt(sumSq / runs + mean * mean);

        std::cout << "Benchmark results: \n  Iteration time: " << mean << " stddev: " << stddev << std::endl;
        double bytesRead = 1.0 * sizeof(double) * N * M;
        double flops = 1.0 * N * M * 2.0; /* 2 ops per vector element */
        std::cout << "  Memory read rate: " << bytesRead / mean / 1e9 << " GB/s" << std::endl;
        std::cout << "  64bit flops: " << flops / mean / 1e9 << " /s" << std::endl;
    }

    double run_benchmark(int32_t iterations) {
      std::mt19937_64 gen(1);
      std::uniform_real_distribution<double> distu(0.0, 1.0);

      reset();
      queue.finish();

      timer.start();
      for(int i = 0; i< iterations; ++i) {
        double u1 = distu(gen) * 2 - 1; // TODO: Pass one u1/u2 for each M
        double u2 = distu(gen) * 2 - 1;
        schedule_iteration(i, u1, u2);
      }

      queue.finish();
      timer.stopAndAddTime();
      return timer.getTimeElapsed();
    }

    void schedule_iteration(int32_t k, double u1, double u2) {
      kernel_prod_diff_realrealvec.setArg(0, k);
      kernel_prod_diff_realrealvec.setArg(1, u1);
      kernel_prod_diff_realrealvec.setArg(2, u2);
      kernel_prod_diff_realrealvec.setArg(3, bufferX);
      kernel_prod_diff_realrealvec.setArg(4, bufferProd1);
      kernel_prod_diff_realrealvec.setArg(5, bufferProd2);

      size_t workItems = (N + ELEMENTS_PER_WORKITEM - 1) / ELEMENTS_PER_WORKITEM;

      cl_int err = queue.enqueueNDRangeKernel(
              kernel_prod_diff_realrealvec, cl::NullRange, cl::NDRange(workItems, M), cl::NDRange(workgroupSize, 1), nullptr, nullptr);
      context.checkErr(err, "kernel");

      err = queue.enqueueNDRangeKernel(
              kernel_prod_divide, cl::NullRange, cl::NDRange((size_t)M), cl::NDRange((size_t)64), nullptr, nullptr);

    }

    void print_intermediate_result(int32_t i) {
      queue.finish();
      LargeProduct prod;
      queue.enqueueReadBuffer(bufferProd1, CL_TRUE, 0, sizeof(LargeProduct), &prod);

      std::cout << "iteration " << i << " (" << timer.getTimeElapsed() << "s): ";
      std::cout << prod.prod << " * 2^" << prod.exponent << std::endl;
    }

    void print_result() {
      std::cout << "M = " << M << " , N= " << N << std::endl;
      std::cout << "Total time: " << timer.getTimeElapsed() << std::endl;

      LargeProduct prod;
      queue.enqueueReadBuffer(bufferProd1, CL_TRUE, 0, sizeof(LargeProduct), &prod);
      std::cout << "prod: " << prod.prod << " * 2^" << prod.exponent << std::endl;

      double bytesRead = 1.0 * sizeof(double) * N * N * M;
      double flops = 1.0 * N * N * M * 2.0; /* 2 ops per vector element */
      std::cout << "Memory read rate: " << bytesRead / timer.getTimeElapsed() / 1e9 << " GB/s" << std::endl;
      std::cout << "64bit flops: " << flops / timer.getTimeElapsed() / 1e9 << " /s" << std::endl;

      if (N == 131072) {
        expect_prod(prod, {1.34437, 16862534 });
      } else if (N == 1048576) {
        expect_prod(prod, {-1.99591, 351275623 });
      }
    }

};



void run_prod_diff_realrealvec(OpenClContext& context, int32_t M, int32_t N, const std::vector<double>& x) {
  LargeProductOpenCl runner(context);
  runner.run(M, N, x);
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
  if (argc!=3) {
    std::cout << argv[0] << "M N\n";
    std::cout << "M number of parallel runs, N number of particles\n";
    std::cout << "example: " << argv[0] << " 10 10000\n";
    return 1;
  }
  long int M = atoi(argv[1]);
  long int N = atoi(argv[2]);

  OpenClConfig config;
  config.platform = 0;
  config.deviceId = 0;

  OpenClContext context(config);

  std::mt19937_64 init_gen(42);
  std::vector x = init_random_positions(M * N, -1, 1, init_gen);
//  std::vector y = init_random_positions(M * N, -1, 1, init_gen);

  run_prod_diff_realrealvec(context, M, N, x);
}


/*
Results

N = 1048576, MULS_PER_EXPONENT_EXTRACTION = 32
Total time: 119.198
prod: -1.39209 * 2^-139635901
Memory read rate: 73.794 GB/s
64bit flops: 147.588 / 8 /s

M = 4 , N= 1048576
Total time: 390.016
prod: -1.99591 * 2^351275623
Memory read rate: 90.2126 GB/s
64bit flops: 22.5531 /s

M = 4 , N= 1059776
Total time: 212.733
prod: 1.93072 * 2^330870711
Memory read rate: 168.945 GB/s
64bit flops: 42.2361 /s



N = 1048576
Total time: 164.358
prod: -1.99591 * 2^351275623
Memory read rate: 53.518 GB/s
64bit flops: 13.3795 /s

N = 131072
Total time: 6.00041
prod: 1.88272 * 2^-37696542
Memory read rate: 22.9049 GB/s
64bit flops: 5.72623 /s
Result matches expectation :-)

M = 128, N = 131072
 Total time: 59.1688
prod: 1.34437 * 2^16862534
Memory read rate: 297.322 GB/s
64bit flops: 74.3305 /s
Result matches expectation :-)

M = 64 , N= 131072
Total time: 35.054
prod: 1.34437 * 2^16862534
Memory read rate: 250.93 GB/s
64bit flops: 62.7324 /s

M = 32 , N= 262144
Total time: 71.6696
prod: -1.05587 * 2^53059519
Memory read rate: 245.462 GB/s
64bit flops: 61.3656 /s


 M = 256 , N= 131072
Total time: 114.884
prod: -1.60203 * 2^16862532
Memory read rate: 306.261 GB/s
64bit flops: 76.5652 /s

M = 16 , N= 1048576
Total time: 491.481
prod: -1.71187 * 2^350895099
Memory read rate: 286.354 GB/s
64bit flops: 71.5885 /s
Invalid result!


 M = 256 , N= 131072
Total time: 121.823
prod: 1.34437 * 2^16862534
Memory read rate: 288.816 GB/s
64bit flops: 72.204 /s


*/
