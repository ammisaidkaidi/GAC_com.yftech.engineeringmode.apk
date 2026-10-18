package com.yftech.engineeringmode.manager;

import android.content.Context;
import android.util.Log;
import com.yftech.engineeringmode.util.Utils;
import com.yftech.vehicle.sdk.CarConfig;
import com.yftech.vehicle.sdk.HostConfig;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ConfigManager {
    private static final String CURRENT_CONFIG_NAME = "读取值_0101";
    private static final String CURRENT_CONFIG_NAME_0100 = "读取值_0100";
    private static final String TAG = ConfigManager.class.getSimpleName();
    private static ConfigManager mConfigManager;
    private Context mContext;
    private final Map<String, byte[]> mConfigs = new HashMap();
    private final List<String> mNames = new ArrayList();

    public Map<String, byte[]> getConfigs() {
        return this.mConfigs;
    }

    public List<String> getNames() {
        return this.mNames;
    }

    private ConfigManager() {
    }

    public static synchronized ConfigManager getInstance() {
        ConfigManager configManager;
        synchronized (ConfigManager.class) {
            if (mConfigManager == null) {
                mConfigManager = new ConfigManager();
            }
            configManager = mConfigManager;
        }
        return configManager;
    }

    public void init(Context context) {
        this.mContext = context;
        loadConfigs();
    }

    public void setConfig0101(byte[] data) {
        setConfigData(data);
    }

    public void setConfig0100(byte[] data) {
        setConfigData0100(data);
    }

    public void setConfig0101(String type) {
        if (type == null) {
            return;
        }
        byte[] data = this.mConfigs.get(type.toUpperCase());
        if (type.contains("0100")) {
            setConfigData0100(data);
        } else {
            setConfigData(data);
        }
    }

    public void setConfig(String did, String indexes, String values) {
        if (did.equals("0101")) {
            setConfig0101(indexes, values);
        } else if (did.equals("0100")) {
            setConfig0100(indexes, values);
        }
    }

    public void setConfig0101(String indexes, String values) {
        if (indexes == null || values == null) {
            Log.i(TAG, "index or value is null");
            return;
        }
        String[] index = indexes.split(",|，");
        String[] value = values.split(",|，");
        byte[] data = getConfigData();
        Log.i(TAG, "index:" + Arrays.toString(index) + " value:" + Arrays.toString(value));
        for (int i = 0; i < index.length; i++) {
            data[Integer.parseInt(index[i])] = (byte) Integer.parseInt(value[i], 16);
        }
        setConfigData(data);
    }

    public void setConfig0100(String indexes, String values) {
        if (indexes == null || values == null) {
            Log.i(TAG, "index or value is null");
            return;
        }
        String[] index = indexes.split(",|，");
        String[] value = values.split(",|，");
        byte[] data = getConfigData0100();
        Log.i(TAG, "index:" + Arrays.toString(index) + " value:" + Arrays.toString(value));
        for (int i = 0; i < index.length; i++) {
            data[Integer.parseInt(index[i])] = (byte) Integer.parseInt(value[i], 16);
        }
        setConfigData0100(data);
    }

    private byte[] getConfigData() {
        try {
            Method method = CarConfig.class.getDeclaredMethod("getConfigData", new Class[0]);
            method.setAccessible(true);
            return (byte[]) method.invoke(null, new Object[0]);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private void setConfigData(byte[] data) {
        try {
            Method method = CarConfig.class.getDeclaredMethod("setConfigData", byte[].class);
            method.setAccessible(true);
            method.invoke(null, data);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private byte[] getConfigData0100() {
        return HostConfig.getConfigData();
    }

    private void setConfigData0100(byte[] data) {
        boolean result = HostConfig.setConfigData(data);
        Log.i(TAG, "setConfigData0100() data-->" + Arrays.toString(data) + " result:" + result);
    }

    public void setBitValue(String did, int bytePos, int bitPos, int bitValue) {
        byte data;
        byte data2;
        if (bitPos > 7 || bitPos < 0) {
            Log.e(TAG, "setBitValue() bitPos is not 0~7");
            return;
        }
        if (bitValue != 0 && bitValue != 1) {
            Log.e(TAG, "setBitValue() bitValue is not 0/1");
            return;
        }
        if ("0100".equals(did)) {
            byte[] bytes = getConfigData0100();
            byte data3 = bytes[bytePos];
            Log.i(TAG, "setBitValue() 旧的data: " + Utils.bytesToHexString(bytes));
            int mask = 1 << bitPos;
            if (bitValue == 0) {
                data2 = (byte) (data3 & (~mask));
            } else {
                data2 = (byte) (data3 | mask);
            }
            bytes[bytePos] = data2;
            Log.i(TAG, "setBitValue() 新的data: " + Utils.bytesToHexString(bytes));
            setConfig0100(bytes);
            return;
        }
        if ("0101".equals(did)) {
            byte[] bytes2 = getConfigData();
            if (bytes2 == null || bytes2.length == 0) {
                Log.e(TAG, "setBitValue() bytes length == 0 or null");
                return;
            }
            byte data4 = bytes2[bytePos];
            Log.i(TAG, "setBitValue() 旧的data: " + Utils.bytesToHexString(bytes2));
            int mask2 = 1 << bitPos;
            if (bitValue == 0) {
                data = (byte) (data4 & (~mask2));
            } else {
                data = (byte) (data4 | mask2);
            }
            bytes2[bytePos] = data;
            Log.i(TAG, "setBitValue() 新的data: " + Utils.bytesToHexString(bytes2));
            setConfig0101(bytes2);
        }
    }

    private void loadConfigs() {
        this.mNames.clear();
        this.mConfigs.clear();
        byte[] curConfigData = getConfigData();
        byte[] curConfigData0100 = getConfigData0100();
        Log.i(TAG, "loadConfigs: 0100-->" + Arrays.toString(curConfigData0100));
        System.out.println(curConfigData.length);
        if (curConfigData != null) {
            this.mNames.add(CURRENT_CONFIG_NAME);
            this.mConfigs.put(CURRENT_CONFIG_NAME, curConfigData);
        }
        if (curConfigData0100 != null) {
            this.mNames.add(CURRENT_CONFIG_NAME_0100);
            this.mConfigs.put(CURRENT_CONFIG_NAME_0100, curConfigData0100);
        }
        try {
            InputStream open = this.mContext.getAssets().open("car_config.json");
            StringBuilder stringBuilder = new StringBuilder();
            InputStreamReader inputStreamReader = new InputStreamReader(open);
            BufferedReader reader = new BufferedReader(inputStreamReader);
            while (true) {
                String line = reader.readLine();
                if (line == null) {
                    break;
                } else {
                    stringBuilder.append(line);
                }
            }
            reader.close();
            inputStreamReader.close();
            open.close();
            JSONArray jsonArray = new JSONArray(stringBuilder.toString());
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject = (JSONObject) jsonArray.get(i);
                String name = jsonObject.getString("name");
                String value = jsonObject.getString("value");
                this.mNames.add(name);
                this.mConfigs.put(name, Utils.hexStr2ByteArray(value));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
