#include "vandermonde_det_opencl.h"

using namespace std;

void expect_prod(LargeProduct actual, LargeProduct expected) {
  if ((actual.exponent == expected.exponent) && (abs(actual.significand - expected.significand) < 1e-5)) {
    std::cout << "Result matches expectation :-)" << std::endl;
  } else {
    std::cerr << "Invalid result!" << std::endl;
    exit(1);
  }
}

void VandermondeDetOpenCl::setup() {
  if (isSetup) {
    return;
  }
  isSetup = true;

  this->blockHCount = (N + BLOCK_H - 1)  / BLOCK_H;
  this->blockVCount = (N + BLOCK_V - 1) / BLOCK_V;

  //std::cout << "sizeof(LargeProduct) = " << sizeof(LargeProduct) << std::endl;
  bufferX = context->createBuffer("x", sizeof(double) * blockHCount * BLOCK_H, CL_MEM_READ_WRITE);
  bufferY = context->createBuffer("y", sizeof(double) * blockHCount * BLOCK_H, CL_MEM_READ_ONLY);
  bufferProdX = context->createBuffer("prodX", sizeof(LargeProduct) * blockHCount * BLOCK_H, CL_MEM_READ_WRITE);
  bufferProdY = context->createBuffer("prodY", sizeof(LargeProduct) * blockHCount * BLOCK_H, CL_MEM_READ_WRITE);
  bufferURandom = context->createBuffer("uRandom", sizeof(LargeProduct) * blockVCount * BLOCK_V, CL_MEM_READ_WRITE);
  bufferDeltaE = context->createBuffer("deltaE", sizeof(double) * blockVCount * BLOCK_V, CL_MEM_READ_WRITE);

  std::vector<std::string> files;
  files.push_back("large_product.h");
  files.push_back("vandermonde_det.cl");

  std::stringstream options_stream;
  options_stream << " -DMULS_PER_EXPONENT_EXTRACTION=" << MULS_PER_EXPONENT_EXTRACTION;
  options_stream << " -DBLOCK_V=" << BLOCK_V;
  options_stream << " -DBLOCK_H=" << BLOCK_H;
  options_stream << " -DVECTOR_SIZE=" << N;
  options_stream << " -DPARAM_A=" << -0.5; // TODO: Pass 'a' to class
  options_stream << " -cl-std=CL2.0 ";
  // options_stream << " -cl-denorms-are-zero -cl-fast-relaxed-math -cl-mad-enable -cl-no-signed-zeros -cl-uniform-work-group-size";
  std::string common_options = options_stream.str();

  program = context->createProgram("vandermonde", files, common_options);
  kernel_prod_diff_realrealvec = context->createKernel(program, "prod_diff_realrealvec");

  queue = context->createQueue();
}

void VandermondeDetOpenCl::copyInputBuffers(const double* x, const double* y, const double* uRandom) {
  std::cout << "Copy input buffers to device.." << std::endl;
  std::vector<LargeProduct> prod_init(N, { 1.0, 0 });
  queue.enqueueWriteBuffer(bufferX, true, 0, sizeof(double) * N, x);
  queue.enqueueWriteBuffer(bufferY, true, 0, sizeof(double) * N, y);
  queue.enqueueWriteBuffer(bufferURandom, true, 0,  sizeof(double) * N, uRandom);
  queue.enqueueWriteBuffer(bufferProdX, true, 0, sizeof(LargeProduct) * N, &prod_init[0]);
  queue.enqueueWriteBuffer(bufferProdY, true, 0, sizeof(LargeProduct) * N, &prod_init[0]);
}

void VandermondeDetOpenCl::benchmark_iteration() {
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

//        std::cout << "Benchmark results: \n  Iteration time: " << mean << " stddev: " << stddev << std::endl;
//        double bytesRead = 1.0 * sizeof(double) * ;
//        double flops = 1.0 * (N - BLOCK_SIZE) * BLOCK_SIZE * 2.0; /* 2 ops per vector element */
//        std::cout << "  Memory read rate: " << bytesRead / mean / 1e9 << " GB/s" << std::endl;
//        std::cout << "  64bit flops: " << flops / mean / 1e9 << " /s" << std::endl;
}

double VandermondeDetOpenCl::run_benchmark(int32_t blocks) {
  queue.finish();

  if (blocks * BLOCK_V > N) {
    blocks = N / BLOCK_V;
  }

  timer.start();
  for(int b = 0; b < blocks; ++b) {
    schedule_compute_products(b);
  }

  queue.finish();
  timer.stopAndAddTime();
  return timer.getTimeElapsed();
}

void VandermondeDetOpenCl::schedule_compute_products(int32_t blockVOffset) {
  int32_t offset = blockVOffset * BLOCK_V;
  kernel_prod_diff_realrealvec.setArg(0, offset);
  kernel_prod_diff_realrealvec.setArg(1, bufferX);
  kernel_prod_diff_realrealvec.setArg(2, bufferY);
  kernel_prod_diff_realrealvec.setArg(3, bufferProdX);
  kernel_prod_diff_realrealvec.setArg(4, bufferProdY);
  kernel_prod_diff_realrealvec.setArg(5, bufferURandom);
  kernel_prod_diff_realrealvec.setArg(6, bufferDeltaE);

  int32_t elements = (1 + (N / BLOCK_H)) * BLOCK_V;
  if (blockVOffset == blockVCount) {
    elements = BLOCK_V;
  }

  cl_int err = queue.enqueueNDRangeKernel(
          kernel_prod_diff_realrealvec, cl::NullRange, cl::NDRange(elements), cl::NDRange(BLOCK_V), nullptr, nullptr);
  context->checkErr(err, "kernel");
}

void VandermondeDetOpenCl::print_intermediate_result(int32_t i) {
  queue.finish();

  LargeProduct prodX, prodY;
  queue.enqueueReadBuffer(bufferProdX, CL_TRUE, i * sizeof(LargeProduct), sizeof(LargeProduct), &prodX);
  queue.enqueueReadBuffer(bufferProdY, CL_TRUE, i * sizeof(LargeProduct), sizeof(LargeProduct), &prodY);

  prodX.normalize_exponent();
  prodY.normalize_exponent();
  std::cout << "iteration " << i << " (" << timer.getTimeElapsed() << "s): ";
  std::cout << prodX.significand << " * 2^" << prodX.exponent << "\t / ";
  std::cout << prodY.significand << " * 2^" << prodY.exponent << std::endl;

  if (N != 1024*1024) {
    return;
  }

#ifdef CHECK_RESULT
  if (i == 0) {
    expect_prod(prodX,  { -1.36992 , -1310370 });
    expect_prod(prodY, { -1.74623 , -1336159 });
  }
  if (i == 65536) {
    expect_prod(prodX,  { 1.32937 , -1221069 });
    expect_prod(prodY,  { 1.90488 , -1424903 });
  }
#endif

}

void VandermondeDetOpenCl::fetch_result(double* x) {
  std::cout << "N= " << N << std::endl;
  std::cout << "Total time: " << timer.getTimeElapsed() << std::endl;

//  std::vector<LargeProduct> prodX(N);
//  std::vector<LargeProduct> prodY(N);
//  queue.enqueueReadBuffer(bufferProdX, CL_TRUE, 0, sizeof(LargeProduct) * N, &prodX[0]);
//  queue.enqueueReadBuffer(bufferProdY, CL_TRUE, 0, sizeof(LargeProduct) * N, &prodY[0]);

  std::vector<double> xNew(N);
  queue.enqueueReadBuffer(bufferX, CL_TRUE, 0, sizeof(double) * N, &xNew[0]);

//  std::vector<double> deltaE(N);
//  queue.enqueueReadBuffer(bufferDeltaE, CL_TRUE, 0, sizeof(double) * N, &deltaE[0]);

  int moved = 0;
  for(int i=0; i<N; ++i) {
    if (x[i] != xNew[i]) {
      moved += 1;
    }
    x[i] = xNew[i];
    if (i > 100 && i< (N-100)) {
      continue;
    }
//    std::cout << i << ":\t" << prodX[i].significand << " * 2^" << prodX[i].exponent;
//    std::cout << "\t / " << prodY[i].significand << " * 2^" << prodY[i].exponent << std::endl;
//    cout << "x[" << i << "] = " << x[i] << "\t" << deltaE[i] << endl;
  }

  cout << "moved = " << moved << endl;

  double bytesRead = 1.0 * sizeof(double) * 2 * (N / BLOCK_V) * (N / BLOCK_H) * (BLOCK_H + BLOCK_V);
  double flops =(1.0 * N * N) * 2 * 2; /* 2 ops per vector element */
  std::cout << "Memory read rate: " << bytesRead / timer.getTimeElapsed() / 1e9 << " GB/s" << std::endl;
  std::cout << "64bit flops: " << flops / timer.getTimeElapsed() / 1e9 << " Gflops/s" << std::endl;

//      if (N == 131072) {
//        expect_prod(prod, {1.34437, 16862534 });
//      } else if (N == 1048576) {
//        expect_prod(prod, {-1.99591, 351275623 });
//      }
}
