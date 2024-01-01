cmake_minimum_required(VERSION 3.20)
project(large_product-opencl)
include(GoogleTest)

set(CMAKE_CXX_STANDARD 17)

add_compile_options(-march=native -O2)

add_executable(main main.cpp OpenClContext.cpp)
target_link_libraries(main OpenCL)

#gtest_discover_tests(tests)

