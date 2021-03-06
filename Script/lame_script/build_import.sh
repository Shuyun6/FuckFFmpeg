#!/bin/bash
NDK_ROOT=/home/shuyun/dev/android-ndk-r21d
TOOLCHAIN=$NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64

export CFLAGS="-fPIC -mfloat-abi=softfp -mfpu=vfp -ffast-math -O2"
export LDFLAGS=""
export CPPFLAGS="$CFLAGS"
export CFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"

export TARGET=armv7a-linux-androideabi
export TARGET2=arm-linux-androideabi
export API=24

export AS=$TOOLCHAIN/bin/$TARGET2-as
export AR=$TOOLCHAIN/bin/$TARGET2-ar
export LD=$TOOLCHAIN/bin/$TARGET2-ld
export NM=$TOOLCHAIN/bin/$TARGET2-nm
export STRIP=$TOOLCHAIN/bin/$TARGET2-strip
export RANLIB=$TOOLCHAIN/bin/$TARGET2-ranlib
export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
export CC=$TOOLCHAIN/bin/$TARGET$API-clang

./configure --host=$TARGET \
--disable-frontend \
--enable-static \
--disable-shared \
--enable-muxer=mp3 \
--enable-encoder=libmp3lame \
--enable-libmp3lame \
--extra-cflags="-Iexternal-libs/lame/include" \
--extra-ldflags="-Lexternal-libs/lame/lib" \
--prefix=/home/shuyun/dev/output

make clean
make -j8
make install
