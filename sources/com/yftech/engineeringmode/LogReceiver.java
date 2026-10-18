package com.yftech.engineeringmode;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.yftech.engineeringmode.util.LogManager;

/* loaded from: /home/user/work/dex/classes2.dex */
public class LogReceiver extends BroadcastReceiver {
    private static final String TAG = "LogReceiver";

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        Log.i(TAG, "action:" + action);
        if ("com.yftech.intent.action.engineeringmode.log".equals(action)) {
            LogManager.getInstance().startLog();
        }
    }
}
