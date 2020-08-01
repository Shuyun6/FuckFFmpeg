#!/bin/bash
API=24
CPU=armv7-a
OUTPUT=/home/shuyun/dev/output
NDK=/home/shuyun/dev/android-ndk-r21d
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT=$TOOLCHAIN/sysroot


function build
{
  ./configure --prefix=$OUTPUT \
  --target-os=android \
  --arch=arm \
  --cpu=armv7-a \
  --enable-asm \
  --enable-neon \
  --enable-cross-compile \
  --enable-shared \
  --disable-ffmpeg \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-avdevice \
  --disable-devices \
  --disable-indevs \
  --disable-outdevs \
  --disable-debug \
  --disable-yasm \
  --disable-doc \
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
  --enable-libx264 \
  --enable-libfdk-aac \
  --prefix=$INSTALL_DIR \
  --enable-gpl \
  --enable-bsf=aac_adtstoasc \
  --enable-bsf=h264_mp4toannexb \
  --sysroot=$SYSROOT \
  --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
  --cross-prefix-clang=$TOOLCHAIN/bin/armv7a-linux-androideabi$API- \
  --extra-cflags="-fPIC -Ifdk-aac/include -Ix264/include" \
  --extra-ldflags="-Lfdk-aac/lib -Lx264/lib"

  make clean all
  make -j12
  make install
}

build

