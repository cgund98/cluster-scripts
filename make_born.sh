#!/bin/bash

if [ $# -q 0]
  then
    cp -R born $HOME/
    cp -R tbb $HOME/born/
    cd $HOME/born/
  else
    cp -R born $1/
    cp -R tbb $1/born/
    cd $1/born/
fi
sh build_born_complete.sh
sh get_data.sh ..
