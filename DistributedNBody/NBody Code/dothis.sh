#!/bin/bash -e

export HPX_ROOT=$HOME/src/hpx/build-apex
export HPX_DIR=$HPX_ROOT/lib/cmake/HPX
export CMAKE_PREFIX_PATH=$HPX_ROOT
export LD_LIBRARY_PATH=$HPX_ROOT/lib:$LD_LIBRARY_PATH
export PATH=$HPX_ROOT/bin:$PATH

build_octree()
{
    # rm -rf build
    if [ ! -d build ] ; then
        mkdir build
    fi
    cd build
    if [ ! -f CMakeCache.txt ] ; then
        cmake ..
    fi
    make -j
    cd ..
}

run_octree()
{
    export APEX_SCREEN_OUTPUT=1
    cmd="srun -p marv_noht -N 8 ./build/Octree" 
    echo $cmd
}

build_octree
run_octree

