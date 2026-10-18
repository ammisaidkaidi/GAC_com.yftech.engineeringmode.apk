package com.yftech.engineeringmode.fragment;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.yftech.car.media.radio.CarRadioManager;
import com.yftech.car.media.radio.entity.DataOfRadio;
import com.yftech.engineeringmode.R;

/* loaded from: /home/user/work/dex/classes2.dex */
public class TunerFragment extends BaseFragment implements View.OnClickListener {
    private final CarRadioManager.CarRadioControlCallback mCarRadioControlCallback = new CarRadioManager.CarRadioControlCallback() { // from class: com.yftech.engineeringmode.fragment.TunerFragment.1
        public void onFreqSignal(int index, DataOfRadio channel, int level) {
            super.onFreqSignal(index, channel, level);
            if (channel.getType() == 0) {
                TunerFragment.this.mTvFreq.setText("FM" + (channel.getFreq() / 1000.0f) + "MHz");
                return;
            }
            TunerFragment.this.mTvFreq.setText("AM" + channel.getFreq() + "KHz");
        }

        public void onSeekStatusChange(int scanType, int status, int operation) {
            super.onSeekStatusChange(scanType, status, operation);
            if (status != 0 || operation == 1) {
            }
        }

        public void onFreqChanage(int colorIndex, DataOfRadio newChannel, DataOfRadio oldChannel) {
            super.onFreqChanage(colorIndex, newChannel, oldChannel);
            TunerFragment.this.mType = newChannel.getType();
            if (TunerFragment.this.mType == 0) {
                TunerFragment.this.mTvFreq.setText("FM" + (newChannel.getFreq() / 1000.0f) + "MHz");
                return;
            }
            TunerFragment.this.mTvFreq.setText("AM" + newChannel.getFreq() + "KHz");
        }

        public void onAudioFocusChange(int focusChange) {
            super.onAudioFocusChange(focusChange);
        }

        public void onPlayPause(boolean isPlaying) {
            TunerFragment.this.mPlay.setText(TunerFragment.this.getString(isPlaying ? R.string.pause : R.string.play));
        }
    };
    private Button mPlay;
    private TextView mTvFreq;
    private int mType;

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_tuner, container, false);
        initView(root);
        return root;
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        CarRadioManager.registerRadioControlCallback(this.mCarRadioControlCallback);
    }

    private void initView(View root) {
        this.mPlay = (Button) root.findViewById(R.id.music_play_pause);
        this.mTvFreq = (TextView) root.findViewById(R.id.radio_Freq_text);
        this.mTvFreq.setOnClickListener(this);
        root.findViewById(R.id.music_play_update).setOnClickListener(this);
        root.findViewById(R.id.music_play_prev).setOnClickListener(this);
        root.findViewById(R.id.music_play_pause).setOnClickListener(this);
        root.findViewById(R.id.music_play_next).setOnClickListener(this);
        root.findViewById(R.id.music_play_collect).setOnClickListener(this);
        root.findViewById(R.id.music_play_update_collect).setOnClickListener(this);
    }

    /* loaded from: /home/user/work/dex/classes2.dex */
    class Listener implements View.OnClickListener {
        Listener() {
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (TunerFragment.this.mType == 0) {
                TunerFragment.this.mTvFreq.setText("FM");
            } else {
                TunerFragment.this.mTvFreq.setText("AM");
            }
        }
    }

    private void onChanged(TextView textView, String oldValue, String newValue) {
        Integer.parseInt(newValue);
        if (this.mType == 0) {
            this.mTvFreq.setText("FM");
            return;
        }
        this.mTvFreq.setText("AM" + newValue);
    }

    private void initDate() {
        CarRadioManager.getInstance().requestAudioFocus();
        DataOfRadio freq = CarRadioManager.getInstance().getFreq();
        if (freq.getType() != -1) {
            this.mType = freq.getType();
            if (freq.getType() == 0) {
                this.mTvFreq.setText("FM" + (freq.getFreq() / 1000.0f) + "MHz");
            } else {
                this.mTvFreq.setText("AM" + freq.getFreq() + "KHz");
            }
        }
        this.mPlay.setText(getString(CarRadioManager.getInstance().isPlaying() ? R.string.pause : R.string.play));
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onDestroy() {
        super.onDestroy();
        CarRadioManager.unregisterRadioControlCallback(this.mCarRadioControlCallback);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        int id = view.getId();
        if (id == 2131296498) {
            int band = CarRadioManager.getInstance().getBand();
            if (band == 0) {
                CarRadioManager.getInstance().setBand(2);
                return;
            } else {
                CarRadioManager.getInstance().setBand(0);
                return;
            }
        }
        switch (id) {
            case R.id.music_play_collect /* 2131296471 */:
                CarRadioManager.getInstance().seekDown();
                return;
            case R.id.music_play_next /* 2131296472 */:
                CarRadioManager.getInstance().stepUp();
                return;
            case R.id.music_play_pause /* 2131296473 */:
                if (CarRadioManager.getInstance().isPlaying()) {
                    CarRadioManager.getInstance().pause();
                    return;
                } else {
                    CarRadioManager.getInstance().play();
                    return;
                }
            case R.id.music_play_prev /* 2131296474 */:
                CarRadioManager.getInstance().stepDown();
                return;
            case R.id.music_play_update /* 2131296475 */:
                CarRadioManager.getInstance().seekUp();
                return;
            case R.id.music_play_update_collect /* 2131296476 */:
                CarRadioManager.getInstance().scanSave();
                return;
            default:
                return;
        }
    }
}
