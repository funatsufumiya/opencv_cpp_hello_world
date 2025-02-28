#!/bin/bash
set -e

if [ ! -d "build" ]; then
    echo "Please build first. exit." > /dev/stderr
    exit 1
fi

# run with checking files
if [ -f "build/Debug/opencv_hello_world.exe" ]; then
    cd build
    ./Debug/opencv_hello_world.exe
    exit 0
elif [ -f "build/opencv_hello_world.exe" ]; then
    cd build
    ./opencv_hello_world.exe
    exit 0
elif [ -f "build/opencv_hello_world" ]; then
    cd build
    ./opencv_hello_world
    exit 0
else
    echo "No executable file found. exit." > /dev/stderr
    exit 1
fi