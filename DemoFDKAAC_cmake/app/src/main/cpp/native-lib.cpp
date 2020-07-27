#include <jni.h>
#include <string>
#include <aacenc_lib.h>

extern "C" JNIEXPORT jstring JNICALL
Java_com_shuyun_demofdkaac_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    std::string ret = "init";
    HANDLE_AACENCODER hAacEncoder = NULL;
    AACENC_ERROR status = aacEncOpen(&hAacEncoder, 0, 0);
    if (status == AACENC_OK) {
        ret = "AACENC_OK";
    }
    return env->NewStringUTF(ret.c_str());
}
