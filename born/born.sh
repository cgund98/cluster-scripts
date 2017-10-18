#!/bin/bash

cd $HOME/send/

module unload intel impi
module load gcc openmpi
export CXX=g++
source $HOME/cluster-scripts/load_tbb.sh $HOME/born
export PATH=$PATH:$HOME/born/Born/bin/

python2 born.py data.big.*.json >& output.txt
