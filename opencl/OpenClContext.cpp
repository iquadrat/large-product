#include "OpenClContext.h"

#include <fstream>
#include <sstream>
#include "HexUtil.h"

using std::string;
using std::vector;

enum Level {
    WARNING,
    INFO,
    ERROR,
};

OpenClContext::OpenClContext(const OpenClConfig& config):
   device_id(config.deviceId),
   binaryKernels(config.binaryKernels),
   debug(config.debug)
 {
   init(config);
   debugClBuffer_ = createBuffer("Debug", kDebugBufferSize,
       CL_MEM_READ_WRITE);
   debugMemBuffer_ = new char[kDebugBufferSize];

   cl_int err;
   dummyEvent_ = cl::UserEvent(getContext(), &err);
   checkErr(err, "Create Dummy Event");
   dummyEvent_.setStatus(CL_COMPLETE);
 }


/* static */ int32_t OpenClContext::platformCount() {
  std::vector<cl::Platform> platforms;
  cl::Platform::get(&platforms);
  return (int32_t)platforms.size();
}

/* static */ cl::Platform OpenClContext::getPlatform(int32_t id) {
  std::vector<cl::Platform> platforms;
  cl::Platform::get(&platforms);

  checkErr(platforms.size() > (size_t)id ? CL_SUCCESS : -1, "Failed to get Platform with id " + std::to_string(id));
  std::cout << "Platform count: " << platforms.size() << std::endl;

  return platforms[id];
}

/* static */ int32_t OpenClContext::deviceCount(int32_t platform_id) {
  cl::Platform platform = getPlatform(platform_id);

  cl_int err;
  cl_context_properties cprops[3] = { CL_CONTEXT_PLATFORM, (cl_context_properties) (platform)(), 0 };
  cl::Context context(CL_DEVICE_TYPE_GPU, cprops, nullptr, nullptr, &err);
  checkErr(err, "cl::Context::Context()");

  vector<cl::Device> devices = context.getInfo<CL_CONTEXT_DEVICES>();
  return (int32_t)devices.size();
}

int64_t OpenClContext::getAvailableDeviceMemory() {
  return getDevice().getInfo<CL_DEVICE_GLOBAL_MEM_SIZE>();
}

void OpenClContext::init(const OpenClConfig& config) {
  cl::Platform platform = getPlatform(config.platform);

	cl_int err;
	cl_context_properties cprops[3] = { CL_CONTEXT_PLATFORM, (cl_context_properties) (platform)(), 0 };
	context_ = cl::Context(CL_DEVICE_TYPE_GPU, cprops, nullptr, nullptr, &err);
	checkErr(err, "cl::Context::Context()");

	vector<cl::Device> devices = context_.getInfo<CL_CONTEXT_DEVICES>();
	checkErr(devices.size() >= (size_t)config.deviceId  ? CL_SUCCESS : -1, "devices.size() < " + std::to_string(config.deviceId));

	device_ = devices.at(config.deviceId);
	deviceName = config.deviceName.empty() ? device_.getInfo<CL_DEVICE_NAME>() : config.deviceName;
}

bool OpenClContext::debugging() {
  return debug;
}

bool OpenClContext::timing() {
  return false;
}

cl::Program OpenClContext::createProgram(const string& name, const vector<string>& files, const string& options) {
  if (binaryKernels) {
    return createProgramFromBinary(name);
  }

  std::cout << "Generating kernel for " << name << std::endl;

	cl::Program::Sources sources;

	string prog;
	for (auto it = files.begin(); it != files.end(); ++it) {
		std::ifstream stream(*it);
		checkErr(stream.is_open() ? CL_SUCCESS : -1, "Failed to read " + *it);
		prog += std::string(
				std::istreambuf_iterator<char>(stream),
				std::istreambuf_iterator<char>());
	}
	sources.push_back(prog);

	vector<cl::Device> devices = { device_ };

	cl::Program program(context_, sources);
	cl_int err = program.build(devices, options.c_str());
	if (err != CL_SUCCESS) {
		std::cerr << "Build Status: " << program.getBuildInfo<CL_PROGRAM_BUILD_STATUS>(device_) << std::endl;
		std::cerr << "Build Log:\n" << program.getBuildInfo<CL_PROGRAM_BUILD_LOG>(device_) << std::endl;
	}
	checkErr(err, "Program::build()");

  std::cout << "Successfully generated kernel for " << name << std::endl;

  if (false) {
    const vector<size_t> binSizes = program.getInfo<CL_PROGRAM_BINARY_SIZES>();
//    CHECK_EQ(binSizes.size(), 1) << "Unexpected binary count: " << binSizes.size();
    size_t binSize = binSizes[0];
    std::unique_ptr<char[]> bin(new char[binSize]);
    std::vector<char*> binaries = {bin.get()};
    program.getInfo(CL_PROGRAM_BINARIES , &binaries[0] ) ;

    string filename = "bin/" + deviceName + "_" + name + ".bin";
    std::ofstream binaryfile(filename);
    if(!binaryfile.good()) {
      std::cout << "Failed to write " << filename;
    } else {
      binaryfile.write(bin.get(), binSize);
      binaryfile.close();
    }
  }
  return program;
}

cl::Program OpenClContext::createProgramFromBinary(const std::string& name) {
  vector<cl::Device> devices = {device_};
  cl::Program::Binaries binaries;

  string filename = "bin/" + deviceName + "_" + name + ".bin";
  std::cout << "loading " << filename << std::endl;
  std::basic_ifstream<unsigned char> stream(filename, std::ios::binary | std::ios::ate);
  checkErr(stream.is_open() ? CL_SUCCESS : -1, "Failed to read " + filename);
  std::streamsize size = stream.tellg();
  stream.seekg(0, std::ios::beg);

  std::vector<unsigned char> buffer(size);
  if (!stream.read(buffer.data(), size)) {
    std::cerr << "Failed to read " << filename << std::endl;
    exit(4);
  }

  binaries.push_back(buffer);

  cl_int err;

  cl::Program program(context_, devices, binaries, nullptr, &err);
  checkErr(err, "CreateProgram " + name);

  err = program.build(devices);
  if (err != CL_SUCCESS) {
    std::cerr << "Build Status: " << program.getBuildInfo<CL_PROGRAM_BUILD_STATUS>(device_) << std::endl;
    std::cerr << "Build Log:\n" << program.getBuildInfo<CL_PROGRAM_BUILD_LOG>(device_) << std::endl;
  }

  return program;
}


cl::Event OpenClContext::enqueueWriteDebugBuffer(cl::CommandQueue* queue) {
  if (!debugging()) {
    return dummyEvent_;
  }
  queue->enqueueBarrierWithWaitList();
  memset(debugMemBuffer_, 0, kDebugZeroSize);
  cl::Event event;
  cl_int err = queue->enqueueWriteBuffer(debugClBuffer_, CL_TRUE, 0, kDebugZeroSize, debugMemBuffer_, nullptr, &event);
  checkErr(err, "Enqueue write Debug buffer failed!");
  return event;
}

cl::Event OpenClContext::enqueueReadDebugBuffer(cl::CommandQueue* queue) {
  if (!debugging()) {
    return dummyEvent_;
  }
  queue->enqueueBarrierWithWaitList();
  cl::Event event;
  cl_int err = queue->enqueueReadBuffer(debugClBuffer_, CL_TRUE, 0, kDebugBufferSize, debugMemBuffer_, NULL, &event);
  checkErr(err, "Enqueue read Debug buffer failed!");
  uint32_t length = ((uint32_t*)debugMemBuffer_)[0];
  std::stringstream ss;
  for(uint32_t i=0; i<length / 4; ++i) {
    ss << ((uint32_t*)debugMemBuffer_)[i+1] << " ";
  }
  if (length > 0) {
    std::cout << "Kernel debug info:" << std::endl << bin2hex(&debugMemBuffer_[sizeof(uint32_t)], length) << std::endl << ss.str() << std::endl;
  }
  return event;
}

/*static*/ void OpenClContext::printStats(cl_event event, int state, void* data_) {
  PrintStatsData* data = (PrintStatsData*)data_;

  cl_ulong queue_time_ns;
  cl_ulong end_time_ns;
  cl_ulong start_time_ns;
  clGetEventProfilingInfo(event, CL_PROFILING_COMMAND_QUEUED, sizeof(cl_ulong), &queue_time_ns, NULL);
  clGetEventProfilingInfo(event, CL_PROFILING_COMMAND_START, sizeof(cl_ulong), &start_time_ns, NULL);
  clGetEventProfilingInfo(event, CL_PROFILING_COMMAND_END, sizeof(cl_ulong), &end_time_ns, NULL);

  cl_ulong queued = (start_time_ns - queue_time_ns);
  cl_ulong elapsed = (end_time_ns - start_time_ns);

  std::cout << "Timings for event '" << data->name << "':" << std::endl
            << "Queued:\t" << queued / 1.0e9 << "s" << std::endl
            << "Run:\t" << elapsed / 1.0e9 << "s" << std::endl;
  delete data;
}

/*static*/std::string OpenClContext::errorToString(cl_int error) {
  switch (error) {
  case 0:
    return "CL_SUCCESS";
  case -1:
    return "CL_DEVICE_NOT_FOUND";
  case -2:
    return "CL_DEVICE_NOT_AVAILABLE";
  case -3:
    return "CL_COMPILER_NOT_AVAILABLE";
  case -4:
    return "CL_MEM_OBJECT_ALLOCATION_FAILURE";
  case -5:
    return "CL_OUT_OF_RESOURCES";
  case -6:
    return "CL_OUT_OF_HOST_MEMORY";
  case -7:
    return "CL_PROFILING_INFO_NOT_AVAILABLE";
  case -8:
    return "CL_MEM_COPY_OVERLAP";
  case -9:
    return "CL_IMAGE_FORMAT_MISMATCH";
  case -10:
    return "CL_IMAGE_FORMAT_NOT_SUPPORTED";
  case -11:
    return "CL_BUILD_PROGRAM_FAILURE";
  case -12:
    return "CL_MAP_FAILURE";

  case -30:
    return "CL_INVALID_VALUE";
  case -31:
    return "CL_INVALID_DEVICE_TYPE";
  case -32:
    return "CL_INVALID_PLATFORM";
  case -33:
    return "CL_INVALID_DEVICE";
  case -34:
    return "CL_INVALID_CONTEXT";
  case -35:
    return "CL_INVALID_QUEUE_PROPERTIES";
  case -36:
    return "CL_INVALID_COMMAND_QUEUE";
  case -37:
    return "CL_INVALID_HOST_PTR";
  case -38:
    return "CL_INVALID_MEM_OBJECT";
  case -39:
    return "CL_INVALID_IMAGE_FORMAT_DESCRIPTOR";
  case -40:
    return "CL_INVALID_IMAGE_SIZE";
  case -41:
    return "CL_INVALID_SAMPLER";
  case -42:
    return "CL_INVALID_BINARY";
  case -43:
    return "CL_INVALID_BUILD_OPTIONS";
  case -44:
    return "CL_INVALID_PROGRAM";
  case -45:
    return "CL_INVALID_PROGRAM_EXECUTABLE";
  case -46:
    return "CL_INVALID_KERNEL_NAME";
  case -47:
    return "CL_INVALID_KERNEL_DEFINITION";
  case -48:
    return "CL_INVALID_KERNEL";
  case -49:
    return "CL_INVALID_ARG_INDEX";
  case -50:
    return "CL_INVALID_ARG_VALUE";
  case -51:
    return "CL_INVALID_ARG_SIZE";
  case -52:
    return "CL_INVALID_KERNEL_ARGS";
  case -53:
    return "CL_INVALID_WORK_DIMENSION";
  case -54:
    return "CL_INVALID_WORK_GROUP_SIZE";
  case -55:
    return "CL_INVALID_WORK_ITEM_SIZE";
  case -56:
    return "CL_INVALID_GLOBAL_OFFSET";
  case -57:
    return "CL_INVALID_EVENT_WAIT_LIST";
  case -58:
    return "CL_INVALID_EVENT";
  case -59:
    return "CL_INVALID_OPERATION";
  case -60:
    return "CL_INVALID_GL_OBJECT";
  case -61:
    return "CL_INVALID_BUFFER_SIZE";
  case -62:
    return "CL_INVALID_MIP_LEVEL";
  case -63:
    return "CL_INVALID_GLOBAL_WORK_SIZE";
  default:
    return "Unknown OpenCL error " + std::to_string(error);
  }
}
