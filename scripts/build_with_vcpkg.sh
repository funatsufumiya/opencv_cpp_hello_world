#!/bin/bash
set -e

# Create build directory
mkdir -p build
cd build

# Configure and build with CMake
cmake .. -DCMAKE_TOOLCHAIN_FILE=../vcpkg/scripts/buildsystems/vcpkg.cmake
cmake --build .
