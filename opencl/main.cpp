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

      std::cout << "blockCount = " << blockCount << std::endl;

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
    const int32_t BLOCK_SIZE = 256;
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
              kernel_prod_diff_realrealvec, cl::NullRange, cl::NDRange(N), cl::NDRange(BLOCK_SIZE), nullptr, nullptr);
      context.checkErr(err, "kernel");
    }

    void print_intermediate_result(int32_t i) {
      queue.finish();
      LargeProduct prodX, prodY;
      queue.enqueueReadBuffer(bufferProdX, CL_TRUE, i * sizeof(LargeProduct), sizeof(LargeProduct), &prodX);
      queue.enqueueReadBuffer(bufferProdY, CL_TRUE, i * sizeof(LargeProduct), sizeof(LargeProduct), &prodY);

      std::cout << "iteration " << i << " (" << timer.getTimeElapsed() << "s): ";
      std::cout << prodX.prod << " * 2^" << prodX.exponent << "\t / ";
      std::cout << prodY.prod << " * 2^" << prodY.exponent << std::endl;

      if (N != 1024*1024) {
        return;
      }

      if (i == 0) {
        if (BLOCK_SIZE == 64) {
          expect_prod(prodX,  {1.28871 ,-1310276});
          expect_prod(prodY, {1.72555 ,-1336068});
        }
        if (BLOCK_SIZE == 256) {
          expect_prod(prodX, { 1.87554, -1310049 });
          expect_prod(prodY, { -1.23407 , -1335825});
        }
      }
      if (i == 16384) {
        if (BLOCK_SIZE == 64) {
          expect_prod(prodX,  {1.17407, -1180929 });
          expect_prod(prodY,  {-1.05701, -1369915 });
        }
        if (BLOCK_SIZE == 256) {
          expect_prod(prodX, {  -1.21037, -1180713 });
          expect_prod(prodY, {  1.41641, -1369695 });
        }
      }

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
      double flops =(1.0 * N * (N - BLOCK_SIZE * BLOCK_SIZE)) * 2 * 2; /* 2 ops per vector element */
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


// Expected values for N = 1048576 (all elements, no block skipping):
//iteration 0 (0.0342477s): -1.36992 * 2^-1310370  / -1.74623 * 2^-1336159
//iteration 16384 (11.2037s): 1.46398 * 2^-1181014         / 1.01569 * 2^-1369992
//iteration 32768 (23.222s): 1.86008 * 2^-1064354  / -1.48215 * 2^-1514374
//iteration 49152 (33.5454s): -1.04359 * 2^-1221576        / 1.03335 * 2^-1510292
//iteration 65536 (37.9008s): 1.32937 * 2^-1221069         / 1.90488 * 2^-1424903
//iteration 81920 (42.2351s): -1.70652 * 2^-1128961        / 1.25602 * 2^-869596
//iteration 98304 (47.7251s): -1.2039 * 2^-602577  / -1.31847 * 2^-918184
//iteration 114688 (56.2511s): -1.5408 * 2^-649257         / -1.98853 * 2^-1290212
//iteration 131072 (67.7364s): -1.11322 * 2^-1419326       / 1.03085 * 2^-1313459
//iteration 147456 (79.7433s): -1.515 * 2^-1495230         / 1.77606 * 2^-822688
//iteration 163840 (91.7866s): 1.28784 * 2^-851171         / 1.75788 * 2^-1014701
//iteration 180224 (97.5041s): -1.31957 * 2^-871677        / 1.77705 * 2^-1501167
//iteration 196608 (101.72s): 1.31012 * 2^-1418678         / 1.2914 * 2^-1266901
//iteration 212992 (106.763s): 1.38817 * 2^-1137868        / 1.47838 * 2^-1474148
//iteration 229376 (114.65s): -1.09694 * 2^-869740         / -1.10818 * 2^-1377941
//iteration 245760 (125.778s): 1.57437 * 2^-1311970        / -1.02743 * 2^-1268034
//iteration 262144 (137.834s): -1.67597 * 2^-757608        / 1.8371 * 2^-1430976
//iteration 278528 (149.876s): 1.21226 * 2^-1361876        / -1.04677 * 2^-912100
//iteration 294912 (157.757s): 1.03205 * 2^-1242711        / -1.08724 * 2^-939016
//iteration 311296 (162.132s): 1.61295 * 2^-1472735        / -1.47074 * 2^-971718
//iteration 327680 (166.819s): -1.88181 * 2^-1495626       / -1.84951 * 2^-1385352
//iteration 344064 (173.651s): 1.31293 * 2^-1479303        / -1.88254 * 2^-1512046
//iteration 360448 (183.77s): 1.12269 * 2^-1499272         / 1.98896 * 2^-756252

// Expected values for N = 1048576 (skipping block, block size 64):

// Expected values for N = 1048576 (skipping block, block size 256):