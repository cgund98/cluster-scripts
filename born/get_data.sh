#!/bin/bash
if [ $# -q 0]
  then
    wget https://storage.googleapis.com/sc17-data/send.tgz
    tar -xf send.tgz
    cp $HOME/cluster-scripts/born/born.py send/
    cp $HOME/cluster-scripts/born/born.sh send/
  else
    cd $1
    wget https://storage.googleapis.com/sc17-data/send.tgz
    tar -xf send.tgz
    cp $HOME/cluster-scripts/born/born.py send/
    cp $HOME/cluster-scripts/born/born.sh send/
fi

