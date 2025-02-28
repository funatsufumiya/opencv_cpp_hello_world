#!/bin/bash
set -e

# Check if running in MSYS2 environment
if [[ "$(uname -o)" != "Msys" ]]; then
    echo "This script must be run in an MSYS2 environment"
    exit 1
fi

# Update package database
echo "Updating package database..."
pacman -Syu --noconfirm

# Install development tools
echo "Installing development tools..."
pacman -S --noconfirm \
    mingw-w64-x86_64-toolchain \
    mingw-w64-x86_64-cmake \
    mingw-w64-x86_64-make \
    mingw-w64-x86_64-ninja \
    git \
    cmake

# Install OpenCV
echo "Installing OpenCV..."
pacman -S --noconfirm mingw-w64-x86_64-opencv

echo "MSYS2 setup completed successfully!"
