package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.manager.ScreenUpgradeCA1105Manager;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ScreenUpgradeCA1105Dialog extends Dialog implements View.OnClickListener, ScreenUpgradeCA1105Manager.ScreenUpgradeCA1105Listener {
    private Button btn_cancel;
    private Button btn_sure;
    private boolean mIsUsbUpgrade;
    private Handler mMainHandler;
    private TextView tv_cur_version;
    private TextView tv_file_version;
    private TextView tv_state;

    public ScreenUpgradeCA1105Dialog(Context context, boolean isUsbUpgrade) {
        super(context, R.style.dialog_normal);
        this.mMainHandler = new Handler(Looper.getMainLooper());
        this.mIsUsbUpgrade = isUsbUpgrade;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_screen_upgrade_ca1105);
        getWindow().setType(2055);
        setCanceledOnTouchOutside(false);
        setCancelable(false);
        this.tv_state = (TextView) findViewById(R.id.tv_state);
        this.tv_cur_version = (TextView) findViewById(R.id.tv_cur_version);
        this.tv_file_version = (TextView) findViewById(R.id.tv_file_version);
        this.btn_sure = (Button) findViewById(R.id.btn_sure);
        this.btn_cancel = (Button) findViewById(R.id.btn_cancel);
        this.btn_sure.setOnClickListener(this);
        this.btn_cancel.setOnClickListener(this);
        initView();
    }

    private void initView() {
        this.tv_cur_version.setText(getContext().getString(R.string.screen_upgrade_cur_version, ScreenUpgradeCA1105Manager.getInstance().getCurScreenVersion()));
        if (this.mIsUsbUpgrade) {
            if (ScreenUpgradeCA1105Manager.getInstance().checkScreenUpgradeFile()) {
                this.tv_state.setText(R.string.screen_upgrade_upgrade_tip);
                this.tv_file_version.setText(getContext().getString(R.string.screen_upgrade_file_version, ScreenUpgradeCA1105Manager.getInstance().getScreenUpgradeFileVersion()));
                this.btn_sure.setVisibility(0);
                this.btn_cancel.setVisibility(0);
                return;
            }
            this.tv_state.setText(R.string.screen_upgrade_not_file);
            this.tv_file_version.setText(BuildConfig.FLAVOR);
            this.btn_sure.setVisibility(8);
            this.btn_cancel.setVisibility(0);
        }
    }

    @Override // android.app.Dialog
    protected void onStart() {
        super.onStart();
        ScreenUpgradeCA1105Manager.getInstance().addScreenUpgradeCA1105Listener(this);
        Log.i("ScreenUpgradeCA1105Dialog", "onStart() isUsbUpgrade:" + this.mIsUsbUpgrade);
        if (!this.mIsUsbUpgrade) {
            ScreenUpgradeCA1105Manager.getInstance().start();
        }
    }

    @Override // android.app.Dialog
    protected void onStop() {
        super.onStop();
        ScreenUpgradeCA1105Manager.getInstance().removeScreenUpgradeCA1105Listener(this);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        int id = v.getId();
        if (id == 2131296317) {
            dismiss();
        } else if (id == 2131296332) {
            ScreenUpgradeCA1105Manager.getInstance().startUpgrade();
        }
    }

    @Override // com.yftech.engineeringmode.manager.ScreenUpgradeCA1105Manager.ScreenUpgradeCA1105Listener
    public void onScreenUpgradeCA1105State(final int state) {
        this.mMainHandler.post(new Runnable() { // from class: com.yftech.engineeringmode.dialog.ScreenUpgradeCA1105Dialog.1
            @Override // java.lang.Runnable
            public void run() {
                ScreenUpgradeCA1105Dialog.this.btn_sure.setVisibility(0);
                ScreenUpgradeCA1105Dialog.this.btn_cancel.setVisibility(0);
                int i = state;
                if (i == 1) {
                    ScreenUpgradeCA1105Dialog.this.tv_state.setText(R.string.screen_upgrade_upgrading);
                    ScreenUpgradeCA1105Dialog.this.btn_sure.setVisibility(8);
                    return;
                }
                if (i == 2) {
                    ScreenUpgradeCA1105Dialog.this.tv_state.setText(R.string.screen_upgrade_upgrade_finish);
                    ScreenUpgradeCA1105Dialog.this.tv_cur_version.setText(ScreenUpgradeCA1105Dialog.this.getContext().getString(R.string.screen_upgrade_cur_version, ScreenUpgradeCA1105Manager.getInstance().getCurScreenVersion()));
                    ScreenUpgradeCA1105Dialog.this.btn_sure.setVisibility(8);
                } else if (i == 4) {
                    ScreenUpgradeCA1105Dialog.this.tv_state.setText(R.string.screen_upgrade_not_file);
                    ScreenUpgradeCA1105Dialog.this.tv_file_version.setText(BuildConfig.FLAVOR);
                    ScreenUpgradeCA1105Dialog.this.btn_sure.setVisibility(8);
                } else if (i == 5) {
                    ScreenUpgradeCA1105Dialog.this.tv_state.setText(R.string.screen_upgrade_copy_fail);
                    ScreenUpgradeCA1105Dialog.this.btn_sure.setVisibility(8);
                } else if (i == 3) {
                    ScreenUpgradeCA1105Dialog.this.tv_state.setText(R.string.screen_upgrade_upgrade_fail);
                    ScreenUpgradeCA1105Dialog.this.btn_sure.setVisibility(8);
                }
            }
        });
    }
}
