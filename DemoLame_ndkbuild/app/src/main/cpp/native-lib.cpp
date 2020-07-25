#include <jni.h>
#include <string>
extern "C"{
#include "include/lame/lame.h"
}

extern "C" JNIEXPORT jstring JNICALL
Java_com_shuyun_demolame_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    std::string hello = "Hello from C++";
    return env->NewStringUTF(hello.c_str());
}

class Mp3Encoder {
private:
    FILE* pcmFile;
    FILE* mp3File;
    lame_t lameClient;

public:
    Mp3Encoder(){

    }
    ~Mp3Encoder(){

    }

    int init(const char *pcmFilePath, const char *mp3FilePath, int sampleRate, int channels, int bitRate){
        int ret = -1;
        pcmFile = fopen(pcmFilePath, "rb");
        if (pcmFile) {
            mp3File = fopen(mp3FilePath, "wb");
            if (mp3File) {
                lameClient = lame_init();
                lame_set_in_samplerate(lameClient, sampleRate);
                lame_set_out_samplerate(lameClient, sampleRate);
                lame_set_num_channels(lameClient, channels);
                lame_set_brate(lameClient, bitRate / 1000);
                lame_init_params(lameClient);
                ret = 0;
            }
        }
        return ret;
    }

    void encode(){
        int bufferSize = 1024 * 256;
        short *buffer = new short[bufferSize / 2];
        short *leftBuffer = new short[bufferSize / 4];
        short *rightBuffer = new short[bufferSize / 4];
        unsigned char *mp3_buffer = new unsigned char[bufferSize];
        size_t readBufferSize = 0;
        while ((readBufferSize = fread(buffer, 2, bufferSize / 2, pcmFile)) > 0) {
            for (int i = 0; i < readBufferSize; i++) {
                if (i % 2 == 0) {
                    leftBuffer[i / 2] = buffer[i];
                } else {
                    rightBuffer[i / 2] = buffer[i];
                }
            }
            size_t wroteSize = lame_encode_buffer(lameClient, leftBuffer,rightBuffer,
                                                  (int) (readBufferSize / 2), mp3_buffer,
                                                  bufferSize);
            fwrite(mp3_buffer, 1, wroteSize, mp3File);
        }
        delete[] buffer;
        delete[] leftBuffer;
        delete[] rightBuffer;
        delete[] mp3_buffer;

    }

    void destroy(){
        if (pcmFile) {
            fclose(pcmFile);
        }
        if (mp3File) {
            fclose(mp3File);
            lame_close(lameClient);
        }
    }

};

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


