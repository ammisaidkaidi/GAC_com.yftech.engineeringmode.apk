package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.yftech.car.upgrade.CarUpgradeManager;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.manager.UpgradeManager;
import com.yftech.vehicle.sdk.CarBspManager;

/* loaded from: /home/user/work/dex/classes2.dex */
public class UpgradeDialog extends Dialog implements View.OnClickListener {
    private static final String TAG = UpgradeDialog.class.getSimpleName();
    private CarUpgradeManager.CarUpgradeCallback mCarUpgradeCallback;
    private Handler mHandlerCarUpgradeCallback;
    private boolean mIsUpgradeMCU;
    private boolean mIsUpgradeOS;
    private boolean mIsUpgradeScreen;
    private boolean mIsUpgradeScreenMcu;
    private int mUpgradeCount;
    private int mUpgradeEndCount;
    private Button mbtnConfirm;
    private ProgressBar mpbUpgradeProgress;
    private TextView mtvUpgradeProgress;
    private TextView mtvUpgradeTip;

    static /* synthetic */ int access$308(UpgradeDialog x0) {
        int i = x0.mUpgradeEndCount;
        x0.mUpgradeEndCount = i + 1;
        return i;
    }

    public UpgradeDialog(Context context) {
        super(context, R.style.dialog_normal);
        this.mHandlerCarUpgradeCallback = new Handler();
        this.mCarUpgradeCallback = new CarUpgradeManager.CarUpgradeCallback() { // from class: com.yftech.engineeringmode.dialog.UpgradeDialog.1
            public void onUpgradeProgress(int module, int progress) {
                super.onUpgradeProgress(module, progress);
                Log.i(UpgradeDialog.TAG, "onUpgradeProgress() module:" + module + ", progress:" + progress);
                UpgradeDialog.this.mpbUpgradeProgress.setProgress(progress);
                UpgradeDialog.this.mtvUpgradeProgress.setText(progress + "%");
            }

            public void onUpgradeState(int module, int state) {
                super.onUpgradeState(module, state);
                Log.i(UpgradeDialog.TAG, "onUpgradeState() module:" + module + ", state:" + state);
                if (module != 1) {
                    if (module != 2) {
                        if (module == 3) {
                            String prefix = UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_screen);
                            switch (state) {
                                case 1:
                                    UpgradeDialog.access$308(UpgradeDialog.this);
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_success));
                                    UpgradeDialog.this.mpbUpgradeProgress.setProgress(100);
                                    UpgradeDialog.this.mtvUpgradeProgress.setText("100%");
                                    if (UpgradeDialog.this.mUpgradeEndCount >= UpgradeDialog.this.mUpgradeCount) {
                                        UpgradeDialog.this.mbtnConfirm.setVisibility(0);
                                        UpgradeManager.isUpdating = false;
                                        UpgradeDialog.this.requestBspInfo();
                                        break;
                                    }
                                    break;
                                case 2:
                                    UpgradeDialog.access$308(UpgradeDialog.this);
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_failed));
                                    if (UpgradeDialog.this.mUpgradeEndCount >= UpgradeDialog.this.mUpgradeCount) {
                                        UpgradeDialog.this.mbtnConfirm.setVisibility(0);
                                        UpgradeManager.isUpdating = false;
                                        break;
                                    }
                                    break;
                                case 3:
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_start));
                                    break;
                                case 4:
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_copying));
                                    break;
                                case 5:
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_checking));
                                    break;
                                case 6:
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_requesting));
                                    break;
                                case 7:
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_upgrading));
                                    break;
                            }
                        } else if (module == 5) {
                            String prefix2 = UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_screen_mcu);
                            switch (state) {
                                case 1:
                                    UpgradeDialog.access$308(UpgradeDialog.this);
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix2 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_success));
                                    UpgradeDialog.this.mpbUpgradeProgress.setProgress(100);
                                    UpgradeDialog.this.mtvUpgradeProgress.setText("100%");
                                    if (UpgradeDialog.this.mUpgradeEndCount >= UpgradeDialog.this.mUpgradeCount) {
                                        UpgradeDialog.this.mbtnConfirm.setVisibility(0);
                                        UpgradeManager.isUpdating = false;
                                        UpgradeDialog.this.requestBspInfo();
                                        break;
                                    }
                                    break;
                                case 2:
                                    UpgradeDialog.access$308(UpgradeDialog.this);
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix2 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_failed));
                                    if (UpgradeDialog.this.mUpgradeEndCount >= UpgradeDialog.this.mUpgradeCount) {
                                        UpgradeDialog.this.mbtnConfirm.setVisibility(0);
                                        UpgradeManager.isUpdating = false;
                                        break;
                                    }
                                    break;
                                case 3:
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix2 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_start));
                                    break;
                                case 4:
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix2 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_copying));
                                    break;
                                case 5:
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix2 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_checking));
                                    break;
                                case 6:
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix2 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_requesting));
                                    break;
                                case 7:
                                    UpgradeDialog.this.mtvUpgradeTip.setText(prefix2 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_upgrading));
                                    break;
                            }
                        }
                    } else {
                        String prefix3 = UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_mcu);
                        switch (state) {
                            case 1:
                                UpgradeDialog.access$308(UpgradeDialog.this);
                                UpgradeDialog.this.mtvUpgradeTip.setText(prefix3 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_success));
                                UpgradeDialog.this.mpbUpgradeProgress.setProgress(100);
                                UpgradeDialog.this.mtvUpgradeProgress.setText("100%");
                                if (UpgradeDialog.this.mUpgradeEndCount >= UpgradeDialog.this.mUpgradeCount) {
                                    UpgradeDialog.this.mbtnConfirm.setVisibility(0);
                                    UpgradeManager.isUpdating = false;
                                    break;
                                }
                                break;
                            case 2:
                                UpgradeDialog.access$308(UpgradeDialog.this);
                                UpgradeDialog.this.mtvUpgradeTip.setText(prefix3 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_failed));
                                if (UpgradeDialog.this.mUpgradeEndCount >= UpgradeDialog.this.mUpgradeCount) {
                                    UpgradeDialog.this.mbtnConfirm.setVisibility(0);
                                    UpgradeManager.isUpdating = false;
                                    break;
                                }
                                break;
                            case 3:
                                UpgradeDialog.this.mtvUpgradeTip.setText(prefix3 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_start));
                                break;
                            case 4:
                                UpgradeDialog.this.mtvUpgradeTip.setText(prefix3 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_copying));
                                break;
                            case 5:
                                UpgradeDialog.this.mtvUpgradeTip.setText(prefix3 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_checking));
                                break;
                            case 6:
                                UpgradeDialog.this.mtvUpgradeTip.setText(prefix3 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_requesting));
                                break;
                            case 7:
                                UpgradeDialog.this.mtvUpgradeTip.setText(prefix3 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_upgrading));
                                break;
                        }
                    }
                } else {
                    String prefix4 = UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_os);
                    switch (state) {
                        case 1:
                            UpgradeDialog.access$308(UpgradeDialog.this);
                            UpgradeDialog.this.mtvUpgradeTip.setText(prefix4 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_success));
                            UpgradeDialog.this.mpbUpgradeProgress.setProgress(100);
                            UpgradeDialog.this.mtvUpgradeProgress.setText("100%");
                            if (UpgradeDialog.this.mUpgradeEndCount >= UpgradeDialog.this.mUpgradeCount) {
                                UpgradeDialog.this.mbtnConfirm.setVisibility(0);
                                UpgradeManager.isUpdating = false;
                                break;
                            }
                            break;
                        case 2:
                            UpgradeDialog.access$308(UpgradeDialog.this);
                            UpgradeDialog.this.mtvUpgradeTip.setText(prefix4 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_failed));
                            if (UpgradeDialog.this.mUpgradeEndCount >= UpgradeDialog.this.mUpgradeCount) {
                                UpgradeDialog.this.mbtnConfirm.setVisibility(0);
                                UpgradeManager.isUpdating = false;
                                break;
                            }
                            break;
                        case 3:
                            UpgradeDialog.this.mtvUpgradeTip.setText(prefix4 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_start));
                            break;
                        case 4:
                            UpgradeDialog.this.mtvUpgradeTip.setText(prefix4 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_copying));
                            break;
                        case 5:
                            UpgradeDialog.this.mtvUpgradeTip.setText(prefix4 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_checking));
                            break;
                        case 6:
                            UpgradeDialog.this.mtvUpgradeTip.setText(prefix4 + UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_upgrading));
                            break;
                    }
                }
                if (state == Integer.MAX_VALUE) {
                    UpgradeDialog.this.mtvUpgradeTip.setText(UpgradeDialog.this.getContext().getResources().getString(R.string.upgrade_checkbox_server_die));
                    UpgradeDialog.this.mbtnConfirm.setVisibility(0);
                }
            }
        };
    }

    public void start(boolean isUpgradeMCU, boolean isUpgradeOS, boolean isUpgradeScreen, boolean isUpgradeScreenMcu) {
        Log.i(TAG, "start() isUpgradeMCU:" + isUpgradeMCU + ", isUpgradeOS:" + isUpgradeOS + ", isUpgradeScreen:" + isUpgradeScreen + ", isUpgradeScreenMcu");
        if (!isUpgradeMCU && !isUpgradeOS && !isUpgradeScreen && !isUpgradeScreenMcu) {
            return;
        }
        this.mUpgradeCount = 0;
        this.mUpgradeEndCount = 0;
        if (isUpgradeMCU) {
            this.mUpgradeCount++;
        }
        if (isUpgradeOS) {
            this.mUpgradeCount++;
        }
        if (isUpgradeScreen) {
            this.mUpgradeCount++;
        }
        if (isUpgradeScreenMcu) {
            this.mUpgradeCount++;
        }
        this.mIsUpgradeMCU = isUpgradeMCU;
        this.mIsUpgradeOS = isUpgradeOS;
        this.mIsUpgradeScreen = isUpgradeScreen;
        this.mIsUpgradeScreenMcu = isUpgradeScreenMcu;
        show();
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        View root = LayoutInflater.from(getContext()).inflate(R.layout.dialog_upgrade, (ViewGroup) null);
        setContentView(root);
        Window window = getWindow();
        if (window != null) {
            WindowManager.LayoutParams params = window.getAttributes();
            params.flags = 8;
            params.gravity = 17;
            params.width = -1;
            params.height = -1;
            params.type = 2055;
            window.setAttributes(params);
        }
        setCanceledOnTouchOutside(false);
        setCancelable(false);
        initView(root);
    }

    private void initView(View root) {
        this.mtvUpgradeTip = (TextView) root.findViewById(R.id.tvUpgradeTip);
        this.mtvUpgradeProgress = (TextView) root.findViewById(R.id.tvUpgradeProgress);
        this.mpbUpgradeProgress = (ProgressBar) root.findViewById(R.id.progressBar);
        this.mbtnConfirm = (Button) root.findViewById(R.id.btnConfirm);
        this.mbtnConfirm.setOnClickListener(this);
    }

    @Override // android.app.Dialog
    protected void onStart() {
        super.onStart();
        Log.i(TAG, "onStart()");
        initData();
        if (this.mIsUpgradeMCU) {
            CarUpgradeManager.getInstance().registerCarMCUUpgradeCallback(this.mCarUpgradeCallback, this.mHandlerCarUpgradeCallback);
        }
        if (this.mIsUpgradeOS) {
            CarUpgradeManager.getInstance().registerCarOSUpgradeCallback(this.mCarUpgradeCallback, this.mHandlerCarUpgradeCallback);
        }
        if (this.mIsUpgradeScreen) {
            CarUpgradeManager.getInstance().registerCarScreenUpgradeCallback(this.mCarUpgradeCallback, this.mHandlerCarUpgradeCallback);
        }
        if (this.mIsUpgradeScreenMcu) {
            CarUpgradeManager.getInstance().registerCarScreenMcuUpgradeCallback(this.mCarUpgradeCallback, this.mHandlerCarUpgradeCallback);
        }
        startUpgrade();
    }

    @Override // android.app.Dialog
    protected void onStop() {
        super.onStop();
        Log.i(TAG, "onStop()");
        if (this.mIsUpgradeMCU) {
            CarUpgradeManager.getInstance().unregisterCarMCUUpgradeCallback(this.mCarUpgradeCallback);
        }
        if (this.mIsUpgradeOS) {
            CarUpgradeManager.getInstance().unregisterCarOSUpgradeCallback(this.mCarUpgradeCallback);
        }
        if (this.mIsUpgradeScreen) {
            CarUpgradeManager.getInstance().unregisterCarScreenUpgradeCallback(this.mCarUpgradeCallback);
        }
        if (this.mIsUpgradeScreenMcu) {
            CarUpgradeManager.getInstance().unregisterCarScreenMcuUpgradeCallback(this.mCarUpgradeCallback);
        }
    }

    private void initData() {
        this.mtvUpgradeTip.setText(getContext().getString(R.string.upgrade_prepare));
        this.mpbUpgradeProgress.setProgress(0);
        this.mtvUpgradeProgress.setText("0%");
        this.mbtnConfirm.setVisibility(8);
    }

    private void startUpgrade() {
        int addMCUUpgradeModuleResult = 0;
        int addOSUpgradeModuleResult = 0;
        int addScreenUpgradeModuleResult = 0;
        int addScreenMcuUpgradeModuleResult = 0;
        if (this.mIsUpgradeMCU) {
            addMCUUpgradeModuleResult = CarUpgradeManager.getInstance().addMCUUpgradeModule(UpgradeManager.MCU_UPGRADE_PATH);
        }
        if (this.mIsUpgradeOS) {
            addOSUpgradeModuleResult = CarUpgradeManager.getInstance().addOSUpgradeModule(UpgradeManager.OS_UPGRADE_PATH);
        }
        if (this.mIsUpgradeScreen) {
            addScreenUpgradeModuleResult = CarUpgradeManager.getInstance().addScreenUpgradeModule(UpgradeManager.SCREEN_UPGRADE_PATH);
        }
        if (this.mIsUpgradeScreenMcu) {
            addScreenMcuUpgradeModuleResult = CarUpgradeManager.getInstance().addScreenMcuUpgradeModule(UpgradeManager.SCREEN_MCU_UPGRADE_PATH);
        }
        Log.i(TAG, "startUpgrade() addMCUUpgradeModuleResult:" + addMCUUpgradeModuleResult + ", addOSUpgradeModuleResult:" + addOSUpgradeModuleResult + ", addScreenUpgradeModuleResult:" + addScreenUpgradeModuleResult + ", addScreenMcuUpgradeModuleResult:" + addScreenMcuUpgradeModuleResult);
        if (addMCUUpgradeModuleResult == 1 || addOSUpgradeModuleResult == 1 || addScreenUpgradeModuleResult == 1 || addScreenMcuUpgradeModuleResult == 1) {
            CarUpgradeManager.getInstance().startUpgrade();
            return;
        }
        this.mtvUpgradeTip.setText("升级文件添加失败");
        this.mbtnConfirm.setVisibility(0);
        UpgradeManager.isUpdating = false;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v.getId() == 2131296315) {
            dismiss();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void requestBspInfo() {
        boolean hardwareResult = CarBspManager.get().queryBspInfoCmd((byte) 7);
        boolean softwareResult = CarBspManager.get().queryBspInfoCmd((byte) 6);
        if (hardwareResult || softwareResult) {
            new Handler().postDelayed(new Runnable() { // from class: com.yftech.engineeringmode.dialog.UpgradeDialog.2
                @Override // java.lang.Runnable
                public void run() {
                    Intent intent = new Intent("com.yftech.engineeringmode.ProductInfo");
                    UpgradeDialog.this.getContext().sendBroadcast(intent);
                }
            }, 1200L);
        }
        Log.i(TAG, "requestBspInfo hardwareResult:" + hardwareResult + " softwareResult:" + softwareResult);
    }
}
