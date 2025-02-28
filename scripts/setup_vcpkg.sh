#!/bin/bash
set -e

# check VCPKG_DIR is specified
if [ -z "$VCPKG_DIR" ]; then
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

    VCPKG_DIR=$(pwd)/vcpkg
else
    echo "[setup] Using vcpkg directory: $VCPKG_DIR"
    # check vcpkg command exists
    if [ ! -f "$VCPKG_DIR/vcpkg" ]; then
        echo "[Error] vcpkg command does not exist. Exiting..." > /dev/stderr
        exit 1
    fi
fi

# Install OpenCV
echo "[setup] Installing OpenCV..."
$VCPKG_DIR/vcpkg install opencv4

echo "[setup] Done."