cmake_minimum_required(VERSION 3.20)
project(large_product)
include(GoogleTest)

set(CMAKE_CXX_STANDARD 17)

add_compile_options(-march=native -O3)

add_library(vector_products vector_products.cpp)

add_executable(tests tests.cpp)
target_link_libraries(tests vector_products gtest)

add_executable(benchmark benchmark.cpp)
target_link_libraries(benchmark vector_products)

gtest_discover_tests(tests)