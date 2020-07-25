# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.4.1)

include_directories(src/main/cpp/include/)

add_library(mp3lame STATIC IMPORTED)
set_target_properties(mp3lame PROPERTIES IMPORTED_LOCATION
        ## ${PROJECT_SOURCE_DIR} in this project indicate to the path of CMakeLists.txt
        ${PROJECT_SOURCE_DIR}/../jniLibs/${ANDROID_ABI}/libmp3lame.a)

add_library( native-lib SHARED native-lib.cpp )

find_library( log-lib log )

target_link_libraries( native-lib
                       mp3lame
                       ${log-lib} )