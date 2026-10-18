package com.yftech.engineeringmode.fragment;

import android.app.ActivityManager;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.os.SystemProperties;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.ConfirmDialog;
import com.yftech.engineeringmode.util.FactorySetting;

/* loaded from: /home/user/work/dex/classes2.dex */
public class BackupRecoveryFragment extends BaseFragment implements View.OnClickListener, View.OnTouchListener {
    private static final String TAG = BackupRecoveryFragment.class.getSimpleName();
    RelativeLayout backupRelativeLayout;

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_backup_recovery, container, false);
        initView(root);
        return root;
    }

    private void initView(View root) {
        this.backupRelativeLayout = (RelativeLayout) root.findViewById(R.id.backup_recovery);
        this.backupRelativeLayout.setOnClickListener(this);
        this.backupRelativeLayout.setOnTouchListener(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startFactory() {
        Intent intent = new Intent("com.yftech.action.factory");
        getContext().sendBroadcast(intent);
        SystemProperties.set("yf.factory", "1");
        FactorySetting factorySetting = new FactorySetting();
        factorySetting.factoryReset(getContext());
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view.getId() == 2131296305) {
            if (ActivityManager.isUserAMonkey()) {
                Log.i(TAG, "backup_recovery monkey not factory recovery");
            } else {
                openConfirmDialog();
            }
        }
    }

    private void openConfirmDialog() {
        ConfirmDialog mConfirmDialog = new ConfirmDialog(getContext());
        mConfirmDialog.setTipMessage(getString(R.string.restore_factory_settings_tip));
        mConfirmDialog.setOnButtonClickListener(new ConfirmDialog.OnDialogButtonClickListener() { // from class: com.yftech.engineeringmode.fragment.BackupRecoveryFragment.1
            @Override // com.yftech.engineeringmode.dialog.ConfirmDialog.OnDialogButtonClickListener
            public void sureButtonClick() {
                BackupRecoveryFragment.this.startFactory();
            }

            @Override // com.yftech.engineeringmode.dialog.ConfirmDialog.OnDialogButtonClickListener
            public void cancelButtonClick() {
            }
        });
        mConfirmDialog.show();
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 0) {
            this.backupRelativeLayout.setBackgroundColor(Color.argb(33, 71, 79, 92));
            return false;
        }
        if (action == 1) {
            this.backupRelativeLayout.setBackgroundColor(Color.rgb(41, 41, 49));
            return false;
        }
        return false;
    }
}
