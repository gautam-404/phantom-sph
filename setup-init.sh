sudo apt update
sudo apt install -y build-essential gfortran \
  libopenmpi-dev openmpi-bin \
  libgsl-dev cmake libfftw3-3 libfftw3-dev \
  libgmp3-dev libmpfr6 libmpfr-dev \
  libhdf5-serial-dev hdf5-tools \
  libblas-dev liblapack-dev splash

echo "export OMP_SCHEDULE='dynamic'" >> ~/.zshrc
echo "export OMP_STACKSIZE=512M" >> ~/.zshrc
echo "ulimit -s unlimited" >> ~/.zshrc


DIR="/workspace/phanton-sph/phantom"
if [ -d "$DIR" ]; then
  echo "Warning: '$DIR' already exists!"
else
  git clone https://github.com/danieljprice/phantom.git
  cd phantom

  export OMP_SCHEDULE="dynamic"
  export OMP_STACKSIZE=512M
  ulimit -s unlimited
  echo "export SYSTEM=gfortran"  >> ~/.zshrc

  make test

  echo "alias phantom_writemake=/workspaces/phantom-sph/phantom/scripts/writemake.sh"  >> ~/.zshrc

  cd ..
  mkdir scratch
  cd scratch

  phantom_writemake sedov > Makefile
 fi

