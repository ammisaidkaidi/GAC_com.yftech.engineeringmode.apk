package com.yftech.tbox.sdk;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: /home/user/work/dex/classes.dex */
public interface ICarTBoxSdkCallback extends IInterface {
    void onActiveDisconnect(int i) throws RemoteException;

    void onBaseStationInfo(int i, String str, int i2) throws RemoteException;

    void onCurrentNetworkType(int i) throws RemoteException;

    void onCurrentOperator(int i) throws RemoteException;

    void onCurrentSignalRSSI(int i) throws RemoteException;

    void onCurrentSignalStrength(int i) throws RemoteException;

    void onDownloadLogState(int i, int i2) throws RemoteException;

    void onFiveCodeInfo(String str) throws RemoteException;

    void onGNSSLocationInfo(String str) throws RemoteException;

    void onHighPrecisionLocationInfo(String str) throws RemoteException;

    void onNetworkState(int i, int i2) throws RemoteException;

    void onResetTBox(int i) throws RemoteException;

    void onResetTBoxNetwork(int i) throws RemoteException;

    void onShutdownTBox(int i) throws RemoteException;

    void onTBoxVersion(String str) throws RemoteException;

    void onTimeZoneInfo(String str) throws RemoteException;

    void onUpgradeState(int i, int i2) throws RemoteException;

    void onUpgradeTip(String str) throws RemoteException;

    /* loaded from: /home/user/work/dex/classes.dex */
    public static abstract class Stub extends Binder implements ICarTBoxSdkCallback {
        private static final String DESCRIPTOR = "com.yftech.tbox.sdk.ICarTBoxSdkCallback";
        static final int TRANSACTION_onActiveDisconnect = 15;
        static final int TRANSACTION_onBaseStationInfo = 8;
        static final int TRANSACTION_onCurrentNetworkType = 2;
        static final int TRANSACTION_onCurrentOperator = 1;
        static final int TRANSACTION_onCurrentSignalRSSI = 4;
        static final int TRANSACTION_onCurrentSignalStrength = 3;
        static final int TRANSACTION_onDownloadLogState = 14;
        static final int TRANSACTION_onFiveCodeInfo = 7;
        static final int TRANSACTION_onGNSSLocationInfo = 18;
        static final int TRANSACTION_onHighPrecisionLocationInfo = 16;
        static final int TRANSACTION_onNetworkState = 5;
        static final int TRANSACTION_onResetTBox = 10;
        static final int TRANSACTION_onResetTBoxNetwork = 9;
        static final int TRANSACTION_onShutdownTBox = 11;
        static final int TRANSACTION_onTBoxVersion = 6;
        static final int TRANSACTION_onTimeZoneInfo = 17;
        static final int TRANSACTION_onUpgradeState = 12;
        static final int TRANSACTION_onUpgradeTip = 13;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ICarTBoxSdkCallback asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ICarTBoxSdkCallback)) {
                return (ICarTBoxSdkCallback) iin;
            }
            return new Proxy(obj);
        }

        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == 1598968902) {
                reply.writeString(DESCRIPTOR);
                return true;
            }
            switch (code) {
                case 1:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg0 = data.readInt();
                    onCurrentOperator(_arg0);
                    reply.writeNoException();
                    return true;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg02 = data.readInt();
                    onCurrentNetworkType(_arg02);
                    reply.writeNoException();
                    return true;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg03 = data.readInt();
                    onCurrentSignalStrength(_arg03);
                    reply.writeNoException();
                    return true;
                case 4:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg04 = data.readInt();
                    onCurrentSignalRSSI(_arg04);
                    reply.writeNoException();
                    return true;
                case 5:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg05 = data.readInt();
                    int _arg1 = data.readInt();
                    onNetworkState(_arg05, _arg1);
                    reply.writeNoException();
                    return true;
                case 6:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg06 = data.readString();
                    onTBoxVersion(_arg06);
                    reply.writeNoException();
                    return true;
                case 7:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg07 = data.readString();
                    onFiveCodeInfo(_arg07);
                    reply.writeNoException();
                    return true;
                case 8:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg08 = data.readInt();
                    String _arg12 = data.readString();
                    int _arg2 = data.readInt();
                    onBaseStationInfo(_arg08, _arg12, _arg2);
                    reply.writeNoException();
                    return true;
                case 9:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg09 = data.readInt();
                    onResetTBoxNetwork(_arg09);
                    reply.writeNoException();
                    return true;
                case 10:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg010 = data.readInt();
                    onResetTBox(_arg010);
                    reply.writeNoException();
                    return true;
                case 11:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg011 = data.readInt();
                    onShutdownTBox(_arg011);
                    reply.writeNoException();
                    return true;
                case 12:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg012 = data.readInt();
                    int _arg13 = data.readInt();
                    onUpgradeState(_arg012, _arg13);
                    reply.writeNoException();
                    return true;
                case 13:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg013 = data.readString();
                    onUpgradeTip(_arg013);
                    reply.writeNoException();
                    return true;
                case 14:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg014 = data.readInt();
                    int _arg14 = data.readInt();
                    onDownloadLogState(_arg014, _arg14);
                    reply.writeNoException();
                    return true;
                case 15:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg015 = data.readInt();
                    onActiveDisconnect(_arg015);
                    reply.writeNoException();
                    return true;
                case 16:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg016 = data.readString();
                    onHighPrecisionLocationInfo(_arg016);
                    reply.writeNoException();
                    return true;
                case 17:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg017 = data.readString();
                    onTimeZoneInfo(_arg017);
                    reply.writeNoException();
                    return true;
                case 18:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg018 = data.readString();
                    onGNSSLocationInfo(_arg018);
                    reply.writeNoException();
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }

        /* loaded from: /home/user/work/dex/classes.dex */
        private static class Proxy implements ICarTBoxSdkCallback {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onCurrentOperator(int operator) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(operator);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onCurrentNetworkType(int type) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(type);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onCurrentSignalStrength(int signal) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(signal);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onCurrentSignalRSSI(int rssi) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(rssi);
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onNetworkState(int simState, int networkState) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(simState);
                    _data.writeInt(networkState);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onTBoxVersion(String version) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(version);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onFiveCodeInfo(String info) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(info);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onBaseStationInfo(int networkType, String operator, int cell) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(networkType);
                    _data.writeString(operator);
                    _data.writeInt(cell);
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onResetTBoxNetwork(int state) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(state);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onResetTBox(int state) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(state);
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onShutdownTBox(int state) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(state);
                    this.mRemote.transact(11, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onUpgradeState(int state, int progress) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(state);
                    _data.writeInt(progress);
                    this.mRemote.transact(12, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onUpgradeTip(String tip) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(tip);
                    this.mRemote.transact(13, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onDownloadLogState(int state, int progress) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(state);
                    _data.writeInt(progress);
                    this.mRemote.transact(14, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onActiveDisconnect(int state) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(state);
                    this.mRemote.transact(15, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onHighPrecisionLocationInfo(String info) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(info);
                    this.mRemote.transact(16, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onTimeZoneInfo(String info) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(info);
                    this.mRemote.transact(17, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkCallback
            public void onGNSSLocationInfo(String info) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(info);
                    this.mRemote.transact(18, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
