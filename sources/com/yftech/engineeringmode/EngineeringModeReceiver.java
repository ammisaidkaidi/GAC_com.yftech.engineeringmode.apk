package com.yftech.engineeringmode;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import com.yftech.engineeringmode.manager.UpgradeManager;

/* loaded from: /home/user/work/dex/classes2.dex */
public class EngineeringModeReceiver extends BroadcastReceiver {
    private static final String ALL_UDISK = "/storage/udisk";
    private static final String TAG = EngineeringModeReceiver.class.getSimpleName();

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (action != null && !"android.os.storage.action.VOLUME_STATE_CHANGED".equals(action)) {
            if ("android.intent.action.MEDIA_MOUNTED".equals(action)) {
                Uri uri = intent.getData();
                if (uri == null) {
                    Log.e(TAG, "onReceive: uri == null");
                    return;
                }
                String path = uri.getPath();
                Log.i(TAG, "onReceive: path:" + path);
                if (!TextUtils.isEmpty(path) && path.startsWith(ALL_UDISK)) {
                    UpgradeManager.getInstance().checkUpgradeFile(false, path, false);
                    return;
                }
                return;
            }
            if ("android.intent.action.MEDIA_EJECT".equals(action) || "android.intent.action.MEDIA_REMOVED".equals(action) || "android.intent.action.MEDIA_BAD_REMOVAL".equals(action)) {
                Log.i(TAG, "action:" + action);
                String path2 = BuildConfig.FLAVOR;
                Uri uri2 = intent.getData();
                if (uri2 != null) {
                    path2 = uri2.getPath();
                }
                Log.i(TAG, "onReceive: path:" + path2);
                UpgradeManager.getInstance().hideCheckUpgradeFileDialog(path2);
            }
        }
    }
}
