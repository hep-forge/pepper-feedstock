#! /usr/bin/bash
set -eux

mkdir -p build
cd build

cmake .. \
  ${CMAKE_ARGS} \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_BUILD_TYPE=Release \
  -DPEPPER_HepMC3_DISABLED=ON \
  -DPEPPER_LHAPDF_DISABLED=ON \
  -DPEPPER_MPI_DISABLED=ON \
  -DPEPPER_MANPAGES_DISABLED=ON \
  -DPEPPER_DOCUMENTATION_DISABLED=ON \
  -DPEPPER_ENABLE_INTEGRATION=OFF \
  -DBUILD_TESTING=OFF

NPROC=$(nproc 2>/dev/null || sysctl -n hw.ncpu)
cmake --build . --parallel "${NPROC}"
cmake --install .
