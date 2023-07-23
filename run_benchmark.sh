set -e
cd build
cmake ..
make
./benchmark $1 $2