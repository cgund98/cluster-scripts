cd $HOME
BORNDIR=$([ -f born ])
if ! test -e born
then
  sudo yum install -y cmake git gcc gcc-c++ openmpi
  git clone https://github.com/cgund98/cluster-scripts
  cd cluster-scripts/
  ./make_born.sh $HOME
fi

cd $HOME/send/
sh born.sh
