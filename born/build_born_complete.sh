#!/bin/bash
dir=$(pwd)
sh build_hypercube.sh $dir
cd $dir
sh build_genericio.sh $dir
cd $dir
sh build_born.sh $dir

