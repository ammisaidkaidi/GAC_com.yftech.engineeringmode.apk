package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import android.view.animation.RotateAnimation;
import android.widget.ImageView;
import com.yftech.engineeringmode.R;

/* loaded from: /home/user/work/dex/classes2.dex */
public class LoadingDialog extends Dialog {
    public LoadingDialog(Context context) {
        super(context);
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_loading);
        ImageView loading = (ImageView) findViewById(R.id.iv_recover_loading);
        Animation loadingAnimation = new RotateAnimation(0.0f, 360.0f, 1, 0.5f, 1, 0.5f);
        loadingAnimation.setDuration(2000L);
        loadingAnimation.setRepeatCount(-1);
        loadingAnimation.setInterpolator(new LinearInterpolator());
        loading.startAnimation(loadingAnimation);
        new Handler().postDelayed(new Runnable() { // from class: com.yftech.engineeringmode.dialog.LoadingDialog.1
            @Override // java.lang.Runnable
            public void run() {
                LoadingDialog.this.dismiss();
            }
        }, 1200L);
    }
}
