package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import com.yftech.engineeringmode.R;

/* loaded from: /home/user/work/dex/classes2.dex */
public class InputDialog extends Dialog {
    private EditText editText;
    private Callback mCallback;
    private Toast mToast;

    /* loaded from: /home/user/work/dex/classes2.dex */
    public interface Callback {
        void onSure(View view, String str);
    }

    public InputDialog(Context context) {
        super(context, R.style.dialog_normal);
        this.mCallback = null;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_write_sample);
        setCanceledOnTouchOutside(false);
        setCancelable(false);
        this.editText = (EditText) findViewById(R.id.editText);
        this.editText.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$InputDialog$eHiQ4HfTWrbI08NgeMgQfpSLUR0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                InputDialog.this.lambda$onCreate$0$InputDialog(view);
            }
        });
        findViewById(R.id.btn_sure).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$InputDialog$xAvESScvtxMnVZPaEssrev7adF8
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                InputDialog.this.lambda$onCreate$1$InputDialog(view);
            }
        });
        findViewById(R.id.btn_cancel).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$InputDialog$Qocq47uAKVzvjlqq09Dxowcsy1g
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                InputDialog.this.lambda$onCreate$2$InputDialog(view);
            }
        });
        this.editText.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$InputDialog$u0GBr00EknZDBI4FvZHUcvm81Go
            @Override // android.widget.TextView.OnEditorActionListener
            public final boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
                return InputDialog.this.lambda$onCreate$3$InputDialog(textView, i, keyEvent);
            }
        });
    }

    public /* synthetic */ void lambda$onCreate$0$InputDialog(View v) {
        setEditTextRequestFocus(this.editText, true);
    }

    public /* synthetic */ void lambda$onCreate$1$InputDialog(View v) {
        String value = this.editText.getText().toString();
        Callback callback = this.mCallback;
        if (callback != null) {
            callback.onSure(v, value);
        }
    }

    public /* synthetic */ void lambda$onCreate$2$InputDialog(View v) {
        dismiss();
    }

    public /* synthetic */ boolean lambda$onCreate$3$InputDialog(TextView v, int actionId, KeyEvent event) {
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

    public void setHint(String hintText) {
        EditText editText = this.editText;
        if (editText != null) {
            editText.setHint(hintText);
        }
    }

    public void showToast(String text) {
        Toast toast = this.mToast;
        if (toast != null) {
            toast.cancel();
        }
        this.mToast = Toast.makeText(getContext(), text, 0);
        this.mToast.show();
    }

    public void setCallback(Callback callback) {
        this.mCallback = callback;
    }
}
