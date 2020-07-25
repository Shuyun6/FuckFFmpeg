package com.shuyun.demolame;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    static {
        System.loadLibrary("native-lib");
    }

    private String pcmFilePath = "sdcard/testcase.wav";
    private String mp3FilePath = "sdcard/testmp3.mp3";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView tv = findViewById(R.id.sample_text);
        tv.setText(stringFromJNI());
        tv.setOnClickListener(view ->{
            new Thread(){
                @Override
                public void run() {
                    super.run();
                    init(pcmFilePath, mp3FilePath, 44100, 2, 320*1000);
                    encode();
                    MainActivity.this.destroy();
                }
            }.start();
            Toast.makeText(getBaseContext(), "encode", Toast.LENGTH_SHORT).show();
        });
    }

    public native String stringFromJNI();

    public native void init(String pcmFilePath, String map3FilePath, int sampleRate, int channels, int bitRate);
    public native void encode();
    public native void destroy();
}
