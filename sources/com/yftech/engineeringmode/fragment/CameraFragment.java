package com.yftech.engineeringmode.fragment;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import com.yftech.engineeringmode.R;

/* loaded from: /home/user/work/dex/classes2.dex */
public class CameraFragment extends BaseFragment implements View.OnClickListener {
    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_camera, container, false);
        initView(root);
        return root;
    }

    private void initView(View root) {
        ((Button) root.findViewById(R.id.btn_camera_rvc)).setOnClickListener(this);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view.getId() == 2131296316) {
            startRvc();
        }
    }

    private void startRvc() {
        Intent intent = new Intent("com.yftech.avmservice.AVM_SHOW");
        intent.setComponent(new ComponentName("com.yftech.avmservice", "com.yftech.avmservice.BootCompletedReceiver"));
        getActivity().sendBroadcast(intent);
    }
}
