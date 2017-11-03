# builds genericIO, argument is build directory
git clone http://zapad.Stanford.EDU/bob/genericIO.git ./genericIO/
#module purge
#module load gcc openmpi
sudo yum -y install boost boost-devel
mkdir genericIO/build
cd genericIO/build
cmake -Dhypercube_DIR=$1/hypercube/lib -DCMAKE_INSTALL_PREFIX=$1/genericIO ..
make install
rm -rf $1/genericIO/build
