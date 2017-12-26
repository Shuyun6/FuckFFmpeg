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

    public native String getConfiguration();

}
