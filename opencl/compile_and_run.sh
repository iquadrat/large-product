#!/bin/bash

#export RUSTICL_ENABLE=radeonsi
export ROC_ENABLE_PRE_VEGA=1

cd build
cmake ..
make
cd ..
./build/main "$@"
