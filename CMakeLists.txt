cmake_minimum_required(VERSION 3.20)
project(large_product)
include(GoogleTest)

set(CMAKE_CXX_STANDARD 17)

add_compile_options(-march=native -O3 -g  -DCL_HPP_TARGET_OPENCL_VERSION=120 -DCL_HPP_MINIMUM_OPENCL_VERSION=120)

add_library(vandermonde_det_opencl opencl/vandermonde_det_opencl.cpp opencl/OpenClContext.cpp)
add_library(vandermonde_det vandermonde_det.cpp)
add_library(vandermonde_det_reference vandermonde_det_reference.cpp)

add_executable(tests tests.cpp)
target_link_libraries(tests vandermonde_det gtest)

add_executable(benchmark benchmark.cpp)
target_link_libraries(benchmark vandermonde_det)

add_executable(monte_carlo_simplified monte_carlo_simplified.cpp)
target_link_libraries(monte_carlo_simplified vandermonde_det vandermonde_det_opencl OpenCL)

gtest_discover_tests(tests)

