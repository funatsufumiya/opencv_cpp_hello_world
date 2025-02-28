#!/bin/bash
set -e

# Check if OpenCV is installed
if ! pkg-config --exists opencv4; then
    echo "OpenCV not found. Please run setup_apt.sh first."
    exit 1
fi

# Create build directory
mkdir -p build
cd build

# Configure and build with CMake
echo "Configuring CMake project..."
cmake .. \
    -DCMAKE_BUILD_TYPE=Release

echo "Building project..."
cmake --build .

echo "Build completed successfully!"
