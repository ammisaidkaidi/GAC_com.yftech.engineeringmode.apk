package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.security.KeyStore;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.TextView;
import com.yftech.car.audio.CarAudioManager;
import com.yftech.car.media.data.CarMediaDataManager;
import com.yftech.car.media.data.entity.MediaFile;
import com.yftech.car.media.music.CarMusicManager;
import com.yftech.car.media.video.VideoPlayer;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.util.AudioSettingUtil;
import com.yftech.engineeringmode.util.Utils;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class MediaDialog extends Dialog {
    private static final String TAG = MediaDialog.class.getSimpleName();
    private CarAudioManager.CarAudioCallback audioCallback;
    private Button back;
    private int currentValue;
    private int durationVideo;
    private TextView fileName;
    private ImageView iv_control;
    private ImageView iv_next;
    private ImageView iv_volume;
    private Handler mHandler;
    private VideoPlayer mVideoPlayer;
    private MediaFile mediaFile;
    private CarMusicManager.CarMusicControlCallback musicControlCallback;
    private VideoPlayer player;
    private int progressMusic;
    private int progressVideo;
    private ProgressBar sb_video;
    private SeekBar sb_volume;
    private TextView timeIndex;
    private TextView timeTotal;
    private int usbIndex;
    VideoPlayer.VideoCallback videoCallback;
    private MediaFile videoFile;
    private final SeekBar.OnSeekBarChangeListener volumeCallbackListener;

    public MediaDialog(Context context, MediaFile mediaFile, int usb) {
        super(context, R.style.dialog_normal);
        this.mHandler = new Handler() { // from class: com.yftech.engineeringmode.dialog.MediaDialog.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                super.handleMessage(msg);
                if (msg.equals(0)) {
                    MediaDialog.this.timeTotal.setText(Utils.getTime(MediaDialog.this.mediaFile.getDuration()));
                    MediaDialog.this.timeIndex.setText(Utils.getTime(MediaDialog.this.progressMusic));
                } else if (msg.equals(1)) {
                    MediaDialog.this.timeTotal.setText(Utils.getTime(MediaDialog.this.videoFile.getDuration()));
                    MediaDialog.this.timeIndex.setText(Utils.getTime(MediaDialog.this.videoFile.getCurrentTime()));
                }
            }
        };
        this.musicControlCallback = new CarMusicManager.CarMusicControlCallback() { // from class: com.yftech.engineeringmode.dialog.MediaDialog.2
            public void onChangePlayMusic(MediaFile musicFile) {
                super.onChangePlayMusic(musicFile);
                MediaDialog.this.mediaFile = musicFile;
                musicFile.getAlbum();
                MediaDialog.this.fileName.setText(MediaDialog.this.mediaFile.getTitle());
                MediaDialog.this.mHandler.sendEmptyMessage(1);
            }

            public void onChangeProgress(int progress) {
                super.onChangeProgress(progress);
                MediaDialog.this.progressMusic = progress;
                int max = MediaDialog.this.progressMusic;
                float progress_percent = (progress * 1.0f) / max;
                Math.round((MediaDialog.this.progressMusic * progress_percent) / 1.0f);
                MediaDialog.this.sb_video.setProgress(progress);
                MediaDialog.this.timeIndex.setText(Utils.getTime(progress));
                MediaDialog.this.sb_video.setMax((int) MediaDialog.this.mediaFile.getDuration());
                MediaDialog.this.timeTotal.setText(Utils.getTime(MediaDialog.this.mediaFile.getDuration()));
                MediaDialog.this.mHandler.sendEmptyMessage(1);
            }
        };
        this.audioCallback = new CarAudioManager.CarAudioCallback() { // from class: com.yftech.engineeringmode.dialog.MediaDialog.3
            public void onChangedVolume(int streamType, int curValue, int tolValue, boolean mute, int flag) {
                super.onChangedVolume(streamType, curValue, tolValue, mute, flag);
                MediaDialog.this.currentValue = curValue;
                Log.d(MediaDialog.TAG, "onChangedVolume: " + streamType + curValue + tolValue + mute + flag);
                if (flag != 4) {
                    MediaDialog.this.sb_volume.setMax(tolValue);
                    MediaDialog.this.sb_volume.setProgress(curValue);
                    MediaDialog.this.mHandler.sendEmptyMessage(1);
                }
            }
        };
        this.volumeCallbackListener = new SeekBar.OnSeekBarChangeListener() { // from class: com.yftech.engineeringmode.dialog.MediaDialog.4
            private int max;
            private int resourceId;

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                switchImageResource(progress);
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
                this.max = MediaDialog.this.sb_volume.getMax();
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
                switchImageResource(seekBar.getProgress());
                int progress = seekBar.getProgress();
                AudioSettingUtil.setStreamVolume(KeyStore.getApplicationContext(), 3, progress);
            }

            private void switchImageResource(int progress) {
                float percent = (progress * 100.0f) / this.max;
                if (percent >= 0.0f && percent < 30.0f && this.resourceId != 2131230834) {
                    MediaDialog.this.iv_volume.setImageResource(R.drawable.imgvideo_icon_volume_on_01);
                    this.resourceId = R.drawable.imgvideo_icon_volume_on_01;
                    return;
                }
                if (percent >= 30.0f && percent < 60.0f && this.resourceId != 2131230835) {
                    MediaDialog.this.iv_volume.setImageResource(R.drawable.imgvideo_icon_volume_on_02);
                    this.resourceId = R.drawable.imgvideo_icon_volume_on_02;
                } else if (percent >= 60.0f && percent < 100.0f && this.resourceId != 2131230836) {
                    MediaDialog.this.iv_volume.setImageResource(R.drawable.imgvideo_icon_volume_on_03);
                    this.resourceId = R.drawable.imgvideo_icon_volume_on_03;
                }
            }
        };
        this.videoCallback = new VideoPlayer.VideoCallback() { // from class: com.yftech.engineeringmode.dialog.MediaDialog.5
            public void onPlayChange(MediaFile musicFile) {
                super.onPlayChange(musicFile);
                MediaDialog.this.videoFile = musicFile;
                MediaDialog.this.fileName.setText(MediaDialog.this.videoFile.getTitle());
                Log.i(MediaDialog.TAG, "getTitle " + MediaDialog.this.videoFile.getTitle());
                MediaDialog.this.mHandler.sendEmptyMessage(1);
            }

            public void onPrepared(int duration) {
                super.onPrepared(duration);
                MediaDialog.this.durationVideo = duration;
                MediaDialog.this.timeTotal.setText(Utils.getTime(duration));
                MediaDialog.this.sb_video.setMax(duration);
                MediaDialog.this.mHandler.sendEmptyMessage(1);
            }

            public void onProgress(int progress) {
                super.onProgress(progress);
                MediaDialog.this.progressVideo = progress;
                MediaDialog.this.timeIndex.setText(Utils.getTime(MediaDialog.this.progressVideo));
                MediaDialog.this.sb_video.setProgress(progress);
                MediaDialog.this.mHandler.sendEmptyMessage(1);
            }
        };
        this.mediaFile = mediaFile;
        this.usbIndex = usb;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        setContentView(R.layout.fragment_video_player);
        CarMusicManager.registerMusicControlCallback(this.musicControlCallback);
        CarAudioManager.getInstance().registerCarAudioCallback(this.audioCallback, (Handler) null);
        Window window = getWindow();
        if (window != null) {
            WindowManager.LayoutParams params = window.getAttributes();
            params.flags = 8;
            params.gravity = 17;
            params.width = -1;
            params.height = -1;
            window.setAttributes(params);
        }
        initView(this.mediaFile);
    }

    private void initView(MediaFile playItem) {
        Log.i(MediaDialog.class.getSimpleName(), this.mediaFile.getFileName());
        this.mVideoPlayer = findViewById(R.id.player);
        this.iv_control = (ImageView) findViewById(R.id.iv_control);
        this.iv_next = (ImageView) findViewById(R.id.iv_next);
        this.sb_video = (ProgressBar) findViewById(R.id.sb_video);
        this.sb_volume = (SeekBar) findViewById(R.id.sb_volume);
        this.iv_volume = (ImageView) findViewById(R.id.iv_volume);
        this.timeIndex = (TextView) findViewById(R.id.tv_time_index);
        this.timeTotal = (TextView) findViewById(R.id.tv_time_total);
        this.fileName = (TextView) findViewById(R.id.media_file_name);
        int maxVolume = AudioSettingUtil.getStreamMaxVolume(KeyStore.getApplicationContext(), 3);
        int volume = AudioSettingUtil.getStreamVolume(KeyStore.getApplicationContext(), 3);
        float percent = (volume * 100.0f) / maxVolume;
        if (percent == 0.0f) {
            this.iv_volume.setImageResource(R.mipmap.imgvideo_icon_volume_off);
        } else if (percent >= 0.0f && percent < 30.0f) {
            this.iv_volume.setImageResource(R.mipmap.imgvideo_icon_volume_on_01);
        } else if (percent >= 30.0f && percent < 60.0f) {
            this.iv_volume.setImageResource(R.mipmap.imgvideo_icon_volume_on_02);
        } else if (percent >= 60.0f && percent < 100.0f) {
            this.iv_volume.setImageResource(R.mipmap.imgvideo_icon_volume_on_03);
        }
        this.sb_volume.setMax(maxVolume);
        this.sb_volume.setProgress(volume);
        this.sb_volume.setOnSeekBarChangeListener(this.volumeCallbackListener);
        this.mVideoPlayer.setVideoCallback(this.videoCallback);
        Message message = new Message();
        message.obj = playItem;
        if (playItem.getType() == 0) {
            CarMusicManager.getInstance().start(this.mediaFile, 2);
            this.iv_control.setSelected(true);
            ((ImageView) findViewById(R.id.iv_control)).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$MediaDialog$Q17gyblLym_kjEIRtZL-cEy6POI
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    MediaDialog.this.lambda$initView$0$MediaDialog(view);
                }
            });
            ((ImageView) findViewById(R.id.iv_next)).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$MediaDialog$vmQ0_sRuE2BQ99N5G_bkRV0jbLI
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    MediaDialog.this.lambda$initView$1$MediaDialog(view);
                }
            });
            Log.i(TAG, "title= " + this.mediaFile.getFileName());
        } else if (playItem.getType() == 1) {
            List<MediaFile> videoList = CarMediaDataManager.getInstance().getFileVideo(this.usbIndex);
            if (videoList != null && !videoList.isEmpty()) {
                this.mVideoPlayer.startPlayList(videoList, this.usbIndex, true);
                ((ImageView) findViewById(R.id.iv_control)).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$MediaDialog$zXN6ewPZ8R_6JTpOrCxzwMOPvSM
                    @Override // android.view.View.OnClickListener
                    public final void onClick(View view) {
                        MediaDialog.this.lambda$initView$2$MediaDialog(view);
                    }
                });
                this.iv_control.setSelected(true);
                ((ImageView) findViewById(R.id.iv_next)).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$MediaDialog$DxNSb5-FWIpwEz4rLoQs6MCi31o
                    @Override // android.view.View.OnClickListener
                    public final void onClick(View view) {
                        MediaDialog.this.lambda$initView$3$MediaDialog(view);
                    }
                });
            }
        } else {
            Log.e("media.dialog", "not support this type");
        }
        ((Button) findViewById(R.id.back)).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$MediaDialog$UEilW5f-RVeLCacc8AMfmPty_P8
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                MediaDialog.this.lambda$initView$4$MediaDialog(view);
            }
        });
    }

    public /* synthetic */ void lambda$initView$0$MediaDialog(View v) {
        pause();
    }

    public /* synthetic */ void lambda$initView$1$MediaDialog(View v) {
        next();
    }

    public /* synthetic */ void lambda$initView$2$MediaDialog(View v) {
        playAndPause();
    }

    public /* synthetic */ void lambda$initView$3$MediaDialog(View v) {
        nextVideo();
    }

    public /* synthetic */ void lambda$initView$4$MediaDialog(View view) {
        dismiss();
    }

    private void next() {
        CarMusicManager.getInstance().next();
    }

    private void pause() {
        CarMusicManager.getInstance().switchPlayPause();
        if (CarMusicManager.getInstance().isPlaying()) {
            this.iv_control.setSelected(false);
        } else {
            this.iv_control.setSelected(true);
        }
    }

    private void nextVideo() {
        this.mVideoPlayer.setPlayState(4);
    }

    private void playAndPause() {
        this.mVideoPlayer.setPlayState(3);
        if (this.mVideoPlayer.isPlaying()) {
            this.iv_control.setSelected(true);
        } else {
            this.iv_control.setSelected(false);
        }
    }

    private void currentPlay() {
        this.mVideoPlayer.getCurrentPlay();
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        super.dismiss();
        CarMusicManager.getInstance().stopPlaying();
        CarMusicManager.unregisterMusicControlCallback(this.musicControlCallback);
    }
}
