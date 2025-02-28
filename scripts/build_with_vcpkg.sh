#!/bin/bash
set -e

if [ -z "$VCPKG_DIR" ]; then
    VCPKG_DIR=$(pwd)/vcpkg
else
    echo "Using vcpkg directory: $VCPKG_DIR"
fi

# Create build directory
mkdir -p build
cd build

# Configure and build with CMake
cmake .. -DCMAKE_TOOLCHAIN_FILE=$VCPKG_DIR/scripts/buildsystems/vcpkg.cmake
cmake --build .
