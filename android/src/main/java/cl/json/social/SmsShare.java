package cl.json.social;

import android.content.ActivityNotFoundException;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableMap;
import android.net.Uri;
import android.content.Intent;
import android.provider.Telephony;
import android.content.Context;
/**
 * Created by disenodosbbcl on 23-07-16.
 */
public class SmsShare extends ShareIntent {
    public SmsShare(ReactApplicationContext reactContext) {
        super(reactContext);
        this.setIntent(new Intent(android.content.Intent.ACTION_VIEW));
        this.getIntent().setData(Uri.parse("sms:"));
        this.getIntent().setType("vnd.android-dir/mms-sms");
    }

    @Override
    public void open(ReadableMap options) throws ActivityNotFoundException {
        super.open(options);
        //  extra params here
        this.openIntentChooser();
    }

    @Override
    protected String getPackage() {
        return null;
    }

    @Override
    protected String getDefaultWebLink() {
        return null;
    }

    @Override
    protected String getPlayStoreLink() {
        return null;
    }
}
