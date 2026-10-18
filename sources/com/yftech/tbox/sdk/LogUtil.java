package com.yftech.tbox.sdk;

import android.util.Log;

/* loaded from: /home/user/work/dex/classes.dex */
public class LogUtil {
    public static final String TAG = "TBoxSDK";

    public static void i(String tag, String content) {
        Log.i("TBoxSDK_" + tag, content);
    }

    public static void d(String tag, String content) {
        Log.d("TBoxSDK_" + tag, content);
    }

    public static void w(String tag, String content) {
        Log.w("TBoxSDK_" + tag, content);
    }

    public static void e(String tag, String content) {
        Log.e("TBoxSDK_" + tag, content);
    }

    public static void v(String tag, String content) {
        Log.v("TBoxSDK_" + tag, content);
    }
}
