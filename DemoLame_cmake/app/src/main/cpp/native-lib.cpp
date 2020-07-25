#include <jni.h>
#include <string>
#include "libmp3lame/lame.h"
#include "Mp3Encoder.h"

extern "C"
JNIEXPORT jstring JNICALL
Java_com_shuyun_demolame_MainActivity_stringFromJNI(JNIEnv *env, jobject thiz) {
    return env->NewStringUTF(get_lame_version());
}

extern "C" {
    Mp3Encoder* mp3Encoder = new Mp3Encoder();
}

extern "C"
JNIEXPORT void JNICALL
Java_com_shuyun_demolame_MainActivity_init(JNIEnv *env, jobject thiz, jstring pcm_file_path,
                                           jstring map3_file_path, jint sample_rate, jint channels,
                                           jint bit_rate) {
    if (mp3Encoder) {
        char* pcm_file = (char*)env->GetStringUTFChars(pcm_file_path, 0);
        char* mp3_file = (char*)env->GetStringUTFChars(map3_file_path, 0);
        mp3Encoder->init(pcm_file, mp3_file, sample_rate, channels, bit_rate);
    }
}

extern "C"
JNIEXPORT void JNICALL
Java_com_shuyun_demolame_MainActivity_encode(JNIEnv *env, jobject thiz) {
    if (mp3Encoder) {
        mp3Encoder->encode();
    }
}

extern "C"
JNIEXPORT void JNICALL
Java_com_shuyun_demolame_MainActivity_destroy(JNIEnv *env, jobject thiz) {
    if (mp3Encoder) {
        mp3Encoder->destroy();
    }
}