package com.yftech.engineeringmode.model;

import android.util.Log;
import com.autochips.metazone.index.MetazoneIndex;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/* loaded from: /home/user/work/dex/classes2.dex */
public class Metazone {
    private static final String TAG = Metazone.class.getSimpleName();

    public static Map<String, Integer> getBinaryIndex() {
        Field[] fields = MetazoneIndex.BinaryIndex.class.getFields();
        Log.i(TAG, "getBinaryIndex fields:" + fields.length);
        Map<String, Integer> map = new HashMap<>();
        for (int i = 0; i < fields.length; i++) {
            try {
                String name = fields[i].getName();
                int ints = fields[i].getInt(fields[i]);
                map.put(name, Integer.valueOf(ints));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return map;
    }

    public static Map<String, Integer> getDwordIndex() {
        Field[] fields = MetazoneIndex.DwordIndex.class.getFields();
        Log.i(TAG, "getDwordIndex fields:" + fields.length);
        Map<String, Integer> map = new HashMap<>();
        for (int i = 0; i < fields.length; i++) {
            try {
                String name = fields[i].getName();
                int ints = fields[i].getInt(fields[i]);
                map.put(name, Integer.valueOf(ints));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return map;
    }
}
