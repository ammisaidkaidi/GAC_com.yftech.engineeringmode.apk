package com.yftech.engineeringmode.widget;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import com.yftech.vehicle.sdk.MpuProjectManager;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class CanLogFloatView implements View.OnTouchListener {
    private static final int DISPLAY_LOG_COUNT_MAX = 10;
    private static final String TAG = "CanLogFloatView";
    private float mDownInScreenX;
    private float mDownInScreenY;
    private View mFloatLayout;
    private float mInScreenX;
    private float mInScreenY;
    private float mInViewX;
    private float mInViewY;
    private TextView mTvInfo;
    private WindowManager mWindowManager;
    private WindowManager.LayoutParams mWindowParams;
    private final List<String> mLogInfoList = new ArrayList();
    private final SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    private final Handler mMainHandler = new Handler(Looper.getMainLooper());
    private final MpuProjectManager.MpuProjectListener mMpuProjectListener = new MpuProjectManager.MpuProjectListener() { // from class: com.yftech.engineeringmode.widget.CanLogFloatView.1
        public void onCanLogInfoChanged(String log, int pid) {
            super.onCanLogInfoChanged(log, pid);
            String info = CanLogFloatView.this.mSimpleDateFormat.format(new Date()) + "\t" + pid + "\t" + log;
            if (CanLogFloatView.this.mLogInfoList.size() >= 10) {
                CanLogFloatView.this.mLogInfoList.remove(0);
            }
            CanLogFloatView.this.mLogInfoList.add(info);
            CanLogFloatView.this.mMainHandler.post(new Runnable() { // from class: com.yftech.engineeringmode.widget.CanLogFloatView.1.1
                @Override // java.lang.Runnable
                public void run() {
                    CanLogFloatView.this.setInfoText();
                }
            });
        }
    };

    public CanLogFloatView(Context context) {
        initFloatView(context);
    }

    private void initFloatView(Context context) {
        LayoutInflater inflater = LayoutInflater.from(context);
        if (inflater == null) {
            Log.d(TAG, "initFloatView->inflater is null");
            return;
        }
        this.mFloatLayout = inflater.inflate(R.layout.view_canlog_float_view, (ViewGroup) null);
        this.mTvInfo = (TextView) this.mFloatLayout.findViewById(R.id.tv_info);
        this.mFloatLayout.setOnTouchListener(this);
        this.mWindowManager = (WindowManager) context.getSystemService("window");
        this.mWindowParams = new WindowManager.LayoutParams();
        WindowManager.LayoutParams layoutParams = this.mWindowParams;
        layoutParams.type = 2055;
        layoutParams.format = 1;
        layoutParams.flags = 8;
        layoutParams.gravity = 8388659;
        layoutParams.width = 600;
        layoutParams.height = -2;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        return floatLayoutTouch(motionEvent);
    }

    private boolean floatLayoutTouch(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 0) {
            this.mInViewX = motionEvent.getX();
            this.mInViewY = motionEvent.getY();
            this.mDownInScreenX = motionEvent.getRawX();
            this.mDownInScreenY = motionEvent.getRawY();
            this.mInScreenX = motionEvent.getRawX();
            this.mInScreenY = motionEvent.getRawY();
        } else if (action != 1) {
            if (action == 2) {
                this.mInScreenX = motionEvent.getRawX();
                this.mInScreenY = motionEvent.getRawY();
                WindowManager.LayoutParams layoutParams = this.mWindowParams;
                layoutParams.x = (int) (this.mInScreenX - this.mInViewX);
                layoutParams.y = (int) (this.mInScreenY - this.mInViewY);
                this.mWindowManager.updateViewLayout(this.mFloatLayout, layoutParams);
            }
        } else if (this.mDownInScreenX == this.mInScreenX) {
            float f = this.mDownInScreenY;
            float f2 = this.mInScreenY;
        }
        return true;
    }

    public void showFloatWindow() {
        if (this.mFloatLayout.getParent() == null) {
            Log.d(TAG, "showFloatWindow");
            WindowManager.LayoutParams layoutParams = this.mWindowParams;
            layoutParams.x = 0;
            layoutParams.y = 0;
            this.mWindowManager.addView(this.mFloatLayout, layoutParams);
            MpuProjectManager.get().registerListener(this.mMpuProjectListener);
        }
    }

    public void hideFloatWindow() {
        if (this.mFloatLayout.getParent() != null) {
            Log.d(TAG, "hideFloatWindow");
            this.mWindowManager.removeView(this.mFloatLayout);
            MpuProjectManager.get().unregisterListener(this.mMpuProjectListener);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setInfoText() {
        StringBuilder text = new StringBuilder();
        for (String s : this.mLogInfoList) {
            text.append(s);
            text.append("\n");
        }
        this.mTvInfo.setText(text.toString());
    }
}
