set -e
cd build
cmake ..
make
cd ..
./build/monte_carlo_simplified $1