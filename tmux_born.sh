#!/bin/bash

cd $HOME
BORNDIR=$([ -f born ])
if ! test -e born
then
  sudo yum -y install git
  git clone https://github.com/cgund98/cluster-scripts
  cd cluster-scripts/
  ./make_born.sh $HOME
fi

cd /mnt/resource/
if ! test -e data
then
  $HOME/cluster-scripts/prepare_data.sh
fi
cd Compress/data
if ! test -e born.py
then
  cp $HOME/cluster-scripts/born/born.sh .
  cp $HOME/cluster-scripts/born/born.py .
fi
tmux new -s born -d 'sh born.sh'
