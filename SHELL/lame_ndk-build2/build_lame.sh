#!/bin/bash
NDK_ROOT=/home/shuyun/dev/android-ndk-r21d
TOOLCHAIN=$NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64

export TARGET=armv7a-linux-androideabi
export API=24

#export AS=$TOOLCHAIN/bin/$TARGET-as
#export AR=$TOOLCHAIN/bin/$TARGET-ar
export LD=$TOOLCHAIN/bin/$TARGET-ld
export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
export CC=$TOOLCHAIN/bin/$TARGET$API-clang
export NM=$TOOLCHAIN/bin/$TARGET-nm
export STRIP=$TOOLCHAIN/bin/$TARGET-strip
#export RANLIB=$$TOOLCHAIN/bin/$TARGET-ranlib

./configure --host=arm-linux \
--disable-frontend \
--enable-static \
--disable-shared \
--prefix=/home/shuyun/dev/lame-3.100/armv7a

make clean
make -j8
make install
