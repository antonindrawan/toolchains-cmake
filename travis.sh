#! /usr/bin/env bash

mkdir -p build
cd build
cmake -G Ninja ..
ninja -v

