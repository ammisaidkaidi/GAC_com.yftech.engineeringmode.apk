package com.yftech.engineeringmode;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.yftech.engineeringmode.manager.ConfigManager;
import com.yftech.vehicle.internal.adapter.ICarMisc;
import com.yftech.vehicle.sdk.CarMiscManager;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ConfigDataReceiver extends BroadcastReceiver {
    private static final String INTENT_ACTION_CAR_TYPE = "com.yftech.intent.action.engineeringmode.cartype";
    private static final String INTENT_ACTION_CHANGE_BIT_VALUE = "com.yftech.intent.action.engineeringmode.config.bit";
    private static final String INTENT_ACTION_DID_INDEX_VALUE = "com.yftech.intent.action.engineeringmode.config.DID_INDEX_VALUE";
    private static final String INTENT_ACTION_INDEX_VALUE = "com.yftech.intent.action.engineeringmode.config.INDEX_VALUE";
    private static final String INTENT_ACTION_TYPE = "com.yftech.intent.action.engineeringmode.config.TYPE";
    private static final String INTENT_FAST_SLEEP = "com.yftech.intent.action.engineeringmode.fastsleep";
    private static final String TAG = ConfigDataReceiver.class.getSimpleName();
    private ICarMisc.AteCarType[] carType = {ICarMisc.AteCarType.IHU12_A88_A1, ICarMisc.AteCarType.IHU12_A58_B1, ICarMisc.AteCarType.IHU12_A79_C1, ICarMisc.AteCarType.IHU12_A79_C2};

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        ConfigManager.getInstance().init(context);
        if (INTENT_ACTION_TYPE.equals(intent.getAction())) {
            String type = intent.getStringExtra("type");
            Log.i(TAG, "type:" + type);
            ConfigManager.getInstance().setConfig0101(type);
            return;
        }
        if (INTENT_ACTION_INDEX_VALUE.equals(intent.getAction())) {
            String index = intent.getStringExtra("index");
            String value = intent.getStringExtra("value");
            Log.i(TAG, "index:" + index + " value:" + value);
            ConfigManager.getInstance().setConfig0101(index, value);
            return;
        }
        if (INTENT_ACTION_DID_INDEX_VALUE.equals(intent.getAction())) {
            String did = intent.getStringExtra("did");
            String index2 = intent.getStringExtra("index");
            String value2 = intent.getStringExtra("value");
            Log.i(TAG, "did: index:" + index2 + " value:" + value2);
            ConfigManager.getInstance().setConfig(did, index2, value2);
            return;
        }
        if (INTENT_ACTION_CHANGE_BIT_VALUE.equals(intent.getAction())) {
            String did2 = intent.getStringExtra("did");
            String bytePos = intent.getStringExtra("bytePos");
            String bitPos = intent.getStringExtra("bitPos");
            String bitValue = intent.getStringExtra("bitValue");
            Log.i(TAG, "onReceive: did:" + did2 + " bytePos:" + bytePos + " bitPos:" + bitPos + " bitValue:" + bitValue);
            ConfigManager.getInstance().setBitValue(did2, Integer.parseInt(bytePos), Integer.parseInt(bitPos), Integer.parseInt(bitValue));
            return;
        }
        if (INTENT_ACTION_CAR_TYPE.equals(intent.getAction())) {
            String type2 = intent.getStringExtra("type");
            Log.i(TAG, "onReceive carType:" + type2);
            int i = 0;
            while (true) {
                ICarMisc.AteCarType[] ateCarTypeArr = this.carType;
                if (i < ateCarTypeArr.length) {
                    if (ateCarTypeArr[i].toString().equals(type2)) {
                        boolean result = CarMiscManager.get().setAteCarType(this.carType[i]);
                        Log.i(TAG, "setAteCarType carType:" + this.carType[i] + " result:" + result);
                    }
                    i++;
                } else {
                    return;
                }
            }
        } else if (INTENT_FAST_SLEEP.equals(intent.getAction())) {
            boolean result2 = CarMiscManager.get().setFastSleep();
            Log.i(TAG, "CarMiscManager.get().setFastSleep():" + result2);
        }
    }
}
