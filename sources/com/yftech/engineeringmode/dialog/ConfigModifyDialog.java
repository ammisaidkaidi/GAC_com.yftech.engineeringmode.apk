package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import com.yftech.engineeringmode.R;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ConfigModifyDialog extends Dialog {
    private Button btn_cancel;
    private Button btn_sure;
    private EditText editText;
    private OnConfigModifyDialogListener mOnConfigModifyDialogListener;
    private int mPosition;
    private TextView tv_title;

    /* loaded from: /home/user/work/dex/classes2.dex */
    public interface OnConfigModifyDialogListener {
        void onValue(int i, byte b);
    }

    public ConfigModifyDialog(Context context) {
        super(context, R.style.dialog_normal);
    }

    public void setOnConfigModifyDialogListener(OnConfigModifyDialogListener listener) {
        this.mOnConfigModifyDialogListener = listener;
    }

    public void setView(int position, String title, String value) {
        this.mPosition = position;
        TextView textView = this.tv_title;
        if (textView != null) {
            textView.setText(title);
        }
        EditText editText = this.editText;
        if (editText != null) {
            editText.setText(value);
        }
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_config_modify);
        getWindow().setType(2055);
        setCanceledOnTouchOutside(false);
        setCancelable(false);
        this.btn_sure = (Button) findViewById(R.id.btn_sure);
        this.btn_cancel = (Button) findViewById(R.id.btn_cancel);
        this.tv_title = (TextView) findViewById(R.id.tv_title);
        this.editText = (EditText) findViewById(R.id.editText);
        this.editText.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$ConfigModifyDialog$Z2SV1xgof-ZbLcPMLxMG024BPLE
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ConfigModifyDialog.this.lambda$onCreate$0$ConfigModifyDialog(view);
            }
        });
        this.btn_sure.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$ConfigModifyDialog$cx7xxkOvhEKKywaadtK4i0a4d6I
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ConfigModifyDialog.this.lambda$onCreate$1$ConfigModifyDialog(view);
            }
        });
        this.btn_cancel.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$ConfigModifyDialog$DbdTZXNalNoobD7I5bZmbRJ6cPg
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ConfigModifyDialog.this.lambda$onCreate$2$ConfigModifyDialog(view);
            }
        });
        this.editText.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$ConfigModifyDialog$QtOQV9rv8-7IQQlJbrijuIVXK0E
            @Override // android.widget.TextView.OnEditorActionListener
            public final boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
                return ConfigModifyDialog.this.lambda$onCreate$3$ConfigModifyDialog(textView, i, keyEvent);
            }
        });
    }

    public /* synthetic */ void lambda$onCreate$0$ConfigModifyDialog(View v) {
        setEditTextRequestFocus(this.editText, true);
    }

    public /* synthetic */ void lambda$onCreate$1$ConfigModifyDialog(View v) {
        dismiss();
        OnConfigModifyDialogListener onConfigModifyDialogListener = this.mOnConfigModifyDialogListener;
        if (onConfigModifyDialogListener != null) {
            onConfigModifyDialogListener.onValue(this.mPosition, (byte) Integer.parseInt(this.editText.getText().toString(), 16));
        }
    }

    public /* synthetic */ void lambda$onCreate$2$ConfigModifyDialog(View v) {
        dismiss();
    }

    public /* synthetic */ boolean lambda$onCreate$3$ConfigModifyDialog(TextView v, int actionId, KeyEvent event) {
        if (event == null || event.getKeyCode() != 66 || event.getAction() != 0) {
            return false;
        }
        setEditTextRequestFocus(this.editText, false);
        return true;
    }

    private void setEditTextRequestFocus(EditText editText, boolean bFocus) {
        if (editText == null) {
            return;
        }
        InputMethodManager imm = (InputMethodManager) getContext().getSystemService("input_method");
        if (bFocus) {
            editText.setFocusableInTouchMode(true);
            editText.setFocusable(true);
            editText.requestFocus();
            imm.showSoftInput(editText, 1);
            return;
        }
        editText.setFocusable(false);
        editText.setFocusableInTouchMode(false);
        imm.hideSoftInputFromWindow(editText.getWindowToken(), 0);
    }
}
