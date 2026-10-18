.class public abstract Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;
.super Landroid/os/Binder;
.source "ICarTBoxSdkService.java"

# interfaces
.implements Lcom/yftech/tbox/sdk/ICarTBoxSdkService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/tbox/sdk/ICarTBoxSdkService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.yftech.tbox.sdk.ICarTBoxSdkService"

.field static final TRANSACTION_registerCarTBoxSdkCallback:I = 0x1

.field static final TRANSACTION_requestActiveDisconnect:I = 0x11

.field static final TRANSACTION_requestCurrentNetworkType:I = 0x4

.field static final TRANSACTION_requestCurrentOperator:I = 0x3

.field static final TRANSACTION_requestCurrentSignalRSSI:I = 0x7

.field static final TRANSACTION_requestCurrentSignalStrength:I = 0x5

.field static final TRANSACTION_requestDownloadLog:I = 0xf

.field static final TRANSACTION_requestFiveCodeInfo:I = 0xc

.field static final TRANSACTION_requestHighPrecisionLocationInfo:I = 0x12

.field static final TRANSACTION_requestNetworkStatus:I = 0x8

.field static final TRANSACTION_requestTBoxVersion:I = 0xb

.field static final TRANSACTION_requestTimeZoneInfo:I = 0x13

.field static final TRANSACTION_requestUpgrade:I = 0xd

.field static final TRANSACTION_resetTBox:I = 0x9

.field static final TRANSACTION_resetTBoxNetwork:I = 0x6

.field static final TRANSACTION_shutdownTBox:I = 0xa

.field static final TRANSACTION_stopDownloadLog:I = 0x10

.field static final TRANSACTION_stopUpgrade:I = 0xe

.field static final TRANSACTION_unregisterCarTBoxSdkCallback:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 14
    const-string v0, "com.yftech.tbox.sdk.ICarTBoxSdkService"

    invoke-virtual {p0, p0, v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 15
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/yftech/tbox/sdk/ICarTBoxSdkService;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 22
    if-nez p0, :cond_0

    .line 23
    const/4 v0, 0x0

    return-object v0

    .line 25
    :cond_0
    const-string v0, "com.yftech.tbox.sdk.ICarTBoxSdkService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 26
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    if-eqz v1, :cond_1

    .line 27
    move-object v1, v0

    check-cast v1, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    return-object v1

    .line 29
    :cond_1
    new-instance v1, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub$Proxy;

    invoke-direct {v1, p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 33
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 5
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 37
    const-string v0, "com.yftech.tbox.sdk.ICarTBoxSdkService"

    .line 38
    .local v0, "descriptor":Ljava/lang/String;
    const v1, 0x5f4e5446

    const/4 v2, 0x1

    if-eq p1, v1, :cond_0

    packed-switch p1, :pswitch_data_0

    .line 209
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    return v1

    .line 201
    :pswitch_0
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 202
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestTimeZoneInfo()Z

    move-result v1

    .line 203
    .local v1, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 204
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 205
    return v2

    .line 193
    .end local v1    # "_result":Z
    :pswitch_1
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 194
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestHighPrecisionLocationInfo()Z

    move-result v1

    .line 195
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 196
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 197
    return v2

    .line 185
    .end local v1    # "_result":Z
    :pswitch_2
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 186
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestActiveDisconnect()Z

    move-result v1

    .line 187
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 188
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 189
    return v2

    .line 177
    .end local v1    # "_result":Z
    :pswitch_3
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 178
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->stopDownloadLog()Z

    move-result v1

    .line 179
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 180
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 181
    return v2

    .line 165
    .end local v1    # "_result":Z
    :pswitch_4
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 167
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 170
    .local v3, "_arg1":Ljava/lang/String;
    invoke-virtual {p0, v1, v3}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestDownloadLog(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    .line 171
    .local v4, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 172
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 173
    return v2

    .line 157
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":Ljava/lang/String;
    .end local v4    # "_result":Z
    :pswitch_5
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 158
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->stopUpgrade()Z

    move-result v1

    .line 159
    .local v1, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 160
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 161
    return v2

    .line 145
    .end local v1    # "_result":Z
    :pswitch_6
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 147
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 149
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 150
    .restart local v3    # "_arg1":Ljava/lang/String;
    invoke-virtual {p0, v1, v3}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestUpgrade(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    .line 151
    .restart local v4    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 152
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 153
    return v2

    .line 137
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":Ljava/lang/String;
    .end local v4    # "_result":Z
    :pswitch_7
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 138
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestFiveCodeInfo()Z

    move-result v1

    .line 139
    .local v1, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 140
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 141
    return v2

    .line 129
    .end local v1    # "_result":Z
    :pswitch_8
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 130
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestTBoxVersion()Z

    move-result v1

    .line 131
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 132
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 133
    return v2

    .line 121
    .end local v1    # "_result":Z
    :pswitch_9
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 122
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->shutdownTBox()Z

    move-result v1

    .line 123
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 124
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 125
    return v2

    .line 113
    .end local v1    # "_result":Z
    :pswitch_a
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 114
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->resetTBox()Z

    move-result v1

    .line 115
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 116
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 117
    return v2

    .line 105
    .end local v1    # "_result":Z
    :pswitch_b
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 106
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestNetworkStatus()Z

    move-result v1

    .line 107
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 108
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 109
    return v2

    .line 97
    .end local v1    # "_result":Z
    :pswitch_c
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 98
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestCurrentSignalRSSI()Z

    move-result v1

    .line 99
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 100
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 101
    return v2

    .line 89
    .end local v1    # "_result":Z
    :pswitch_d
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->resetTBoxNetwork()Z

    move-result v1

    .line 91
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 92
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 93
    return v2

    .line 81
    .end local v1    # "_result":Z
    :pswitch_e
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 82
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestCurrentSignalStrength()Z

    move-result v1

    .line 83
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 84
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 85
    return v2

    .line 73
    .end local v1    # "_result":Z
    :pswitch_f
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestCurrentNetworkType()Z

    move-result v1

    .line 75
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 76
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 77
    return v2

    .line 65
    .end local v1    # "_result":Z
    :pswitch_10
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 66
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->requestCurrentOperator()Z

    move-result v1

    .line 67
    .restart local v1    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 68
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 69
    return v2

    .line 56
    .end local v1    # "_result":Z
    :pswitch_11
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 58
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback;

    move-result-object v1

    .line 59
    .local v1, "_arg0":Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback;
    invoke-virtual {p0, v1}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->unregisterCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback;)V

    .line 60
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 61
    return v2

    .line 47
    .end local v1    # "_arg0":Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback;
    :pswitch_12
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback;

    move-result-object v1

    .line 50
    .restart local v1    # "_arg0":Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback;
    invoke-virtual {p0, v1}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->registerCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback;)V

    .line 51
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 52
    return v2

    .line 42
    .end local v1    # "_arg0":Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback;
    :cond_0
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 43
    return v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
