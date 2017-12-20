package shuyun.fuckffmpeg;

/**
 * Created by Shuyun on 2017/12/15 0015.
 */

public class Fucker {

    static{
        System.loadLibrary("FuckFFmpeg-lib");
    }

    public Fucker(){

    }

    public native String getMsg();

    public native void YUYV422TONV21(byte[] yuyv422, byte[] nv21, int width, int height);

}
