#!/bin/bash
set -e

if [ ! -d "build" ]; then
    echo "Please build first. exit." > /dev/stderr
    exit 1
fi

cd build
./opencv_hello_world