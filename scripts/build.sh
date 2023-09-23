#!/bin/bash
mkdir -p bin
cat <<EOT > bin/CMakeLists.txt

cmake_minimum_required(VERSION 3.14.0 FATAL_ERROR)
project(test)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "\${CMAKE_CXX_FLAGS} -std=c++20")

FILE(GLOB src ../src/*.cpp)
FILE(GLOB headers ../src/*.h)

add_executable(out \${src} \${headers})


EOT
cmake -S bin -B bin
make -C bin
mv -f bin/out ./out
