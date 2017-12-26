package shuyun.fuckffmpeg;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    static{
        System.loadLibrary("FuckFFmpeg-lib");
    }

    private Fucker fucker;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        fucker = new Fucker();

        TextView tv = (TextView) findViewById(R.id.sample_text);
        tv.setText(fucker.getConfiguration());

    }

}
