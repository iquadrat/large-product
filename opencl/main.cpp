#include <stdint.h>
#include <vector>
#include <random>
#include <iostream>
#include <sstream>
#include "OpenClContext.h"
#include "large_product.h"
#include "Timer.h"

using std::size_t;

void run_prod_diff_realrealvec(OpenClContext& context, const std::vector<double>& x, std::mt19937_64& gen) {
  size_t N = x.size();
  const size_t workgroupSize = 256;
  const int64_t MULS_PER_EXPONENT_EXTRACTION = 16;

  cl::Buffer bufferX = context.createBuffer("x", sizeof(double) * N, CL_MEM_READ_ONLY);
  cl::Buffer bufferProd1 = context.createBuffer("prod1", sizeof(LargeProduct), CL_MEM_READ_WRITE);
  cl::Buffer bufferProd2 = context.createBuffer("prod2", sizeof(LargeProduct), CL_MEM_READ_WRITE);

  std::vector<std::string> files;
  files.push_back("large_product.h");
  files.push_back("vandermonde_det.cl");

  std::stringstream options_stream;
  options_stream << " -DMULS_PER_EXPONENT_EXTRACTION=" << MULS_PER_EXPONENT_EXTRACTION;
	options_stream << " -cl-std=CL2.0 ";
  std::string common_options = options_stream.str();

  cl::Program program = context.createProgram("vandermonde", files, common_options);
  cl::Kernel kernel_prod_diff_realrealvec = context.createKernel(program, "prod_diff_realrealvec");

  cl::Kernel kernel_prod_normalize = context.createKernel(program, "prod_normalize");
  kernel_prod_normalize.setArg(0, bufferProd1);
  kernel_prod_normalize.setArg(1, bufferProd2);

  auto queue = context.createQueue();

  LargeProduct prod1 = {1.0, 0};
  LargeProduct prod2 = { 1.0, 0};
  queue.enqueueWriteBuffer(bufferProd1, true, 0, sizeof(LargeProduct), &prod1);
  queue.enqueueWriteBuffer(bufferProd2, true, 0, sizeof(LargeProduct), &prod2);
  queue.enqueueWriteBuffer(bufferX, true, 0, sizeof(double) * N, &x[0]);

  std::uniform_real_distribution<double> distu(0.0, 1.0);

  Timer timer;
  timer.start();
  for(int32_t i = 0; i < N; ++i) {
    double u1 = distu(gen)*2-1;
    double u2 = distu(gen)*2-1;

    kernel_prod_diff_realrealvec.setArg(0, i);
    kernel_prod_diff_realrealvec.setArg(1, u1);
    kernel_prod_diff_realrealvec.setArg(2, u2);
    kernel_prod_diff_realrealvec.setArg(3, bufferX);
    kernel_prod_diff_realrealvec.setArg(4, bufferProd1);
    kernel_prod_diff_realrealvec.setArg(5, bufferProd2);

    size_t workItems = (N + MULS_PER_EXPONENT_EXTRACTION - 1) / MULS_PER_EXPONENT_EXTRACTION;

    cl_int err = queue.enqueueNDRangeKernel(
            kernel_prod_diff_realrealvec, cl::NullRange, cl::NDRange(workItems), cl::NDRange(workgroupSize), nullptr, nullptr);
    context.checkErr(err, "kernel");

    err = queue.enqueueNDRangeKernel(
            kernel_prod_normalize, cl::NullRange, cl::NDRange((size_t)1), cl::NDRange((size_t)64), nullptr, nullptr);

    queue.finish();

    if (i % 1 == 0) {
      queue.enqueueReadBuffer(bufferProd1, CL_TRUE, 0, sizeof(prod1), &prod1);
      queue.enqueueReadBuffer(bufferProd2, CL_TRUE, 0, sizeof(prod2), &prod2);

      std::cout << "iteration " << i << ": " << timer.getTimeElapsed() << std::endl;
      std::cout << u1 << "/" << u2 <<std::endl;
      std::cout << "prod1: " << prod1.prod << " * 2^" << prod1.exponent << std::endl;
      std::cout << "prod2: " << prod2.prod << " * 2^" << prod2.exponent << std::endl;
    }
  }

  queue.finish();

  std::cout << "Total time: " << timer.getTimeElapsed() << std::endl;

  queue.enqueueReadBuffer(bufferProd1, CL_TRUE, 0, sizeof(prod1), &prod1);
  queue.enqueueReadBuffer(bufferProd2, CL_TRUE, 0, sizeof(prod2), &prod2);

  std::cout << "prod1: " << prod1.prod << " * 2^" << prod1.exponent << std::endl;
  std::cout << "prod2: " << prod2.prod << " * 2^" << prod2.exponent << std::endl;
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

const uint64_t EXPONENT_MASK = 0x7ff0000000000000ULL;
const uint64_t EXPONENT_RESET_MASK = 0x3ff0000000000000ULL;
const int32_t EXPONENT_BIAS = 1023;

typedef union {
    uint64_t u64;
    double f64;
} double_cast;

void normalize_exponent(double* prod, int32_t* exponent) {
  double_cast* cast_prod = (double_cast*)prod;
  *exponent = *exponent + (((*cast_prod).u64 & EXPONENT_MASK) >> 52) - EXPONENT_BIAS;
  (*cast_prod).u64 = ((*cast_prod).u64 & ~EXPONENT_MASK) | EXPONENT_RESET_MASK;
}

int main(int argc, char** argv) {
  double prod = 0.104612;
  int32_t exponent = 0;
  normalize_exponent(&prod, &exponent);
  std::cout << prod << "* 2^" << exponent << std::endl;

  OpenClConfig config;
  config.platform = 0;
  config.deviceId = 0;

  OpenClContext context(config);

  std::mt19937_64 gen(42);
  std::vector x = init_random_positions(100000, -1, 1, gen);
  std::vector y = init_random_positions(100000, -1, 1, gen);

  run_prod_diff_realrealvec(context, x, gen);
}