//
// Created by shuyun on 2020/7/25 0025.
//

#ifndef DEMOLAME_MP3ENCODER_H
#define DEMOLAME_MP3ENCODER_H

#include <jni.h>
#include <string>
#include "libmp3lame/lame.h"

class Mp3Encoder {

private:
    FILE* pcmFile;
    FILE* mp3File;
    lame_t lameClient;

public:
    Mp3Encoder();
    ~Mp3Encoder();
    int init(const char *pcmFilePath, const char *mp3FilePath, int sampleRate, int channels, int bitRate);
    void encode();
    void destroy();

};

#endif //DEMOLAME_MP3ENCODER_H
