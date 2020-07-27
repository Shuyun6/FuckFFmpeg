# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.4.1)

add_library( mp3lame
        SHARED
        libmp3lame/bitstream.c
        libmp3lame/encoder.c
        libmp3lame/fft.c
        libmp3lame/gain_analysis.c
        libmp3lame/id3tag.c
        libmp3lame/lame.c
        libmp3lame/mpglib_interface.c
        libmp3lame/newmdct.c
        libmp3lame/presets.c
        libmp3lame/psymodel.c
        libmp3lame/quantize.c
        libmp3lame/quantize_pvt.c
        libmp3lame/reservoir.c
        libmp3lame/set_get.c
        libmp3lame/tables.c
        libmp3lame/takehiro.c
        libmp3lame/util.c
        libmp3lame/vbrquantize.c
        libmp3lame/VbrTag.c
        libmp3lame/version.c)

add_library( native-lib
        SHARED
        native-lib.cpp
        Mp3Encoder.cpp)

find_library( log-lib log )

target_link_libraries( native-lib
        ${log-lib}
        mp3lame
        )