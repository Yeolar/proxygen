#!/usr/bin/env bash

## Run this script to build proxygen and run the tests. If you want to
## install proxygen to use in another C++ project on this machine, run
## the sibling file `reinstall.sh`.

# Parse args
JOBS=8
USAGE="./deps.sh [-j num_jobs]"
while [ "$1" != "" ]; do
  case $1 in
    -j | --jobs ) shift
                  JOBS=$1
                  ;;
    * )           echo $USAGE
                  exit 1
esac
shift
done

# Build proxygen
autoreconf -ivf
./configure --prefix=$PWD/../../usr/local/ LDFLAGS=-L$PWD/../../usr/local/lib CPPFLAGS=-I$PWD/../../usr/local/include
make -j$JOBS

# Install the libs
make install
