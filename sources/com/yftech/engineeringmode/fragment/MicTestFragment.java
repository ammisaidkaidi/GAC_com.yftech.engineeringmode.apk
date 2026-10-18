package com.yftech.engineeringmode.fragment;

import android.media.MediaPlayer;
import android.media.MediaRecorder;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import java.io.File;
import java.io.IOException;

/* loaded from: /home/user/work/dex/classes2.dex */
public class MicTestFragment extends BaseFragment implements View.OnClickListener {
    private File audioFile;
    private boolean isRecorder = false;
    private MediaRecorder mMediaRecorder;
    private MediaPlayer mediaPlayer;
    private String msg;
    private View viewRoot;

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_mic, container, false);
        this.viewRoot = root;
        initView(root);
        return root;
    }

    private void initView(View root) {
        root.findViewById(R.id.record).setOnClickListener(this);
        root.findViewById(R.id.stop).setOnClickListener(this);
        root.findViewById(R.id.play).setOnClickListener(this);
        root.findViewById(R.id.stopplay).setOnClickListener(this);
        root.findViewById(R.id.clear).setOnClickListener(this);
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        initData();
    }

    private void initData() {
        this.mediaPlayer = new MediaPlayer();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        File file;
        switch (v.getId()) {
            case R.id.clear /* 2131296349 */:
                this.audioFile = new File(this.audioFile.getAbsolutePath());
                if (!this.audioFile.exists() || (file = this.audioFile) == null || !file.isDirectory()) {
                    return;
                }
                for (File file2 : this.audioFile.listFiles()) {
                    if (file2.isFile()) {
                        file2.delete();
                        Log.d("test", "1111");
                    }
                    this.audioFile.delete();
                    Log.d("test", "2222098765432");
                }
                return;
            case R.id.play /* 2131296492 */:
                if (this.audioFile == null || this.isRecorder || this.mediaPlayer.isPlaying()) {
                    return;
                }
                try {
                    this.mediaPlayer.setDataSource(this.audioFile.getAbsolutePath());
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    this.mediaPlayer.prepare();
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
                this.mediaPlayer.start();
                this.mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() { // from class: com.yftech.engineeringmode.fragment.-$$Lambda$MicTestFragment$jrKQkuPdgNeHnkWRwwCYP8nfaLw
                    @Override // android.media.MediaPlayer.OnCompletionListener
                    public final void onCompletion(MediaPlayer mediaPlayer) {
                        MicTestFragment.this.lambda$onClick$0$MicTestFragment(mediaPlayer);
                    }
                });
                this.msg = getString(R.string.playing_recording);
                ((TextView) this.viewRoot.findViewById(2131296572)).setText(this.msg);
                return;
            case R.id.record /* 2131296500 */:
                this.mMediaRecorder = new MediaRecorder();
                this.mMediaRecorder.setAudioSource(1);
                this.mMediaRecorder.setOutputFormat(0);
                this.mMediaRecorder.setAudioEncoder(0);
                try {
                    this.audioFile = File.createTempFile("record_", ".mp3");
                } catch (IOException e3) {
                    e3.printStackTrace();
                }
                this.mMediaRecorder.setOutputFile(this.audioFile.getAbsolutePath());
                try {
                    this.mMediaRecorder.prepare();
                    this.mMediaRecorder.start();
                    this.isRecorder = true;
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
                this.msg = getString(R.string.recording);
                ((TextView) this.viewRoot.findViewById(2131296572)).setText(this.msg);
                return;
            case R.id.stop /* 2131296561 */:
                MediaRecorder mediaRecorder = this.mMediaRecorder;
                if (mediaRecorder != null) {
                    mediaRecorder.stop();
                    this.mMediaRecorder.reset();
                    this.mMediaRecorder.release();
                    this.mMediaRecorder = null;
                    this.isRecorder = false;
                }
                this.msg = getString(R.string.recording_stopped);
                ((TextView) this.viewRoot.findViewById(2131296572)).setText(this.msg);
                return;
            case R.id.stopplay /* 2131296562 */:
                MediaPlayer mediaPlayer = this.mediaPlayer;
                if (mediaPlayer == null) {
                    return;
                }
                mediaPlayer.stop();
                this.msg = getString(R.string.play_stop);
                ((TextView) this.viewRoot.findViewById(2131296572)).setText(this.msg);
                return;
            default:
                return;
        }
    }

    public /* synthetic */ void lambda$onClick$0$MicTestFragment(MediaPlayer mp) {
        setTitle();
    }

    private void setTitle() {
    }
}
