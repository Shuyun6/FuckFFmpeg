#include <jni.h>
#include <string>
#include "libmp3lame/lame.h"

extern "C" JNIEXPORT jstring JNICALL
Java_com_shuyun_demolame_1cmake_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    return env->NewStringUTF(get_lame_version());
}
