package com.yftech.tbox.sdk;

import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.ArrayMap;
import com.yftech.car.utils.MonitorServiceRestartManager;
import com.yftech.tbox.sdk.ICarTBoxSdkCallback;
import com.yftech.tbox.sdk.ICarTBoxSdkService;

/* loaded from: /home/user/work/dex/classes.dex */
public class CarTBoxSdkManager {
    public static final int BASE_STATION_CELL_ADJACENT_COMMUNITIES = 0;
    public static final int BASE_STATION_CELL_CURRENT_COMMUNITY = 1;
    public static final int BASE_STATION_NETWORK_TYPE_2G = 2;
    public static final int BASE_STATION_NETWORK_TYPE_3G = 3;
    public static final int BASE_STATION_NETWORK_TYPE_4G = 4;
    public static final int BASE_STATION_NETWORK_TYPE_CONNECTING = 1;
    public static final int BASE_STATION_NETWORK_TYPE_NO_NETWORK = 0;
    public static final String BASE_STATION_OPERATOR_CHINA_MOBILE = "46000";
    public static final String BASE_STATION_OPERATOR_CHINA_TELECOM = "46002";
    public static final String BASE_STATION_OPERATOR_CHINA_UNICOM = "46001";
    public static final String BASE_STATION_OPERATOR_NOT_REGISTERED = "00000";
    public static final String BASE_STATION_OPERATOR_OTHER = "N.A.";
    public static final int LOG_STATE_EXPORTING = 160;
    public static final int LOG_STATE_EXPORT_COMPLETE = 128;
    public static final int LOG_STATE_EXPORT_FAILED = 130;
    public static final int LOG_STATE_EXPORT_FAILED_FTP_ERROR = 163;
    public static final int LOG_STATE_EXPORT_FAILED_INVALID_PATH = 129;
    public static final int LOG_STATE_EXPORT_FAILED_PARAM_ERROR = 161;
    public static final int LOG_STATE_EXPORT_FAILED_UNCONNECTED = 162;
    public static final int LOG_STATE_EXPORT_START = 0;
    public static final int NETWORK_STATE_NETWORK_AVAILABLE = 1;
    public static final int NETWORK_STATE_NETWORK_UNAVAILABLE = 0;
    public static final int NETWORK_STATE_SIM_CARD_AVAILABLE = 1;
    public static final int NETWORK_STATE_SIM_CARD_UNAVAILABLE = 0;
    public static final int NETWORK_TYPE_2G = 1;
    public static final int NETWORK_TYPE_3G = 2;
    public static final int NETWORK_TYPE_4G = 3;
    public static final int NETWORK_TYPE_SIM_CARD_FAULT = 16;
    public static final int NETWORK_TYPE_UNKNOWN = 0;
    public static final int OPERATOR_CHINA_MOBILE = 2;
    public static final int OPERATOR_CHINA_TELECOM = 3;
    public static final int OPERATOR_CHINA_UNICOM = 1;
    public static final int OPERATOR_SIM_CARD_FAULT = 16;
    public static final int OPERATOR_UNKNOWN = 0;
    public static final String SERVICE_NAME = "car_tbox_sdk";
    public static final int STATE_FAILED = 1;
    public static final int STATE_SUCCESS = 0;
    private static final String TAG = "CarTBoxSdkManager";
    public static final int UPGRADE_STATE_COMPLETE = 128;
    public static final int UPGRADE_STATE_FAILED = 129;
    public static final int UPGRADE_STATE_FAILED_FTP_ERROR = 163;
    public static final int UPGRADE_STATE_FAILED_PARAM_ERROR = 161;
    public static final int UPGRADE_STATE_FAILED_UNCONNECTED = 162;
    public static final int UPGRADE_STATE_START = 0;
    public static final int UPGRADE_STATE_UPGRADING = 160;
    private static volatile CarTBoxSdkManager mInstance;

    private CarTBoxSdkManager() {
    }

    public static CarTBoxSdkManager getInstance() {
        if (mInstance == null) {
            synchronized (CarTBoxSdkManager.class) {
                if (mInstance == null) {
                    mInstance = new CarTBoxSdkManager();
                }
            }
        }
        return mInstance;
    }

    public void registerCarTBoxSdkCallback(CarTBoxSdkCallback callback, Handler handler) {
        if (handler == null) {
            Looper looper = Looper.myLooper();
            if (looper == null) {
                throw new IllegalArgumentException("No handler given, and current thread has no looper!");
            }
            handler = new Handler(looper);
        }
        CarTBoxSdkManagerGlobal.get().registerCarTBoxSdkCallback(callback, handler);
    }

    public void unregisterCarTBoxSdkCallback(CarTBoxSdkCallback callback) {
        CarTBoxSdkManagerGlobal.get().unregisterCarTBoxSdkCallback(callback);
    }

    public boolean requestCurrentOperator() {
        return CarTBoxSdkManagerGlobal.get().requestCurrentOperator();
    }

    public boolean requestCurrentNetworkType() {
        return CarTBoxSdkManagerGlobal.get().requestCurrentNetworkType();
    }

    public boolean requestCurrentSignalStrength() {
        return CarTBoxSdkManagerGlobal.get().requestCurrentSignalStrength();
    }

    public boolean resetTBoxNetwork() {
        return CarTBoxSdkManagerGlobal.get().resetTBoxNetwork();
    }

    public boolean requestCurrentSignalRSSI() {
        return CarTBoxSdkManagerGlobal.get().requestCurrentSignalRSSI();
    }

    public boolean requestNetworkStatus() {
        return CarTBoxSdkManagerGlobal.get().requestNetworkStatus();
    }

    public boolean resetTBox() {
        return CarTBoxSdkManagerGlobal.get().resetTBox();
    }

    public boolean shutdownTBox() {
        return CarTBoxSdkManagerGlobal.get().shutdownTBox();
    }

    public boolean requestTBoxVersion() {
        return CarTBoxSdkManagerGlobal.get().requestTBoxVersion();
    }

    public boolean requestFiveCodeInfo() {
        return CarTBoxSdkManagerGlobal.get().requestFiveCodeInfo();
    }

    public boolean requestUpgrade(String fileName, String path) {
        return CarTBoxSdkManagerGlobal.get().requestUpgrade(fileName, path);
    }

    public boolean stopUpgrade() {
        return CarTBoxSdkManagerGlobal.get().stopUpgrade();
    }

    public boolean requestDownloadLog(String logPath, String savePath) {
        return CarTBoxSdkManagerGlobal.get().requestDownloadLog(logPath, savePath);
    }

    public boolean stopDownloadLog() {
        return CarTBoxSdkManagerGlobal.get().stopDownloadLog();
    }

    public boolean requestActiveDisconnect() {
        return CarTBoxSdkManagerGlobal.get().requestActiveDisconnect();
    }

    public boolean requestHighPrecisionLocationInfo() {
        return CarTBoxSdkManagerGlobal.get().requestHighPrecisionLocationInfo();
    }

    public boolean requestTimeZoneInfo() {
        return CarTBoxSdkManagerGlobal.get().requestTimeZoneInfo();
    }

    public String getVersionName() {
        return BuildConfig.VERSION_NAME;
    }

    /* loaded from: /home/user/work/dex/classes.dex */
    private static final class CarTBoxSdkManagerGlobal extends ICarTBoxSdkCallback.Stub implements IBinder.DeathRecipient, MonitorServiceRestartManager.IMonitorCallback {
        private static final CarTBoxSdkManagerGlobal CAR_TBOX_SDK_GLOBAL = new CarTBoxSdkManagerGlobal();
        private static ICarTBoxSdkService mCarTBoxSdkService;
        private final Object mLock = new Object();
        private final ArrayMap<CarTBoxSdkCallback, Handler> mCallbackMap = new ArrayMap<>();

        private CarTBoxSdkManagerGlobal() {
        }

        public static CarTBoxSdkManagerGlobal get() {
            return CAR_TBOX_SDK_GLOBAL;
        }

        public ICarTBoxSdkService getCarScreenService() {
            ICarTBoxSdkService iCarTBoxSdkService;
            synchronized (this.mLock) {
                if (!connectCarTBoxSdkServiceLocked() || mCarTBoxSdkService == null) {
                    LogUtil.e(CarTBoxSdkManager.TAG, "car screen service is unavailable");
                    startReconnectThread();
                }
                iCarTBoxSdkService = mCarTBoxSdkService;
            }
            return iCarTBoxSdkService;
        }

        private void startReconnectThread() {
            MonitorServiceRestartManager.getInstance().addMonitor(CarTBoxSdkManager.SERVICE_NAME, this);
        }

        public void onServiceStart(String serviceName) {
            connectCarTBoxSdkServiceLocked();
        }

        private boolean connectCarTBoxSdkServiceLocked() {
            ICarTBoxSdkService iCarTBoxSdkService = mCarTBoxSdkService;
            if (iCarTBoxSdkService == null || iCarTBoxSdkService.asBinder() == null || !mCarTBoxSdkService.asBinder().isBinderAlive()) {
                IBinder binder = ServiceManager.getService(CarTBoxSdkManager.SERVICE_NAME);
                try {
                    if (binder != null) {
                        binder.linkToDeath(this, 0);
                        mCarTBoxSdkService = ICarTBoxSdkService.Stub.asInterface(binder);
                        mCarTBoxSdkService.registerCarTBoxSdkCallback(this);
                        synchronized (this.mLock) {
                            int callbackCount = this.mCallbackMap.size();
                            for (int i = 0; i < callbackCount; i++) {
                                Handler handler = this.mCallbackMap.valueAt(i);
                                final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                                handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.1
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        callback.onServiceBind();
                                    }
                                });
                            }
                        }
                        return true;
                    }
                    LogUtil.e(CarTBoxSdkManager.TAG, "the car screen service not started!connected service fail!");
                    return false;
                } catch (RemoteException e) {
                    LogUtil.e(CarTBoxSdkManager.TAG, "link to death error!" + e.getMessage());
                    e.printStackTrace();
                    return false;
                }
            }
            return true;
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback.Stub, android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.IBinder.DeathRecipient
        public void binderDied() {
            LogUtil.w(CarTBoxSdkManager.TAG, "binder died,reconnect service car_tbox_sdk after 1000ms!");
            synchronized (this.mLock) {
                if (mCarTBoxSdkService == null) {
                    return;
                }
                mCarTBoxSdkService = null;
                if (!this.mCallbackMap.isEmpty()) {
                    startReconnectThread();
                }
            }
        }

        public void registerCarTBoxSdkCallback(CarTBoxSdkCallback callback, Handler handler) {
            synchronized (this.mLock) {
                if (!connectCarTBoxSdkServiceLocked()) {
                    startReconnectThread();
                }
                if (!this.mCallbackMap.containsKey(callback)) {
                    this.mCallbackMap.put(callback, handler);
                }
            }
        }

        public void unregisterCarTBoxSdkCallback(CarTBoxSdkCallback callback) {
            synchronized (this.mLock) {
                this.mCallbackMap.remove(callback);
            }
        }

        boolean requestCurrentOperator() {
            try {
                return getCarScreenService().requestCurrentOperator();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestCurrentNetworkType() {
            try {
                return getCarScreenService().requestCurrentNetworkType();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestCurrentSignalStrength() {
            try {
                return getCarScreenService().requestCurrentSignalStrength();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean resetTBoxNetwork() {
            try {
                return getCarScreenService().resetTBoxNetwork();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestCurrentSignalRSSI() {
            try {
                return getCarScreenService().requestCurrentSignalRSSI();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestNetworkStatus() {
            try {
                return getCarScreenService().requestNetworkStatus();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean resetTBox() {
            try {
                return getCarScreenService().resetTBox();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean shutdownTBox() {
            try {
                return getCarScreenService().shutdownTBox();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestTBoxVersion() {
            try {
                return getCarScreenService().requestTBoxVersion();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestFiveCodeInfo() {
            try {
                return getCarScreenService().requestFiveCodeInfo();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestUpgrade(String fileName, String path) {
            try {
                return getCarScreenService().requestUpgrade(fileName, path);
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestDownloadLog(String logPath, String savePath) {
            try {
                return getCarScreenService().requestDownloadLog(logPath, savePath);
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean stopUpgrade() {
            try {
                return getCarScreenService().stopUpgrade();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean stopDownloadLog() {
            try {
                return getCarScreenService().stopDownloadLog();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestActiveDisconnect() {
            try {
                return getCarScreenService().requestActiveDisconnect();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestHighPrecisionLocationInfo() {
            try {
                return getCarScreenService().requestHighPrecisionLocationInfo();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        boolean requestTimeZoneInfo() {
            try {
                return getCarScreenService().requestTimeZoneInfo();
            } catch (RemoteException | NullPointerException e) {
                e.printStackTrace();
                return false;
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onCurrentOperator(final int operator) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.2
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onCurrentOperator(operator);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onCurrentNetworkType(final int type) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.3
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onCurrentNetworkType(type);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onCurrentSignalStrength(final int signal) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.4
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onCurrentSignalStrength(signal);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onCurrentSignalRSSI(final int rssi) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.5
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onCurrentSignalRSSI(rssi);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onNetworkState(final int simState, final int networkState) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.6
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onNetworkState(simState, networkState);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onTBoxVersion(final String version) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.7
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onTBoxVersion(version);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onFiveCodeInfo(final String info) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.8
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onFiveCodeInfo(info);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onBaseStationInfo(final int networkType, final String operator, final int cell) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.9
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onBaseStationInfo(networkType, operator, cell);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onResetTBoxNetwork(final int state) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.10
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onResetTBoxNetwork(state);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onResetTBox(final int state) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.11
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onResetTBox(state);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onShutdownTBox(final int state) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.12
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onShutdownTBox(state);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onUpgradeState(final int state, final int progress) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.13
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onUpgradeState(state, progress);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onUpgradeTip(final String tip) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.14
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onUpgradeTip(tip);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onDownloadLogState(final int state, final int progress) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.15
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onDownloadLogState(state, progress);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onActiveDisconnect(final int state) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.16
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onActiveDisconnect(state);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onHighPrecisionLocationInfo(final String info) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.17
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onHighPrecisionLocationInfo(info);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onTimeZoneInfo(final String info) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.18
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onTimeZoneInfo(info);
                        }
                    });
                }
            }
        }

        @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
        public void onGNSSLocationInfo(final String info) throws RemoteException {
            synchronized (this.mLock) {
                int callbackCount = this.mCallbackMap.size();
                for (int i = 0; i < callbackCount; i++) {
                    Handler handler = this.mCallbackMap.valueAt(i);
                    final CarTBoxSdkCallback callback = this.mCallbackMap.keyAt(i);
                    handler.post(new Runnable() { // from class: com.yftech.tbox.sdk.CarTBoxSdkManager.CarTBoxSdkManagerGlobal.19
                        @Override // java.lang.Runnable
                        public void run() {
                            callback.onGNSSLocationInfo(info);
                        }
                    });
                }
            }
        }
    }

    /* loaded from: /home/user/work/dex/classes.dex */
    public static abstract class CarTBoxSdkCallback {
        public void onServiceBind() {
        }

        public void onCurrentOperator(int operator) {
        }

        public void onCurrentNetworkType(int type) {
        }

        public void onCurrentSignalStrength(int signal) {
        }

        public void onCurrentSignalRSSI(int rssi) {
        }

        public void onNetworkState(int simState, int networkState) {
        }

        public void onTBoxVersion(String version) {
        }

        public void onFiveCodeInfo(String info) {
        }

        public void onBaseStationInfo(int networkType, String operator, int cell) {
        }

        public void onResetTBoxNetwork(int state) {
        }

        public void onResetTBox(int state) {
        }

        public void onShutdownTBox(int state) {
        }

        public void onUpgradeState(int state, int progress) {
        }

        public void onUpgradeTip(String tip) {
        }

        public void onDownloadLogState(int state, int progress) {
        }

        public void onActiveDisconnect(int state) {
        }

        public void onHighPrecisionLocationInfo(String info) {
        }

        public void onTimeZoneInfo(String info) {
        }

        public void onGNSSLocationInfo(String info) {
        }
    }
}
