git clone http://zapad.stanford.edu/bob/hypercube.git hypercube/src
mkdir hypercube/build; cd hypercube/build
module purge
module load gcc openmpi
cmake -DCMAKE_INSTALL_PREFIX=$1/hypercube ../src
make install
rm -rf $1/hypercube/build
