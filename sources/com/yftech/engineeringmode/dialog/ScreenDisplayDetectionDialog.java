package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import com.yftech.engineeringmode.R;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ScreenDisplayDetectionDialog extends Dialog {
    public static final int BLACK_TO_WHITE_GRADIENT = 1000;
    public static final int DETECTION_MODE_AUTO_CYCLIC_COLOR = 1;
    public static final int DETECTION_MODE_MANUAL_SWITCHING_COLOR = 2;
    public static final int DETECTION_MODE_SINGLE_COLOR = 0;
    private static final int INTERVAL = 3000;
    private int[] mColors;
    private GradientDrawable mGradientBlackToWhite;
    private Handler mHandler;
    private int mIndex;
    private int mMode;
    private Runnable mRunnable;
    private int mStartIndex;
    private View mView;

    static /* synthetic */ int access$008(ScreenDisplayDetectionDialog x0) {
        int i = x0.mIndex;
        x0.mIndex = i + 1;
        return i;
    }

    public ScreenDisplayDetectionDialog(Context context) {
        super(context, R.style.dialog_normal);
        this.mGradientBlackToWhite = new GradientDrawable(GradientDrawable.Orientation.LEFT_RIGHT, new int[]{Color.rgb(0, 0, 0), Color.rgb(255, 255, 255)});
        this.mColors = new int[]{Color.rgb(255, 255, 255), Color.rgb(0, 0, 0), BLACK_TO_WHITE_GRADIENT, Color.rgb(255, 0, 0), Color.rgb(0, 255, 0), Color.rgb(0, 0, 255)};
        this.mStartIndex = 0;
        this.mIndex = 0;
        this.mHandler = new Handler();
        this.mRunnable = new Runnable() { // from class: com.yftech.engineeringmode.dialog.ScreenDisplayDetectionDialog.1
            @Override // java.lang.Runnable
            public void run() {
                ScreenDisplayDetectionDialog.access$008(ScreenDisplayDetectionDialog.this);
                if (ScreenDisplayDetectionDialog.this.mIndex >= ScreenDisplayDetectionDialog.this.mColors.length) {
                    ScreenDisplayDetectionDialog.this.mIndex = 0;
                }
                ScreenDisplayDetectionDialog screenDisplayDetectionDialog = ScreenDisplayDetectionDialog.this;
                screenDisplayDetectionDialog.setBackgroundColor(screenDisplayDetectionDialog.mColors[ScreenDisplayDetectionDialog.this.mIndex]);
                ScreenDisplayDetectionDialog.this.mHandler.postDelayed(ScreenDisplayDetectionDialog.this.mRunnable, 3000L);
            }
        };
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        View root = LayoutInflater.from(getContext()).inflate(R.layout.dialog_screen_display_detection, (ViewGroup) null);
        setContentView(root);
        Window window = getWindow();
        if (window != null) {
            WindowManager.LayoutParams params = window.getAttributes();
            params.flags = 8;
            params.gravity = 17;
            params.width = -1;
            params.height = -1;
            params.type = 2055;
            window.setAttributes(params);
        }
        setCanceledOnTouchOutside(false);
        setCancelable(false);
        this.mView = root.findViewById(R.id.layout);
        this.mView.setOnTouchListener(new View.OnTouchListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$ScreenDisplayDetectionDialog$CG7Yb1VTiCcsi9XY2fR_9RtMENg
            @Override // android.view.View.OnTouchListener
            public final boolean onTouch(View view, MotionEvent motionEvent) {
                return ScreenDisplayDetectionDialog.this.lambda$onCreate$0$ScreenDisplayDetectionDialog(view, motionEvent);
            }
        });
    }

    public /* synthetic */ boolean lambda$onCreate$0$ScreenDisplayDetectionDialog(View v, MotionEvent event) {
        boolean isDismiss;
        if (this.mMode == 2) {
            isDismiss = next();
        } else {
            isDismiss = true;
        }
        if (isDismiss) {
            dismiss();
            return false;
        }
        return false;
    }

    public boolean next() {
        if (this.mMode != 2) {
            return false;
        }
        this.mIndex++;
        if (this.mIndex >= this.mColors.length) {
            this.mIndex = 0;
        }
        int i = this.mStartIndex;
        int i2 = this.mIndex;
        if (i == i2) {
            return true;
        }
        setBackgroundColor(this.mColors[i2]);
        return false;
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        this.mHandler.removeCallbacks(this.mRunnable);
        super.dismiss();
    }

    public void showColor(int color, int mode) {
        show();
        this.mMode = mode;
        setBackgroundColor(color);
        if (mode == 1 || mode == 2) {
            this.mIndex = 0;
            int i = 0;
            while (true) {
                int[] iArr = this.mColors;
                if (i >= iArr.length) {
                    break;
                }
                if (color != iArr[i]) {
                    i++;
                } else {
                    this.mIndex = i;
                    break;
                }
            }
            int i2 = this.mIndex;
            this.mStartIndex = i2;
            if (mode == 1) {
                this.mHandler.removeCallbacks(this.mRunnable);
                this.mHandler.postDelayed(this.mRunnable, 3000L);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setBackgroundColor(int color) {
        View view = this.mView;
        if (view != null) {
            if (color == 1000) {
                view.setBackground(this.mGradientBlackToWhite);
            } else {
                view.setBackgroundColor(color);
            }
        }
    }
}
