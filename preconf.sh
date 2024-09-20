PREFIX=$1

libtoolize --force --copy --automake
aclocal
autoheader
automake --foreign --copy --add-missing
autoconf
mkdir -p build/autotools
cd build/autotools
echo "Install path set to $PREFIX"
../../configure --prefix=$PREFIX
cd ../..
