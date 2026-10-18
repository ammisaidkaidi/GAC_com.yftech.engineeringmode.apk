package com.yftech.engineeringmode.fragment;

import android.os.Bundle;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.autochips.audiosettings.AudioSettings;
import com.yftech.car.utils.Loger;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.ScreenDisplayDetectionDialog;
import com.yftech.engineeringmode.widget.GainEditText;
import java.util.Arrays;

/* loaded from: /home/user/work/dex/classes2.dex */
public class EQFragment extends BaseFragment implements View.OnClickListener {
    private static final float BAND_MAX_VALUE = 15.0f;
    private static final float BAND_MIN_VALUE = -15.0f;
    private static final int CUSTOM_BAND_PRESET_TYPE = 10;
    private static final String EQ_FREQ_KEY = "eq.freq";
    private static final String EQ_GAIN_KEY = "eq.gain";
    private LinearLayout layoutBand0;
    private LinearLayout layoutBand1;
    private LinearLayout layoutBand2;
    private LinearLayout layoutBand3;
    private LinearLayout layoutBand4;
    private LinearLayout layoutBand5;
    private LinearLayout layoutBand6;
    private LinearLayout layoutBand7;
    private LinearLayout layoutBand8;
    private LinearLayout layoutBand9;
    private static final String TAG = EQFragment.class.getSimpleName();
    private static final int[] BANDS = {31, 62, 125, 250, 500, ScreenDisplayDetectionDialog.BLACK_TO_WHITE_GRADIENT, 2000, 4000, 8000, 16000};
    private EditText[] freqEditTexts = new EditText[10];
    private GainEditText[] gainEditTexts = new GainEditText[10];
    private int[] freq = new int[10];
    private int[] gains = new int[10];
    private boolean isEmpty = false;
    private int[] tempFreq = new int[10];
    private int[] tempGains = new int[10];

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_eq, container, false);
        initView(view);
        return view;
    }

    private void initView(View root) {
        Integer valueOf = Integer.valueOf(R.id.eq_band0);
        this.layoutBand0 = (LinearLayout) root.findViewById(R.id.eq_band0);
        ((TextView) this.layoutBand0.findViewById(R.id.tv_eq_band_name)).setText("Band0");
        this.freqEditTexts[0] = (EditText) this.layoutBand0.findViewById(R.id.band_freq_edit);
        this.gainEditTexts[0] = (GainEditText) this.layoutBand0.findViewById(R.id.band_gain_edit);
        this.layoutBand0.findViewById(R.id.band_freq_reduce).setTag(valueOf);
        this.layoutBand0.findViewById(R.id.band_freq_plus).setTag(valueOf);
        this.layoutBand0.findViewById(R.id.band_gain_reduce).setTag(valueOf);
        this.layoutBand0.findViewById(R.id.band_gain_plus).setTag(valueOf);
        ((Button) this.layoutBand0.findViewById(R.id.band_freq_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand0.findViewById(R.id.band_freq_plus)).setOnClickListener(this);
        ((Button) this.layoutBand0.findViewById(R.id.band_gain_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand0.findViewById(R.id.band_gain_plus)).setOnClickListener(this);
        Integer valueOf2 = Integer.valueOf(R.id.eq_band1);
        this.layoutBand1 = (LinearLayout) root.findViewById(R.id.eq_band1);
        ((TextView) this.layoutBand1.findViewById(R.id.tv_eq_band_name)).setText("Band1");
        this.freqEditTexts[1] = (EditText) this.layoutBand1.findViewById(R.id.band_freq_edit);
        this.gainEditTexts[1] = (GainEditText) this.layoutBand1.findViewById(R.id.band_gain_edit);
        this.layoutBand1.findViewById(R.id.band_freq_reduce).setTag(valueOf2);
        this.layoutBand1.findViewById(R.id.band_freq_plus).setTag(valueOf2);
        this.layoutBand1.findViewById(R.id.band_gain_reduce).setTag(valueOf2);
        this.layoutBand1.findViewById(R.id.band_gain_plus).setTag(valueOf2);
        ((Button) this.layoutBand1.findViewById(R.id.band_freq_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand1.findViewById(R.id.band_freq_plus)).setOnClickListener(this);
        ((Button) this.layoutBand1.findViewById(R.id.band_gain_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand1.findViewById(R.id.band_gain_plus)).setOnClickListener(this);
        Integer valueOf3 = Integer.valueOf(R.id.eq_band2);
        this.layoutBand2 = (LinearLayout) root.findViewById(R.id.eq_band2);
        ((TextView) this.layoutBand2.findViewById(R.id.tv_eq_band_name)).setText("Band2");
        this.freqEditTexts[2] = (EditText) this.layoutBand2.findViewById(R.id.band_freq_edit);
        this.gainEditTexts[2] = (GainEditText) this.layoutBand2.findViewById(R.id.band_gain_edit);
        this.layoutBand2.findViewById(R.id.band_freq_reduce).setTag(valueOf3);
        this.layoutBand2.findViewById(R.id.band_freq_plus).setTag(valueOf3);
        this.layoutBand2.findViewById(R.id.band_gain_reduce).setTag(valueOf3);
        this.layoutBand2.findViewById(R.id.band_gain_plus).setTag(valueOf3);
        ((Button) this.layoutBand2.findViewById(R.id.band_freq_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand2.findViewById(R.id.band_freq_plus)).setOnClickListener(this);
        ((Button) this.layoutBand2.findViewById(R.id.band_gain_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand2.findViewById(R.id.band_gain_plus)).setOnClickListener(this);
        Integer valueOf4 = Integer.valueOf(R.id.eq_band3);
        this.layoutBand3 = (LinearLayout) root.findViewById(R.id.eq_band3);
        ((TextView) this.layoutBand3.findViewById(R.id.tv_eq_band_name)).setText("Band3");
        this.freqEditTexts[3] = (EditText) this.layoutBand3.findViewById(R.id.band_freq_edit);
        this.gainEditTexts[3] = (GainEditText) this.layoutBand3.findViewById(R.id.band_gain_edit);
        this.layoutBand3.findViewById(R.id.band_freq_reduce).setTag(valueOf4);
        this.layoutBand3.findViewById(R.id.band_freq_plus).setTag(valueOf4);
        this.layoutBand3.findViewById(R.id.band_gain_reduce).setTag(valueOf4);
        this.layoutBand3.findViewById(R.id.band_gain_plus).setTag(valueOf4);
        ((Button) this.layoutBand3.findViewById(R.id.band_freq_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand3.findViewById(R.id.band_freq_plus)).setOnClickListener(this);
        ((Button) this.layoutBand3.findViewById(R.id.band_gain_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand3.findViewById(R.id.band_gain_plus)).setOnClickListener(this);
        Integer valueOf5 = Integer.valueOf(R.id.eq_band4);
        this.layoutBand4 = (LinearLayout) root.findViewById(R.id.eq_band4);
        ((TextView) this.layoutBand4.findViewById(R.id.tv_eq_band_name)).setText("Band4");
        this.freqEditTexts[4] = (EditText) this.layoutBand4.findViewById(R.id.band_freq_edit);
        this.gainEditTexts[4] = (GainEditText) this.layoutBand4.findViewById(R.id.band_gain_edit);
        this.layoutBand4.findViewById(R.id.band_freq_reduce).setTag(valueOf5);
        this.layoutBand4.findViewById(R.id.band_freq_plus).setTag(valueOf5);
        this.layoutBand4.findViewById(R.id.band_gain_reduce).setTag(valueOf5);
        this.layoutBand4.findViewById(R.id.band_gain_plus).setTag(valueOf5);
        ((Button) this.layoutBand4.findViewById(R.id.band_freq_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand4.findViewById(R.id.band_freq_plus)).setOnClickListener(this);
        ((Button) this.layoutBand4.findViewById(R.id.band_gain_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand4.findViewById(R.id.band_gain_plus)).setOnClickListener(this);
        Integer valueOf6 = Integer.valueOf(R.id.eq_band5);
        this.layoutBand5 = (LinearLayout) root.findViewById(R.id.eq_band5);
        ((TextView) this.layoutBand5.findViewById(R.id.tv_eq_band_name)).setText("Band5");
        this.freqEditTexts[5] = (EditText) this.layoutBand5.findViewById(R.id.band_freq_edit);
        this.gainEditTexts[5] = (GainEditText) this.layoutBand5.findViewById(R.id.band_gain_edit);
        this.layoutBand5.findViewById(R.id.band_freq_reduce).setTag(valueOf6);
        this.layoutBand5.findViewById(R.id.band_freq_plus).setTag(valueOf6);
        this.layoutBand5.findViewById(R.id.band_gain_reduce).setTag(valueOf6);
        this.layoutBand5.findViewById(R.id.band_gain_plus).setTag(valueOf6);
        ((Button) this.layoutBand5.findViewById(R.id.band_freq_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand5.findViewById(R.id.band_freq_plus)).setOnClickListener(this);
        ((Button) this.layoutBand5.findViewById(R.id.band_gain_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand5.findViewById(R.id.band_gain_plus)).setOnClickListener(this);
        Integer valueOf7 = Integer.valueOf(R.id.eq_band6);
        this.layoutBand6 = (LinearLayout) root.findViewById(R.id.eq_band6);
        ((TextView) this.layoutBand6.findViewById(R.id.tv_eq_band_name)).setText("Band6");
        this.freqEditTexts[6] = (EditText) this.layoutBand6.findViewById(R.id.band_freq_edit);
        this.gainEditTexts[6] = (GainEditText) this.layoutBand6.findViewById(R.id.band_gain_edit);
        this.layoutBand6.findViewById(R.id.band_freq_reduce).setTag(valueOf7);
        this.layoutBand6.findViewById(R.id.band_freq_plus).setTag(valueOf7);
        this.layoutBand6.findViewById(R.id.band_gain_reduce).setTag(valueOf7);
        this.layoutBand6.findViewById(R.id.band_gain_plus).setTag(valueOf7);
        ((Button) this.layoutBand6.findViewById(R.id.band_freq_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand6.findViewById(R.id.band_freq_plus)).setOnClickListener(this);
        ((Button) this.layoutBand6.findViewById(R.id.band_gain_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand6.findViewById(R.id.band_gain_plus)).setOnClickListener(this);
        this.layoutBand7 = (LinearLayout) root.findViewById(R.id.eq_band7);
        ((TextView) this.layoutBand7.findViewById(R.id.tv_eq_band_name)).setText("Band7");
        this.freqEditTexts[7] = (EditText) this.layoutBand7.findViewById(R.id.band_freq_edit);
        this.gainEditTexts[7] = (GainEditText) this.layoutBand7.findViewById(R.id.band_gain_edit);
        this.layoutBand7.findViewById(R.id.band_freq_reduce).setTag(Integer.valueOf(R.id.eq_band7));
        this.layoutBand7.findViewById(R.id.band_freq_plus).setTag(Integer.valueOf(R.id.eq_band7));
        this.layoutBand7.findViewById(R.id.band_gain_reduce).setTag(Integer.valueOf(R.id.eq_band7));
        this.layoutBand7.findViewById(R.id.band_gain_plus).setTag(Integer.valueOf(R.id.eq_band7));
        ((Button) this.layoutBand7.findViewById(R.id.band_freq_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand7.findViewById(R.id.band_freq_plus)).setOnClickListener(this);
        ((Button) this.layoutBand7.findViewById(R.id.band_gain_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand7.findViewById(R.id.band_gain_plus)).setOnClickListener(this);
        this.layoutBand8 = (LinearLayout) root.findViewById(R.id.eq_band8);
        ((TextView) this.layoutBand8.findViewById(R.id.tv_eq_band_name)).setText("Band8");
        this.freqEditTexts[8] = (EditText) this.layoutBand8.findViewById(R.id.band_freq_edit);
        this.gainEditTexts[8] = (GainEditText) this.layoutBand8.findViewById(R.id.band_gain_edit);
        this.layoutBand8.findViewById(R.id.band_freq_reduce).setTag(Integer.valueOf(R.id.eq_band8));
        this.layoutBand8.findViewById(R.id.band_freq_plus).setTag(Integer.valueOf(R.id.eq_band8));
        this.layoutBand8.findViewById(R.id.band_gain_reduce).setTag(Integer.valueOf(R.id.eq_band8));
        this.layoutBand8.findViewById(R.id.band_gain_plus).setTag(Integer.valueOf(R.id.eq_band8));
        ((Button) this.layoutBand8.findViewById(R.id.band_freq_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand8.findViewById(R.id.band_freq_plus)).setOnClickListener(this);
        ((Button) this.layoutBand8.findViewById(R.id.band_gain_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand8.findViewById(R.id.band_gain_plus)).setOnClickListener(this);
        this.layoutBand9 = (LinearLayout) root.findViewById(R.id.eq_band9);
        ((TextView) this.layoutBand9.findViewById(R.id.tv_eq_band_name)).setText("Band9");
        this.freqEditTexts[9] = (EditText) this.layoutBand9.findViewById(R.id.band_freq_edit);
        this.gainEditTexts[9] = (GainEditText) this.layoutBand9.findViewById(R.id.band_gain_edit);
        this.layoutBand9.findViewById(R.id.band_freq_reduce).setTag(Integer.valueOf(R.id.eq_band9));
        this.layoutBand9.findViewById(R.id.band_freq_plus).setTag(Integer.valueOf(R.id.eq_band9));
        this.layoutBand9.findViewById(R.id.band_gain_reduce).setTag(Integer.valueOf(R.id.eq_band9));
        this.layoutBand9.findViewById(R.id.band_gain_plus).setTag(Integer.valueOf(R.id.eq_band9));
        ((Button) this.layoutBand9.findViewById(R.id.band_freq_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand9.findViewById(R.id.band_freq_plus)).setOnClickListener(this);
        ((Button) this.layoutBand9.findViewById(R.id.band_gain_reduce)).setOnClickListener(this);
        ((Button) this.layoutBand9.findViewById(R.id.band_gain_plus)).setOnClickListener(this);
        ((Button) root.findViewById(R.id.btn_confirm)).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.fragment.EQFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                EQFragment.this.setEq();
            }
        });
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        initData();
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onStop() {
        super.onStop();
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onDestroy() {
        super.onDestroy();
    }

    private void initData() {
        String freqString = Settings.System.getString(getContext().getContentResolver(), EQ_FREQ_KEY);
        String gainString = Settings.System.getString(getContext().getContentResolver(), EQ_GAIN_KEY);
        Log.i(TAG, "initData: " + freqString + " -- " + gainString);
        if (freqString == null) {
            int i = 0;
            while (true) {
                EditText[] editTextArr = this.freqEditTexts;
                if (i >= editTextArr.length) {
                    break;
                }
                editTextArr[i].setText(String.valueOf(BANDS[i]));
                i++;
            }
        } else {
            intStringToIntArray(freqString, this.freqEditTexts);
        }
        if (gainString != null) {
            intStringToIntArray(gainString, this.gainEditTexts);
        }
        this.tempFreq = getFreqValues(this.freqEditTexts);
        this.tempGains = getGainValues(this.gainEditTexts);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (((Integer) v.getTag()).intValue()) {
            case R.id.eq_band0 /* 2131296377 */:
                switch (v.getId()) {
                    case R.id.band_freq_plus /* 2131296307 */:
                        addFreqOne(this.freqEditTexts[0]);
                        return;
                    case R.id.band_freq_reduce /* 2131296308 */:
                        decFreqOne(this.freqEditTexts[0]);
                        return;
                    case R.id.band_gain_edit /* 2131296309 */:
                    default:
                        return;
                    case R.id.band_gain_plus /* 2131296310 */:
                        addGainOne(this.gainEditTexts[0]);
                        return;
                    case R.id.band_gain_reduce /* 2131296311 */:
                        decGainOne(this.gainEditTexts[0]);
                        return;
                }
            case R.id.eq_band1 /* 2131296378 */:
                switch (v.getId()) {
                    case R.id.band_freq_plus /* 2131296307 */:
                        addFreqOne(this.freqEditTexts[1]);
                        return;
                    case R.id.band_freq_reduce /* 2131296308 */:
                        decFreqOne(this.freqEditTexts[1]);
                        return;
                    case R.id.band_gain_edit /* 2131296309 */:
                    default:
                        return;
                    case R.id.band_gain_plus /* 2131296310 */:
                        addGainOne(this.gainEditTexts[1]);
                        return;
                    case R.id.band_gain_reduce /* 2131296311 */:
                        decGainOne(this.gainEditTexts[1]);
                        return;
                }
            case R.id.eq_band2 /* 2131296379 */:
                switch (v.getId()) {
                    case R.id.band_freq_plus /* 2131296307 */:
                        addFreqOne(this.freqEditTexts[2]);
                        return;
                    case R.id.band_freq_reduce /* 2131296308 */:
                        decFreqOne(this.freqEditTexts[2]);
                        return;
                    case R.id.band_gain_edit /* 2131296309 */:
                    default:
                        return;
                    case R.id.band_gain_plus /* 2131296310 */:
                        addGainOne(this.gainEditTexts[2]);
                        return;
                    case R.id.band_gain_reduce /* 2131296311 */:
                        decGainOne(this.gainEditTexts[2]);
                        return;
                }
            case R.id.eq_band3 /* 2131296380 */:
                switch (v.getId()) {
                    case R.id.band_freq_plus /* 2131296307 */:
                        addFreqOne(this.freqEditTexts[3]);
                        return;
                    case R.id.band_freq_reduce /* 2131296308 */:
                        decFreqOne(this.freqEditTexts[3]);
                        return;
                    case R.id.band_gain_edit /* 2131296309 */:
                    default:
                        return;
                    case R.id.band_gain_plus /* 2131296310 */:
                        addGainOne(this.gainEditTexts[3]);
                        return;
                    case R.id.band_gain_reduce /* 2131296311 */:
                        decGainOne(this.gainEditTexts[3]);
                        return;
                }
            case R.id.eq_band4 /* 2131296381 */:
                switch (v.getId()) {
                    case R.id.band_freq_plus /* 2131296307 */:
                        addFreqOne(this.freqEditTexts[4]);
                        return;
                    case R.id.band_freq_reduce /* 2131296308 */:
                        decFreqOne(this.freqEditTexts[4]);
                        return;
                    case R.id.band_gain_edit /* 2131296309 */:
                    default:
                        return;
                    case R.id.band_gain_plus /* 2131296310 */:
                        addGainOne(this.gainEditTexts[4]);
                        return;
                    case R.id.band_gain_reduce /* 2131296311 */:
                        decGainOne(this.gainEditTexts[4]);
                        return;
                }
            case R.id.eq_band5 /* 2131296382 */:
                switch (v.getId()) {
                    case R.id.band_freq_plus /* 2131296307 */:
                        addFreqOne(this.freqEditTexts[5]);
                        return;
                    case R.id.band_freq_reduce /* 2131296308 */:
                        decFreqOne(this.freqEditTexts[5]);
                        return;
                    case R.id.band_gain_edit /* 2131296309 */:
                    default:
                        return;
                    case R.id.band_gain_plus /* 2131296310 */:
                        addGainOne(this.gainEditTexts[5]);
                        return;
                    case R.id.band_gain_reduce /* 2131296311 */:
                        decGainOne(this.gainEditTexts[5]);
                        return;
                }
            case R.id.eq_band6 /* 2131296383 */:
                switch (v.getId()) {
                    case R.id.band_freq_plus /* 2131296307 */:
                        addFreqOne(this.freqEditTexts[6]);
                        return;
                    case R.id.band_freq_reduce /* 2131296308 */:
                        decFreqOne(this.freqEditTexts[6]);
                        return;
                    case R.id.band_gain_edit /* 2131296309 */:
                    default:
                        return;
                    case R.id.band_gain_plus /* 2131296310 */:
                        addGainOne(this.gainEditTexts[6]);
                        return;
                    case R.id.band_gain_reduce /* 2131296311 */:
                        decGainOne(this.gainEditTexts[6]);
                        return;
                }
            case R.id.eq_band7 /* 2131296384 */:
                switch (v.getId()) {
                    case R.id.band_freq_plus /* 2131296307 */:
                        addFreqOne(this.freqEditTexts[7]);
                        return;
                    case R.id.band_freq_reduce /* 2131296308 */:
                        decFreqOne(this.freqEditTexts[7]);
                        return;
                    case R.id.band_gain_edit /* 2131296309 */:
                    default:
                        return;
                    case R.id.band_gain_plus /* 2131296310 */:
                        addGainOne(this.gainEditTexts[7]);
                        return;
                    case R.id.band_gain_reduce /* 2131296311 */:
                        decGainOne(this.gainEditTexts[7]);
                        return;
                }
            case R.id.eq_band8 /* 2131296385 */:
                switch (v.getId()) {
                    case R.id.band_freq_plus /* 2131296307 */:
                        addFreqOne(this.freqEditTexts[8]);
                        return;
                    case R.id.band_freq_reduce /* 2131296308 */:
                        decFreqOne(this.freqEditTexts[8]);
                        return;
                    case R.id.band_gain_edit /* 2131296309 */:
                    default:
                        return;
                    case R.id.band_gain_plus /* 2131296310 */:
                        addGainOne(this.gainEditTexts[8]);
                        return;
                    case R.id.band_gain_reduce /* 2131296311 */:
                        decGainOne(this.gainEditTexts[8]);
                        return;
                }
            case R.id.eq_band9 /* 2131296386 */:
                switch (v.getId()) {
                    case R.id.band_freq_plus /* 2131296307 */:
                        addFreqOne(this.freqEditTexts[9]);
                        return;
                    case R.id.band_freq_reduce /* 2131296308 */:
                        decFreqOne(this.freqEditTexts[9]);
                        return;
                    case R.id.band_gain_edit /* 2131296309 */:
                    default:
                        return;
                    case R.id.band_gain_plus /* 2131296310 */:
                        addGainOne(this.gainEditTexts[9]);
                        return;
                    case R.id.band_gain_reduce /* 2131296311 */:
                        decGainOne(this.gainEditTexts[9]);
                        return;
                }
            default:
                return;
        }
    }

    private void decFreqOne(EditText editText) {
        int src;
        String num = editText.getText().toString();
        if (TextUtils.isEmpty(num)) {
            src = 1;
        } else {
            src = Integer.parseInt(num);
            if (src > 1) {
                src--;
            }
        }
        editText.setText(BuildConfig.FLAVOR + src);
    }

    private void addFreqOne(EditText editText) {
        int src;
        String num = editText.getText().toString();
        if (TextUtils.isEmpty(num)) {
            src = 1;
        } else {
            int src2 = Integer.parseInt(editText.getText().toString());
            src = src2 + 1;
        }
        editText.setText(BuildConfig.FLAVOR + src);
    }

    private void decGainOne(EditText editText) {
        int src;
        String num = editText.getText().toString();
        if (TextUtils.isEmpty(num)) {
            src = 0;
        } else {
            src = Integer.parseInt(num);
            if (src > -15) {
                src--;
            }
        }
        editText.setText(BuildConfig.FLAVOR + src);
    }

    private void addGainOne(EditText editText) {
        int src;
        String num = editText.getText().toString();
        if (TextUtils.isEmpty(num)) {
            src = 0;
        } else {
            src = Integer.parseInt(editText.getText().toString());
            if (src < 15) {
                src++;
            }
        }
        editText.setText(BuildConfig.FLAVOR + src);
    }

    private boolean setBandGains(int[] iArr, int[] iArr2, int i, boolean z) {
        int[] iArr3 = new int[468];
        int[] iArr4 = {313, 344, 375, 406, 437};
        int[] iArr5 = {322, 353, 384, 415, 446};
        int[] iArr6 = {158, 189, 220, 251, 282};
        int[] iArr7 = {167, 198, 229, 260, 291};
        int[] iArr8 = {200, 200, 200, 200, 200, 200, 200, 200, 200, 200};
        int[] iArr9 = {50, 50, 50, 50, 50, 50, 50, 50, 50, 50};
        iArr3[0] = z ? 1 : 0;
        iArr3[1] = 10;
        iArr3[2] = i;
        copyIntArray(iArr, 0, iArr3, 3, 10);
        copyIntArray(iArr, 0, iArr3, 34, 10);
        copyIntArray(iArr, 0, iArr3, 65, 10);
        copyIntArray(iArr, 0, iArr3, 96, 10);
        copyIntArray(iArr, 0, iArr3, 127, 10);
        copyIntArray(iArr2, 0, iArr3, 313, 10);
        copyIntArray(iArr2, 0, iArr3, 344, 10);
        copyIntArray(iArr2, 0, iArr3, 375, 10);
        copyIntArray(iArr2, 0, iArr3, 406, 10);
        copyIntArray(iArr2, 0, iArr3, 437, 10);
        for (int i2 = 0; i2 < 5; i2++) {
            int i3 = 0;
            int i4 = iArr6[i2];
            int i5 = iArr4[i2];
            while (i4 <= iArr7[i2] && i5 <= iArr5[i2]) {
                if (iArr3[i5] >= 15) {
                    iArr3[i4] = iArr8[i3];
                } else {
                    iArr3[i4] = iArr9[i3];
                }
                i4++;
                i5++;
                i3++;
            }
        }
        if (AudioSettings.SetValue(1, iArr3, iArr3.length) == 0) {
            return true;
        }
        Loger.e("setBandGains, failed: presetType:" + i + ", enable:" + z);
        return false;
    }

    private void copyIntArray(int[] src, int srcOffset, int[] des, int desOffset, int length) {
        for (int i = 0; i < length; i++) {
            des[i + desOffset] = src[i + srcOffset];
        }
    }

    public boolean setBandValue(int[] freq, int[] values, float[] qs) {
        if (values == null || values.length != BANDS.length) {
            Loger.e("setBandValue, param error");
            return false;
        }
        int[] gains = new int[values.length];
        for (int i = 0; i < values.length; i++) {
            gains[i] = (int) (values[i] - BAND_MIN_VALUE);
        }
        return setBandGains(freq, gains, 10, true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setEq() {
        float[] qs = new float[1];
        setBandValue(this.tempFreq, this.tempGains, qs);
        this.freq = getFreqValues(this.freqEditTexts);
        this.gains = getGainValues(this.gainEditTexts);
        if (this.isEmpty) {
            return;
        }
        boolean result = setBandValue(this.freq, this.gains, qs);
        int[] iArr = this.freq;
        this.tempFreq = Arrays.copyOf(iArr, iArr.length);
        int[] iArr2 = this.gains;
        this.tempGains = Arrays.copyOf(iArr2, iArr2.length);
        if (result) {
            Toast.makeText(getContext(), getString(R.string.setting_succeeded), 1).show();
            Settings.System.putString(getContext().getContentResolver(), EQ_FREQ_KEY, Arrays.toString(this.freq));
            Settings.System.putString(getContext().getContentResolver(), EQ_GAIN_KEY, Arrays.toString(this.gains));
        }
    }

    private int[] getFreqValues(EditText[] freqEditTexts) {
        int[] freq = new int[10];
        for (int i = 0; i < freqEditTexts.length; i++) {
            try {
                freq[i] = Integer.parseInt(freqEditTexts[i].getText().toString());
            } catch (Exception e) {
                e.printStackTrace();
                this.isEmpty = true;
                int[] iArr = this.tempFreq;
                freq = Arrays.copyOf(iArr, iArr.length);
                Toast.makeText(getContext(), getString(R.string.input_empty_tip), 1).show();
            }
        }
        this.isEmpty = false;
        Log.i(TAG, "getFreqValues: " + Arrays.toString(freq));
        return freq;
    }

    private int[] getGainValues(EditText[] gainEditTexts) {
        int[] gains = new int[10];
        for (int i = 0; i < gainEditTexts.length; i++) {
            try {
                gains[i] = Integer.parseInt(gainEditTexts[i].getText().toString());
            } catch (Exception e) {
                e.printStackTrace();
                this.isEmpty = true;
                int[] iArr = this.tempGains;
                gains = Arrays.copyOf(iArr, iArr.length);
                Toast.makeText(getContext(), getString(R.string.input_empty_tip), 1).show();
            }
        }
        this.isEmpty = false;
        Log.i(TAG, "getGainValues: " + Arrays.toString(gains));
        return gains;
    }

    private void intStringToIntArray(String data, EditText[] editTexts) {
        String[] strings = data.replaceAll("(?:\\[|null|\\]| +)", BuildConfig.FLAVOR).split(",");
        for (int i = 0; i < editTexts.length; i++) {
            editTexts[i].setText(strings[i]);
        }
    }
}
