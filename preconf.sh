libtoolize --force --copy --automake
aclocal
autoheader
automake --foreign --copy --add-missing
autoconf
CFLAGS="-O2 -Wall -W -Wunused-const-variable=0 -pipe -g" ./configure --disable-aload
