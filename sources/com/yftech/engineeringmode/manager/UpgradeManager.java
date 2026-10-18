package com.yftech.engineeringmode.manager;

import android.content.Context;
import android.content.DialogInterface;
import android.os.SystemProperties;
import android.text.TextUtils;
import android.util.Log;
import com.yftech.car.media.data.CarMediaDataManager;
import com.yftech.car.upgrade.CarUpgradeManager;
import com.yftech.car.utils.PlatformProjectDescribe;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.engineeringmode.dialog.UpgradeCheckDialog;
import com.yftech.engineeringmode.dialog.UpgradeDialog;
import com.yftech.engineeringmode.util.DeleteUtil;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class UpgradeManager {
    private static UpgradeManager sUpgradeManager;
    private Context mContext;
    private String mHasUpgradeFileUdiskPath = BuildConfig.FLAVOR;
    private UpgradeCheckDialog mUpgradeCheckDialog;
    private UpgradeDialog mUpgradeDialog;
    private static final String TAG = UpgradeManager.class.getSimpleName();
    public static String MCU_UPGRADE_PATH = BuildConfig.FLAVOR;
    public static String OS_UPGRADE_PATH = BuildConfig.FLAVOR;
    public static String SCREEN_UPGRADE_PATH = BuildConfig.FLAVOR;
    public static String SCREEN_MCU_UPGRADE_PATH = BuildConfig.FLAVOR;
    public static String MCU_PATH_SUFFIX = BuildConfig.FLAVOR;
    public static String OS_PATH_SUFFIX = BuildConfig.FLAVOR;
    public static String SCREEN_PATH_SUFFIX = BuildConfig.FLAVOR;
    public static String SCREEN_MCU_PATH_SUFFIX = BuildConfig.FLAVOR;
    public static boolean isAlreadyHasUpdateFile = false;
    public static boolean isUpdating = false;

    private UpgradeManager() {
    }

    public static synchronized UpgradeManager getInstance() {
        UpgradeManager upgradeManager;
        synchronized (UpgradeManager.class) {
            if (sUpgradeManager == null) {
                sUpgradeManager = new UpgradeManager();
            }
            upgradeManager = sUpgradeManager;
        }
        return upgradeManager;
    }

    public void init(Context context) {
        Log.d(TAG, "init()");
        this.mContext = context;
    }

    public void deInit() {
        Log.d(TAG, "deInit()");
    }

    public void checkUpgradeFile(boolean isShowNoUpgradeFileDialog, String udiskPath, boolean isOnlyScreen) {
        boolean isCBIHU12;
        String osPath;
        String screenMcuPath;
        String mcuPath;
        String path;
        UpgradeManager upgradeManager = this;
        UpgradeCheckDialog upgradeCheckDialog = upgradeManager.mUpgradeCheckDialog;
        if (upgradeCheckDialog != null && upgradeCheckDialog.isShowing()) {
            return;
        }
        boolean isCBIHU122 = PlatformProjectDescribe.isCBIHU12Project();
        Log.i(TAG, "checkUpgradeFile() isShowNoUpgradeFileDialog:" + isShowNoUpgradeFileDialog + ", udiskPath:" + udiskPath + " ,isCBIHU12:" + isCBIHU122);
        boolean hasMCUUpgradeFile = false;
        boolean hasOSUpgradeFile = false;
        boolean hasScreenUpgradeFile = false;
        boolean hasScreenMcuUpgradeFile = false;
        String str = "/storage/udisk1";
        if (!TextUtils.isEmpty(udiskPath)) {
            if (isCBIHU122) {
                if (!"/storage/udisk1".equals(udiskPath)) {
                    return;
                }
                MCU_UPGRADE_PATH = "/storage/udisk1" + MCU_PATH_SUFFIX;
                OS_UPGRADE_PATH = "/storage/udisk1" + OS_PATH_SUFFIX;
                SCREEN_UPGRADE_PATH = "/storage/udisk1" + SCREEN_PATH_SUFFIX;
                SCREEN_MCU_UPGRADE_PATH = "/storage/udisk1" + SCREEN_MCU_PATH_SUFFIX;
            } else {
                MCU_UPGRADE_PATH = udiskPath + MCU_PATH_SUFFIX;
                OS_UPGRADE_PATH = udiskPath + OS_PATH_SUFFIX;
                SCREEN_UPGRADE_PATH = udiskPath + SCREEN_PATH_SUFFIX;
                SCREEN_MCU_UPGRADE_PATH = udiskPath + SCREEN_MCU_PATH_SUFFIX;
            }
            if (upgradeManager.matchMCUUpgradeFileSoc(MCU_UPGRADE_PATH)) {
                hasMCUUpgradeFile = CarUpgradeManager.getInstance().checkMCUUpgradeFile(MCU_UPGRADE_PATH);
            }
            hasOSUpgradeFile = CarUpgradeManager.getInstance().checkOSUpgradeFile(OS_UPGRADE_PATH);
            hasScreenUpgradeFile = CarUpgradeManager.getInstance().checkScreenUpgradeFile(SCREEN_UPGRADE_PATH);
            hasScreenMcuUpgradeFile = CarUpgradeManager.getInstance().checkScreenMcuUpgradeFile(SCREEN_MCU_UPGRADE_PATH);
        } else {
            List<String> udiskPaths = CarMediaDataManager.getInstance().getExistUdiskList();
            if (udiskPaths == null) {
                Log.e(TAG, "checkUpgradeFile() udiskPaths == null");
                return;
            }
            boolean hasMCUPath = false;
            boolean hasOSPath = false;
            boolean hasScreenPath = false;
            boolean hasScreenMcuPath = false;
            for (String path2 : udiskPaths) {
                boolean hasMCUUpgradeFile2 = hasMCUUpgradeFile;
                if (!isCBIHU122) {
                    isCBIHU12 = isCBIHU122;
                    String mcuPath2 = path2 + MCU_PATH_SUFFIX;
                    StringBuilder sb = new StringBuilder();
                    sb.append(path2);
                    String mcuPath3 = OS_PATH_SUFFIX;
                    sb.append(mcuPath3);
                    String osPath2 = sb.toString();
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(path2);
                    String osPath3 = SCREEN_PATH_SUFFIX;
                    sb2.append(osPath3);
                    String screenPath = sb2.toString();
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(path2);
                    String screenPath2 = SCREEN_MCU_PATH_SUFFIX;
                    sb3.append(screenPath2);
                    String sb4 = sb3.toString();
                    osPath = osPath2;
                    screenMcuPath = sb4;
                    mcuPath = mcuPath2;
                    path = screenPath;
                } else {
                    isCBIHU12 = isCBIHU122;
                    String mcuPath4 = str + MCU_PATH_SUFFIX;
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append(str);
                    String mcuPath5 = OS_PATH_SUFFIX;
                    sb5.append(mcuPath5);
                    String osPath4 = sb5.toString();
                    StringBuilder sb6 = new StringBuilder();
                    sb6.append(str);
                    String osPath5 = SCREEN_PATH_SUFFIX;
                    sb6.append(osPath5);
                    String screenPath3 = sb6.toString();
                    StringBuilder sb7 = new StringBuilder();
                    sb7.append(str);
                    String screenPath4 = SCREEN_MCU_PATH_SUFFIX;
                    sb7.append(screenPath4);
                    String sb8 = sb7.toString();
                    osPath = osPath4;
                    screenMcuPath = sb8;
                    mcuPath = mcuPath4;
                    path = screenPath3;
                }
                boolean hasMCUUpgradeFile3 = upgradeManager.matchMCUUpgradeFileSoc(mcuPath) ? CarUpgradeManager.getInstance().checkMCUUpgradeFile(mcuPath) : hasMCUUpgradeFile2;
                List<String> udiskPaths2 = udiskPaths;
                boolean hasOSUpgradeFile2 = CarUpgradeManager.getInstance().checkOSUpgradeFile(osPath);
                String str2 = str;
                boolean hasScreenUpgradeFile2 = CarUpgradeManager.getInstance().checkScreenUpgradeFile(path);
                boolean hasScreenMcuUpgradeFile2 = CarUpgradeManager.getInstance().checkScreenMcuUpgradeFile(screenMcuPath);
                Log.i(TAG, "checkUpgradeFile() mcuPath:" + mcuPath + ", hasMCUUpgradeFile:" + hasMCUUpgradeFile3 + ", hasMCUPath:" + hasMCUPath + ", osPath:" + osPath + ", hasOSUpgradeFile:" + hasOSUpgradeFile2 + ", hasOSPath:" + hasOSPath + ", screenPath:" + path + ", hasScreenUpgradeFile:" + hasScreenUpgradeFile2 + ", hasScreenPath:" + hasScreenPath + ", screenMcuPath:" + screenMcuPath + ", hanScreenMcuUpgrade:" + hasScreenMcuUpgradeFile2);
                if (hasMCUUpgradeFile3 && !hasMCUPath) {
                    MCU_UPGRADE_PATH = mcuPath;
                    hasMCUPath = true;
                }
                if (hasOSUpgradeFile2 && !hasOSPath) {
                    OS_UPGRADE_PATH = osPath;
                    hasOSPath = true;
                }
                if (hasScreenUpgradeFile2 && !hasScreenPath) {
                    SCREEN_UPGRADE_PATH = path;
                    hasScreenPath = true;
                }
                if (hasScreenMcuUpgradeFile2 && !hasScreenMcuPath) {
                    SCREEN_MCU_UPGRADE_PATH = screenMcuPath;
                    hasScreenMcuPath = true;
                }
                hasMCUUpgradeFile = hasMCUUpgradeFile3;
                hasOSUpgradeFile = hasOSUpgradeFile2;
                hasScreenUpgradeFile = hasScreenUpgradeFile2;
                udiskPaths = udiskPaths2;
                isCBIHU122 = isCBIHU12;
                str = str2;
                hasScreenMcuUpgradeFile = hasScreenMcuUpgradeFile2;
                upgradeManager = this;
            }
        }
        Log.i(TAG, "checkUpgradeFile() MCU_UPGRADE_PATH:" + MCU_UPGRADE_PATH + ", hasMCUUpgradeFile:" + hasMCUUpgradeFile + ", OS_UPGRADE_PATH:" + OS_UPGRADE_PATH + ", hasOSUpgradeFile:" + hasOSUpgradeFile + ", SCREEN_UPGRADE_PATH" + SCREEN_UPGRADE_PATH + ", hasScreenUpgradeFile:" + hasScreenUpgradeFile + ", SCREEN_MCU_UPGRADE_PATH:" + SCREEN_MCU_UPGRADE_PATH + ", hasScreenMcuFile：" + hasScreenMcuUpgradeFile);
        if (!isShowNoUpgradeFileDialog && !hasMCUUpgradeFile && !hasOSUpgradeFile && !hasScreenUpgradeFile && !hasScreenMcuUpgradeFile) {
            return;
        }
        this.mHasUpgradeFileUdiskPath = udiskPath;
        if (isOnlyScreen) {
            showCheckUpgradeFileDialog(false, false, hasScreenUpgradeFile, hasScreenMcuUpgradeFile);
        } else if (!isUpdating) {
            showCheckUpgradeFileDialog(hasMCUUpgradeFile, hasOSUpgradeFile, hasScreenUpgradeFile, hasScreenMcuUpgradeFile);
        }
    }

    public void hideCheckUpgradeFileDialog(String udiskPath) {
        UpgradeCheckDialog upgradeCheckDialog = this.mUpgradeCheckDialog;
        if (upgradeCheckDialog != null && upgradeCheckDialog.isShowing() && !TextUtils.isEmpty(udiskPath) && udiskPath.equals(this.mHasUpgradeFileUdiskPath)) {
            this.mUpgradeCheckDialog.dismiss();
            this.mUpgradeCheckDialog = null;
        }
    }

    private void showCheckUpgradeFileDialog(boolean hasMCUUpgradeFile, boolean hasOSUpgradeFile, boolean hasScreenUpgradeFile, boolean hasScreenMcuUpgradeFile) {
        UpgradeDialog upgradeDialog = this.mUpgradeDialog;
        if (upgradeDialog != null && upgradeDialog.isShowing()) {
            this.mUpgradeDialog.dismiss();
        }
        if (this.mUpgradeCheckDialog == null) {
            this.mUpgradeCheckDialog = new UpgradeCheckDialog(this.mContext);
            this.mUpgradeCheckDialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.yftech.engineeringmode.manager.UpgradeManager.1
                @Override // android.content.DialogInterface.OnDismissListener
                public void onDismiss(DialogInterface dialog) {
                    UpgradeManager.this.mUpgradeCheckDialog = null;
                }
            });
        }
        this.mUpgradeCheckDialog.show(hasMCUUpgradeFile, hasOSUpgradeFile, hasScreenUpgradeFile, hasScreenMcuUpgradeFile);
        this.mUpgradeCheckDialog.setOnUpgradeCheckDialogListener(new UpgradeCheckDialog.OnUpgradeCheckDialogListener() { // from class: com.yftech.engineeringmode.manager.UpgradeManager.2
            @Override // com.yftech.engineeringmode.dialog.UpgradeCheckDialog.OnUpgradeCheckDialogListener
            public void onUpgrade(boolean isUpgradeMCU, boolean isUpgradeOS, boolean isUpgradeScreen, boolean isUpgradeScreenMcu) {
                DeleteUtil.deleFotaData();
                UpgradeManager.this.startUpgrade(isUpgradeMCU, isUpgradeOS, isUpgradeScreen, isUpgradeScreenMcu);
            }

            @Override // com.yftech.engineeringmode.dialog.UpgradeCheckDialog.OnUpgradeCheckDialogListener
            public void onCancel() {
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startUpgrade(boolean isUpgradeMCU, boolean isUpgradeOS, boolean isUpgradeScreen, boolean isUpgradeScreenMcu) {
        if (this.mUpgradeDialog == null) {
            this.mUpgradeDialog = new UpgradeDialog(this.mContext);
            this.mUpgradeDialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.yftech.engineeringmode.manager.UpgradeManager.3
                @Override // android.content.DialogInterface.OnDismissListener
                public void onDismiss(DialogInterface dialog) {
                    UpgradeManager.this.mUpgradeDialog = null;
                }
            });
        }
        isUpdating = true;
        this.mUpgradeDialog.start(isUpgradeMCU, isUpgradeOS, isUpgradeScreen, isUpgradeScreenMcu);
    }

    private boolean matchMCUUpgradeFile(String path) {
        int match = SystemProperties.getInt("sys.engineeringmode.mcu.upgrade.match", 0);
        Log.i(TAG, "matchMCUUpgradeFile() match:" + match);
        if (match == 1) {
            return true;
        }
        File file = new File(path + File.separator + "mcuupgrade.bin");
        if (!file.exists()) {
            Log.i(TAG, "matchMCUUpgradeFile() file is not exist. path:" + file.getPath());
            return false;
        }
        String mcuVersion = SystemProperties.get("persist.version.mcu", BuildConfig.FLAVOR);
        Log.i(TAG, "matchMCUUpgradeFile() mcuVersion:" + mcuVersion);
        if (TextUtils.isEmpty(mcuVersion)) {
            return false;
        }
        String mcuUpgradeFileVersion = getMcuUpgradeFileVersion(file.getPath());
        Log.i(TAG, "matchMCUUpgradeFile() mcuUpgradeFileVersion:" + mcuUpgradeFileVersion);
        return mcuVersion.contains(mcuUpgradeFileVersion);
    }

    public String getMcuUpgradeFileVersion(String path) {
        File file;
        String version = BuildConfig.FLAVOR;
        FileInputStream fileInputStream = null;
        ByteArrayOutputStream outputStream = null;
        try {
            try {
                try {
                    file = new File(path);
                } finally {
                }
            } catch (IOException e) {
                e.printStackTrace();
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                    }
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }
        } catch (IOException e3) {
            e3.printStackTrace();
        }
        if (!file.exists()) {
            if (0 != 0) {
                try {
                    fileInputStream.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
            }
            if (0 != 0) {
                try {
                    outputStream.close();
                } catch (IOException e5) {
                    e5.printStackTrace();
                }
            }
            return BuildConfig.FLAVOR;
        }
        fileInputStream = new FileInputStream(file);
        byte[] buffer = new byte[1024];
        outputStream = new ByteArrayOutputStream();
        while (true) {
            int len = fileInputStream.read(buffer);
            if (len == -1) {
                break;
            }
            outputStream.write(buffer, 0, len);
        }
        byte[] data = outputStream.toByteArray();
        int versionIndex = Integer.parseInt("420", 16) + 6;
        Log.i(TAG, "getMcuUpgradeFileVersion() versionIndex:" + versionIndex);
        StringBuilder stringBuilder = new StringBuilder();
        while (data[versionIndex] != 0) {
            char value = (char) data[versionIndex];
            stringBuilder.append(value);
            versionIndex++;
        }
        version = stringBuilder.toString();
        try {
            fileInputStream.close();
        } catch (IOException e6) {
            e6.printStackTrace();
        }
        outputStream.close();
        return version;
    }

    private boolean matchMCUUpgradeFileSoc(String path) {
        String product = SystemProperties.get("ro.build.product");
        Log.i(TAG, "matchMCUUpgradeFileSoc: ro.build.product --> " + product);
        if (product.contains("CDC007")) {
            return true;
        }
        int match = SystemProperties.getInt("sys.engineeringmode.mcu.upgrade.match", 0);
        Log.i(TAG, "matchMCUUpgradeFileSoc() match:" + match);
        if (match == 1) {
            return true;
        }
        File file = new File(path + File.separator + "mcuupgrade.bin");
        if (!file.exists()) {
            Log.i(TAG, "matchMCUUpgradeFileSoc() file is not exist. path:" + file.getPath());
            return false;
        }
        String mcuUpgradeFileVersion = getMcuUpgradeFileVersion(file.getPath());
        String mcuVersion = getMcuVersion().trim();
        Log.i(TAG, "matchMCUUpgradeFileSoc() mcuVersion:" + mcuVersion + " mcuUpgradeFileVersion:" + mcuUpgradeFileVersion);
        if (TextUtils.isEmpty(mcuVersion) || mcuVersion.contains(mcuUpgradeFileVersion)) {
            return true;
        }
        String[] strings = mcuVersion.split("\\.");
        Log.i(TAG, "matchMCUUpgradeFileSoc: --->" + Arrays.toString(strings));
        String mcuVersionPrefix = mcuVersion;
        if (strings.length >= 3) {
            mcuVersionPrefix = strings[0] + "." + strings[1] + "." + strings[2];
            Log.i(TAG, "matchMCUUpgradeFileSoc: mcuVersionPrefix:" + mcuVersionPrefix);
        }
        if (mcuUpgradeFileVersion.contains(mcuVersionPrefix)) {
            return true;
        }
        return (mcuUpgradeFileVersion.contains("1.12.58") || mcuUpgradeFileVersion.contains("1.12.9E")) && (mcuVersion.contains("1.12.58") || mcuVersion.contains("1.12.9E"));
    }

    private String getMcuVersion() {
        return SystemProperties.get("persist.version.mcu", BuildConfig.FLAVOR);
    }

    private boolean matchSocVersionAndMcuUpgradeFileVersion(String mcuUpgradeFileVersion) {
        String socVersion = SystemProperties.get("ro.build.display.id", BuildConfig.FLAVOR);
        Log.i(TAG, "matchSocVersionAndMcuUpgradeFileVersion() socVersion:" + socVersion);
        return (socVersion.contains("A88") && mcuUpgradeFileVersion.contains("1.12.88A1")) || (socVersion.contains("A9E") && mcuUpgradeFileVersion.contains("1.12.9EB1")) || ((socVersion.contains("A58") && mcuUpgradeFileVersion.contains("1.12.58")) || ((socVersion.contains("A79") && mcuUpgradeFileVersion.contains("1.12.79C1")) || ((socVersion.contains("A79") && mcuUpgradeFileVersion.contains("1.12.79C2")) || ((socVersion.contains("A79_G") && mcuUpgradeFileVersion.contains("1.12.79C3")) || ((socVersion.contains("A79_G") && mcuUpgradeFileVersion.contains("1.12.79C4")) || (socVersion.contains("A8E") && mcuUpgradeFileVersion.contains("1.12.8EA2")))))));
    }
}
