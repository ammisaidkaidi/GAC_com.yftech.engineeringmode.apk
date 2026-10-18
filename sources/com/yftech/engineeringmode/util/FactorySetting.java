package com.yftech.engineeringmode.util;

import android.content.Context;
import android.os.RecoverySystem;
import android.os.SystemClock;
import android.util.Log;
import com.yftech.vehicle.sdk.CarMiscManager;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Locale;

/* loaded from: /home/user/work/dex/classes2.dex */
public class FactorySetting {
    private static final long EARLIEST_SUPPORTED_TIME = 1420041600000L;
    private static final String TAG = FactorySetting.class.getSimpleName();
    private static File RECOVERY_DIR = new File("/data/cache/recovery");
    private static File COMMAND_FILE = new File(RECOVERY_DIR, "command");
    private static File LOG_FILE = new File(RECOVERY_DIR, "log");

    public void factoryReset(Context context) {
        boolean result = CarMiscManager.get().setFactoryModeReSetFactorySettingNotify();
        Log.i(TAG, "setFactoryModReSetFactorySettingNotify() result: " + result);
        clearOsData(context);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r0v2, types: [com.yftech.engineeringmode.util.FactorySetting$1, java.lang.Thread] */
    private void clearOsData(final Context context) {
        String str = "Can't close command";
        Log.i(TAG, "clearOsData() resetTime");
        SystemClock.setCurrentTimeMillis(EARLIEST_SUPPORTED_TIME);
        StringBuilder args = new StringBuilder("--locale=");
        args.append(Locale.getDefault().toString());
        args.append("\n--wipe_data");
        RECOVERY_DIR.mkdirs();
        COMMAND_FILE.delete();
        LOG_FILE.delete();
        deleteSystemFile();
        FileWriter command = null;
        try {
            try {
                try {
                    command = new FileWriter(COMMAND_FILE);
                    command.write(args.toString());
                    command.write("\n");
                    Log.e(TAG, "clearOsData:  args==" + ((Object) args));
                    command.close();
                } catch (Throwable th) {
                    if (command != null) {
                        try {
                            command.close();
                        } catch (Exception e) {
                            Log.d(TAG, str);
                        }
                    }
                    throw th;
                }
            } catch (IOException e2) {
                Log.d(TAG, "Can't write command file");
                if (command != null) {
                    command.close();
                }
            }
        } catch (Exception e3) {
            Log.d(TAG, "Can't close command");
        }
        str = new Thread("Reboot") { // from class: com.yftech.engineeringmode.util.FactorySetting.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                try {
                    RecoverySystem.rebootWipeUserData(context);
                    Log.d(FactorySetting.TAG, "Still running after master clear?!");
                } catch (Exception e4) {
                    Log.d(FactorySetting.TAG, "Can't perform master clear/factory reset");
                    e4.printStackTrace();
                }
            }
        };
        str.start();
    }

    private void deleteSystemFile() {
        boolean result = DeleteUtil.delete("/sdcard/atclog");
        Log.i(TAG, "deleteSystemFile atclog result:" + result);
    }
}
