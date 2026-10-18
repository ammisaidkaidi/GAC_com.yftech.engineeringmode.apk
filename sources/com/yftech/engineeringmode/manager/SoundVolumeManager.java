package com.yftech.engineeringmode.manager;

import android.content.Context;
import android.media.AudioManager;
import android.os.Handler;
import android.util.Log;
import com.yftech.car.audio.CarAudioManager;
import java.util.ArrayList;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class SoundVolumeManager {
    public static final int STREAM_CALL = 6;
    public static final int STREAM_MUSIC = 3;
    public static final int STREAM_NAVI = 11;
    public static final int STREAM_VOICE = 9;
    private static final String TAG = SoundVolumeManager.class.getSimpleName();
    public static final int VOLUME_CALL_MIN = 3;
    public static final int VOLUME_MEDIA_MIN = 0;
    public static final int VOLUME_NAVI_MIN = 0;
    public static final int VOLUME_VOICE_MIN = 3;
    private static SoundVolumeManager mSoundVolumeManager;
    private AudioManager mAudioManager;
    private Context mContext;
    private boolean mIsRecoverMediaVolume = false;
    private boolean mIsRecoverCallVolume = false;
    private boolean mIsRecoverVoiceVolume = false;
    private boolean mIsRecoverNaviVolume = false;
    private Handler mCarAudioCallbackHandler = new Handler();
    private List<SoundVolumeListener> mSoundVolumeListeners = new ArrayList();
    private CarAudioManager.CarAudioCallback mCarAudioCallback = new CarAudioManager.CarAudioCallback() { // from class: com.yftech.engineeringmode.manager.SoundVolumeManager.1
        public void onChangedVolume(int streamType, int curValue, int tolValue, boolean mute, int flag) {
            super.onChangedVolume(streamType, curValue, tolValue, mute, flag);
            Log.i(SoundVolumeManager.TAG, "onChangedVolume streamType:" + streamType + ", curValue:" + curValue + ", tolValue:" + tolValue + ", mute:" + mute + ", flag:" + flag);
            if (streamType == 3 || streamType == 6 || streamType == 9 || streamType == 11) {
                if (streamType != 3) {
                    if (streamType != 6) {
                        if (streamType != 9) {
                            if (streamType == 11 && SoundVolumeManager.this.getRecoverVolume(11) && curValue != 0) {
                                SoundVolumeManager.this.setRecoverVolume(11, false);
                            }
                        } else if (SoundVolumeManager.this.getRecoverVolume(9) && curValue != 3) {
                            SoundVolumeManager.this.setRecoverVolume(9, false);
                        }
                    } else if (SoundVolumeManager.this.getRecoverVolume(6) && curValue != 3) {
                        SoundVolumeManager.this.setRecoverVolume(6, false);
                    }
                } else if (SoundVolumeManager.this.getRecoverVolume(3) && curValue != 0) {
                    SoundVolumeManager.this.setRecoverVolume(3, false);
                }
                for (int i = 0; i < SoundVolumeManager.this.mSoundVolumeListeners.size(); i++) {
                    ((SoundVolumeListener) SoundVolumeManager.this.mSoundVolumeListeners.get(i)).onChangedVolume(streamType, curValue, tolValue, mute, flag);
                }
            }
        }
    };

    /* loaded from: /home/user/work/dex/classes2.dex */
    public interface SoundVolumeListener {
        void onChangedVolume(int i, int i2, int i3, boolean z, int i4);
    }

    private SoundVolumeManager() {
    }

    public static synchronized SoundVolumeManager getInstance() {
        SoundVolumeManager soundVolumeManager;
        synchronized (SoundVolumeManager.class) {
            if (mSoundVolumeManager == null) {
                mSoundVolumeManager = new SoundVolumeManager();
            }
            soundVolumeManager = mSoundVolumeManager;
        }
        return soundVolumeManager;
    }

    public void init(Context context) {
        this.mContext = context;
        this.mAudioManager = (AudioManager) this.mContext.getSystemService("audio");
        CarAudioManager.getInstance().registerCarAudioCallback(this.mCarAudioCallback, this.mCarAudioCallbackHandler);
    }

    public void deInit() {
        CarAudioManager.getInstance().unregisterCarAudioCallback(this.mCarAudioCallback);
    }

    public void addSoundVolumeListener(SoundVolumeListener listener) {
        if (!this.mSoundVolumeListeners.contains(listener)) {
            this.mSoundVolumeListeners.add(listener);
        }
    }

    public void removeSoundVolumeListener(SoundVolumeListener listener) {
        if (this.mSoundVolumeListeners.contains(listener)) {
            this.mSoundVolumeListeners.remove(listener);
        }
    }

    public void setVolume(int streamType, int value) {
        setVolume(streamType, value, 0);
    }

    public int getVolume(int streamType) {
        AudioManager audioManager = this.mAudioManager;
        if (audioManager != null) {
            return audioManager.getStreamVolume(streamType);
        }
        return 0;
    }

    public int getMaxVolume(int streamType) {
        AudioManager audioManager = this.mAudioManager;
        if (audioManager != null) {
            return audioManager.getStreamMaxVolume(streamType);
        }
        return 0;
    }

    public void slideVolume(int streamType, int value) {
        setVolume(streamType, value, 1073741824);
    }

    private void setVolume(int streamType, int value, int flags) {
        AudioManager audioManager = this.mAudioManager;
        if (audioManager != null) {
            audioManager.setStreamVolume(streamType, value, flags);
            Log.i(TAG, "setVolume, streamType:" + streamType + ", value:" + value + ", flags:" + flags);
        }
    }

    public void setRecoverVolume(int streamType, boolean isRecover) {
        Log.i(TAG, "setRecoverVolume, streamType:" + streamType + ", isRecover:" + isRecover);
        if (streamType == 3) {
            this.mIsRecoverMediaVolume = isRecover;
            return;
        }
        if (streamType == 6) {
            this.mIsRecoverCallVolume = isRecover;
        } else if (streamType == 9) {
            this.mIsRecoverVoiceVolume = isRecover;
        } else if (streamType == 11) {
            this.mIsRecoverNaviVolume = isRecover;
        }
    }

    public boolean getRecoverVolume(int streamType) {
        if (streamType == 3) {
            return this.mIsRecoverMediaVolume;
        }
        if (streamType == 6) {
            return this.mIsRecoverCallVolume;
        }
        if (streamType == 9) {
            return this.mIsRecoverVoiceVolume;
        }
        if (streamType == 11) {
            return this.mIsRecoverNaviVolume;
        }
        return false;
    }
}
