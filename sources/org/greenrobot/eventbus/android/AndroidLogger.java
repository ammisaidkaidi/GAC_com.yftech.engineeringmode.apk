package org.greenrobot.eventbus.android;

import android.util.Log;
import java.util.logging.Level;
import org.greenrobot.eventbus.Logger;

/* loaded from: /home/user/work/dex/classes.dex */
public class AndroidLogger implements Logger {
    private static final boolean ANDROID_LOG_AVAILABLE;
    private final String tag;

    static {
        boolean android2 = false;
        try {
            android2 = Class.forName("android.util.Log") != null;
        } catch (ClassNotFoundException e) {
        }
        ANDROID_LOG_AVAILABLE = android2;
    }

    public static boolean isAndroidLogAvailable() {
        return ANDROID_LOG_AVAILABLE;
    }

    public AndroidLogger(String tag) {
        this.tag = tag;
    }

    @Override // org.greenrobot.eventbus.Logger
    public void log(Level level, String msg) {
        if (level != Level.OFF) {
            Log.println(mapLevel(level), this.tag, msg);
        }
    }

    @Override // org.greenrobot.eventbus.Logger
    public void log(Level level, String msg, Throwable th) {
        if (level != Level.OFF) {
            Log.println(mapLevel(level), this.tag, msg + "\n" + Log.getStackTraceString(th));
        }
    }

    private int mapLevel(Level level) {
        int value = level.intValue();
        if (value < 800) {
            if (value < 500) {
                return 2;
            }
            return 3;
        }
        if (value < 900) {
            return 4;
        }
        if (value < 1000) {
            return 5;
        }
        return 6;
    }
}
