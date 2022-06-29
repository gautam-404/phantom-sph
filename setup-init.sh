git clone https://github.com/danieljprice/phantom.git
cd phantom

export OMP_SCHEDULE="dynamic"
export OMP_STACKSIZE=512M
ulimit -s unlimited

make test

echo "alias phantom_writemake=/workspaces/phantom-sph/phantom/scripts/writemake.sh"  >> ~/.zshrc

cd ..
mkdir scratch
cd scratch

phantom_writemake sedov > Makefile

