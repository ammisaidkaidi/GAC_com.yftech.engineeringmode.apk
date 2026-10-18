package com.yftech.engineeringmode.fragment;

import android.os.Bundle;
import android.text.method.ScrollingMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.manager.UpgradeManager;

/* loaded from: /home/user/work/dex/classes2.dex */
public class UsbUpgradeFragment extends BaseFragment {
    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_usb_upgrade, container, false);
        initView(root);
        return root;
    }

    private void initView(View root) {
        ((TextView) root.findViewById(R.id.tv_content)).setMovementMethod(ScrollingMovementMethod.getInstance());
        root.findViewById(R.id.btn_check).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.fragment.-$$Lambda$UsbUpgradeFragment$yaUHj_XyHW1UDrnCNtOnb-XYnkg
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                UpgradeManager.getInstance().checkUpgradeFile(true, null, false);
            }
        });
    }
}
