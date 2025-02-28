#!/bin/bash
set -e

if [ ! -d "build" ]; then
    echo "Please build first. exit." > /dev/stderr
    exit 1
fi

# check is win git-bash
# if [ "$(uname -o)" = "Msys" ]; then

# check is msys2
if [ "$(uname -o)" = "Msys" ]; then
    IS_MSYS2=true
else
    IS_MSYS2=false
fi

# check is git-bash
if [ -z "$EXEPATH" ]; then
    IS_GITBASH=false
else
    exe_path=$(cygpath "$EXEPATH")
    if [ "$exe_path" = '/' ]; then
        IS_GITBASH=true
    else
        IS_GITBASH=false
    fi
fi

if [ "$IS_GITBASH" = true ]; then
    echo "git-bash detected."
    cd build
    ./Debug/opencv_hello_world.exe
elif [ "$IS_MSYS2" = true ]; then
    echo "msys2 detected."
    cd build
    # ./Debug/opencv_hello_world.exe
    ./opencv_hello_world.exe
else
    cd build
    ./opencv_hello_world
fi