#!/bin/bash
set -e

# Check if running in MSYS2 environment
if [[ "$(uname -o)" != "Msys" ]]; then
    echo "This script must be run in an MSYS2 environment"
    exit 1
fi

# Create build directory
mkdir -p build
cd build

# Detect OpenCV path in MSYS2
OPENCV_DIR="/mingw64/lib/cmake/opencv4"

if [ ! -d "$OPENCV_DIR" ]; then
    echo "OpenCV not found. Please run setup_msys2.sh first."
    exit 1
fi

# Configure and build with CMake
echo "Configuring CMake project..."
cmake .. \
    -G "MSYS Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DOpenCV_DIR=$OPENCV_DIR

echo "Building project..."
cmake --build .

echo "Build completed successfully!"
