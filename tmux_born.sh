#!/bin/bash

cd $HOME
BORNDIR=$([ -f born ])
if ! test -e born
then
  sudo yum install git
  git clone https://github.com/cgund98/cluster-scripts
  cd cluster-scripts/
  ./make_born.sh $HOME
fi

cd /mnt/resource/send/
tmux new -s born -d 'sh born.sh'
