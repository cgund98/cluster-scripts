#!/bin/bash
git clone http://zapad.Stanford.EDU/SEP-external/Born.git ./Born/src
mkdir Born/build; cd Born/build
#module purge; module load gcc openmpi
#TBBPATH=$(( module show intel ) |& grep TBBROOT | tr -d '"')
#TBBPATH=($TBBPATH)
#TBBPATH=${TBBPATH[2]}
#echo $TBBPATH/bin/tbbvars.sh
export CXX=g++
TBBPATH=$1/tbb
source $TBBPATH"/bin/tbbvars.sh" intel64 linux auto_tbbroot
#ls $TBBPATH/bin/tbbvars.sh
cmake -DLIBTBB=$TBBROOT -DCMAKE_CXX_FLAGS=-ltbb -Dhypercube_DIR=$1/hypercube/lib -DgenericIO_DIR=$1/genericIO/lib -DCMAKE_INSTALL_PREFIX=$1/Born ../src
#cmake -DLIBTBB=/usr/lib64/libtbb.so.2 -DCMAKE_CXX_FLAGS=-ltbb -Dhypercube_DIR=$1/hypercube/lib -DgenericIO_DIR=$1/genericIO/lib -DCMAKE_INSTALL_PREFIX=$1/Born ../src
make
make install
