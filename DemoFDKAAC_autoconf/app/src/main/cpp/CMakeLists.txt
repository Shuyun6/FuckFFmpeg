# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.4.1)

include_directories(src/main/cpp/include/fdk-aac/)

add_library(fdk-aac SHARED IMPORTED)
set_target_properties(fdk-aac PROPERTIES IMPORTED_LOCATION
        ${PROJECT_SOURCE_DIR}/../jniLibs/${ANDROID_ABI}/libfdk-aac.so)

add_library( native-lib SHARED native-lib.cpp )



find_library( log-lib log )

target_link_libraries( native-lib fdk-aac ${log-lib}
        )