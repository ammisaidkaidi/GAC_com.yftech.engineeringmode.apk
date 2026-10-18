package com.yftech.engineeringmode.fragment;

import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.adapter.FaultCodeAdapter;
import com.yftech.vehicle.internal.adapter.ICarMisc;
import com.yftech.vehicle.sdk.CarMiscManager;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

/* loaded from: /home/user/work/dex/classes2.dex */
public class FaultCodeFragment extends BaseFragment implements View.OnClickListener {
    private static final int FAULT_SELECT_END = -1;
    private static final String TAG = "FaultInfo";
    private FaultCodeAdapter adapter;
    public List<ICarMisc.ErrorCodeInfo> errorCodeInfoList;
    private ListView faultListView;
    private Timer mTimer;
    private TimerTask mTimerTask;
    private View root;
    private TextView selectingTextview;
    private boolean isQuery = false;
    private Handler updateListViewHandler = new Handler() { // from class: com.yftech.engineeringmode.fragment.FaultCodeFragment.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            FaultCodeFragment.this.selectingTextview.setVisibility(4);
            FaultCodeFragment faultCodeFragment = FaultCodeFragment.this;
            faultCodeFragment.adapter = new FaultCodeAdapter(faultCodeFragment.getContext(), (List) msg.obj);
            FaultCodeFragment.this.faultListView.setAdapter((ListAdapter) FaultCodeFragment.this.adapter);
            FaultCodeFragment.this.isQuery = false;
            FaultCodeFragment.this.cancelTimer();
        }
    };
    CarMiscManager.CarMiscListener miscListener = new CarMiscManager.CarMiscListener() { // from class: com.yftech.engineeringmode.fragment.FaultCodeFragment.2
        public void onFactoryModeErrorCodeChanged(ICarMisc.ErrorCodeInfo code) {
            Log.d(FaultCodeFragment.TAG, code.toString());
            if (code.dtc_index != FaultCodeFragment.FAULT_SELECT_END && code.dtc_state != FaultCodeFragment.FAULT_SELECT_END) {
                FaultCodeFragment.this.errorCodeInfoList.add(code);
                return;
            }
            Message message = new Message();
            message.obj = FaultCodeFragment.this.errorCodeInfoList;
            FaultCodeFragment.this.updateListViewHandler.sendMessage(message);
        }
    };

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        try {
            CarMiscManager.get().registerListener(this.miscListener);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.root = inflater.inflate(R.layout.fragment_fault_code_clean, container, false);
        initView(this.root);
        return this.root;
    }

    private void initView(View view) {
        ViewGroup tableTitle = (ViewGroup) view.findViewById(R.id.item_fault_title);
        tableTitle.setBackgroundColor(Color.rgb(195, 195, 197));
        this.faultListView = (ListView) view.findViewById(R.id.fault_list);
        this.errorCodeInfoList = new ArrayList();
        this.selectingTextview = (TextView) view.findViewById(R.id.fault_selecting);
        ((Button) view.findViewById(R.id.fault_select)).setOnClickListener(this);
        ((Button) view.findViewById(R.id.fault_clean)).setOnClickListener(this);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        int id = view.getId();
        if (id != 2131296390) {
            if (id == 2131296398 && !this.isQuery) {
                clearListView();
                this.errorCodeInfoList.clear();
                this.isQuery = CarMiscManager.get().setFactoryModeErrorCodeEnabled(false);
                startTimer();
                this.selectingTextview.setText(getString(R.string.querying));
                this.selectingTextview.setVisibility(0);
                Log.d(TAG, "isQuery:" + this.isQuery);
                return;
            }
            return;
        }
        CarMiscManager.get().setFactoryModeClearDtc(true);
        clearListView();
    }

    private void clearListView() {
        this.errorCodeInfoList.clear();
        this.adapter = new FaultCodeAdapter(getContext(), this.errorCodeInfoList);
        this.faultListView.setAdapter((ListAdapter) this.adapter);
    }

    private void startTimer() {
        this.mTimer = new Timer();
        this.mTimerTask = new TimerTask() { // from class: com.yftech.engineeringmode.fragment.FaultCodeFragment.3
            @Override // java.util.TimerTask, java.lang.Runnable
            public void run() {
                FaultCodeFragment.this.selectingTextview.setText(FaultCodeFragment.this.getText(R.string.query_timeout));
                Message message = new Message();
                message.obj = FaultCodeFragment.this.errorCodeInfoList;
                FaultCodeFragment.this.updateListViewHandler.sendMessageDelayed(message, 1500L);
            }
        };
        this.mTimer.schedule(this.mTimerTask, 20000L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cancelTimer() {
        this.mTimer.cancel();
        this.mTimer = null;
        this.mTimerTask.cancel();
        this.mTimerTask = null;
    }

    public void onPause() {
        super.onPause();
        CarMiscManager.get().unregisterListener(this.miscListener);
        this.updateListViewHandler.removeCallbacksAndMessages(null);
    }
}
