package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.adapter.CheckInfoAdapter;
import com.yftech.engineeringmode.model.CheckInfo;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class CheckInfoDialog extends Dialog {
    private final List<CheckInfo> mCheckInfos;

    public CheckInfoDialog(Context context, List<CheckInfo> checkInfos) {
        super(context, R.style.dialog_normal);
        this.mCheckInfos = checkInfos;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_check_info);
        Window window = getWindow();
        if (window != null) {
            WindowManager.LayoutParams params = window.getAttributes();
            params.flags = 8;
            params.width = -1;
            params.height = -1;
            params.type = 2055;
            params.gravity = 17;
            window.setAttributes(params);
        }
        setCanceledOnTouchOutside(false);
        setCancelable(false);
        RecyclerView recyclerView = findViewById(R.id.recycler_view);
        CheckInfoAdapter checkInfoAdapter = new CheckInfoAdapter(getContext(), this.mCheckInfos);
        recyclerView.setAdapter(checkInfoAdapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        findViewById(R.id.btn_close).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$CheckInfoDialog$6i2fiE-hk3S_oBDRCWushfzAn5c
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                CheckInfoDialog.this.lambda$onCreate$0$CheckInfoDialog(view);
            }
        });
    }

    public /* synthetic */ void lambda$onCreate$0$CheckInfoDialog(View v) {
        dismiss();
    }
}
