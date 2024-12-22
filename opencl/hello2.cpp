// OpenCL header
#ifdef __APPLE__
#include <OpenCL/opencl.h>
#else
#include <CL/cl.h>
#endif

#include <iostream>
#include <vector>

int main()
{
  cl_int err;

  // Get the platforms
  std::vector<cl_platform_id> platforms(10);
  cl_uint platform_count;
  err = clGetPlatformIDs(platforms.size(), &platforms[0], &platform_count);

  if (err != CL_SUCCESS)
  {
    std::cout << "Failed to find an OpenCL platform!" << std::endl;
    return 1;
  }

  // Get the devices
  std::vector<cl_device_id> devices(10);
  cl_uint device_count;
  err = clGetDeviceIDs(platforms[0], CL_DEVICE_TYPE_ALL, devices.size(), &devices[0], &device_count);

  if (err != CL_SUCCESS)
  {
    std::cout << "Failed to find an OpenCL device!" << std::endl;
    return 1;
  }

  // Create a context
  cl_context context = clCreateContext(0, device_count, &devices[0], NULL, NULL, &err);

  if (!context)
  {
    std::cout << "Failed to create a compute context!" << std::endl;
    return EXIT_FAILURE;
  }

  // Finally, create a command queue. Starting with OpenCL 2.0, we use
  // clCreateCommandQueueWithProperties, but for earlier versions it's
  // clCreateCommandQueue
  cl_command_queue queue = clCreateCommandQueue(context, devices[0], 0, &err);

  if (!queue)
  {
    std::cout << "Failed to create a command queue!" << std::endl;
    return EXIT_FAILURE;
  }

  // At this point we have a command queue and can start to enqueue commands.
  // Don't forget to clean up at the end of the program
  clReleaseCommandQueue(queue);
  clReleaseContext(context);

  std::cout << "success" << std::endl;

  return 0;
}