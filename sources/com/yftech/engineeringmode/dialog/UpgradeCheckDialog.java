package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.yftech.engineeringmode.R;

/* loaded from: /home/user/work/dex/classes2.dex */
public class UpgradeCheckDialog extends Dialog {
    private Button btn_cancel;
    private Button btn_sure;
    private CheckBox ck_mcu;
    private CheckBox ck_os;
    private CheckBox ck_screen;
    private CheckBox ck_screen_mcu;
    private RelativeLayout layout_checkbox;
    private boolean mHasMCUUpgradeFile;
    private boolean mHasOSUpgradeFile;
    private boolean mHasScreenMcuUpgradeFile;
    private boolean mHasScreenUpgradeFile;
    private OnUpgradeCheckDialogListener mOnUpgradeCheckDialogListener;
    private TextView tv_content;

    /* loaded from: /home/user/work/dex/classes2.dex */
    public interface OnUpgradeCheckDialogListener {
        void onCancel();

        void onUpgrade(boolean z, boolean z2, boolean z3, boolean z4);
    }

    public UpgradeCheckDialog(Context context) {
        super(context, R.style.dialog_normal);
    }

    public void show(boolean hasMCUUpgradeFile, boolean hasOSUpgradeFile, boolean hasScreenUpgradeFile, boolean hasScreenMcuUpgradeFile) {
        this.mHasMCUUpgradeFile = hasMCUUpgradeFile;
        this.mHasOSUpgradeFile = hasOSUpgradeFile;
        this.mHasScreenUpgradeFile = hasScreenUpgradeFile;
        this.mHasScreenMcuUpgradeFile = hasScreenMcuUpgradeFile;
        show();
    }

    public void setOnUpgradeCheckDialogListener(OnUpgradeCheckDialogListener listener) {
        this.mOnUpgradeCheckDialogListener = listener;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_upgrade_check);
        Window window = getWindow();
        if (window != null) {
            window.setType(2055);
            WindowManager.LayoutParams params = window.getAttributes();
            params.flags = 8;
            window.setAttributes(params);
        }
        setCanceledOnTouchOutside(false);
        setCancelable(false);
        this.btn_sure = (Button) findViewById(R.id.btn_sure);
        this.btn_cancel = (Button) findViewById(R.id.btn_cancel);
        this.tv_content = (TextView) findViewById(R.id.tv_content);
        this.layout_checkbox = (RelativeLayout) findViewById(R.id.layout_checkbox);
        this.ck_mcu = (CheckBox) findViewById(R.id.ck_mcu);
        this.ck_os = (CheckBox) findViewById(R.id.ck_os);
        this.ck_screen = (CheckBox) findViewById(R.id.ck_screen);
        this.ck_screen_mcu = (CheckBox) findViewById(R.id.ck_screen_mcu);
        this.btn_sure.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.UpgradeCheckDialog.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (!UpgradeCheckDialog.this.ck_mcu.isChecked() && !UpgradeCheckDialog.this.ck_os.isChecked() && !UpgradeCheckDialog.this.ck_screen.isChecked() && !UpgradeCheckDialog.this.ck_screen_mcu.isChecked()) {
                    return;
                }
                UpgradeCheckDialog.this.dismiss();
                if (UpgradeCheckDialog.this.mOnUpgradeCheckDialogListener != null) {
                    UpgradeCheckDialog.this.mOnUpgradeCheckDialogListener.onUpgrade(UpgradeCheckDialog.this.ck_mcu.isChecked(), UpgradeCheckDialog.this.ck_os.isChecked(), UpgradeCheckDialog.this.ck_screen.isChecked(), UpgradeCheckDialog.this.ck_screen_mcu.isChecked());
                }
            }
        });
        this.btn_cancel.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.UpgradeCheckDialog.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                UpgradeCheckDialog.this.dismiss();
                if (UpgradeCheckDialog.this.mOnUpgradeCheckDialogListener != null) {
                    UpgradeCheckDialog.this.mOnUpgradeCheckDialogListener.onCancel();
                }
            }
        });
        this.ck_mcu.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.yftech.engineeringmode.dialog.UpgradeCheckDialog.3
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (buttonView.isPressed()) {
                    UpgradeCheckDialog.this.updateButton();
                }
            }
        });
        this.ck_os.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.yftech.engineeringmode.dialog.UpgradeCheckDialog.4
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (buttonView.isPressed()) {
                    UpgradeCheckDialog.this.updateButton();
                }
            }
        });
        this.ck_screen.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.yftech.engineeringmode.dialog.UpgradeCheckDialog.5
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (buttonView.isPressed()) {
                    if (isChecked) {
                        UpgradeCheckDialog.this.ck_screen.setChecked(true);
                        UpgradeCheckDialog.this.ck_screen_mcu.setChecked(false);
                    } else {
                        UpgradeCheckDialog.this.ck_screen.setChecked(false);
                    }
                    UpgradeCheckDialog.this.updateButton();
                }
            }
        });
        this.ck_screen_mcu.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.yftech.engineeringmode.dialog.UpgradeCheckDialog.6
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (buttonView.isPressed()) {
                    if (isChecked) {
                        UpgradeCheckDialog.this.ck_screen_mcu.setChecked(true);
                        UpgradeCheckDialog.this.ck_screen.setChecked(false);
                    } else {
                        UpgradeCheckDialog.this.ck_screen_mcu.setChecked(false);
                    }
                    UpgradeCheckDialog.this.updateButton();
                }
            }
        });
    }

    @Override // android.app.Dialog
    protected void onStart() {
        super.onStart();
        boolean hasUpgradeFile = this.mHasMCUUpgradeFile || this.mHasOSUpgradeFile || this.mHasScreenUpgradeFile || this.mHasScreenMcuUpgradeFile;
        this.tv_content.setVisibility(!hasUpgradeFile ? 0 : 8);
        this.layout_checkbox.setVisibility(hasUpgradeFile ? 0 : 8);
        this.ck_mcu.setVisibility(this.mHasMCUUpgradeFile ? 0 : 8);
        this.ck_os.setVisibility(this.mHasOSUpgradeFile ? 0 : 8);
        this.ck_screen.setVisibility(this.mHasScreenUpgradeFile ? 0 : 8);
        this.ck_screen_mcu.setVisibility(this.mHasScreenMcuUpgradeFile ? 0 : 8);
        this.ck_mcu.setChecked(this.mHasMCUUpgradeFile);
        this.ck_os.setChecked(this.mHasOSUpgradeFile);
        this.ck_screen.setChecked(this.mHasScreenUpgradeFile);
        if (!this.ck_screen.isChecked()) {
            this.ck_screen_mcu.setChecked(this.mHasScreenMcuUpgradeFile);
        }
        updateButton();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateButton() {
        boolean z = true;
        boolean hasUpgradeFile = this.mHasMCUUpgradeFile || this.mHasOSUpgradeFile || this.mHasScreenUpgradeFile || this.mHasScreenMcuUpgradeFile;
        this.btn_cancel.setText(hasUpgradeFile ? R.string.upgrade_dialog_btn_cancel_text : R.string.upgrade_dialog_btn_submit_text);
        this.btn_cancel.setBackgroundResource(hasUpgradeFile ? R.drawable.selector_dialog_right_btn_bg : R.drawable.selector_dialog_one_btn_bg);
        this.btn_sure.setVisibility(hasUpgradeFile ? 0 : 8);
        Button button = this.btn_sure;
        if (!this.ck_mcu.isChecked() && !this.ck_os.isChecked() && !this.ck_screen.isChecked() && !this.ck_screen_mcu.isChecked()) {
            z = false;
        }
        button.setEnabled(z);
    }
}
