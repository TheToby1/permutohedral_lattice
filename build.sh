#!/usr/bin/env bash

rm lattice_filter.so
rm -r build_dir
mkdir build_dir
cd build_dir


CUDA_COMPILER=/usr/local/cuda/bin/nvcc
CXX_COMPILER=/usr/bin/g++
CUDA_INCLUDE=/usr/local/cuda/include/

SPATIAL_DIMS=2
INPUT_CHANNELS=3
REFERENCE_CHANNELS=3
MAKE_TESTS=True

cmake -DCMAKE_BUILD_TYPE=Debug -D CMAKE_CUDA_COMPILER=${CUDA_COMPILER} \
                               -D CMAKE_CXX_COMPILER=${CXX_COMPILER} \
                               -D CMAKE_CUDA_HOST_COMPILER=${CXX_COMPILER} \
                               -D CUDA_INCLUDE=${CUDA_INCLUDE} \
                               -D SPATIAL_DIMS=${SPATIAL_DIMS} \
                               -D INPUT_CHANNELS=${INPUT_CHANNELS} \
                               -D REFERENCE_CHANNELS=${REFERENCE_CHANNELS} \
                               -D MAKE_TESTS=${MAKE_TESTS} \
                               -G "CodeBlocks - Unix Makefiles" ../


make

cp lattice_filter.so ../
