package com.yftech.engineeringmode.fragment;

import android.content.DialogInterface;
import android.os.Bundle;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.Switch;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.InputDialog;
import com.yftech.vehicle.sdk.CarMiscManager;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: /home/user/work/dex/classes2.dex */
public class OtherFragment extends BaseFragment implements CompoundButton.OnCheckedChangeListener {
    private final String HIDE_CAR = "com.yftech.engineeringmode.hide_car";
    private Switch hideSwitch;
    private InputDialog mWriteSNDialog;

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_other, container, false);
        initView(root);
        return root;
    }

    private void initView(View root) {
        this.hideSwitch = (Switch) root.findViewById(R.id.hide_car);
        root.findViewById(R.id.btn_write_sn_number).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.fragment.OtherFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                OtherFragment.this.showWriteSNDialog();
            }
        });
        this.hideSwitch.setOnCheckedChangeListener(this);
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        initData();
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onStop() {
        super.onStop();
        hideSNDialog();
    }

    private void initData() {
        this.hideSwitch.setChecked(Settings.Global.getInt(getContext().getContentResolver(), "com.yftech.engineeringmode.hide_car", 1) == 1);
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        if (buttonView.isPressed() && buttonView.getId() == 2131296413) {
            setHideCar(isChecked);
        }
    }

    private void setHideCar(boolean z) {
        Settings.Global.putInt(getContext().getContentResolver(), "com.yftech.engineeringmode.hide_car", z ? 1 : 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showWriteSNDialog() {
        this.mWriteSNDialog = new InputDialog(getContext());
        this.mWriteSNDialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.yftech.engineeringmode.fragment.OtherFragment.2
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface dialogInterface) {
                OtherFragment.this.mWriteSNDialog = null;
            }
        });
        this.mWriteSNDialog.setCallback(new InputDialog.Callback() { // from class: com.yftech.engineeringmode.fragment.OtherFragment.3
            @Override // com.yftech.engineeringmode.dialog.InputDialog.Callback
            public void onSure(View view, String sn) {
                try {
                    OtherFragment.this.checkInputSNValue(sn);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        this.mWriteSNDialog.show();
        this.mWriteSNDialog.setHint(getString(R.string.write_sn_hint_tip));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkInputSNValue(String sn) {
        Log.w("TAG", "checkInputSNValue, text: " + sn);
        if (TextUtils.isEmpty(sn) || sn.length() != 5) {
            showSNError(getString(R.string.write_sn_error));
            return;
        }
        if (!isAlphanumeric(sn)) {
            showSNError(getString(R.string.write_sn_error));
            return;
        }
        int ecu = Integer.parseInt(sn.substring(0, 4), 16);
        if (ecu < 1) {
            showSNError(getString(R.string.write_sn_error));
            return;
        }
        int pro = Integer.parseInt(sn.substring(4, 5), 16);
        if (pro < 1) {
            showSNError(getString(R.string.write_sn_error));
            return;
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMdd");
        String format = simpleDateFormat.format(new Date());
        Log.w("TAG", "checkInputSNValue: ,ecu:" + ecu + ",pro:" + pro + ",format:" + format);
        CarMiscManager.get().setFactoryModeEcuAndProductLineSerial(ecu, pro, format);
        InputDialog inputDialog = this.mWriteSNDialog;
        if (inputDialog != null) {
            inputDialog.dismiss();
        }
    }

    private void showSNError(String text) {
        InputDialog inputDialog = this.mWriteSNDialog;
        if (inputDialog != null) {
            inputDialog.showToast(text);
        }
    }

    public static boolean isAlphanumeric(String input) {
        Pattern pattern = Pattern.compile("^[a-fA-F0-9]+$");
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    private void hideSNDialog() {
        InputDialog inputDialog = this.mWriteSNDialog;
        if (inputDialog != null && inputDialog.isShowing()) {
            this.mWriteSNDialog.dismiss();
        }
    }
}
