package com.yftech.engineeringmode.fragment;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemProperties;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import com.yftech.car.media.data.CarMediaDataManager;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.ConfirmDialog;
import com.yftech.engineeringmode.util.DeleteUtil;
import com.yftech.engineeringmode.widget.CanLogFloatView;
import com.yftech.tbox.sdk.CarTBoxSdkManager;
import java.io.File;
import java.util.Iterator;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class LogFragment extends BaseFragment implements AdapterView.OnItemSelectedListener, View.OnClickListener, CompoundButton.OnCheckedChangeListener {
    private static final String PERSIST_FLOGCAT_LOG_LEVEL = "persist.flogcat.log.level";
    private static final String PERSIST_FLOGCAT_LOG_TIME = "persist.flogcat.log.tim";
    private static final String PERSIST_FLOGCAT_MCU_ENABLE = "persist.flogcat.mcu.enable";
    private static final String PERSIST_FLOGCAT_MPU_ENABLE = "persist.flogcat.mpu.enable";
    private static final String TAG = LogFragment.class.getSimpleName();
    private Button btn_tbox_log;
    private CanLogFloatView mCanLogFloatView;
    private ConfirmDialog mConfirmDialog;
    private RelativeLayout mRlTboxLog;
    private Toast mToast;
    private Spinner sp_display_time;
    private Spinner sp_level;
    private Spinner sp_save_option;
    private Spinner sp_spi_save;
    private TextView tv_tbox_log_tip;
    private String[] mMPUValues = {"0", "1"};
    private String[] mMCUValues = {"0", "1"};
    private String[] mLevelValues = {"V", "D", "I", "W", "E", "S"};
    private String[] mTimeValues = {"thread", "threadtime"};
    private final CarTBoxSdkManager.CarTBoxSdkCallback mCarTBoxSdkCallback = new CarTBoxSdkManager.CarTBoxSdkCallback() { // from class: com.yftech.engineeringmode.fragment.LogFragment.2
        public void onDownloadLogState(int state, int progress) {
            super.onDownloadLogState(state, progress);
            Log.i(LogFragment.TAG, "onDownloadLogState state=" + state + " progress=" + progress);
            if (state == 0) {
                LogFragment.this.tv_tbox_log_tip.setText(LogFragment.this.getString(R.string.log_tbox_download_exporting));
                LogFragment.this.setTBoxLogButtonEnabled(false);
                return;
            }
            if (state == 128) {
                LogFragment.this.tv_tbox_log_tip.setText(LogFragment.this.getString(R.string.log_tbox_download_complete));
                LogFragment.this.setTBoxLogButtonEnabled(true);
                return;
            }
            if (state == 160) {
                LogFragment.this.tv_tbox_log_tip.setText(LogFragment.this.getString(R.string.log_tbox_download_exporting));
                LogFragment.this.setTBoxLogButtonEnabled(false);
                return;
            }
            if (state == 130 || state == 129 || state == 161 || state == 162 || state == 163) {
                LogFragment.this.tv_tbox_log_tip.setText(LogFragment.this.getString(R.string.log_tbox_download_failed) + "(code=" + state + ")");
                LogFragment.this.setTBoxLogButtonEnabled(true);
            }
        }
    };

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_log, container, false);
        initView(root);
        return root;
    }

    private void initView(View root) {
        this.sp_save_option = (Spinner) root.findViewById(R.id.sp_save_option);
        ArrayAdapter<String> saveOptionAdapter = new ArrayAdapter<>(getContext(), R.layout.spinner_item, getResources().getStringArray(R.array.log_save_option));
        saveOptionAdapter.setDropDownViewResource(R.layout.spinner_item_dropdown);
        this.sp_save_option.setAdapter((SpinnerAdapter) saveOptionAdapter);
        this.sp_save_option.setSelection(getMPULogState(), true);
        this.sp_save_option.setOnItemSelectedListener(this);
        ArrayAdapter<String> openCloseAdapter = new ArrayAdapter<>(getContext(), R.layout.spinner_item, getResources().getStringArray(R.array.log_open_close));
        openCloseAdapter.setDropDownViewResource(R.layout.spinner_item_dropdown);
        this.sp_spi_save = (Spinner) root.findViewById(R.id.sp_spi_save);
        this.sp_spi_save.setAdapter((SpinnerAdapter) openCloseAdapter);
        this.sp_spi_save.setSelection(getMCULogState(), true);
        this.sp_spi_save.setOnItemSelectedListener(this);
        this.sp_level = (Spinner) root.findViewById(R.id.sp_level);
        ArrayAdapter<String> levelAdapter = new ArrayAdapter<>(getContext(), R.layout.spinner_item, getResources().getStringArray(R.array.log_level));
        levelAdapter.setDropDownViewResource(R.layout.spinner_item_dropdown);
        this.sp_level.setAdapter((SpinnerAdapter) levelAdapter);
        this.sp_level.setSelection(getLevelLogState(), true);
        this.sp_level.setOnItemSelectedListener(this);
        this.sp_display_time = (Spinner) root.findViewById(R.id.sp_display_time);
        this.sp_display_time.setAdapter((SpinnerAdapter) openCloseAdapter);
        this.sp_display_time.setSelection(getTimeLogState(), true);
        this.sp_display_time.setOnItemSelectedListener(this);
        ((Button) root.findViewById(R.id.btn_clean_log)).setOnClickListener(this);
        ((Switch) root.findViewById(R.id.sw_canlog)).setChecked(SystemProperties.getInt("persist.canlog.state", 0) == 1);
        ((Switch) root.findViewById(R.id.sw_canlog)).setOnCheckedChangeListener(this);
        ((Switch) root.findViewById(R.id.sw_canlog_display)).setChecked(SystemProperties.getInt("yf.canlog.display", 0) == 1);
        ((Switch) root.findViewById(R.id.sw_canlog_display)).setOnCheckedChangeListener(this);
        this.mRlTboxLog = (RelativeLayout) root.findViewById(R.id.mRlTboxLog);
        if (isSupportTboxLog()) {
            this.mRlTboxLog.setVisibility(0);
            this.btn_tbox_log = (Button) root.findViewById(R.id.btn_tbox_log);
            this.btn_tbox_log.setOnClickListener(this);
            this.tv_tbox_log_tip = (TextView) root.findViewById(R.id.tv_tbox_log_tip);
            return;
        }
        this.mRlTboxLog.setVisibility(8);
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        switch (parent.getId()) {
            case R.id.sp_display_time /* 2131296547 */:
                setTimeLogState(position);
                return;
            case R.id.sp_index /* 2131296548 */:
            case R.id.sp_option /* 2131296550 */:
            case R.id.sp_screen_temperature_protection /* 2131296552 */:
            default:
                return;
            case R.id.sp_level /* 2131296549 */:
                setLevelLogState(position);
                return;
            case R.id.sp_save_option /* 2131296551 */:
                setMPULogState(position);
                return;
            case R.id.sp_spi_save /* 2131296553 */:
                setMCULogState(position);
                return;
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onNothingSelected(AdapterView<?> parent) {
    }

    private int getMPULogState() {
        String value = SystemProperties.get(PERSIST_FLOGCAT_MPU_ENABLE, "1");
        Log.i(TAG, "getMPULogState() value:" + value);
        int index = 0;
        while (true) {
            String[] strArr = this.mMPUValues;
            if (index < strArr.length) {
                if (!strArr[index].equals(value)) {
                    index++;
                } else {
                    return index;
                }
            } else {
                return 0;
            }
        }
    }

    private void setMPULogState(int index) {
        if (index >= 0 && index < this.mMPUValues.length) {
            Log.i(TAG, "setMPULogState() index:" + index + ", value:" + this.mMPUValues[index]);
            SystemProperties.set(PERSIST_FLOGCAT_MPU_ENABLE, this.mMPUValues[index]);
        }
    }

    private int getMCULogState() {
        String value = SystemProperties.get(PERSIST_FLOGCAT_MCU_ENABLE, "1");
        Log.i(TAG, "getMCULogState() value:" + value);
        int index = 0;
        while (true) {
            String[] strArr = this.mMCUValues;
            if (index < strArr.length) {
                if (!strArr[index].equals(value)) {
                    index++;
                } else {
                    return index;
                }
            } else {
                return 0;
            }
        }
    }

    private void setMCULogState(int index) {
        if (index >= 0 && index < this.mMCUValues.length) {
            Log.i(TAG, "setMCULogState() index:" + index + ", value:" + this.mMCUValues[index]);
            SystemProperties.set(PERSIST_FLOGCAT_MCU_ENABLE, this.mMCUValues[index]);
        }
    }

    private int getLevelLogState() {
        String value = SystemProperties.get(PERSIST_FLOGCAT_LOG_LEVEL, "V");
        Log.i(TAG, "getLevelLogState() value:" + value);
        int index = 0;
        while (true) {
            String[] strArr = this.mLevelValues;
            if (index < strArr.length) {
                if (!strArr[index].equals(value)) {
                    index++;
                } else {
                    return index;
                }
            } else {
                return 0;
            }
        }
    }

    private void setLevelLogState(int index) {
        if (index >= 0 && index < this.mLevelValues.length) {
            Log.i(TAG, "setLevelLogState() index:" + index + ", value:" + this.mLevelValues[index]);
            SystemProperties.set(PERSIST_FLOGCAT_LOG_LEVEL, this.mLevelValues[index]);
        }
    }

    private int getTimeLogState() {
        String value = SystemProperties.get(PERSIST_FLOGCAT_LOG_TIME, "threadtime");
        Log.i(TAG, "getTimeLogState() value:" + value);
        int index = 0;
        while (true) {
            String[] strArr = this.mTimeValues;
            if (index < strArr.length) {
                if (!strArr[index].equals(value)) {
                    index++;
                } else {
                    return index;
                }
            } else {
                return 0;
            }
        }
    }

    private void setTimeLogState(int index) {
        if (index >= 0 && index < this.mTimeValues.length) {
            Log.i(TAG, "setTimeLogState() index:" + index + ", value:" + this.mTimeValues[index]);
            SystemProperties.set(PERSIST_FLOGCAT_LOG_TIME, this.mTimeValues[index]);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        int id = v.getId();
        if (id != 2131296319) {
            if (id == 2131296333) {
                downloadTBoxLog();
            }
        } else {
            this.mConfirmDialog = new ConfirmDialog(getContext());
            this.mConfirmDialog.setTipMessage(getString(R.string.log_dialog_tip));
            this.mConfirmDialog.setOnButtonClickListener(new ConfirmDialog.OnDialogButtonClickListener() { // from class: com.yftech.engineeringmode.fragment.LogFragment.1
                @Override // com.yftech.engineeringmode.dialog.ConfirmDialog.OnDialogButtonClickListener
                public void sureButtonClick() {
                    LogFragment.this.cleanLog();
                }

                @Override // com.yftech.engineeringmode.dialog.ConfirmDialog.OnDialogButtonClickListener
                public void cancelButtonClick() {
                }
            });
            this.mConfirmDialog.show();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cleanLog() {
        boolean delAtclog = DeleteUtil.delete("/sdcard/atclog");
        boolean delLog = DeleteUtil.delete("/log");
        Toast.makeText(getContext(), R.string.log_clean_success, 1).show();
        Log.i(TAG, "cleanLog: del /sdcard/atclog:" + delAtclog + " del /log:" + delLog);
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public void onCheckedChanged(CompoundButton compoundButton, boolean isChecked) {
        if (!compoundButton.isPressed()) {
            return;
        }
        if (compoundButton.getId() == 2131296566) {
            SystemProperties.set("persist.canlog.state", isChecked ? "1" : "0");
        } else if (compoundButton.getId() == 2131296567) {
            SystemProperties.set("yf.canlog.display", isChecked ? "1" : "0");
            setCanLogDisplayView(isChecked);
        }
    }

    private void setCanLogDisplayView(boolean show) {
        Log.i(TAG, "setCanLogDisplayView->show=" + show);
        if (show) {
            if (this.mCanLogFloatView == null) {
                this.mCanLogFloatView = new CanLogFloatView(getContext());
            }
            this.mCanLogFloatView.showFloatWindow();
        } else {
            CanLogFloatView canLogFloatView = this.mCanLogFloatView;
            if (canLogFloatView != null) {
                canLogFloatView.hideFloatWindow();
                this.mCanLogFloatView = null;
            }
        }
    }

    public void onStart() {
        super.onStart();
        Log.i(TAG, "onStart");
        if (isSupportTboxLog()) {
            CarTBoxSdkManager.getInstance().registerCarTBoxSdkCallback(this.mCarTBoxSdkCallback, new Handler(Looper.getMainLooper()));
        }
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onStop() {
        super.onStop();
        Log.i(TAG, "onStop");
        if (isSupportTboxLog()) {
            CarTBoxSdkManager.getInstance().unregisterCarTBoxSdkCallback(this.mCarTBoxSdkCallback);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setTBoxLogButtonEnabled(boolean enabled) {
        Button button = this.btn_tbox_log;
        if (button != null) {
            button.setEnabled(enabled);
        }
    }

    private void downloadTBoxLog() {
        List<String> udiskPaths = CarMediaDataManager.getInstance().getExistUdiskList();
        if (udiskPaths == null) {
            Log.i(TAG, "downloadTBoxLog->get udiskPaths fail");
            showToast(getString(R.string.log_tbox_download_get_usb_path_failed));
            return;
        }
        String path = BuildConfig.FLAVOR;
        Iterator<String> it = udiskPaths.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            String udiskPath = it.next();
            Log.i(TAG, "downloadTBoxLog->udiskPath=" + udiskPath);
            File file = new File(udiskPath);
            if (!file.exists()) {
                Log.i(TAG, "downloadTBoxLog->udiskPath is not exists");
            } else if (udiskPath.startsWith("/storage/udisk")) {
                path = udiskPath;
                break;
            }
        }
        if (TextUtils.isEmpty(path)) {
            Log.i(TAG, "downloadTBoxLog->no usb");
            showToast(getString(R.string.log_tbox_download_no_usb));
            return;
        }
        Log.i(TAG, "downloadTBoxLog->path=" + path);
        boolean result = CarTBoxSdkManager.getInstance().requestDownloadLog("/mnt/sdcard/log", path);
        if (!result) {
            Log.i(TAG, "downloadTBoxLog->result=" + result);
            this.tv_tbox_log_tip.setText(R.string.log_tbox_download_failed);
        }
    }

    private void showToast(String text) {
        Toast toast = this.mToast;
        if (toast != null) {
            toast.cancel();
        }
        this.mToast = Toast.makeText(getContext(), text, 1);
        this.mToast.show();
    }

    private boolean isSupportTboxLog() {
        boolean r = false;
        String name = SystemProperties.get("ro.product.name", BuildConfig.FLAVOR);
        String brand = SystemProperties.get("ro.product.vendor.brand", BuildConfig.FLAVOR);
        Log.i(TAG, "name=" + name + ", brand=" + brand);
        if (!TextUtils.isEmpty(name) && !TextUtils.isEmpty(brand)) {
            if (TextUtils.equals("CB_IHU12_C7", name) && TextUtils.equals("T79_G", brand)) {
                r = true;
            } else if (TextUtils.equals("CB_IHU23", name) && TextUtils.equals("A29_AIO", brand)) {
                r = true;
            } else if (TextUtils.equals("CB_IHU23_C1", name) && TextUtils.equals("A29_Y", brand)) {
                r = true;
            }
        }
        Log.i(TAG, "r=" + r);
        return r;
    }
}
