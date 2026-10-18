package com.yftech.tbox.sdk;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.yftech.tbox.sdk.ICarTBoxSdkCallback;

/* loaded from: /home/user/work/dex/classes.dex */
public interface ICarTBoxSdkService extends IInterface {
    void registerCarTBoxSdkCallback(ICarTBoxSdkCallback iCarTBoxSdkCallback) throws RemoteException;

    boolean requestActiveDisconnect() throws RemoteException;

    boolean requestCurrentNetworkType() throws RemoteException;

    boolean requestCurrentOperator() throws RemoteException;

    boolean requestCurrentSignalRSSI() throws RemoteException;

    boolean requestCurrentSignalStrength() throws RemoteException;

    boolean requestDownloadLog(String str, String str2) throws RemoteException;

    boolean requestFiveCodeInfo() throws RemoteException;

    boolean requestHighPrecisionLocationInfo() throws RemoteException;

    boolean requestNetworkStatus() throws RemoteException;

    boolean requestTBoxVersion() throws RemoteException;

    boolean requestTimeZoneInfo() throws RemoteException;

    boolean requestUpgrade(String str, String str2) throws RemoteException;

    boolean resetTBox() throws RemoteException;

    boolean resetTBoxNetwork() throws RemoteException;

    boolean shutdownTBox() throws RemoteException;

    boolean stopDownloadLog() throws RemoteException;

    boolean stopUpgrade() throws RemoteException;

    void unregisterCarTBoxSdkCallback(ICarTBoxSdkCallback iCarTBoxSdkCallback) throws RemoteException;

    /* loaded from: /home/user/work/dex/classes.dex */
    public static abstract class Stub extends Binder implements ICarTBoxSdkService {
        private static final String DESCRIPTOR = "com.yftech.tbox.sdk.ICarTBoxSdkService";
        static final int TRANSACTION_registerCarTBoxSdkCallback = 1;
        static final int TRANSACTION_requestActiveDisconnect = 17;
        static final int TRANSACTION_requestCurrentNetworkType = 4;
        static final int TRANSACTION_requestCurrentOperator = 3;
        static final int TRANSACTION_requestCurrentSignalRSSI = 7;
        static final int TRANSACTION_requestCurrentSignalStrength = 5;
        static final int TRANSACTION_requestDownloadLog = 15;
        static final int TRANSACTION_requestFiveCodeInfo = 12;
        static final int TRANSACTION_requestHighPrecisionLocationInfo = 18;
        static final int TRANSACTION_requestNetworkStatus = 8;
        static final int TRANSACTION_requestTBoxVersion = 11;
        static final int TRANSACTION_requestTimeZoneInfo = 19;
        static final int TRANSACTION_requestUpgrade = 13;
        static final int TRANSACTION_resetTBox = 9;
        static final int TRANSACTION_resetTBoxNetwork = 6;
        static final int TRANSACTION_shutdownTBox = 10;
        static final int TRANSACTION_stopDownloadLog = 16;
        static final int TRANSACTION_stopUpgrade = 14;
        static final int TRANSACTION_unregisterCarTBoxSdkCallback = 2;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ICarTBoxSdkService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ICarTBoxSdkService)) {
                return (ICarTBoxSdkService) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i == 1598968902) {
                parcel2.writeString(DESCRIPTOR);
                return true;
            }
            switch (i) {
                case 1:
                    parcel.enforceInterface(DESCRIPTOR);
                    registerCarTBoxSdkCallback(ICarTBoxSdkCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    unregisterCarTBoxSdkCallback(ICarTBoxSdkCallback.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestCurrentOperator = requestCurrentOperator();
                    parcel2.writeNoException();
                    parcel2.writeInt(requestCurrentOperator ? 1 : 0);
                    return true;
                case 4:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestCurrentNetworkType = requestCurrentNetworkType();
                    parcel2.writeNoException();
                    parcel2.writeInt(requestCurrentNetworkType ? 1 : 0);
                    return true;
                case 5:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestCurrentSignalStrength = requestCurrentSignalStrength();
                    parcel2.writeNoException();
                    parcel2.writeInt(requestCurrentSignalStrength ? 1 : 0);
                    return true;
                case 6:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean resetTBoxNetwork = resetTBoxNetwork();
                    parcel2.writeNoException();
                    parcel2.writeInt(resetTBoxNetwork ? 1 : 0);
                    return true;
                case 7:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestCurrentSignalRSSI = requestCurrentSignalRSSI();
                    parcel2.writeNoException();
                    parcel2.writeInt(requestCurrentSignalRSSI ? 1 : 0);
                    return true;
                case 8:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestNetworkStatus = requestNetworkStatus();
                    parcel2.writeNoException();
                    parcel2.writeInt(requestNetworkStatus ? 1 : 0);
                    return true;
                case 9:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean resetTBox = resetTBox();
                    parcel2.writeNoException();
                    parcel2.writeInt(resetTBox ? 1 : 0);
                    return true;
                case 10:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean shutdownTBox = shutdownTBox();
                    parcel2.writeNoException();
                    parcel2.writeInt(shutdownTBox ? 1 : 0);
                    return true;
                case 11:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestTBoxVersion = requestTBoxVersion();
                    parcel2.writeNoException();
                    parcel2.writeInt(requestTBoxVersion ? 1 : 0);
                    return true;
                case 12:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestFiveCodeInfo = requestFiveCodeInfo();
                    parcel2.writeNoException();
                    parcel2.writeInt(requestFiveCodeInfo ? 1 : 0);
                    return true;
                case 13:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestUpgrade = requestUpgrade(parcel.readString(), parcel.readString());
                    parcel2.writeNoException();
                    parcel2.writeInt(requestUpgrade ? 1 : 0);
                    return true;
                case 14:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean stopUpgrade = stopUpgrade();
                    parcel2.writeNoException();
                    parcel2.writeInt(stopUpgrade ? 1 : 0);
                    return true;
                case 15:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestDownloadLog = requestDownloadLog(parcel.readString(), parcel.readString());
                    parcel2.writeNoException();
                    parcel2.writeInt(requestDownloadLog ? 1 : 0);
                    return true;
                case 16:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean stopDownloadLog = stopDownloadLog();
                    parcel2.writeNoException();
                    parcel2.writeInt(stopDownloadLog ? 1 : 0);
                    return true;
                case 17:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestActiveDisconnect = requestActiveDisconnect();
                    parcel2.writeNoException();
                    parcel2.writeInt(requestActiveDisconnect ? 1 : 0);
                    return true;
                case 18:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestHighPrecisionLocationInfo = requestHighPrecisionLocationInfo();
                    parcel2.writeNoException();
                    parcel2.writeInt(requestHighPrecisionLocationInfo ? 1 : 0);
                    return true;
                case 19:
                    parcel.enforceInterface(DESCRIPTOR);
                    boolean requestTimeZoneInfo = requestTimeZoneInfo();
                    parcel2.writeNoException();
                    parcel2.writeInt(requestTimeZoneInfo ? 1 : 0);
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        /* loaded from: /home/user/work/dex/classes.dex */
        private static class Proxy implements ICarTBoxSdkService {
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

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public void registerCarTBoxSdkCallback(ICarTBoxSdkCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public void unregisterCarTBoxSdkCallback(ICarTBoxSdkCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callback != null ? callback.asBinder() : null);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestCurrentOperator() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestCurrentNetworkType() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestCurrentSignalStrength() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean resetTBoxNetwork() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestCurrentSignalRSSI() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestNetworkStatus() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean resetTBox() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean shutdownTBox() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestTBoxVersion() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(11, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestFiveCodeInfo() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(12, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestUpgrade(String fileName, String path) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(fileName);
                    _data.writeString(path);
                    this.mRemote.transact(13, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean stopUpgrade() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(14, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestDownloadLog(String logPath, String savePath) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(logPath);
                    _data.writeString(savePath);
                    this.mRemote.transact(15, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean stopDownloadLog() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(16, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestActiveDisconnect() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(17, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestHighPrecisionLocationInfo() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(18, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.yftech.tbox.sdk.ICarTBoxSdkService
            public boolean requestTimeZoneInfo() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(19, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
