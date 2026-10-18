package com.yftech.engineeringmode.fragment;

import android.app.ActivityManager;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemProperties;
import android.provider.Settings;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.CompoundButton;
import android.widget.RelativeLayout;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.Switch;
import android.widget.TextView;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.ConfirmDialog;
import com.yftech.engineeringmode.dialog.ScreenUpgradeCA1105Dialog;
import com.yftech.engineeringmode.fragment.AdditionalFragment;
import com.yftech.engineeringmode.widget.SeekBarNumber;
import com.yftech.vehicle.sdk.CarInfoManager;
import com.yftech.vehicle.sdk.CarMiscManager;
import com.yftech.vehicle.sdk.CarSwcManager;
import java.io.IOException;

/* loaded from: /home/user/work/dex/classes2.dex */
public class AdditionalFragment extends BaseFragment implements View.OnClickListener, SeekBar.OnSeekBarChangeListener, AdapterView.OnItemSelectedListener, CompoundButton.OnCheckedChangeListener {
    private static final String ENGINEERING_MODE_CAMERA_TYPE = "engineering_mode_camera_type";
    private static final int ENGINEERING_MODE_CAMERA_TYPE_AVM = 1;
    private static final int ENGINEERING_MODE_CAMERA_TYPE_NONE = 0;
    private static final int ENGINEERING_MODE_CAMERA_TYPE_RVC = 2;
    private static final String SYSTEMPROPERTIES_YF_TEMP_PROTECT = "yf.temp.protect";
    private static final int SYSTEMPROPERTIES_YF_TEMP_PROTECT_VALUE_CLOSE = 0;
    private static final int SYSTEMPROPERTIES_YF_TEMP_PROTECT_VALUE_OPNE = 1;
    private static final String TAG = AdditionalFragment.class.getSimpleName();
    private ScreenUpgradeCA1105Dialog mScreenUpgradeCA1105Dialog;
    private SeekBarNumber mSeekBarNumber;
    private TextView tvSteeringWheelAngle;
    private TextView tvVehicleSpeed;
    private Handler mMainHandler = new Handler(Looper.getMainLooper());
    private final Handler speedHandler = new Handler() { // from class: com.yftech.engineeringmode.fragment.AdditionalFragment.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            AdditionalFragment.this.tvVehicleSpeed.setText(String.valueOf(msg.arg1) + " km/h");
        }
    };
    private final Handler angleHandler = new Handler() { // from class: com.yftech.engineeringmode.fragment.AdditionalFragment.2
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            AdditionalFragment.this.tvSteeringWheelAngle.setText(String.valueOf(msg.obj));
        }
    };
    private CarInfoManager.CarInfoListener mCarInfoListener = new CarInfoManager.CarInfoListener() { // from class: com.yftech.engineeringmode.fragment.AdditionalFragment.3
        public void onVehicleSpeedChanged(int speed) {
            super.onVehicleSpeedChanged(speed);
            Message speedMessage = new Message();
            speedMessage.arg1 = speed;
            AdditionalFragment.this.speedHandler.sendMessage(speedMessage);
        }
    };
    private CarSwcManager.CarSwcListener mCarSwcListener = new CarSwcManager.CarSwcListener() { // from class: com.yftech.engineeringmode.fragment.AdditionalFragment.4
        public void onSwcAngleChanged(float angle) {
            super.onSwcAngleChanged(angle);
            Message angleMessage = new Message();
            angleMessage.obj = Float.valueOf(angle);
            AdditionalFragment.this.angleHandler.sendMessage(angleMessage);
        }
    };
    private CarMiscManager.CarMiscListener mCarMiscListener = new AnonymousClass5();

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.yftech.engineeringmode.fragment.AdditionalFragment$5, reason: invalid class name */
    /* loaded from: /home/user/work/dex/classes2.dex */
    public class AnonymousClass5 extends CarMiscManager.CarMiscListener {
        AnonymousClass5() {
        }

        public void onKeyboardBacklightChanged(final int level) {
            super.onKeyboardBacklightChanged(level);
            Log.i(AdditionalFragment.TAG, "onKeyboardBacklightChanged level:" + level);
            AdditionalFragment.this.mMainHandler.post(new Runnable() { // from class: com.yftech.engineeringmode.fragment.-$$Lambda$AdditionalFragment$5$aWXju1J-g_3v3EEA5VXGiHRU4Xw
                @Override // java.lang.Runnable
                public final void run() {
                    AdditionalFragment.AnonymousClass5.this.lambda$onKeyboardBacklightChanged$0$AdditionalFragment$5(level);
                }
            });
        }

        public /* synthetic */ void lambda$onKeyboardBacklightChanged$0$AdditionalFragment$5(int level) {
            if (level != AdditionalFragment.this.mSeekBarNumber.getProgress()) {
                AdditionalFragment.this.mSeekBarNumber.setProgress(level);
            }
        }
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_additional, container, false);
        initView(root);
        return root;
    }

    private void initView(View root) {
        this.tvVehicleSpeed = (TextView) root.findViewById(R.id.additional_vehicle_speed);
        this.tvSteeringWheelAngle = (TextView) root.findViewById(R.id.additional_steering_wheel_angle);
        this.mSeekBarNumber = (SeekBarNumber) root.findViewById(R.id.seekBarNumber);
        this.mSeekBarNumber.setMax(10000);
        this.mSeekBarNumber.setOnSeekBarChangeListener(this);
        root.findViewById(R.id.btn_sub).setOnClickListener(this);
        root.findViewById(R.id.btn_inc).setOnClickListener(this);
        ((RelativeLayout) root.findViewById(R.id.additional_sys_reboot)).setOnClickListener(this);
        this.tvVehicleSpeed.setText(getVehicleSpeed());
        this.tvSteeringWheelAngle.setText(getSteeringWheelAngle());
        ((TextView) root.findViewById(R.id.additional_mcu_bootloader_version)).setText(getMcuBootloaderVersion());
        ((TextView) root.findViewById(R.id.additional_sys_version)).setText(getSystemVersion());
        ((Switch) root.findViewById(R.id.additional_mcu_test_mode)).setChecked(CarMiscManager.get().getFactoryModeDevelopModeEnabled());
        ((Switch) root.findViewById(R.id.additional_mcu_test_mode)).setOnCheckedChangeListener(this);
        Spinner spCameraType = (Spinner) root.findViewById(R.id.sp_camera_type);
        ArrayAdapter<String> saveOptionAdapter = new ArrayAdapter<>(getContext(), R.layout.spinner_item, getResources().getStringArray(R.array.camera_type));
        saveOptionAdapter.setDropDownViewResource(R.layout.spinner_item_dropdown);
        spCameraType.setAdapter((SpinnerAdapter) saveOptionAdapter);
        spCameraType.setSelection(getCameraType(), true);
        spCameraType.setOnItemSelectedListener(this);
        Spinner spScreenTemperatureProtection = (Spinner) root.findViewById(R.id.sp_screen_temperature_protection);
        ArrayAdapter<String> openCloseAdapter = new ArrayAdapter<>(getContext(), R.layout.spinner_item, getResources().getStringArray(R.array.log_open_close));
        openCloseAdapter.setDropDownViewResource(R.layout.spinner_item_dropdown);
        spScreenTemperatureProtection.setAdapter((SpinnerAdapter) openCloseAdapter);
        spScreenTemperatureProtection.setSelection(getScreenTemperatureProtectionState(), true);
        spScreenTemperatureProtection.setOnItemSelectedListener(this);
        root.findViewById(R.id.additional_screen_upgrade_btn).setOnClickListener(this);
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        int level = CarMiscManager.get().getKeyboardBacklight();
        Log.i(TAG, "onResume level:" + level);
        this.mSeekBarNumber.setProgress(level);
        CarMiscManager.get().registerReceiver(this.mCarMiscListener);
        CarInfoManager.get().registerListener(this.mCarInfoListener);
        CarSwcManager.get().registerListener(this.mCarSwcListener);
    }

    public void onPause() {
        super.onPause();
        this.speedHandler.removeCallbacksAndMessages(null);
        this.angleHandler.removeCallbacksAndMessages(null);
        CarMiscManager.get().unregisterReceiver(this.mCarMiscListener);
        CarInfoManager.get().unregisterListener(this.mCarInfoListener);
        CarSwcManager.get().unregisterListener(this.mCarSwcListener);
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public void onCheckedChanged(CompoundButton compoundButton, boolean isChecked) {
        if (compoundButton.isPressed() && compoundButton.getId() == 2131296286) {
            boolean result = isChecked ? CarMiscManager.get().setFactoryModeDevelopModeEnabled(true, false) : CarMiscManager.get().setFactoryModeDevelopModeEnabled(false, false);
            boolean openStatus = CarMiscManager.get().getFactoryModeDevelopModeEnabled();
            Log.i(TAG, "set result:" + result + " openStatus:" + openStatus);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.additional_screen_upgrade_btn /* 2131296287 */:
                this.mScreenUpgradeCA1105Dialog = new ScreenUpgradeCA1105Dialog(getContext().getApplicationContext(), true);
                this.mScreenUpgradeCA1105Dialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.yftech.engineeringmode.fragment.AdditionalFragment.6
                    @Override // android.content.DialogInterface.OnDismissListener
                    public void onDismiss(DialogInterface dialog) {
                        AdditionalFragment.this.mScreenUpgradeCA1105Dialog = null;
                    }
                });
                this.mScreenUpgradeCA1105Dialog.show();
                return;
            case R.id.additional_sys_reboot /* 2131296289 */:
                openRebootDialog();
                return;
            case R.id.btn_inc /* 2131296322 */:
                int progress = this.mSeekBarNumber.getProgress();
                if (progress >= this.mSeekBarNumber.getMax()) {
                    return;
                }
                CarMiscManager.get().setKeyboardBacklight(progress + 1);
                return;
            case R.id.btn_sub /* 2131296331 */:
                int progress2 = this.mSeekBarNumber.getProgress();
                if (progress2 <= 0) {
                    return;
                }
                CarMiscManager.get().setKeyboardBacklight(progress2 - 1);
                return;
            default:
                return;
        }
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
        if (fromUser && seekBar.getId() == 2131296534) {
            if (this.mSeekBarNumber.isMoveOutside()) {
                SeekBarNumber seekBarNumber = this.mSeekBarNumber;
                seekBarNumber.setProgress(seekBarNumber.getMoveOutsideProgress());
            } else {
                CarMiscManager.get().setKeyboardBacklight(progress);
            }
        }
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStartTrackingTouch(SeekBar seekBar) {
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStopTrackingTouch(SeekBar seekBar) {
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        if (parent.getId() == 2131296546) {
            setCameraType(position);
        } else if (parent.getId() == 2131296552) {
            setScreenTemperatureProtectionState(position);
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onNothingSelected(AdapterView<?> parent) {
    }

    private void openRebootDialog() {
        ConfirmDialog confirmDialog = new ConfirmDialog(getContext());
        confirmDialog.setTipMessage("是否确定重启系统");
        confirmDialog.setOnButtonClickListener(new ConfirmDialog.OnDialogButtonClickListener() { // from class: com.yftech.engineeringmode.fragment.AdditionalFragment.7
            @Override // com.yftech.engineeringmode.dialog.ConfirmDialog.OnDialogButtonClickListener
            public void sureButtonClick() {
                AdditionalFragment.reboot();
            }

            @Override // com.yftech.engineeringmode.dialog.ConfirmDialog.OnDialogButtonClickListener
            public void cancelButtonClick() {
            }
        });
        confirmDialog.show();
    }

    private int getCameraType() {
        int type = Settings.System.getInt(getContext().getContentResolver(), ENGINEERING_MODE_CAMERA_TYPE, 0);
        Log.i(TAG, "getCameraType type:" + type);
        return type;
    }

    private void setCameraType(int index) {
        boolean ret = Settings.System.putInt(getContext().getContentResolver(), ENGINEERING_MODE_CAMERA_TYPE, index);
        Log.i(TAG, "setCameraType index:" + index + " ret:" + ret);
    }

    private int getScreenTemperatureProtectionState() {
        int state = SystemProperties.getInt(SYSTEMPROPERTIES_YF_TEMP_PROTECT, 1);
        Log.i(TAG, "getScreenTemperatureProtectionState state:" + state);
        return state;
    }

    private void setScreenTemperatureProtectionState(int state) {
        SystemProperties.set(SYSTEMPROPERTIES_YF_TEMP_PROTECT, String.valueOf(state));
        Log.i(TAG, "setScreenTemperatureProtectionState state:" + state);
    }

    private String getVehicleSpeed() {
        int speed = CarInfoManager.get().getVehicleSpeed();
        Log.i(TAG, "getVehicleSpeed() VehicleSpeed:" + speed);
        return speed + " km/h";
    }

    private String getSteeringWheelAngle() {
        Log.i(TAG, "getSteeringWheelAngle() angle:" + CarSwcManager.get().getSwcAngle());
        return String.valueOf(CarSwcManager.get().getSwcAngle());
    }

    private String getMcuBootloaderVersion() {
        String version = SystemProperties.get("persist.version.mcuboot", BuildConfig.FLAVOR);
        Log.i(TAG, "getMcuBootloaderVersion() version:" + version);
        return version;
    }

    private String getSystemVersion() {
        String version = SystemProperties.get("ro.build.realversion.date", BuildConfig.FLAVOR);
        Log.i(TAG, "getSystemVersion() version:" + version);
        return version;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void reboot() {
        if (ActivityManager.isUserAMonkey()) {
            Log.i(TAG, "monkey not reboot");
            return;
        }
        try {
            Process process = Runtime.getRuntime().exec("reboot");
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
