package com.yftech.engineeringmode.util;

import android.os.Process;
import android.os.SystemProperties;
import android.text.TextUtils;
import android.util.Log;
import com.yftech.car.utils.PlatformProjectDescribe;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.tbox.sdk.LogUtil;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/* loaded from: /home/user/work/dex/classes2.dex */
public class Utils {
    private static final String TAG = Utils.class.getSimpleName();

    public static byte[] hexStr2ByteArray(String hexString) {
        if (TextUtils.isEmpty(hexString)) {
            return null;
        }
        String hexString2 = hexString.toLowerCase().replaceAll("0x|,| ", BuildConfig.FLAVOR);
        byte[] byteArray = new byte[hexString2.length() / 2];
        int k = 0;
        for (int i = 0; i < byteArray.length; i++) {
            byte high = (byte) (Character.digit(hexString2.charAt(k), 16) & 255);
            byte low = (byte) (Character.digit(hexString2.charAt(k + 1), 16) & 255);
            byteArray[i] = (byte) ((high << 4) | low);
            k += 2;
        }
        return byteArray;
    }

    public static String bytesToHexString(byte[] src) {
        StringBuilder stringBuilder = new StringBuilder(BuildConfig.FLAVOR);
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 255;
            stringBuilder.append("0x");
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
            if (i != src.length - 1) {
                stringBuilder.append(",");
            }
        }
        return stringBuilder.toString();
    }

    public static String formatHHMMSS(long time) {
        SimpleDateFormat formatter = new SimpleDateFormat("HH时mm分ss秒");
        Date date = new Date(time);
        return formatter.format(date);
    }

    public static String getTime(long time) {
        long hour = ((time / 1000) / 60) / 60;
        long min = ((time / 1000) / 60) - (hour * 60);
        long second = ((time / 1000) - (min * 60)) - ((hour * 60) * 60);
        return String.format(Locale.getDefault(), "%02d:%02d:%02d", Long.valueOf(hour), Long.valueOf(min), Long.valueOf(second));
    }

    public static void killProcess() {
        Process.killProcess(Process.myPid());
    }

    public static boolean isSupportConfigSetting() {
        if (!PlatformProjectDescribe.isCBIHU12Project() && !PlatformProjectDescribe.isCBIHU23Project() && !PlatformProjectDescribe.isCBIHU12C1Project()) {
            return true;
        }
        if (!PlatformProjectDescribe.isCBIHU12C1Project()) {
            return false;
        }
        String productBrand_ext = SystemProperties.get("ro.product.brand_ext");
        Log.i(TAG, "isSupportConfigSetting() productBrand_ext:" + productBrand_ext);
        return "C5".equals(productBrand_ext) || "C2".equals(productBrand_ext);
    }

    public static boolean getScreenTpAutoBrightnessEnable() {
        return SystemProperties.getBoolean("yf.engineeringmode.screen.tp.auto.brightness", false);
    }

    public static void setScreenTpAutoBrightnessEnable(boolean enable) {
        SystemProperties.set("yf.engineeringmode.screen.tp.auto.brightness", String.valueOf(enable));
    }

    public static void setNodeString(String path, String value) {
        LogUtil.i(TAG, "setNodeString() path=" + path + " value=" + value);
        FileWriter fileWriter = null;
        try {
            try {
                try {
                    fileWriter = new FileWriter(path);
                    fileWriter.write(value);
                    fileWriter.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    LogUtil.e(TAG, "setNodeString() write fail");
                    if (fileWriter != null) {
                        fileWriter.close();
                    }
                }
            } catch (Throwable th) {
                if (fileWriter != null) {
                    try {
                        fileWriter.close();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                        LogUtil.e(TAG, "setNodeString() close fail");
                    }
                }
                throw th;
            }
        } catch (IOException e3) {
            e3.printStackTrace();
            LogUtil.e(TAG, "setNodeString() close fail");
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x001b -> B:7:0x0037). Please report as a decompilation issue!!! */
    public static String getNodeString(String path) {
        String str = "getNodeString() close fail";
        String value = BuildConfig.FLAVOR;
        BufferedReader reader = null;
        try {
            try {
                try {
                    reader = new BufferedReader(new FileReader(path));
                    value = reader.readLine();
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    LogUtil.e(TAG, "getNodeString() close fail");
                }
            } catch (IOException e2) {
                e2.printStackTrace();
                LogUtil.e(TAG, "getNodeString() read fail");
                if (reader != null) {
                    reader.close();
                }
            }
            str = TAG;
            LogUtil.i(str, "getNodeString() path=" + path + " value=" + value);
            return value;
        } catch (Throwable th) {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e3) {
                    e3.printStackTrace();
                    LogUtil.e(TAG, str);
                }
            }
            throw th;
        }
    }
}
