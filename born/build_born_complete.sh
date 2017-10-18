#!/bin/bash
module load gcc openmpi
source $HOME/cluster-scripts/load_tbb.sh $(pwd)
export CXX=g++
dir=$(pwd)
sh build_hypercube.sh $dir
cd $dir
sh build_genericio.sh $dir
cd $dir
sh build_born.sh $dir

