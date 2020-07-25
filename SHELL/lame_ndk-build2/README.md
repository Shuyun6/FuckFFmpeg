## Preparation
1. System: ubuntu 20.04LTS
2. Download and configurate android-ndk-r21d (The latest version till 2020-07-25. For this version, we need to change this compile script cause it does not support gcc anymore since r19, install of using clang)

## Compile
Download LAME source files and copy *build.sh* into LAME's directory
then run with ```./build.sh```
then we can get dirs *include* and *lib"
Copy *include" folder into Android project in *src/main/cpp/*
Copy *.a* file in *lib" folder into Android project in *src/main/jniLibs/armeabi-v7a/*
Finally configurate the Android project.

## Others
+ We can change *armv7-a* to *armv8-a* or others to compile other API libraries
+ We can change *--prefix* parameter to a local path to store the output files
+ We can set *--enable-shared* to compile a SHARED library (Error ocurs when I try to compile shared libraries, so I just enbale static parameter)

