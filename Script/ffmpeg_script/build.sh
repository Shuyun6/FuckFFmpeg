#!/bin/bash
set -x
API=24
CPU=armv7-a
OUTPUT=home/shuyun/dev/output/$CPU
NDK=/home/shuyun/dev/android-ndk-r21d
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT=$TOOLCHAIN/sysroot

function build
{
  ./configure \
  --prefix=$OUTPUT \
  --target-os=android \
  --arch=arm \
  --cpu=armv7-a \
  --enable-asm \
  --enable-neon \
  --enable-cross-compile \
  --enable-shared \
  --disable-static \
  --disable-doc \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-symver \
  --disable-ffmpeg \
  --sysroot=$SYSROOT \
  --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
  --cross-prefix-clang=$TOOLCHAIN/bin/armv7a-linux-androideabi$API- \
  --extra-cflags="-fPIC"

  make clean all
  make -j12
  make install
}

build

