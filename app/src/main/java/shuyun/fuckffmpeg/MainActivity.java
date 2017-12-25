package shuyun.fuckffmpeg;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    static{
        System.loadLibrary("FuckFFmpeg-lib");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Example of a call to a native method
        TextView tv = (TextView) findViewById(R.id.sample_text);
        try{

            tv.setText(new Fucker().getMsg());
        }catch(Exception e){
            Log.e("test", e.getMessage());
        }
    }

}
