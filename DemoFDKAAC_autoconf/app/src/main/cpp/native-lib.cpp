#include <jni.h>
#include <string>
#include "include/fdk-aac/aacenc_lib.h"

extern "C" JNIEXPORT jstring JNICALL
Java_com_shuyun_demofdk_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    std::string hello = "init";
    AACENCODER* aacencoder = nullptr;
    AACENC_ERROR status = aacEncOpen(&aacencoder, 0, 0);
    if (status == AACENC_OK) {
        hello = "aacEncOpen";
    }
    return env->NewStringUTF(hello.c_str());
}
