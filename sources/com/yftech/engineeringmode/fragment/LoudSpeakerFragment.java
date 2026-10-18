package com.yftech.engineeringmode.fragment;

import android.content.res.AssetFileDescriptor;
import android.graphics.Color;
import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.SeekBar;
import android.widget.Toast;
import com.yftech.car.audio.CarSoundEffectManager;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.manager.SoundVolumeManager;
import com.yftech.engineeringmode.widget.SeekBarNumber;
import java.io.IOException;

/* loaded from: /home/user/work/dex/classes2.dex */
public class LoudSpeakerFragment extends BaseFragment implements SeekBar.OnSeekBarChangeListener, SoundVolumeManager.SoundVolumeListener, View.OnClickListener {
    private static final String PATH = "audio/loudspeaker_test.MP3";
    private static final String TAG = "LoudSpeakerTest";
    private AudioAttributes audioAttributes;
    private AudioFocusRequest audioFocusRequest;
    private Button btnFl;
    private Button btnFr;
    private Button btnPlay;
    private Button btnRl;
    private Button btnRr;
    private AssetFileDescriptor fileDescriptor;
    private AudioManager mAudioManager;
    private MediaPlayer mMediaPlayer;
    private SeekBarNumber mSbLoudspeakerVolumeCall;
    private SeekBarNumber mSbLoudspeakerVolumeMedia;
    private SeekBarNumber mSbLoudspeakerVolumeNavi;
    private SeekBarNumber mSbLoudspeakerVolumeVoice;
    private float fl = 0.0f;
    private float fr = 0.0f;
    private float rl = 0.0f;
    private float rr = 0.0f;
    private float tempFl = 0.0f;
    private float tempFr = 0.0f;
    private float tempRl = 0.0f;
    private float tempRr = 0.0f;
    private AudioManager.OnAudioFocusChangeListener focusChangeListener = new AudioManager.OnAudioFocusChangeListener() { // from class: com.yftech.engineeringmode.fragment.LoudSpeakerFragment.1
        @Override // android.media.AudioManager.OnAudioFocusChangeListener
        public void onAudioFocusChange(int focusChange) {
            if (focusChange == -3 || focusChange == -2) {
                LoudSpeakerFragment.this.mMediaPlayer.pause();
                return;
            }
            if (focusChange != -1) {
                if (focusChange == 1) {
                    LoudSpeakerFragment.this.mMediaPlayer.start();
                    return;
                }
                return;
            }
            if (LoudSpeakerFragment.this.mMediaPlayer.isPlaying()) {
                LoudSpeakerFragment.this.mMediaPlayer.stop();
            }
            int result = LoudSpeakerFragment.this.mAudioManager.abandonAudioFocusRequest(LoudSpeakerFragment.this.audioFocusRequest);
            Log.i(LoudSpeakerFragment.TAG, "onAudioFocusChange: AudioManager.AUDIOFOCUS_LOSS: abandonAudioFocusRequest: result:" + result);
        }
    };

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_loud_speaker, container, false);
        initView(root);
        return root;
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        initData();
        this.mAudioManager = (AudioManager) getContext().getSystemService("audio");
        setVolumeProgress(3, SoundVolumeManager.getInstance().getVolume(3));
        setVolumeProgress(9, SoundVolumeManager.getInstance().getVolume(9));
        setVolumeProgress(6, SoundVolumeManager.getInstance().getVolume(6));
        setVolumeProgress(11, SoundVolumeManager.getInstance().getVolume(11));
        SoundVolumeManager.getInstance().addSoundVolumeListener(this);
    }

    public void onPause() {
        super.onPause();
        SoundVolumeManager.getInstance().removeSoundVolumeListener(this);
        audioStop();
        CarSoundEffectManager.getInstance().setBalance(this.tempFl, this.tempFr, this.tempRl, this.tempRr);
        setBtnBackgroundColor(this.btnFl, 0.0f);
        setBtnBackgroundColor(this.btnFr, 0.0f);
        setBtnBackgroundColor(this.btnRl, 0.0f);
        setBtnBackgroundColor(this.btnRr, 0.0f);
        this.fl = 0.0f;
        this.fr = 0.0f;
        this.rl = 0.0f;
        this.rr = 0.0f;
    }

    private void initView(View root) {
        this.mSbLoudspeakerVolumeMedia = (SeekBarNumber) root.findViewById(R.id.sb_loudspeaker_volume_media);
        this.mSbLoudspeakerVolumeMedia.setMax(SoundVolumeManager.getInstance().getMaxVolume(3));
        this.mSbLoudspeakerVolumeMedia.setOnSeekBarChangeListener(this);
        this.mSbLoudspeakerVolumeVoice = (SeekBarNumber) root.findViewById(R.id.sb_loudspeaker_volume_voice);
        this.mSbLoudspeakerVolumeVoice.setMax(SoundVolumeManager.getInstance().getMaxVolume(9));
        this.mSbLoudspeakerVolumeVoice.setOnSeekBarChangeListener(this);
        this.mSbLoudspeakerVolumeCall = (SeekBarNumber) root.findViewById(R.id.sb_loudspeaker_volume_call);
        this.mSbLoudspeakerVolumeCall.setMax(SoundVolumeManager.getInstance().getMaxVolume(6));
        this.mSbLoudspeakerVolumeCall.setOnSeekBarChangeListener(this);
        this.mSbLoudspeakerVolumeNavi = (SeekBarNumber) root.findViewById(R.id.sb_loudspeaker_volume_navi);
        this.mSbLoudspeakerVolumeNavi.setMax(SoundVolumeManager.getInstance().getMaxVolume(11));
        this.mSbLoudspeakerVolumeNavi.setOnSeekBarChangeListener(this);
        this.btnFl = (Button) root.findViewById(R.id.loudspeaker_fl);
        this.btnFl.setOnClickListener(this);
        this.btnFr = (Button) root.findViewById(R.id.loudspeaker_fr);
        this.btnFr.setOnClickListener(this);
        this.btnRl = (Button) root.findViewById(R.id.loudspeaker_rl);
        this.btnRl.setOnClickListener(this);
        this.btnRr = (Button) root.findViewById(R.id.loudspeaker_rr);
        this.btnRr.setOnClickListener(this);
        this.btnPlay = (Button) root.findViewById(R.id.loudspeaker_play);
        this.btnPlay.setOnClickListener(this);
    }

    private void initData() {
        this.tempFl = CarSoundEffectManager.getInstance().getBalanceValueFL();
        this.tempFr = CarSoundEffectManager.getInstance().getBalanceValueFR();
        this.tempRl = CarSoundEffectManager.getInstance().getBalanceValueRL();
        this.tempRr = CarSoundEffectManager.getInstance().getBalanceValueRR();
        this.audioAttributes = new AudioAttributes.Builder().setContentType(2).build();
        this.audioFocusRequest = new AudioFocusRequest.Builder(2).setAudioAttributes(this.audioAttributes).setOnAudioFocusChangeListener(this.focusChangeListener).build();
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
        if (!fromUser) {
            return;
        }
        switch (seekBar.getId()) {
            case R.id.sb_loudspeaker_volume_call /* 2131296508 */:
                if (this.mSbLoudspeakerVolumeCall.isMoveOutside()) {
                    setVolumeProgress(6, this.mSbLoudspeakerVolumeCall.getMoveOutsideProgress());
                    return;
                } else {
                    handleVolumeChanged(6, progress);
                    return;
                }
            case R.id.sb_loudspeaker_volume_media /* 2131296509 */:
                if (this.mSbLoudspeakerVolumeMedia.isMoveOutside()) {
                    setVolumeProgress(3, this.mSbLoudspeakerVolumeMedia.getMoveOutsideProgress());
                    return;
                } else {
                    handleVolumeChanged(3, progress);
                    return;
                }
            case R.id.sb_loudspeaker_volume_navi /* 2131296510 */:
                if (this.mSbLoudspeakerVolumeNavi.isMoveOutside()) {
                    setVolumeProgress(11, this.mSbLoudspeakerVolumeNavi.getMoveOutsideProgress());
                    return;
                } else {
                    handleVolumeChanged(11, progress);
                    return;
                }
            case R.id.sb_loudspeaker_volume_voice /* 2131296511 */:
                if (this.mSbLoudspeakerVolumeVoice.isMoveOutside()) {
                    setVolumeProgress(9, this.mSbLoudspeakerVolumeVoice.getMoveOutsideProgress());
                    return;
                } else {
                    handleVolumeChanged(9, progress);
                    return;
                }
            default:
                return;
        }
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStartTrackingTouch(SeekBar seekBar) {
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStopTrackingTouch(SeekBar seekBar) {
    }

    @Override // com.yftech.engineeringmode.manager.SoundVolumeManager.SoundVolumeListener
    public void onChangedVolume(int streamType, int curValue, int tolValue, boolean mute, int flag) {
        if ((1073741824 & flag) > 0) {
            return;
        }
        setVolumeProgress(streamType, curValue);
    }

    private void handleVolumeChanged(int streamType, int progress) {
        int min = 0;
        if (streamType == 3) {
            min = 0;
        } else if (streamType == 6) {
            min = 3;
        } else if (streamType == 9) {
            min = 3;
        } else if (streamType == 11) {
            min = 0;
        }
        if (progress < min) {
            setVolumeProgress(streamType, min);
        } else {
            SoundVolumeManager.getInstance().slideVolume(streamType, progress);
        }
    }

    private void setVolumeProgress(int streamType, int progress) {
        if (streamType == 3) {
            this.mSbLoudspeakerVolumeMedia.setProgress(progress);
            return;
        }
        if (streamType == 6) {
            this.mSbLoudspeakerVolumeCall.setProgress(progress);
        } else if (streamType == 9) {
            this.mSbLoudspeakerVolumeVoice.setProgress(progress);
        } else if (streamType == 11) {
            this.mSbLoudspeakerVolumeNavi.setProgress(progress);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.loudspeaker_fl /* 2131296455 */:
                this.fl = getLoudSpeakerBalance(this.fl);
                setBtnBackgroundColor(this.btnFl, this.fl);
                return;
            case R.id.loudspeaker_fr /* 2131296456 */:
                this.fr = getLoudSpeakerBalance(this.fr);
                setBtnBackgroundColor(this.btnFr, this.fr);
                return;
            case R.id.loudspeaker_play /* 2131296457 */:
                Log.d(TAG, "fl:" + this.fl + " fr:" + this.fr + " rl:" + this.rl + " rr：" + this.rr);
                CarSoundEffectManager.getInstance().setBalance(this.fl, this.fr, this.rl, this.rr);
                setBtnClickDisable();
                audioPlay();
                return;
            case R.id.loudspeaker_rl /* 2131296458 */:
                this.rl = getLoudSpeakerBalance(this.rl);
                setBtnBackgroundColor(this.btnRl, this.rl);
                return;
            case R.id.loudspeaker_rr /* 2131296459 */:
                this.rr = getLoudSpeakerBalance(this.rr);
                setBtnBackgroundColor(this.btnRr, this.rr);
                return;
            default:
                return;
        }
    }

    private void audioPlay() {
        try {
            this.mMediaPlayer = new MediaPlayer();
            this.mMediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() { // from class: com.yftech.engineeringmode.fragment.LoudSpeakerFragment.2
                @Override // android.media.MediaPlayer.OnCompletionListener
                public void onCompletion(MediaPlayer mediaPlayer) {
                    LoudSpeakerFragment.this.setBtnClickAble();
                    int result = LoudSpeakerFragment.this.mAudioManager.abandonAudioFocusRequest(LoudSpeakerFragment.this.audioFocusRequest);
                    Log.i(LoudSpeakerFragment.TAG, "abandonAudioFocusRequest: result:" + result);
                    Toast.makeText(LoudSpeakerFragment.this.getContext(), R.string.loudspeaker_play_complete, 0).show();
                }
            });
            this.fileDescriptor = getResources().getAssets().openFd(PATH);
            this.mMediaPlayer.setDataSource(this.fileDescriptor.getFileDescriptor(), this.fileDescriptor.getStartOffset(), this.fileDescriptor.getLength());
            this.mMediaPlayer.prepare();
            if (this.mAudioManager.requestAudioFocus(this.audioFocusRequest) == 1) {
                this.mMediaPlayer.start();
            }
        } catch (IOException e) {
            e.printStackTrace();
            setBtnClickAble();
            Toast.makeText(getContext(), "找不到音频文件", 0).show();
            Log.d(TAG, "Audio file not found.");
        }
    }

    private void audioStop() {
        MediaPlayer mediaPlayer = this.mMediaPlayer;
        if (mediaPlayer == null) {
            return;
        }
        mediaPlayer.stop();
    }

    private void setBtnClickDisable() {
        this.btnFl.setBackgroundColor(Color.rgb(128, 128, 128));
        this.btnFl.setClickable(false);
        this.btnFr.setBackgroundColor(Color.rgb(128, 128, 128));
        this.btnFr.setClickable(false);
        this.btnRl.setBackgroundColor(Color.rgb(128, 128, 128));
        this.btnRl.setClickable(false);
        this.btnRr.setBackgroundColor(Color.rgb(128, 128, 128));
        this.btnRr.setClickable(false);
        this.btnPlay.setBackgroundColor(Color.rgb(128, 128, 128));
        this.btnPlay.setClickable(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setBtnClickAble() {
        setBtnBackgroundColor(this.btnFl, this.fl);
        this.btnFl.setClickable(true);
        setBtnBackgroundColor(this.btnFr, this.fr);
        this.btnFr.setClickable(true);
        setBtnBackgroundColor(this.btnRl, this.rl);
        this.btnRl.setClickable(true);
        setBtnBackgroundColor(this.btnRr, this.rr);
        this.btnRr.setClickable(true);
        this.btnPlay.setBackgroundColor(Color.rgb(195, 195, 197));
        this.btnPlay.setClickable(true);
    }

    private float getLoudSpeakerBalance(float value) {
        if (value == 0.0f) {
            float value2 = CarSoundEffectManager.getInstance().getBalanceMaxValue();
            return value2;
        }
        return 0.0f;
    }

    private void setBtnBackgroundColor(Button button, float value) {
        if (value == 0.0f) {
            button.setBackgroundColor(Color.rgb(195, 195, 197));
        } else {
            button.setBackgroundColor(-65536);
        }
    }
}
