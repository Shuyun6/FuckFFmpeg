#!/bin/bash
NDK_ROOT=/home/shuyun/dev/android-ndk-r21d
TOOLCHAIN=$NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64
PLATFORM=$NDK/platforms/android-24/arch-arm/

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

./configure \
--prefix=/home/shuyun/dev/output \
--host=$TARGET \
--enable-static \
--disable-shared \
--enable-pic \
--enable-strip \
--disable-cli \
--disable-asm \
--extra-cflag="-O2 -mfloat-abi=softfp -mfpu=neon"
--cross-prefix=$TOOLCHAIN/bin/$TARGET2- \
--sysroot=$PLATFORM

make clean
make -j8
make install
