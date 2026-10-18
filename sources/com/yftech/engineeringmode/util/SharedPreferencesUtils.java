package com.yftech.engineeringmode.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import android.util.Base64;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yftech.engineeringmode.BuildConfig;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: /home/user/work/dex/classes2.dex */
public class SharedPreferencesUtils {
    private static SharedPreferences.Editor editor;
    private static SharedPreferences sp;

    private static SharedPreferences getInstance(Context context) {
        if (sp == null) {
            sp = context.getSharedPreferences(AppConstants.SHARED_PREFERENCES_NAME, 0);
            editor = sp.edit();
        }
        return sp;
    }

    public static void putString(Context context, String key, String value) {
        SharedPreferences preferences = getInstance(context);
        SharedPreferences.Editor editor2 = preferences.edit();
        editor2.putString(key, value);
        editor2.commit();
    }

    public static String getString(Context context, String key) {
        SharedPreferences preferences = getInstance(context);
        return preferences.getString(key, BuildConfig.FLAVOR);
    }

    public static String getString(Context context, String key, String value) {
        SharedPreferences preferences = getInstance(context);
        return preferences.getString(key, value);
    }

    public static void putBoolean(Context context, String key, boolean value) {
        SharedPreferences sp2 = getInstance(context);
        SharedPreferences.Editor editor2 = sp2.edit();
        editor2.putBoolean(key, value);
        editor2.commit();
    }

    public static boolean getBoolean(Context context, String key, boolean defValue) {
        SharedPreferences sp2 = getInstance(context);
        return sp2.getBoolean(key, defValue);
    }

    public static void putLong(Context context, String key, long value) {
        SharedPreferences sp2 = getInstance(context);
        SharedPreferences.Editor editor2 = sp2.edit();
        editor2.putLong(key, value);
        editor2.commit();
    }

    public static long getLong(Context context, String key, long defValue) {
        SharedPreferences sp2 = getInstance(context);
        return sp2.getLong(key, defValue);
    }

    public static void putInt(Context context, String key, int value) {
        SharedPreferences sp2 = getInstance(context);
        SharedPreferences.Editor editor2 = sp2.edit();
        editor2.putInt(key, value);
        editor2.commit();
    }

    public static int getInt(Context context, String key, int defValue) {
        SharedPreferences sp2 = getInstance(context);
        return sp2.getInt(key, defValue);
    }

    public static <T extends Serializable> void putObject(Context context, String key, T obj) {
        try {
            put(context, key, obj);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static <T extends Serializable> T getObject(Context context, String key) {
        try {
            return (T) get(context, key);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public <T> void setDataList(String tag, List<T> datalist) {
        if (datalist == null || datalist.size() <= 0) {
            return;
        }
        Gson gson = new Gson();
        String strJson = gson.toJson(datalist);
        editor.clear();
        editor.putString(tag, strJson);
        editor.commit();
    }

    public <T> List<T> getDataList(String str) {
        ArrayList arrayList = new ArrayList();
        String string = sp.getString(str, null);
        if (string == null) {
            return arrayList;
        }
        return (List) new Gson().fromJson(string, new TypeToken<List<T>>() { // from class: com.yftech.engineeringmode.util.SharedPreferencesUtils.1
        }.getType());
    }

    public <K, T> void setMap(String key, Map<K, T> map) {
        if (map == null || map.isEmpty() || map.size() < 1) {
            return;
        }
        Gson gson = new Gson();
        String strJson = gson.toJson(map);
        editor.clear();
        editor.putString(key, strJson);
        editor.commit();
    }

    public <K, T> Map<K, T> getMap(String str) {
        HashMap hashMap = new HashMap();
        String string = sp.getString(str, null);
        if (string == null) {
            return hashMap;
        }
        return (Map) new Gson().fromJson(string, new TypeToken<Map<K, T>>() { // from class: com.yftech.engineeringmode.util.SharedPreferencesUtils.2
        }.getType());
    }

    private static void put(Context context, String key, Object obj) throws IOException {
        if (obj == null) {
            return;
        }
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(baos);
        oos.writeObject(obj);
        String objectStr = new String(Base64.encode(baos.toByteArray(), 0));
        baos.close();
        oos.close();
        putString(context, key, objectStr);
    }

    private static Object get(Context context, String key) throws IOException, ClassNotFoundException {
        String wordBase64 = getString(context, key);
        if (TextUtils.isEmpty(wordBase64)) {
            return null;
        }
        byte[] objBytes = Base64.decode(wordBase64.getBytes(), 0);
        ByteArrayInputStream bais = new ByteArrayInputStream(objBytes);
        ObjectInputStream ois = new ObjectInputStream(bais);
        Object obj = ois.readObject();
        bais.close();
        ois.close();
        return obj;
    }
}
