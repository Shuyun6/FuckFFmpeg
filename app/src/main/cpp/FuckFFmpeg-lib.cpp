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
Java_shuyun_fuckffmpeg_Fucker_getMsg(JNIEnv *env, jobject instance) {

    // TODO
    char msg[1024*8] = {};
    sprintf(msg, "%s", avcodec_configuration());
    return env->NewStringUTF(msg);
}







