#!/bin/bash
set -ex

chromium_version="136.0.7066.1"
build_path=build_${chromium_version}

echo -n ${chromium_version} > chromium_version.txt

cmake -S . -B ${build_path}
cmake --build ${build_path} -j8

mkdir -p ${build_path}/libdawn_${chromium_version}/include
cp -R ${build_path}/_deps/dawn-src/include/dawn ${build_path}/libdawn_${chromium_version}/include
cp -R ${build_path}/_deps/dawn-build/gen/include/dawn ${build_path}/libdawn_${chromium_version}/include
cp -R ${build_path}/_deps/dawn-src/include/webgpu ${build_path}/libdawn_${chromium_version}/include
cp -R ${build_path}/_deps/dawn-build/gen/include/webgpu ${build_path}/libdawn_${chromium_version}/include

mkdir -p ${build_path}/libdawn_${chromium_version}/lib
cp ${build_path}/lib/libdawn.so ${build_path}/libdawn_${chromium_version}/lib
cp ${build_path}/lib/libwebgpu_dawn.so ${build_path}/libdawn_${chromium_version}/lib

echo "======"
echo "${build_path}/libdawn_${chromium_version}"
