#!/bin/bash
set -e

# first, check vcpkg folder exists and vcpkg works
if [ ! -d "vcpkg" -o ! -f "vcpkg/README.md" ]; then
    echo "[setup] vcpkg folder does not exist. Creating..."
    git submodule update --init --recursive

    if [ ! -d "vcpkg" ]; then
        echo "[Error] vcpkg folder does still not exist. Exiting..." > /dev/stderr
        exit 1
    fi
fi

if [ ! -f "vcpkg/vcpkg" ]; then
    echo "[setup] vcpkg command does not exist. Bootstrapping..."
    ./vcpkg/bootstrap-vcpkg.sh

    if [ ! -f "vcpkg/vcpkg" ]; then
        echo "[Error] vcpkg command does still not exist. Exiting..." > /dev/stderr
        exit 1
    fi
fi

# Install OpenCV
echo "[setup] Installing OpenCV..."
./vcpkg/vcpkg install opencv4

echo "[setup] Done."