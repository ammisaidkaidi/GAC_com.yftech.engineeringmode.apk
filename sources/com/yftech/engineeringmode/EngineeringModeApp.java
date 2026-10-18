package com.yftech.engineeringmode;

import android.app.Application;
import android.content.Context;
import android.util.Log;
import com.yftech.engineeringmode.manager.SoundVolumeManager;
import com.yftech.engineeringmode.manager.UpgradeManager;
import com.yftech.engineeringmode.util.LogManager;
import com.yftech.vehicle.sdk.CarBspManager;

/* loaded from: /home/user/work/dex/classes2.dex */
public class EngineeringModeApp extends Application {
    public static final String TAG = EngineeringModeApp.class.getSimpleName();

    @Override // android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        Log.d(TAG, "attachBaseContext");
    }

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        Log.d(TAG, "onCreate");
        UpgradeManager.getInstance().init(this);
        SoundVolumeManager.getInstance().init(this);
        LogManager.getInstance().init(this);
        requestBspInfo();
    }

    @Override // android.app.Application
    public void onTerminate() {
        super.onTerminate();
        Log.d(TAG, "onTerminate");
        UpgradeManager.getInstance().deInit();
        SoundVolumeManager.getInstance().deInit();
        LogManager.getInstance().deInit();
    }

    @Override // android.app.Application, android.content.ComponentCallbacks2
    public void onTrimMemory(int level) {
        super.onTrimMemory(level);
        Log.d(TAG, "onTrimMemory level:" + level);
    }

    private void requestBspInfo() {
        CarBspManager.get().queryBspInfoCmd((byte) 1);
        CarBspManager.get().queryBspInfoCmd((byte) 2);
        CarBspManager.get().queryBspInfoCmd((byte) 3);
        CarBspManager.get().queryBspInfoCmd((byte) 4);
        CarBspManager.get().queryBspInfoCmd((byte) 5);
        CarBspManager.get().queryBspInfoCmd((byte) 6);
        CarBspManager.get().queryBspInfoCmd((byte) 7);
        CarBspManager.get().queryBspInfoCmd((byte) 8);
        CarBspManager.get().queryBspInfoCmd((byte) 9);
        CarBspManager.get().queryBspInfoCmd((byte) 10);
    }
}
