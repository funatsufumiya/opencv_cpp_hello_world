#!/bin/bash
set -e

# ビルドディレクトリの作成
mkdir -p build
cd build

# CMakeの設定とビルド（homebrew版OpenCVを使用）
cmake .. -DOpenCV_DIR=$(brew --prefix opencv)/lib/cmake/opencv4
cmake --build .