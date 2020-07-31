#!/bin/bash
set -x
API=24
CPU=armv7-a
OUTPUT=home/shuyun/dev/output/$CPU
NDK=/home/shuyun/dev/android-ndk-r21d
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT=$TOOLCHAIN/sysroot
CONFIGURE_FLAGS=--enable-shared \
  --disable-static \
  --disable-stripping \
  --disable-ffmpeg \
  --disable-ffplay \
  --disable-ffserver \
  --disable-ffprobe \
  --disable-avdevice \
  --disable-devices \
  --disable-indevs \
  --disable-outdevs \
  --disable-debug \
  --disable-yasm \
  --disable-doc \
  --enable-asm \
  --enable-neon \
  --enable-small \
  --enable-dct \
  --enable-dwt \
  --enable-lsp \
  --enable-mdct \
  --enable-rdft \
  --enable-fft \
  --enable-version3 \
  --enable-small \
  --enable-nonfree \
  --disable-filters \
  --disable-postproc \
  --disable-bsfs \
  --enable-bsf=aac_adtstoasc \
  --enable-bsf=h264_mp4toannexb \
  --disable-encoders \
  --enable-encoder=pcm_s161e \
  --enable-encoder=aac \
  --enable-encoder=libvo_aacenc \
  --disable-decoders \
  --enable-decoder=aac \
  --enable-decoder=mp3 \
  --enable-decoder=pcm-s161e \
  --disable-parsers \
  --enable-parser=aac \
  --disable-muxers \
  --enable-muxer=flv \
  --enable-muxer=wav \
  --enable-muxer=adts \
  --disable-demuxers \
  --enable-demuxer=flv \
  --enable-demuxer=wav \
  --enable-demuxer=aac \
  --disable-protocols \
  --enable-protocol=rtmp \
  --enable-protocol=file \
  --enable-libfdk_aac \
  --enable-libx264 \
  --enable-cross-compile \
  --prefix=$INSTALL_DIR

function build
{
  ./configure \
  $CONFIGURE_FLAGS \
  --prefix=$OUTPUT \
  --target-os=android \
  --arch=arm \
  --cpu=armv7-a \
  
  #add x264
  --enable-muxer=h264 \
  --enable-encoder=libx264 \
  --enbale-libx264 \
  --extra-cflags="-Iexternal-libs/x264/include" \
  --extra-ldflags="-Iexternal-libs/x264/lib" \
  
  #add lame
  --enable-muxer=mp3 \
  --enable-encoder=libmp3lame \
  --enbale-libx264 \
  --extra-cflags="-Iexternal-libs/lame/include" \
  --extra-ldflags="-Iexternal-libs/lame/lib" \
  
  #add fdk-aac
  --enable-encoder=libfdk_aac \
  --enbale-libfdk_aac \
  --extra-cflags="-Iexternal-libs/fdk-aac/include" \
  --extra-ldflags="-Iexternal-libs/fdk-aac/lib" \
  
  #addition
  --enable-bsf=aac_adtstoasc \
  --enable-bsf=h264_mp4toannexb \
  

  
  
  --sysroot=$SYSROOT \
  --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
  --cross-prefix-clang=$TOOLCHAIN/bin/armv7a-linux-androideabi$API- \
  --extra-cflags="-fPIC -Ifdk_aac/include -Ix264 /include"\
  --extra-ldflags="-Ifdk_aac/lib -Ix264 /lib"

  make clean all
  make -j12
  make install
}

build

