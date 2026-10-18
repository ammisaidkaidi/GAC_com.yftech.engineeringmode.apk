package com.yftech.engineeringmode.widget;

import android.content.Context;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.widget.EditText;

/* loaded from: /home/user/work/dex/classes2.dex */
public class GainEditText extends EditText {
    private Context context;
    private int max;
    private int min;

    public GainEditText(Context context) {
        super(context);
        this.context = context;
    }

    public GainEditText(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.context = context;
    }

    public GainEditText(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.context = context;
    }

    public void setTextWatcher() {
        addTextChangedListener(new TextWatcher() { // from class: com.yftech.engineeringmode.widget.GainEditText.1
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
            }
        });
    }
}
