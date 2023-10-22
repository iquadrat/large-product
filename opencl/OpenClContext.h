#ifndef OPENCLCONTEXT_H_
#define OPENCLCONTEXT_H_

#include <CL/opencl.hpp>
#include <string>
#include <vector>
#include <iostream>

struct OpenClConfig {
  int32_t platform = 0;
  int32_t deviceId = 0;
  bool binaryKernels = false;
  std::string deviceName;
  bool debug = false;
};

class OpenClContext final {
  public:
    static int32_t platformCount();
    static cl::Platform getPlatform(int32_t id);
    static int32_t deviceCount(int32_t plaform);

    OpenClContext(const OpenClConfig& config);

    ~OpenClContext() {
      delete[] debugMemBuffer_;
    }

    OpenClContext(const OpenClContext&) = delete;
    OpenClContext& operator=(const OpenClContext&) = delete;

    bool debugging();

    bool timing();

    std::string getDeviceName() {
    	return deviceName;
    }

    cl::Context& getContext() {
      return context_;
    }

    cl::Device& getDevice() {
      return device_;
    }

    int32_t getDeviceId() {
      return device_id;
    }

    cl::Buffer getDebugClBuffer() {
      return debugClBuffer_;
    }

    int64_t getAvailableDeviceMemory();

    static inline void checkErr(cl_int error, const std::string& message) {
      if (error == CL_SUCCESS) {
        return;
      }
      std::cerr << "OpenCL error: " << message << " (" << errorToString(error) << ")" << std::endl;
      exit(3);
    }

    cl::Program createProgram(
        const std::string& name,
        const std::vector<std::string>& files,
        const std::string& options);

    cl::Kernel createKernel(const cl::Program& program, const std::string& name) {
      cl_int err;
      cl::Kernel result = cl::Kernel(program, name.c_str(), &err);
      checkErr(err, "Failed to create Kernel '" + name+"'");
      return result;
    }

    cl::Buffer createBuffer(const std::string& name, size_t size, cl_mem_flags flags) {
      cl_int err;
      cl::Buffer result = cl::Buffer(context_, flags, size, nullptr, &err);
      checkErr(err, "Failed to create Buffer '" +name+"'");
      return result;
    }

    cl::CommandQueue createQueue() {
      cl_int err;
      cl_command_queue_properties properties = 0; //CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE;
      if (timing()) {
        properties |= CL_QUEUE_PROFILING_ENABLE;
      }
      cl::CommandQueue queue(context_, device_, properties, &err);
      checkErr(err, "Failed to create CommandQueue!");
      return queue;
    }

    cl::Event enqueueWriteDebugBuffer(cl::CommandQueue* queue);
    cl::Event enqueueReadDebugBuffer(cl::CommandQueue* queue);

    void asyncPrintEventTimings(cl::Event event, std::string name) {
      if (!timing()) {
        return;
      }
      PrintStatsData* data = new PrintStatsData();
      data->name = std::move(name);
      event.setCallback(CL_COMPLETE, printStats, data);
    }

    static std::string errorToString(cl_int error);

    cl::Program createProgramFromBinary(
        const std::string& name);

  private:
    constexpr static const uint32_t kDebugBufferSize = 32 * 1024*10;
    constexpr static const uint32_t kDebugZeroSize = kDebugBufferSize;

    struct PrintStatsData {
      std::string name;
    };

    static void printStats(cl_event event, int state, void* data_);

    void init(const OpenClConfig& config);

    const int32_t device_id;
    const bool binaryKernels;
    const bool debug;

    std::string deviceName;
    cl::Context context_;
    cl::Device device_;
    cl::Buffer debugClBuffer_;
    cl::UserEvent dummyEvent_;
    char* debugMemBuffer_;
  };

#endif
