package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import com.yftech.engineeringmode.R;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class AtcMetazoneInpuDialog extends Dialog implements AdapterView.OnItemSelectedListener {
    private static final String TAG = AtcMetazoneInpuDialog.class.getSimpleName();
    private Button btn_cancel;
    private Button btn_sure;
    private OnDialogButtonClickListener dialogButtonClickListener;
    private EditText editValue;
    private List<String> indexes;
    private boolean isRead;
    private RelativeLayout layoutIndex;
    private RelativeLayout layoutValue;
    private String selectIndex;
    private Spinner spIndex;
    private String value;

    /* loaded from: /home/user/work/dex/classes2.dex */
    public interface OnDialogButtonClickListener {
        void read(String str);

        void write(String str, String str2);
    }

    public AtcMetazoneInpuDialog(Context context, boolean isRead, List<String> list) {
        super(context, R.style.dialog_normal);
        this.isRead = isRead;
        this.indexes = list;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_atcmetazone_input);
        setCanceledOnTouchOutside(false);
        setCancelable(false);
        this.btn_sure = (Button) findViewById(R.id.btn_sure);
        this.btn_cancel = (Button) findViewById(R.id.btn_cancel);
        this.layoutIndex = (RelativeLayout) findViewById(R.id.layout_index);
        this.layoutValue = (RelativeLayout) findViewById(R.id.layout_value);
        this.editValue = (EditText) findViewById(R.id.editText_value);
        this.spIndex = (Spinner) findViewById(R.id.sp_index);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(getContext(), R.layout.spinner_item, this.indexes);
        adapter.setDropDownViewResource(R.layout.spinner_item_dropdown);
        this.spIndex.setAdapter((SpinnerAdapter) adapter);
        this.spIndex.setSelection(0, true);
        this.spIndex.setOnItemSelectedListener(this);
        this.layoutValue.setVisibility(this.isRead ? 8 : 0);
        this.selectIndex = this.indexes.get(0);
        this.btn_sure.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$AtcMetazoneInpuDialog$0AoOH5a4KyU6UzBfjELObLJJihc
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                AtcMetazoneInpuDialog.this.lambda$onCreate$0$AtcMetazoneInpuDialog(view);
            }
        });
        this.btn_cancel.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$AtcMetazoneInpuDialog$ACT736Ltq7JeujVLAQn6oiU-nXA
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                AtcMetazoneInpuDialog.this.lambda$onCreate$1$AtcMetazoneInpuDialog(view);
            }
        });
        this.editValue.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$AtcMetazoneInpuDialog$Sh4znB3BDZOlpUOM9s84-CQ4Z4Q
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                AtcMetazoneInpuDialog.this.lambda$onCreate$2$AtcMetazoneInpuDialog(view);
            }
        });
    }

    public /* synthetic */ void lambda$onCreate$0$AtcMetazoneInpuDialog(View v) {
        if (this.isRead) {
            this.dialogButtonClickListener.read(this.selectIndex);
        } else {
            this.value = this.editValue.getText().toString();
            this.dialogButtonClickListener.write(this.selectIndex, this.value);
        }
        dismiss();
    }

    public /* synthetic */ void lambda$onCreate$1$AtcMetazoneInpuDialog(View v) {
        dismiss();
    }

    public /* synthetic */ void lambda$onCreate$2$AtcMetazoneInpuDialog(View v) {
        setEditTextRequestFocus(this.editValue, true);
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        if (parent.getId() == 2131296548) {
            this.selectIndex = this.indexes.get(position);
            Log.i("AtcMetazoneFragment", "onItemSelected selectIndex:" + this.selectIndex);
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onNothingSelected(AdapterView<?> parent) {
    }

    public void setOnButtonClickListener(OnDialogButtonClickListener listener) {
        this.dialogButtonClickListener = listener;
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

    public void setEditIndex(String index) {
    }
}
