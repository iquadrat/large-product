set -e
cmake .
make
./benchmark $1 $2