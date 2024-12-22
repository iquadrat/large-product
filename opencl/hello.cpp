#include <CL/cl.h>
#include <CL/opencl.hpp>
#include <iostream>
#include <vector>
#include <string>

static inline void checkErr(cl_int error, const std::string& message) {
  if (error == CL_SUCCESS) {
    return;
  }
  std::cerr << "OpenCL error: " << message << " (" << error << ")" << std::endl;
  exit(3);
}

int main() {
  std::vector<cl::Platform> platforms;
  cl::Platform::get(&platforms);

  cl::Platform platform = platforms[0];
  cl_int err;
  cl::Context context = cl::Context(CL_DEVICE_TYPE_GPU, nullptr, nullptr, nullptr, &err);
  checkErr(err, "cl::Context::Context()");

  std::vector<cl::Device> devices = context.getInfo<CL_CONTEXT_DEVICES>();

  cl::Device device = devices.at(0);
  std::string deviceName = device.getInfo<CL_DEVICE_NAME>();

  std::cout << "Device Name: " << deviceName << std::endl;

  cl_command_queue_properties properties = 0; //CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE;
  //properties |= CL_QUEUE_PROFILING_ENABLE;
  cl::CommandQueue queue(context, device, properties, &err);
  cl_command_queue queue = clCreateCommandQueueWithProperties(context.get(), devices[0].get(), 0, &err);

  if (!queue)
  {
    std::cout << "Failed to create a command queue!" << std::endl;
    return EXIT_FAILURE;
  }
  checkErr(err, "Failed to create CommandQueue!");

  std::cout << "created queue" << std::endl;

}
