package com.yftech.engineeringmode.util;

import android.content.Context;
import android.media.AudioManager;
import java.lang.reflect.Method;

/* loaded from: /home/user/work/dex/classes2.dex */
public class AudioSettingUtil {
    public static void requestAudioFocus(Context mContext, AudioManager.OnAudioFocusChangeListener listener, int streamType, int durationHint) {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        if (audioManager != null) {
            audioManager.requestAudioFocus(listener, streamType, durationHint);
        }
    }

    public static void abandonAudioFocus(Context mContext, AudioManager.OnAudioFocusChangeListener listener) {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        if (audioManager != null) {
            audioManager.abandonAudioFocus(listener);
        }
    }

    public static int getStreamMaxVolume(Context mContext, int streamType) {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        if (audioManager == null) {
            return 0;
        }
        int maxVolume = audioManager.getStreamMaxVolume(3);
        return maxVolume;
    }

    public static int getStreamVolume(Context mContext, int streamType) {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        if (audioManager == null) {
            return 0;
        }
        int streamVolume = audioManager.getStreamVolume(3);
        return streamVolume;
    }

    public static void setStreamVolume(Context mContext, int streamType, int volume) {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        if (audioManager != null) {
            audioManager.setStreamVolume(streamType, volume, 4);
        }
    }

    public static void playSystemClickSoundEffect(Context context) {
        AudioManager mAudioMgr = (AudioManager) context.getSystemService("audio");
        mAudioMgr.playSoundEffect(3);
    }

    public static void setMasterMute(Context mContext, boolean isMute) {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        try {
            Class classz = audioManager.getClass();
            Method method = classz.getDeclaredMethod("setMasterMute", Boolean.TYPE, Integer.TYPE);
            method.setAccessible(true);
            method.invoke(audioManager, Boolean.valueOf(isMute), 4);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean isMasterMute(Context mContext) {
        AudioManager audioManager = (AudioManager) mContext.getSystemService("audio");
        try {
            Class classz = audioManager.getClass();
            Method method = classz.getDeclaredMethod("isMasterMute", new Class[0]);
            method.setAccessible(true);
            method.invoke(audioManager, new Object[0]);
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
