package com.yftech.engineeringmode.manager;

import android.content.Context;
import android.content.DialogInterface;
import android.text.TextUtils;
import android.util.Log;
import com.yftech.car.media.data.CarMediaDataManager;
import com.yftech.car.utils.PlatformProjectDescribe;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.engineeringmode.dialog.ScreenUpgradeCA1105Dialog;
import com.yftech.engineeringmode.util.Copier;
import com.yftech.engineeringmode.util.DeleteUtil;
import com.yftech.engineeringmode.util.Utils;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ScreenUpgradeCA1105Manager {
    private static final String SCREEN_UPGRADE_ATUO_FILE_PATH = "/vendor/firmware";
    private static final String SCREEN_UPGRADE_FILE_DST_PATH = "/sdcard";
    private static final String SCREEN_UPGRADE_FILE_NAME = "screen.bin";
    private static final String SCREEN_UPGRADE_NODE = "/sys/bus/i2c/devices/3-0038/fts_upgrade_bin";
    private static final String SCREEN_VERSION_NODE = "/sys/bus/i2c/devices/3-0038/fts_fw_version";
    private static final String TAG = "ScreenUpgradeCA1105Manager";
    public static final int UPGRADE_FAIL = 3;
    public static final int UPGRADE_FAIL_COPY_FAIL = 5;
    public static final int UPGRADE_FAIL_NOT_FILE = 4;
    public static final int UPGRADE_FINISH = 2;
    public static final int UPGRADE_START = 1;
    private static ScreenUpgradeCA1105Manager sScreenUpgradeCA1105Manager;
    private String mFilePath;
    private ScreenUpgradeCA1105Dialog mScreenUpgradeCA1105Dialog;
    private final List<ScreenUpgradeCA1105Listener> mScreenUpgradeCA1105Listeners = new ArrayList();

    /* loaded from: /home/user/work/dex/classes2.dex */
    public interface ScreenUpgradeCA1105Listener {
        void onScreenUpgradeCA1105State(int i);
    }

    private ScreenUpgradeCA1105Manager() {
    }

    public static synchronized ScreenUpgradeCA1105Manager getInstance() {
        ScreenUpgradeCA1105Manager screenUpgradeCA1105Manager;
        synchronized (ScreenUpgradeCA1105Manager.class) {
            if (sScreenUpgradeCA1105Manager == null) {
                sScreenUpgradeCA1105Manager = new ScreenUpgradeCA1105Manager();
            }
            screenUpgradeCA1105Manager = sScreenUpgradeCA1105Manager;
        }
        return screenUpgradeCA1105Manager;
    }

    public void addScreenUpgradeCA1105Listener(ScreenUpgradeCA1105Listener listener) {
        if (!this.mScreenUpgradeCA1105Listeners.contains(listener)) {
            this.mScreenUpgradeCA1105Listeners.add(listener);
        }
    }

    public void removeScreenUpgradeCA1105Listener(ScreenUpgradeCA1105Listener listener) {
        if (this.mScreenUpgradeCA1105Listeners.contains(listener)) {
            this.mScreenUpgradeCA1105Listeners.remove(listener);
        }
    }

    public void startUpgrade() {
        Log.d(TAG, "startUpgrade()");
        if (!checkScreenUpgradeFile()) {
            notifyOnScreenUpgradeCA1105State(4);
        } else {
            start();
        }
    }

    public void start() {
        if (!Copier.copy(new File(this.mFilePath), new File(SCREEN_UPGRADE_FILE_DST_PATH), (Copier.CopyProgressCallback) null)) {
            notifyOnScreenUpgradeCA1105State(5);
        } else {
            notifyOnScreenUpgradeCA1105State(1);
            new Thread(new Runnable() { // from class: com.yftech.engineeringmode.manager.ScreenUpgradeCA1105Manager.1
                @Override // java.lang.Runnable
                public void run() {
                    ScreenUpgradeCA1105Manager.this.writeUpgradeBin();
                }
            }).start();
        }
    }

    public boolean checkScreenUpgradeFile() {
        List<String> udiskList = CarMediaDataManager.getInstance().getExistUdiskList();
        for (String udisk : udiskList) {
            File file = new File(udisk + File.separator + SCREEN_UPGRADE_FILE_NAME);
            if (file.exists()) {
                this.mFilePath = file.getPath();
                Log.d(TAG, "checkScreenUpgradeFile() FilePath:" + this.mFilePath);
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x001b -> B:6:0x002b). Please report as a decompilation issue!!! */
    public String getCurScreenVersion() {
        String version = BuildConfig.FLAVOR;
        BufferedReader bufferedReader = null;
        try {
            try {
                try {
                    bufferedReader = new BufferedReader(new FileReader(SCREEN_VERSION_NODE));
                    version = bufferedReader.readLine();
                    bufferedReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    if (bufferedReader != null) {
                        bufferedReader.close();
                    }
                }
            } catch (IOException e2) {
                e2.printStackTrace();
            }
            return version;
        } catch (Throwable th) {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException e3) {
                    e3.printStackTrace();
                }
            }
            throw th;
        }
    }

    public String getScreenUpgradeFileVersion() {
        File file;
        String version = BuildConfig.FLAVOR;
        FileInputStream fileInputStream = null;
        try {
            try {
                try {
                    file = new File(this.mFilePath);
                } catch (IOException e) {
                    e.printStackTrace();
                    if (fileInputStream != null) {
                        fileInputStream.close();
                    }
                }
            } finally {
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                    }
                }
            }
        } catch (IOException e3) {
            e3.printStackTrace();
        }
        if (!file.exists()) {
            return BuildConfig.FLAVOR;
        }
        fileInputStream = new FileInputStream(file);
        byte[] buffer = new byte[1024];
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        while (true) {
            int len = fileInputStream.read(buffer);
            if (len == -1) {
                break;
            }
            outputStream.write(buffer, 0, len);
        }
        byte[] data = outputStream.toByteArray();
        int versionIndex = Integer.parseInt("2100", 16) + 14;
        version = String.format("%02x", Integer.valueOf(data[versionIndex] & 255));
        fileInputStream.close();
        return version;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x002d -> B:6:0x0043). Please report as a decompilation issue!!! */
    public void writeUpgradeBin() {
        Log.d(TAG, "writeUpgradeBin()");
        BufferedWriter bufferedWriter = null;
        try {
            try {
                try {
                    bufferedWriter = new BufferedWriter(new FileWriter(SCREEN_UPGRADE_NODE));
                    bufferedWriter.write(SCREEN_UPGRADE_FILE_NAME);
                    bufferedWriter.write("\n");
                    bufferedWriter.flush();
                    notifyOnScreenUpgradeCA1105State(2);
                    bufferedWriter.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    notifyOnScreenUpgradeCA1105State(3);
                    if (bufferedWriter != null) {
                        bufferedWriter.close();
                    }
                }
            } catch (Throwable th) {
                if (bufferedWriter != null) {
                    try {
                        bufferedWriter.close();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                        notifyOnScreenUpgradeCA1105State(3);
                    }
                }
                throw th;
            }
        } catch (IOException e3) {
            e3.printStackTrace();
            notifyOnScreenUpgradeCA1105State(3);
        }
    }

    private void notifyOnScreenUpgradeCA1105State(int status) {
        Log.d(TAG, "status:" + status);
        if (status != 1) {
            DeleteUtil.delete(SCREEN_UPGRADE_FILE_DST_PATH + File.separator + SCREEN_UPGRADE_FILE_NAME);
        }
        for (ScreenUpgradeCA1105Listener listener : this.mScreenUpgradeCA1105Listeners) {
            listener.onScreenUpgradeCA1105State(status);
        }
    }

    public void checkAutoScreenUpgrade(Context context) {
        if (!PlatformProjectDescribe.isCA1105Project()) {
            Log.i(TAG, "checkAutoScreenUpgrade() is not 1105, killProcess");
            Utils.killProcess();
            return;
        }
        File file = new File(SCREEN_UPGRADE_ATUO_FILE_PATH + File.separator + SCREEN_UPGRADE_FILE_NAME);
        if (!file.exists()) {
            Log.i(TAG, "checkAutoScreenUpgrade() upgrade file is not exists, killProcess");
            Utils.killProcess();
            return;
        }
        this.mFilePath = file.getPath();
        String curVersion = getCurScreenVersion();
        String fileVersion = getScreenUpgradeFileVersion();
        Log.i(TAG, "checkAutoScreenUpgrade() curVersion:" + curVersion + " fileVersion:" + fileVersion + " path:" + this.mFilePath);
        if (!TextUtils.isEmpty(curVersion) && !TextUtils.isEmpty(fileVersion) && !curVersion.equalsIgnoreCase(fileVersion)) {
            Log.i(TAG, "checkAutoScreenUpgrade() upgrade");
            this.mScreenUpgradeCA1105Dialog = new ScreenUpgradeCA1105Dialog(context, false);
            this.mScreenUpgradeCA1105Dialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.yftech.engineeringmode.manager.-$$Lambda$ScreenUpgradeCA1105Manager$FJ3RzWmZoVoTNrMtWhmrIcLbVt4
                @Override // android.content.DialogInterface.OnDismissListener
                public final void onDismiss(DialogInterface dialogInterface) {
                    ScreenUpgradeCA1105Manager.this.lambda$checkAutoScreenUpgrade$0$ScreenUpgradeCA1105Manager(dialogInterface);
                }
            });
            this.mScreenUpgradeCA1105Dialog.show();
            return;
        }
        Log.i(TAG, "checkAutoScreenUpgrade() no upgrade, killProcess");
        Utils.killProcess();
    }

    public /* synthetic */ void lambda$checkAutoScreenUpgrade$0$ScreenUpgradeCA1105Manager(DialogInterface dialog) {
        Log.i(TAG, "checkAutoScreenUpgrade() onDismiss, killProcess");
        this.mScreenUpgradeCA1105Dialog = null;
        Utils.killProcess();
    }
}
