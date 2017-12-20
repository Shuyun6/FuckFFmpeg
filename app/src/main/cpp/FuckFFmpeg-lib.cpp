//
// Created by Shuyun on 2017/12/15 0015.
//
#include <jni.h>
#include <string>
#include <libswscale/swscale.h>

extern "C" {
#include <libavcodec/avcodec.h>
}

extern "C"
JNIEXPORT jstring JNICALL
Java_shuyun_fuckffmpeg_Fucker_getMsg(JNIEnv *env, jobject instance) {

    // TODO
    char msg[1024] = {};
    sprintf(msg, "%s", avcodec_configuration());

    return env->NewStringUTF(msg);
}

extern "C"
JNIEXPORT void JNICALL
/**
 * Transform video format yuyv422 to nv21
 * @param env
 * @param instance
 * @param yuyv422_
 * @param nv21_
 * @param width
 * @param height
 */
Java_shuyun_fuckffmpeg_Fucker_YUYV422TONV21(JNIEnv *env, jobject instance, jbyteArray yuyv422_,
                                            jbyteArray nv21_, jint width, jint height) {
    jbyte *yuyv422 = env->GetByteArrayElements(yuyv422_, NULL);
    jbyte *nv21 = env->GetByteArrayElements(nv21_, NULL);

    // TODO
    AVFrame *rpic = av_frame_alloc();
    AVFrame *ypic = av_frame_alloc();
    struct SwsContext *swsContext = NULL;
    avpicture_fill((AVPicture *) rpic, (const uint8_t *) nv21, AV_PIX_FMT_NV21, width, height);
    avpicture_fill((AVPicture *) ypic, (const uint8_t *) yuyv422, AV_PIX_FMT_YUYV422, width, height);
    swsContext = sws_getContext(width, height, AV_PIX_FMT_YUYV422, width, height, AV_PIX_FMT_NV21,
                                SWS_BICUBIC, NULL, NULL, NULL);
    sws_scale(swsContext, (const uint8_t *const *) ypic->data, ypic->linesize, 0, height,
              rpic->data, rpic->linesize);
    sws_freeContext(swsContext);
    av_free(rpic);
    av_free(ypic);

    env->ReleaseByteArrayElements(yuyv422_, yuyv422, 0);
    env->ReleaseByteArrayElements(nv21_, nv21, 0);
}






