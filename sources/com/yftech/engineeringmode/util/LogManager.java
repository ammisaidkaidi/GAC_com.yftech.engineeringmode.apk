package com.yftech.engineeringmode.util;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemProperties;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;
import com.yftech.car.media.data.CarMediaDataManager;
import com.yftech.engineeringmode.BuildConfig;
import java.util.Iterator;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class LogManager {
    private static final String TAG = "LogManager";
    private static LogManager sLogManager;
    private Context mContext;
    private int mLogDownloadUsbIndex;
    private final Handler mMainHandler = new Handler(Looper.getMainLooper());
    private final CarMediaDataManager.OnDataChangeCallback mOnDataChangeCallback = new CarMediaDataManager.OnDataChangeCallback() { // from class: com.yftech.engineeringmode.util.LogManager.1
        public void onUsbStatusChange(int usbIndex, boolean isUsbExists) {
            super.onUsbStatusChange(usbIndex, isUsbExists);
            Log.i(LogManager.TAG, "onUsbStatusChange() isUsbExists:" + isUsbExists + " usbIndex:" + usbIndex + " logDownloadUsbIndex:" + LogManager.this.mLogDownloadUsbIndex);
            if (!isUsbExists && LogManager.this.mLogDownloadUsbIndex == usbIndex) {
                LogManager.this.mLogDownloadUsbIndex = -1;
            }
        }
    };
    private Toast mToast;

    private LogManager() {
    }

    public static synchronized LogManager getInstance() {
        LogManager logManager;
        synchronized (LogManager.class) {
            if (sLogManager == null) {
                sLogManager = new LogManager();
            }
            logManager = sLogManager;
        }
        return logManager;
    }

    public void init(Context context) {
        Log.d(TAG, "init()");
        this.mContext = context;
        CarMediaDataManager.getInstance().registerCarDataControlCallback(this.mOnDataChangeCallback, this.mMainHandler);
    }

    public void deInit() {
        Log.d(TAG, "deInit()");
        CarMediaDataManager.getInstance().unregisterCarDataControlCallback(this.mOnDataChangeCallback);
    }

    public void startLog() {
        String yflogstatus = SystemProperties.get("init.svc.yflog");
        Log.i(TAG, "startLog() yflogstatus:" + yflogstatus);
        if ("running".equals(yflogstatus)) {
            showToast("正在取日志，请稍等");
            return;
        }
        this.mLogDownloadUsbIndex = -1;
        List<String> udiskPaths = CarMediaDataManager.getInstance().getExistUdiskList();
        String path = BuildConfig.FLAVOR;
        Iterator<String> it = udiskPaths.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            String udiskPath = it.next();
            Log.i(TAG, "startLog() udiskPath:" + udiskPath);
            if (udiskPath.startsWith("/storage/udisk")) {
                path = udiskPath;
                break;
            }
        }
        if (TextUtils.isEmpty(path)) {
            Log.i(TAG, "startLog() no usb");
            showToast("取日志，请先接入U盘");
            return;
        }
        this.mLogDownloadUsbIndex = CarMediaDataManager.getInstance().getUsbIndex(path);
        Log.i(TAG, "startLog() path:" + path + " logDownloadUsbIndex:" + this.mLogDownloadUsbIndex);
        SystemProperties.set("yf.log.capture.save.path", path);
        SystemProperties.set("ctl.start", "yflog");
    }

    private void showToast(String text) {
        Toast toast = this.mToast;
        if (toast != null) {
            toast.cancel();
        }
        this.mToast = Toast.makeText(this.mContext, text, 1);
        this.mToast.show();
    }
}
