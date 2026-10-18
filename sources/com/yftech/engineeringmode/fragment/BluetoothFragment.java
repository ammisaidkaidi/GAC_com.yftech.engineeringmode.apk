package com.yftech.engineeringmode.fragment;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.yftech.car.bluetooth.CarBluetoothManager;
import com.yftech.car.bluetooth.callback.CarBluetoothSettingsCallback;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.engineeringmode.R;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class BluetoothFragment extends BaseFragment {
    private static final int CONNECTED = 2;
    private static final int DISCONNECTED = 0;
    private static final String TAG = "BluetoothInfo";
    private BluetoothDevice bluetoothDeviceConnected;
    private BluetoothGatt bluetoothGatt;
    private boolean bluetoothIsConnected;
    private List<BluetoothDevice> btList;
    private volatile boolean isRunning;
    private View viewRoot;
    private final BluetoothAdapter bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
    private final BluetoothGattCallback bluetoothGattCallback = new BluetoothGattCallback() { // from class: com.yftech.engineeringmode.fragment.BluetoothFragment.1
        @Override // android.bluetooth.BluetoothGattCallback
        public void onConnectionStateChange(BluetoothGatt gatt, int status, int newState) {
            super.onConnectionStateChange(gatt, status, newState);
            if (newState == 2) {
                gatt.readRemoteRssi();
            }
        }

        @Override // android.bluetooth.BluetoothGattCallback
        public void onReadRemoteRssi(BluetoothGatt gatt, int rssi, int status) {
            super.onReadRemoteRssi(gatt, rssi, status);
            if (status == 0) {
                Message message = new Message();
                message.obj = Integer.valueOf(rssi);
                Log.d(BluetoothFragment.TAG, "Rssi is " + rssi);
                BluetoothFragment.this.updateRSSIUIHandler.sendMessage(message);
            }
        }
    };
    private final Handler updateRSSIUIHandler = new Handler() { // from class: com.yftech.engineeringmode.fragment.BluetoothFragment.2
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            if (msg.obj != null) {
                ((TextView) BluetoothFragment.this.viewRoot.findViewById(R.id.tv_bluetooth_RSSI)).setText(msg.obj.toString());
            }
        }
    };
    private final Handler reloadHandler = new Handler() { // from class: com.yftech.engineeringmode.fragment.BluetoothFragment.3
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            if (msg.arg1 == 2 && msg.obj != null) {
                BluetoothFragment.this.isRunning = false;
                BluetoothFragment.this.bluetoothDeviceConnected = (BluetoothDevice) msg.obj;
                ((TextView) BluetoothFragment.this.viewRoot.findViewById(R.id.tv_bluetooth_remote_name)).setText(BluetoothFragment.this.bluetoothDeviceConnected.getName());
                ((TextView) BluetoothFragment.this.viewRoot.findViewById(R.id.tv_bluetooth_remote_address)).setText(BluetoothFragment.this.bluetoothDeviceConnected.getAddress());
                ((TextView) BluetoothFragment.this.viewRoot.findViewById(R.id.tv_bluetooth_connect_status)).setText("已连接");
                BluetoothFragment.this.getBluetoothRssi();
                return;
            }
            if (msg.arg1 == 0) {
                BluetoothFragment.this.isRunning = true;
                BluetoothFragment.this.bluetoothDeviceConnected = null;
                ((TextView) BluetoothFragment.this.viewRoot.findViewById(R.id.tv_bluetooth_remote_name)).setText((CharSequence) null);
                ((TextView) BluetoothFragment.this.viewRoot.findViewById(R.id.tv_bluetooth_remote_address)).setText((CharSequence) null);
                ((TextView) BluetoothFragment.this.viewRoot.findViewById(R.id.tv_bluetooth_connect_status)).setText("未连接");
                ((TextView) BluetoothFragment.this.viewRoot.findViewById(R.id.tv_bluetooth_RSSI)).setText("--");
            }
        }
    };
    private final CarBluetoothSettingsCallback bluetoothSettingsCallback = new CarBluetoothSettingsCallback() { // from class: com.yftech.engineeringmode.fragment.BluetoothFragment.4
        public void onBluetoothConnectStateChanged(BluetoothDevice bluetoothDevice, int state) {
            super.onBluetoothConnectStateChanged(bluetoothDevice, state);
            Message message = new Message();
            message.obj = bluetoothDevice;
            message.arg1 = state;
            BluetoothFragment.this.reloadHandler.sendMessage(message);
        }
    };

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        CarBluetoothManager.getInstance().registerBluetoothSettingsCallback(this.bluetoothSettingsCallback, new Handler());
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_bluetooth, container, false);
        this.viewRoot = root;
        initData();
        initView(root);
        return root;
    }

    private void initView(View root) {
        ((TextView) root.findViewById(R.id.tv_bluetooth_local_name)).setText(getBluetoothLocalName());
        ((TextView) root.findViewById(R.id.tv_bluetooth_local_address)).setText(getBluetoothLocalAddress());
        ((TextView) root.findViewById(R.id.tv_bluetooth_local_version)).setText(getBluetoothLocalVersion());
        ((TextView) root.findViewById(R.id.tv_bluetooth_remote_name)).setText(getBluetoothRemoteName());
        ((TextView) root.findViewById(R.id.tv_bluetooth_remote_address)).setText(getBluetoothRemoteAddress());
        ((TextView) root.findViewById(R.id.tv_bluetooth_connect_status)).setText(getBluetoothConnectStatus());
        ((TextView) root.findViewById(R.id.tv_bluetooth_RSSI)).setText("--");
    }

    private void initData() {
        this.btList = CarBluetoothManager.getInstance().getRemoteDevices();
        if (this.btList.size() == 0) {
            this.bluetoothDeviceConnected = null;
        } else {
            this.bluetoothDeviceConnected = this.btList.get(0);
        }
        this.isRunning = false;
        if (this.bluetoothDeviceConnected != null) {
            Log.d(TAG, "Get the connected bluetooth device");
            this.bluetoothIsConnected = true;
            getBluetoothRssi();
        } else {
            this.bluetoothIsConnected = false;
            Log.d(TAG, "The connected bluetooth device is null");
        }
    }

    private String getBluetoothLocalName() {
        return CarBluetoothManager.getInstance().getBluetoothName();
    }

    private String getBluetoothLocalAddress() {
        return CarBluetoothManager.getInstance().getBluetoothMacAddress();
    }

    private String getBluetoothLocalVersion() {
        return CarBluetoothManager.getInstance().getSDKVersion();
    }

    private String getBluetoothRemoteName() {
        if (this.bluetoothIsConnected) {
            return this.bluetoothDeviceConnected.getName();
        }
        return BuildConfig.FLAVOR;
    }

    private String getBluetoothRemoteAddress() {
        if (this.bluetoothIsConnected) {
            return this.bluetoothDeviceConnected.getAddress();
        }
        return BuildConfig.FLAVOR;
    }

    private String getBluetoothConnectStatus() {
        if (this.bluetoothIsConnected) {
            return getString(R.string.connected);
        }
        return getString(R.string.disconnect);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getBluetoothRssi() {
        ReadRssiThread readRssiThread = new ReadRssiThread();
        this.bluetoothGatt = this.bluetoothDeviceConnected.connectGatt(getActivity().getApplicationContext(), false, this.bluetoothGattCallback);
        readRssiThread.start();
        Log.d(TAG, "readRssiThread is start.");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: /home/user/work/dex/classes2.dex */
    public class ReadRssiThread extends Thread {
        ReadRssiThread() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            super.run();
            while (!BluetoothFragment.this.isRunning) {
                try {
                    BluetoothFragment.this.bluetoothGatt.readRemoteRssi();
                    sleep(500L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            Log.d(BluetoothFragment.TAG, "ReadRssiThread finished");
        }
    }

    public void onPause() {
        super.onPause();
        CarBluetoothManager.getInstance().unregisterBluetoothSettingsCallback(this.bluetoothSettingsCallback);
        this.isRunning = true;
        BluetoothGatt bluetoothGatt = this.bluetoothGatt;
        if (bluetoothGatt != null) {
            bluetoothGatt.disconnect();
        }
    }
}
