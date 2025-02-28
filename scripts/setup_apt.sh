#!/bin/bash
set -e

# Check if running as root or with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run with sudo or as root"
    exit 1
fi

# Update package database
echo "Updating package database..."
apt update

# Install build tools and dependencies
echo "Installing build tools and dependencies..."
apt install -y \
    build-essential \
    cmake \
    git \
    pkg-config

# Install OpenCV and development packages
echo "Installing OpenCV and development packages..."
apt install -y \
    libopencv-dev \
    python3-opencv

echo "APT setup completed successfully!"
