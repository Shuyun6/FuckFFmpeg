## Preparation
1. System: ubuntu 20.04LTS
2. Download and configurate android-ndk-r14b (Because newer version haven't included *platforms/android-24/arch-arm/usr/include* and *gcc*. So when we compile in this way, maybe r14b is an appropriate version.)
3. Configurate gcc *sudo apt-get install build-essential*
4. Configurate yum *sudo apt-get install yum*

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
+ We can set *--enable-shared* to compile a SHARED library (but I just get the *.so.0*, *.la* for no reason, they are not the correct files. So I try to compile static library)

