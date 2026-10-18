package com.yftech.engineeringmode.fragment;

import android.content.DialogInterface;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.SeekBar;
import com.autochips.pq.AtcPq;
import com.yftech.car.screen.CarScreenManager;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.ScreenDisplayDetectionDialog;
import com.yftech.engineeringmode.dialog.ScreenTpTestDialog;
import com.yftech.engineeringmode.manager.UpgradeManager;
import com.yftech.engineeringmode.util.Utils;
import com.yftech.engineeringmode.widget.SeekBarNumber;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ScreenFragment extends BaseFragment implements View.OnClickListener, SeekBar.OnSeekBarChangeListener {
    private static final int PRIMARY_DISPLAY = 0;
    private static final int SECONDARY_DISPLAY = 1;
    private SeekBarNumber mSbScreenBrightnessDebugging;
    private SeekBarNumber mSbScreenGammaDebugging;
    private ScreenDisplayDetectionDialog mScreenDisplayDetectionDialog;
    private Handler mMainHandler = new Handler(Looper.getMainLooper());
    private CarScreenManager.CarScreenCallback mCarScreenCallback = new CarScreenManager.CarScreenCallback() { // from class: com.yftech.engineeringmode.fragment.ScreenFragment.1
        public void onChangedScreenBrightness(boolean open, int brightness) {
            super.onChangedScreenBrightness(open, brightness);
            if (brightness != ScreenFragment.this.mSbScreenBrightnessDebugging.getProgress()) {
                ScreenFragment.this.mSbScreenBrightnessDebugging.setProgress(brightness);
            }
        }
    };

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_screen, container, false);
        initView(root);
        return root;
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        this.mSbScreenBrightnessDebugging.setProgress(CarScreenManager.getInstance().getBrightness());
        CarScreenManager.getInstance().registerCarScreenCallback(this.mCarScreenCallback, this.mMainHandler);
    }

    public void onPause() {
        super.onPause();
        CarScreenManager.getInstance().unregisterCarScreenCallback(this.mCarScreenCallback);
    }

    private void initView(View root) {
        this.mSbScreenBrightnessDebugging = (SeekBarNumber) root.findViewById(R.id.sb_screen_brightness_debugging);
        this.mSbScreenBrightnessDebugging.setMax(CarScreenManager.getInstance().getBrightnessMaxValue());
        this.mSbScreenBrightnessDebugging.setOnSeekBarChangeListener(this);
        this.mSbScreenGammaDebugging = (SeekBarNumber) root.findViewById(R.id.sb_screen_gamma_value_debugging);
        this.mSbScreenGammaDebugging.setProgress(AtcPq.getColorTemperature(0));
        this.mSbScreenGammaDebugging.setMax(AtcPq.getMaxColorTemperatureIndex(0));
        this.mSbScreenGammaDebugging.setMin(AtcPq.getMinColorTemperatureIndex(0));
        this.mSbScreenGammaDebugging.setOnSeekBarChangeListener(this);
        root.findViewById(R.id.btn_screen_display_detection_manual).setOnClickListener(this);
        root.findViewById(R.id.btn_screen_display_detection_white).setOnClickListener(this);
        root.findViewById(R.id.btn_screen_display_detection_black).setOnClickListener(this);
        root.findViewById(R.id.btn_screen_display_detection_black_to_white).setOnClickListener(this);
        root.findViewById(R.id.btn_screen_display_detection_red).setOnClickListener(this);
        root.findViewById(R.id.btn_screen_display_detection_green).setOnClickListener(this);
        root.findViewById(R.id.btn_screen_display_detection_blue).setOnClickListener(this);
        root.findViewById(R.id.btn_screen_display_detection_cycle).setOnClickListener(this);
        root.findViewById(R.id.textView_tp_test).setOnClickListener(this);
        root.findViewById(R.id.textView_screen_upgrade).setOnClickListener(this);
        CheckBox cb_screen_tp_detection = (CheckBox) root.findViewById(R.id.cb_screen_tp_detection);
        cb_screen_tp_detection.setChecked(Utils.getScreenTpAutoBrightnessEnable());
        cb_screen_tp_detection.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.yftech.engineeringmode.fragment.ScreenFragment.2
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (buttonView.isPressed() && buttonView.getId() == 2131296337) {
                    Utils.setScreenTpAutoBrightnessEnable(isChecked);
                }
            }
        });
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        int id = v.getId();
        switch (id) {
            case R.id.btn_screen_display_detection_black /* 2131296323 */:
                showScreenDisplayDetectionDialog(Color.rgb(0, 0, 0), 0);
                return;
            case R.id.btn_screen_display_detection_black_to_white /* 2131296324 */:
                showScreenDisplayDetectionDialog(ScreenDisplayDetectionDialog.BLACK_TO_WHITE_GRADIENT, 0);
                return;
            case R.id.btn_screen_display_detection_blue /* 2131296325 */:
                showScreenDisplayDetectionDialog(Color.rgb(0, 0, 255), 0);
                return;
            case R.id.btn_screen_display_detection_cycle /* 2131296326 */:
                showScreenDisplayDetectionDialog(Color.rgb(255, 255, 255), 1);
                return;
            case R.id.btn_screen_display_detection_green /* 2131296327 */:
                showScreenDisplayDetectionDialog(Color.rgb(0, 255, 0), 0);
                return;
            case R.id.btn_screen_display_detection_manual /* 2131296328 */:
                showScreenDisplayDetectionDialog(Color.rgb(255, 255, 255), 2);
                return;
            case R.id.btn_screen_display_detection_red /* 2131296329 */:
                showScreenDisplayDetectionDialog(Color.rgb(255, 0, 0), 0);
                return;
            case R.id.btn_screen_display_detection_white /* 2131296330 */:
                showScreenDisplayDetectionDialog(Color.rgb(255, 255, 255), 0);
                return;
            default:
                switch (id) {
                    case R.id.textView_screen_upgrade /* 2131296577 */:
                        UpgradeManager.getInstance().checkUpgradeFile(true, null, true);
                        return;
                    case R.id.textView_tp_test /* 2131296578 */:
                        ScreenTpTestDialog screenTpTestDialog = new ScreenTpTestDialog(getContext());
                        screenTpTestDialog.show();
                        return;
                    default:
                        return;
                }
        }
    }

    private void showScreenDisplayDetectionDialog(int color, int mode) {
        this.mScreenDisplayDetectionDialog = new ScreenDisplayDetectionDialog(getContext());
        this.mScreenDisplayDetectionDialog.showColor(color, mode);
        this.mScreenDisplayDetectionDialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.yftech.engineeringmode.fragment.-$$Lambda$ScreenFragment$QgV0uut-79KFYY2McNMjn_wKNME
            @Override // android.content.DialogInterface.OnDismissListener
            public final void onDismiss(DialogInterface dialogInterface) {
                ScreenFragment.this.lambda$showScreenDisplayDetectionDialog$0$ScreenFragment(dialogInterface);
            }
        });
    }

    public /* synthetic */ void lambda$showScreenDisplayDetectionDialog$0$ScreenFragment(DialogInterface dialog) {
        this.mScreenDisplayDetectionDialog = null;
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
        if (!fromUser) {
            return;
        }
        if (seekBar.getId() == 2131296512) {
            if (this.mSbScreenBrightnessDebugging.isMoveOutside()) {
                SeekBarNumber seekBarNumber = this.mSbScreenBrightnessDebugging;
                seekBarNumber.setProgress(seekBarNumber.getMoveOutsideProgress());
            } else {
                CarScreenManager.getInstance().setBrightness(progress);
            }
        }
        if (seekBar.getId() == 2131296514) {
            if (this.mSbScreenGammaDebugging.isMoveOutside()) {
                SeekBarNumber seekBarNumber2 = this.mSbScreenGammaDebugging;
                seekBarNumber2.setProgress(seekBarNumber2.getMoveOutsideProgress());
            } else {
                AtcPq.setColorTemperature(0, progress);
            }
        }
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStartTrackingTouch(SeekBar seekBar) {
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStopTrackingTouch(SeekBar seekBar) {
    }
}
