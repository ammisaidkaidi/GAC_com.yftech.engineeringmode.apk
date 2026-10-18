package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import com.yftech.engineeringmode.R;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ConfirmDialog extends Dialog {
    private Button btn_cancel;
    private Button btn_sure;
    private OnDialogButtonClickListener dialogButtonClickListener;
    private String tvTipMessage;

    /* loaded from: /home/user/work/dex/classes2.dex */
    public interface OnDialogButtonClickListener {
        void cancelButtonClick();

        void sureButtonClick();
    }

    public ConfirmDialog(Context context) {
        super(context, R.style.dialog_normal);
    }

    public void setTipMessage(String message) {
        this.tvTipMessage = message;
    }

    @Override // android.app.Dialog
    protected void onStart() {
        super.onStart();
        if (this.tvTipMessage != null) {
            ((TextView) findViewById(R.id.tv_title)).setText(this.tvTipMessage);
        }
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_config_confirm_write);
        getWindow().setType(2055);
        setCanceledOnTouchOutside(false);
        setCancelable(false);
        this.btn_sure = (Button) findViewById(R.id.btn_sure);
        this.btn_cancel = (Button) findViewById(R.id.btn_cancel);
        this.btn_sure.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$ConfirmDialog$6ph7k78A-nZ-CEz7Z0Yu2NDYY4Q
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ConfirmDialog.this.lambda$onCreate$0$ConfirmDialog(view);
            }
        });
        this.btn_cancel.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$ConfirmDialog$02Docu704MtvC9yJj7V3Ji0j5I0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ConfirmDialog.this.lambda$onCreate$1$ConfirmDialog(view);
            }
        });
    }

    public /* synthetic */ void lambda$onCreate$0$ConfirmDialog(View v) {
        dismiss();
        OnDialogButtonClickListener onDialogButtonClickListener = this.dialogButtonClickListener;
        if (onDialogButtonClickListener != null) {
            onDialogButtonClickListener.sureButtonClick();
        }
    }

    public /* synthetic */ void lambda$onCreate$1$ConfirmDialog(View v) {
        dismiss();
    }

    public void setOnButtonClickListener(OnDialogButtonClickListener listener) {
        this.dialogButtonClickListener = listener;
    }
}
