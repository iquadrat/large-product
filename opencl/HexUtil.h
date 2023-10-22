#ifndef HEXUTIL_H_
#define HEXUTIL_H_

#include <string>
#include <stdint.h>

inline std::string bin2hex(const char* data, size_t length) {
  char* result = new char[length * 2 + 1];
  for (size_t i = 0; i < length; i++) {
	// snprintf appends a null terminator, so we always write 3 bytes.
    snprintf(&result[2 * i], 3, "%02x", (unsigned char) data[i]);
  }
  std::string s = std::string(result);
  delete[] result;
  return std::move(s);
}

inline std::string bin2hex(const uint8_t* data, size_t length) {
  return bin2hex((const char*)data, length);
}


inline uint8_t hex2Byte(char c) {
  if (c >= '0' && c <= '9') {
    return (uint8_t)(c - '0');
  }
  if (c >= 'a' && c <= 'f') {
    return (uint8_t)(c - 'a' + 10);
  }
  if (c >= 'A' && c <= 'F') {
    return (uint8_t)(c - 'A' + 10);
  }
  return 255;
}

inline uint8_t* hex2Bytes(const std::string& string, bool flip) {
  if (string.length() % 2 != 0) {
    return nullptr;
  }
  size_t outputLength = string.length() / 2;
  uint8_t* result = new uint8_t[outputLength];
  for (size_t i = 0; i < outputLength; ++i) {
    size_t resultIndex = flip ? (outputLength - i - 1) : i;
    uint8_t b1 = hex2Byte(string[2 * i]);
    uint8_t b2 = hex2Byte(string[2 * i + 1]);
    if (b1 == 255 || b2 == 255) {
      delete[] result;
      return nullptr;
    }
    result[resultIndex] = (uint8_t) ((b1 << 4) | b2);
  }
  return result;
}

#endif
