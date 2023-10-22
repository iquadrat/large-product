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

void run_prod_diff_realrealvec(OpenClContext& context, int32_t M, int32_t N, const std::vector<double>& x) {
  const size_t workgroupSize = 256;
  const int64_t MULS_PER_EXPONENT_EXTRACTION = 16;

  cl::Buffer bufferX = context.createBuffer("x", sizeof(double) * N * M, CL_MEM_READ_ONLY);
  cl::Buffer bufferProd1 = context.createBuffer("prod1", sizeof(LargeProduct) * M, CL_MEM_READ_WRITE);
  cl::Buffer bufferProd2 = context.createBuffer("prod2", sizeof(LargeProduct) * M, CL_MEM_READ_WRITE);

  std::vector<std::string> files;
  files.push_back("large_product.h");
  files.push_back("vandermonde_det.cl");

  std::stringstream options_stream;
  options_stream << " -DMULS_PER_EXPONENT_EXTRACTION=" << MULS_PER_EXPONENT_EXTRACTION;
  options_stream << " -DWORKGROUP_SIZE=" << workgroupSize;
	options_stream << " -cl-std=CL2.0 ";
  std::string common_options = options_stream.str();

  cl::Program program = context.createProgram("vandermonde", files, common_options);
  cl::Kernel kernel_prod_diff_realrealvec = context.createKernel(program, "prod_diff_realrealvec");

  std::vector<LargeProduct> prod_init(M, { 1.0, 0 });

  cl::Kernel kernel_prod_divide = context.createKernel(program, "prod_divide");
  kernel_prod_divide.setArg(0, bufferProd1);
  kernel_prod_divide.setArg(1, bufferProd2);

  auto queue = context.createQueue();

  LargeProduct prod1 = {1.0, 0};
  queue.enqueueWriteBuffer(bufferProd1, true, 0, sizeof(LargeProduct) * M, &prod1);
  queue.enqueueWriteBuffer(bufferProd2, true, 0, sizeof(LargeProduct) * M, &prod1);
  queue.enqueueWriteBuffer(bufferX, true, 0, sizeof(double) * N * M, &x[0]);

  std::mt19937_64 gen(2023);
  std::uniform_real_distribution<double> distu(0.0, 1.0);

  Timer timer;
  timer.start();
  for(int32_t i = 0; i < N; ++i) {
    double u1 = distu(gen)*2-1; // TODO: Pass one u1/u2 for each M
    double u2 = distu(gen)*2-1;

    kernel_prod_diff_realrealvec.setArg(0, i);
    kernel_prod_diff_realrealvec.setArg(1, u1);
    kernel_prod_diff_realrealvec.setArg(2, u2);
    kernel_prod_diff_realrealvec.setArg(3, bufferX);
    kernel_prod_diff_realrealvec.setArg(4, bufferProd1);
    kernel_prod_diff_realrealvec.setArg(5, bufferProd2);

    size_t workItems = (N + MULS_PER_EXPONENT_EXTRACTION - 1) / MULS_PER_EXPONENT_EXTRACTION;

    cl_int err = queue.enqueueNDRangeKernel(
            kernel_prod_diff_realrealvec, cl::NullRange, cl::NDRange(workItems, M), cl::NDRange(workgroupSize, 1), nullptr, nullptr);
    context.checkErr(err, "kernel");

    err = queue.enqueueNDRangeKernel(
            kernel_prod_divide, cl::NullRange, cl::NDRange((size_t)M), cl::NDRange((size_t)64), nullptr, nullptr);

    if (i % 1024 == 0) {
      queue.finish();
      LargeProduct prod;
      queue.enqueueReadBuffer(bufferProd1, CL_TRUE, 0, sizeof(LargeProduct), &prod);

      std::cout << "iteration " << i << " (" << timer.getTimeElapsed() << "s): ";
      std::cout << prod.prod << " * 2^" << prod.exponent << std::endl;
    }

  }

  queue.finish();
  timer.stopAndAddTime();

  std::cout << "Total time: " << timer.getTimeElapsed() << std::endl;

  LargeProduct prod;
  queue.enqueueReadBuffer(bufferProd1, CL_TRUE, 0, sizeof(LargeProduct), &prod);
  std::cout << "prod: " << prod.prod << " * 2^" << prod.exponent << std::endl;

  double bytesRead = 1.0 * sizeof(double) * N * N * M;
  double flops = 1.0 * N * N * M * 2.0; /* 2 ops per vector element */
  std::cout << "Memory read rate: " << bytesRead / timer.getTimeElapsed() / 1e9 << " GB/s" << std::endl;
  std::cout << "64bit flops: " << flops / timer.getTimeElapsed() / 1e9 << " /s" << std::endl;

  if (N == 131072) {
    expect_prod(prod, {-1.64183, 18490594 });
  } else if (N == 1048576) {
    expect_prod(prod, {-1.99591, 351275623 });
  }
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
Result matches expectation :-)

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

*/
