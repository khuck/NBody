#!/bin/bash -e

rm -rf build
mkdir build
cd build

export HPX_ROOT=$HOME/src/hpx/build-apex
export HPX_DIR=$HPX_ROOT/lib/cmake/HPX
export CMAKE_PREFIX_PATH=$HPX_ROOT
export LD_LIBRARY_PATH=$HPX_ROOT/lib:$LD_LIBRARY_PATH
export PATH=$HPX_ROOT/bin:$PATH

cmake ..
make -j
