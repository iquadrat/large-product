#include <random>
#include <iostream>
#include "OpenClContext.h"
#include "large_product.h"
#include "vandermonde_det_opencl.h"

#define CHECK_RESULT

using std::size_t;


void run_prod_diff_realrealvec(OpenClContext& context, int32_t N, const std::vector<double>& x, const std::vector<double>& y) {
  VandermondeDetOpenCl runner(context);
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