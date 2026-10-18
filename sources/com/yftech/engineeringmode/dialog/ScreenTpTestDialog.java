package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.ListAdapter;
import android.widget.Toast;
import com.yftech.car.screen.CarScreenManager;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.adapter.ScreenTpGridViewAdapter;
import com.yftech.engineeringmode.util.Utils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ScreenTpTestDialog extends Dialog implements View.OnTouchListener, AdapterView.OnItemLongClickListener {
    private static final int AUTO_BRIGHTNESS_INTERVAL_TIME = 100;
    private static final int AUTO_BRIGHTNESS_TOTAL_TIME = 2000;
    private static final String TAG = "ScreenTpTestDialog";
    private int AUTO_BRIGHTNESS_STEP_VALUE;
    private int count;
    private int heightCount;
    private boolean isLongTouch;
    private boolean mAutoBrightnessEnable;
    private final Handler mAutoBrightnessHandler;
    private final Runnable mAutoBrightnessRunnable;
    private int mAutoBrightnessStep;
    private Context mContext;
    private ViewTreeObserver.OnGlobalLayoutListener mGlobalLayoutListener;
    private GridView mGridView;
    private List<TouchScreenBean> mList;
    private int mMaxBrightness;
    private int mMinBrightness;
    private int mRestBrightness;
    private ScreenTpGridViewAdapter screenTpGridViewAdapter;
    private int widthCount;

    public ScreenTpTestDialog(Context context) {
        super(context, R.style.dialog_normal);
        this.isLongTouch = false;
        this.mList = new ArrayList();
        this.mGlobalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.yftech.engineeringmode.dialog.ScreenTpTestDialog.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                ScreenTpTestDialog.this.mGridView.getViewTreeObserver().removeOnGlobalLayoutListener(ScreenTpTestDialog.this.mGlobalLayoutListener);
                DisplayMetrics dm = new DisplayMetrics();
                ScreenTpTestDialog.this.getWindow().getWindowManager().getDefaultDisplay().getRealMetrics(dm);
                int viewWidth = dm.widthPixels;
                int viewHeight = dm.heightPixels;
                Log.d(ScreenTpTestDialog.TAG, "width:" + viewWidth + "  height:" + viewHeight);
                ScreenTpTestDialog.this.heightCount = viewHeight / 72;
                ScreenTpTestDialog.this.widthCount = viewWidth / 128;
                ScreenTpTestDialog screenTpTestDialog = ScreenTpTestDialog.this;
                screenTpTestDialog.count = screenTpTestDialog.widthCount * ScreenTpTestDialog.this.heightCount;
                for (int i = 0; i < ScreenTpTestDialog.this.count; i++) {
                    TouchScreenBean bean = new TouchScreenBean(false);
                    ScreenTpTestDialog.this.mList.add(bean);
                }
                ScreenTpTestDialog.this.mGridView.setNumColumns(ScreenTpTestDialog.this.widthCount);
                ScreenTpTestDialog screenTpTestDialog2 = ScreenTpTestDialog.this;
                screenTpTestDialog2.screenTpGridViewAdapter = new ScreenTpGridViewAdapter(screenTpTestDialog2.mContext, ScreenTpTestDialog.this.mList, ScreenTpTestDialog.this.widthCount, ScreenTpTestDialog.this.heightCount);
                ScreenTpTestDialog.this.mGridView.setAdapter((ListAdapter) ScreenTpTestDialog.this.screenTpGridViewAdapter);
            }
        };
        this.AUTO_BRIGHTNESS_STEP_VALUE = 1;
        this.mAutoBrightnessHandler = new Handler();
        this.mAutoBrightnessRunnable = new Runnable() { // from class: com.yftech.engineeringmode.dialog.ScreenTpTestDialog.2
            @Override // java.lang.Runnable
            public void run() {
                int brightness = CarScreenManager.getInstance().getBrightness();
                if (brightness >= ScreenTpTestDialog.this.mMaxBrightness) {
                    ScreenTpTestDialog screenTpTestDialog = ScreenTpTestDialog.this;
                    screenTpTestDialog.mAutoBrightnessStep = -screenTpTestDialog.AUTO_BRIGHTNESS_STEP_VALUE;
                }
                if (brightness <= ScreenTpTestDialog.this.mMinBrightness) {
                    ScreenTpTestDialog screenTpTestDialog2 = ScreenTpTestDialog.this;
                    screenTpTestDialog2.mAutoBrightnessStep = screenTpTestDialog2.AUTO_BRIGHTNESS_STEP_VALUE;
                }
                int value = ScreenTpTestDialog.this.mAutoBrightnessStep + brightness;
                if (value > ScreenTpTestDialog.this.mMaxBrightness) {
                    value = ScreenTpTestDialog.this.mMaxBrightness;
                }
                if (value < ScreenTpTestDialog.this.mMinBrightness) {
                    value = ScreenTpTestDialog.this.mMinBrightness;
                }
                CarScreenManager.getInstance().setBrightness(value);
                ScreenTpTestDialog.this.mAutoBrightnessHandler.postDelayed(ScreenTpTestDialog.this.mAutoBrightnessRunnable, 100L);
            }
        };
        this.mContext = context;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        View root = LayoutInflater.from(getContext()).inflate(R.layout.dialog_screen_tp, (ViewGroup) null);
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
        this.mGridView = (GridView) findViewById(R.id.gridView_screen_tp);
        this.mGridView.getViewTreeObserver().addOnGlobalLayoutListener(this.mGlobalLayoutListener);
        this.mGridView.setOnTouchListener(this);
        this.mGridView.setOnItemLongClickListener(this);
    }

    @Override // android.app.Dialog
    protected void onStart() {
        super.onStart();
        startAutoBrightness();
    }

    @Override // android.app.Dialog
    protected void onStop() {
        super.onStop();
        stopAutoBrightness();
    }

    private void startAutoBrightness() {
        this.mAutoBrightnessEnable = Utils.getScreenTpAutoBrightnessEnable();
        Log.d(TAG, "startAutoBrightness() autoBrightnessEnable=" + this.mAutoBrightnessEnable);
        if (this.mAutoBrightnessEnable) {
            this.mMaxBrightness = CarScreenManager.getInstance().getBrightnessMaxValue();
            this.mMinBrightness = 0;
            this.AUTO_BRIGHTNESS_STEP_VALUE = this.mMaxBrightness / 20;
            Log.d(TAG, "startAutoBrightness() maxBrightness=" + this.mMaxBrightness + " minBrightness=" + this.mMinBrightness + " AUTO_BRIGHTNESS_STEP_VALUE=" + this.AUTO_BRIGHTNESS_STEP_VALUE);
            this.mAutoBrightnessStep = this.AUTO_BRIGHTNESS_STEP_VALUE;
            this.mRestBrightness = CarScreenManager.getInstance().getBrightness();
            this.mAutoBrightnessHandler.removeCallbacks(this.mAutoBrightnessRunnable);
            this.mAutoBrightnessHandler.postDelayed(this.mAutoBrightnessRunnable, 100L);
        }
    }

    private void stopAutoBrightness() {
        if (this.mAutoBrightnessEnable) {
            Log.d(TAG, "stopAutoBrightness() restBrightness=" + this.mRestBrightness);
            this.mAutoBrightnessHandler.removeCallbacks(this.mAutoBrightnessRunnable);
            CarScreenManager.getInstance().setBrightness(this.mRestBrightness);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x001c, code lost:
    
        if (r3 != 2) goto L31;
     */
    @Override // android.view.View.OnTouchListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean onTouch(View view, MotionEvent motionEvent) {
        float currentXPosition = motionEvent.getX();
        float currentYPosition = motionEvent.getY();
        int position = this.mGridView.pointToPosition((int) currentXPosition, (int) currentYPosition);
        int action = motionEvent.getAction();
        if (action != 0) {
            if (action == 1) {
                if (this.isLongTouch) {
                    this.isLongTouch = false;
                    return false;
                }
                if (position != -1) {
                    this.mList.get(position).setSelect(true);
                    int a = 0;
                    for (int i = 0; i < this.mList.size(); i++) {
                        if (this.mList.get(i).isSelect()) {
                            a++;
                        }
                        if (a == this.mList.size()) {
                            Toast.makeText(this.mContext, "测试通过！", 0).show();
                            Handler handler = new Handler();
                            handler.postDelayed(new Runnable() { // from class: com.yftech.engineeringmode.dialog.ScreenTpTestDialog.3
                                @Override // java.lang.Runnable
                                public void run() {
                                    ScreenTpTestDialog.this.dismiss();
                                }
                            }, 1000L);
                        }
                    }
                }
            }
            this.screenTpGridViewAdapter.notifyDataSetChanged();
            return false;
        }
        if (!this.isLongTouch && position != -1) {
            this.mList.get(position).setSelect(true);
        }
        this.screenTpGridViewAdapter.notifyDataSetChanged();
        return false;
    }

    @Override // android.widget.AdapterView.OnItemLongClickListener
    public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
        if (i == this.mList.size() - 1) {
            dismiss();
        } else if (i == this.widthCount * (this.heightCount - 1)) {
            for (TouchScreenBean touch : this.mList) {
                touch.setSelect(false);
            }
            this.screenTpGridViewAdapter = new ScreenTpGridViewAdapter(this.mContext, this.mList, this.widthCount, this.heightCount);
            this.mGridView.setAdapter((ListAdapter) this.screenTpGridViewAdapter);
            this.isLongTouch = true;
            Log.d(TAG, "TouchScreen is clear");
        }
        return false;
    }

    /* loaded from: /home/user/work/dex/classes2.dex */
    public static class TouchScreenBean {
        private boolean select;

        public boolean isSelect() {
            return this.select;
        }

        public void setSelect(boolean select) {
            this.select = select;
        }

        public TouchScreenBean(boolean select) {
            this.select = select;
        }
    }
}
