//
// Created by Shuyun on 2017/12/15 0015.
//
#include <jni.h>
#include <string>

extern "C" {
    #include "include/libavcodec/avcodec.h"
}

extern "C"
JNIEXPORT jstring JNICALL
Java_shuyun_fuckffmpeg_Fucker_getConfiguration(JNIEnv *env, jobject instance) {

    // TODO
    return env->NewStringUTF(avcodec_configuration());
}







