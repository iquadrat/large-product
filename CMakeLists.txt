cmake_minimum_required(VERSION 3.20)
project(large_product)
include(GoogleTest)

set(CMAKE_CXX_STANDARD 17)

add_compile_options(-march=native -O3)

add_library(vandermonde_det vandermonde_det.cpp)
add_library(vandermonde_det_reference vandermonde_det_reference.cpp)

add_executable(tests tests.cpp)
target_link_libraries(tests vandermonde_det gtest)

add_executable(benchmark benchmark.cpp)
target_link_libraries(benchmark vandermonde_det)

gtest_discover_tests(tests)