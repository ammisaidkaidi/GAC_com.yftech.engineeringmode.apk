package com.yftech.engineeringmode.fragment;

import android.app.ActivityManager;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.adapter.ConfigReadAdapter;
import com.yftech.engineeringmode.dialog.ConfirmDialog;
import com.yftech.engineeringmode.manager.ConfigManager;
import com.yftech.engineeringmode.util.Utils;
import java.io.IOException;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ConfigFragment extends BaseFragment implements AdapterView.OnItemSelectedListener {
    private static final String TAG = ConfigFragment.class.getSimpleName();
    private ConfigReadAdapter mConfigReadAdapter;
    private Spinner mSpinner;
    private final Runnable rebootRunnable = new Runnable() { // from class: com.yftech.engineeringmode.fragment.ConfigFragment.2
        @Override // java.lang.Runnable
        public void run() {
            Log.d(ConfigFragment.TAG, "Start reboot system.");
            ConfigFragment.reboot();
        }
    };

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_config, container, false);
        initView(root);
        return root;
    }

    private void initView(View root) {
        ConfigManager.getInstance().init(getContext());
        RecyclerView recyclerView = root.findViewById(R.id.recycler_view);
        recyclerView.setLayoutManager(new GridLayoutManager(getContext(), 10));
        this.mConfigReadAdapter = new ConfigReadAdapter(getContext());
        recyclerView.setAdapter(this.mConfigReadAdapter);
        this.mSpinner = (Spinner) root.findViewById(R.id.spinner);
        ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(getContext(), R.layout.spinner_item, ConfigManager.getInstance().getNames());
        arrayAdapter.setDropDownViewResource(R.layout.spinner_item_dropdown);
        this.mSpinner.setAdapter((SpinnerAdapter) arrayAdapter);
        this.mSpinner.setOnItemSelectedListener(this);
        root.findViewById(R.id.button).setVisibility(Utils.isSupportConfigSetting() ? 0 : 8);
        root.findViewById(R.id.button).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.fragment.-$$Lambda$ConfigFragment$VGRCGnuhVmBEw-FC-fiSaoTiZ4w
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ConfigFragment.this.lambda$initView$0$ConfigFragment(view);
            }
        });
    }

    public /* synthetic */ void lambda$initView$0$ConfigFragment(View v) {
        openConfirmDialogDialog();
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        this.mSpinner.setSelection(0);
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        if (position >= 0 && position < ConfigManager.getInstance().getNames().size()) {
            String key = ConfigManager.getInstance().getNames().get(position);
            this.mConfigReadAdapter.setData(ConfigManager.getInstance().getConfigs().get(key));
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onNothingSelected(AdapterView<?> parent) {
    }

    private void openConfirmDialogDialog() {
        ConfirmDialog confirmDialog = new ConfirmDialog(getContext());
        confirmDialog.setOnButtonClickListener(new ConfirmDialog.OnDialogButtonClickListener() { // from class: com.yftech.engineeringmode.fragment.ConfigFragment.1
            @Override // com.yftech.engineeringmode.dialog.ConfirmDialog.OnDialogButtonClickListener
            public void sureButtonClick() {
                byte[] data = ConfigFragment.this.mConfigReadAdapter.getData();
                String selectItem = ConfigFragment.this.mSpinner.getSelectedItem().toString();
                Log.i(ConfigFragment.TAG, "sureButtonClick() --> selectItem:" + selectItem);
                if (selectItem.contains("0100")) {
                    ConfigManager.getInstance().setConfig0100(data);
                } else {
                    ConfigManager.getInstance().setConfig0101(data);
                }
                Handler rebootHandler = new Handler();
                rebootHandler.postDelayed(ConfigFragment.this.rebootRunnable, 3000L);
            }

            @Override // com.yftech.engineeringmode.dialog.ConfirmDialog.OnDialogButtonClickListener
            public void cancelButtonClick() {
            }
        });
        confirmDialog.show();
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
