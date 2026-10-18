package com.yftech.engineeringmode.fragment;

import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.fragment.StreelingWheelKeyFragment;
import com.yftech.vehicle.internal.SignalReceiver;
import com.yftech.vehicle.internal.adapter.ICarKey;
import com.yftech.vehicle.sdk.CarKeyManager;

/* loaded from: /home/user/work/dex/classes2.dex */
public class StreelingWheelKeyFragment extends BaseFragment {
    private static final String TAG = StreelingWheelKeyFragment.class.getSimpleName();
    private Button chdown;
    private Button chup;
    ICarKey.CarKeyEvent mCarKeyEvent;
    private CarKeyManager.CarKeyListener mCarKeyListener = new AnonymousClass1();
    private Handler mMainHandler = new Handler(Looper.getMainLooper());
    private Button mode;
    private Button mute;
    private Button offhook;
    private Button onhook;
    private Button voldown;
    private Button volup;
    private Button vr;

    /* renamed from: com.yftech.engineeringmode.fragment.StreelingWheelKeyFragment$1, reason: invalid class name */
    /* loaded from: /home/user/work/dex/classes2.dex */
    class AnonymousClass1 extends CarKeyManager.CarKeyListener {
        AnonymousClass1() {
        }

        public void onSteeringWheelKeyEvent(final ICarKey.CarKeyEvent event) {
            super.onSteeringWheelKeyEvent(event);
            Log.i(StreelingWheelKeyFragment.TAG, "streelingkeychanged:" + event);
            Log.d("KeyCode", event.toString());
            StreelingWheelKeyFragment.this.mCarKeyEvent = event;
            if (event.action == 0) {
                int i = event.keyCode;
                if (i != 11) {
                    switch (i) {
                        case 1:
                            StreelingWheelKeyFragment.this.chdown.setBackgroundColor(Color.rgb(244, 231, 86));
                            break;
                        case 2:
                            StreelingWheelKeyFragment.this.chup.setBackgroundColor(Color.rgb(244, 231, 86));
                            break;
                        case 3:
                            StreelingWheelKeyFragment.this.volup.setBackgroundColor(Color.rgb(244, 231, 86));
                            break;
                        case 4:
                            StreelingWheelKeyFragment.this.voldown.setBackgroundColor(Color.rgb(244, 231, 86));
                            break;
                        case 5:
                            StreelingWheelKeyFragment.this.mode.setBackgroundColor(Color.rgb(244, 231, 86));
                            break;
                        case 6:
                            StreelingWheelKeyFragment.this.vr.setBackgroundColor(Color.rgb(244, 231, 86));
                            break;
                        case 7:
                            StreelingWheelKeyFragment.this.onhook.setBackgroundColor(Color.rgb(244, 231, 86));
                            break;
                        case 8:
                            StreelingWheelKeyFragment.this.offhook.setBackgroundColor(Color.rgb(244, 231, 86));
                            break;
                    }
                } else {
                    StreelingWheelKeyFragment.this.mute.setBackgroundColor(Color.rgb(244, 231, 86));
                }
            } else if (event.action == 1) {
                int i2 = event.keyCode;
                if (i2 != 11) {
                    switch (i2) {
                        case 1:
                            StreelingWheelKeyFragment.this.chdown.setBackgroundColor(Color.rgb(21, 236, 248));
                            break;
                        case 2:
                            StreelingWheelKeyFragment.this.chup.setBackgroundColor(Color.rgb(21, 236, 248));
                            break;
                        case 3:
                            System.out.println("=============");
                            StreelingWheelKeyFragment.this.volup.setBackgroundColor(Color.rgb(21, 236, 248));
                            System.out.println("=============");
                            break;
                        case 4:
                            StreelingWheelKeyFragment.this.voldown.setBackgroundColor(Color.rgb(21, 236, 248));
                            break;
                        case 5:
                            StreelingWheelKeyFragment.this.mode.setBackgroundColor(Color.rgb(21, 236, 248));
                            break;
                        case 6:
                            StreelingWheelKeyFragment.this.vr.setBackgroundColor(Color.rgb(21, 236, 248));
                            break;
                        case 7:
                            StreelingWheelKeyFragment.this.onhook.setBackgroundColor(Color.rgb(21, 236, 248));
                            break;
                        case 8:
                            StreelingWheelKeyFragment.this.offhook.setBackgroundColor(Color.rgb(21, 236, 248));
                            break;
                    }
                } else {
                    StreelingWheelKeyFragment.this.mute.setBackgroundColor(Color.rgb(21, 236, 248));
                }
            }
            StreelingWheelKeyFragment.this.mMainHandler.post(new Runnable() { // from class: com.yftech.engineeringmode.fragment.-$$Lambda$StreelingWheelKeyFragment$1$mvlAxBDPaNoqT-vU18xA7uFn45g
                @Override // java.lang.Runnable
                public final void run() {
                    StreelingWheelKeyFragment.AnonymousClass1.lambda$onSteeringWheelKeyEvent$0(event);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$onSteeringWheelKeyEvent$0(ICarKey.CarKeyEvent event) {
            if (event != ICarKey.CarKeyEvent.valueOf(9999)) {
                event.toString();
            }
        }
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_streeling_wheel_key, container, false);
        initView(root);
        return root;
    }

    private void initView(View root) {
        this.volup = (Button) root.findViewById(R.id.vol_up);
        this.voldown = (Button) root.findViewById(R.id.vol_down);
        this.mode = (Button) root.findViewById(R.id.mode);
        this.vr = (Button) root.findViewById(R.id.vr);
        this.offhook = (Button) root.findViewById(R.id.off_hook);
        this.onhook = (Button) root.findViewById(R.id.on_hook);
        this.mute = (Button) root.findViewById(R.id.mute);
        this.chup = (Button) root.findViewById(R.id.ch_up);
        this.chdown = (Button) root.findViewById(R.id.ch_down);
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        Log.i(TAG, "onResume event9999");
        CarKeyManager.get().registerReceiver(this.mCarKeyListener);
    }

    public void onPause() {
        super.onPause();
        CarKeyManager.get().unregisterReceiver(this.mCarKeyListener);
    }

    @SignalReceiver
    public void onSteeringWheelKeyEvent(ICarKey.CarKeyEvent event) {
    }
}
