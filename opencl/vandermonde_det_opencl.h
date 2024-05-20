#include <stdint.h>
#include <vector>
#include <random>
#include <iostream>
#include <sstream>
#include "OpenClContext.h"
#include "large_product.h"
#include "Timer.h"

//#define CHECK_RESULT

using std::size_t;

class VandermondeDetOpenCl {

public:
    VandermondeDetOpenCl(OpenClContext& context): context(context) {

    }

    void run(int32_t N, const std::vector<double>& x, const std::vector<double>& y) {
      this->N = N;
      this->blockHCount = (N + BLOCK_H - 1)  / BLOCK_H;
      setup();

      std::cout << "blockHCount = " << blockHCount << std::endl;
      this->blockVCount = (N + BLOCK_V - 1) / BLOCK_V;

//      copyInputBuffers(x, y);
//      benchmark_iteration();

      copyInputBuffers(x, y);
      timer.restart();

      for(int32_t b = 0; b < blockVCount + 1; b++) {
        schedule_compute_products(b);

        if ((b * BLOCK_V) % (1 << 10) == BLOCK_V) {
          print_intermediate_result((b - 1) * BLOCK_V);
        }
      }

      queue.finish();
      timer.stopAndAddTime();

      print_result();
    }

private:
    const int32_t BLOCK_H = 512;
    const int32_t BLOCK_V = 256;
    const int32_t MULS_PER_EXPONENT_EXTRACTION = 16;

    OpenClContext& context;

    int32_t N;
    int32_t blockHCount;
    int32_t blockVCount;

    cl::Buffer bufferX;
    cl::Buffer bufferY;
    cl::Buffer bufferProdX;
    cl::Buffer bufferProdY;

    cl::Program program;
    cl::Kernel kernel_prod_diff_realrealvec;
    cl::Kernel kernel_prod_divide;

    cl::CommandQueue queue;

    Timer timer;

    void setup();

    void copyInputBuffers(const std::vector<double>& x, const std::vector<double>& y);

    void benchmark_iteration();

    double run_benchmark(int32_t blocks);

    void schedule_compute_products(int32_t blockVOffset);

    void print_intermediate_result(int32_t i);

    void print_result();

};

