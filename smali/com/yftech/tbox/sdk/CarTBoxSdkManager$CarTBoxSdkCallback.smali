.class public abstract Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
.super Ljava/lang/Object;
.source "CarTBoxSdkManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/tbox/sdk/CarTBoxSdkManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "CarTBoxSdkCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActiveDisconnect(I)V
    .locals 0
    .param p1, "state"    # I

    .line 1283
    return-void
.end method

.method public onBaseStationInfo(ILjava/lang/String;I)V
    .locals 0
    .param p1, "networkType"    # I
    .param p2, "operator"    # Ljava/lang/String;
    .param p3, "cell"    # I

    .line 1202
    return-void
.end method

.method public onCurrentNetworkType(I)V
    .locals 0
    .param p1, "type"    # I

    .line 1135
    return-void
.end method

.method public onCurrentOperator(I)V
    .locals 0
    .param p1, "operator"    # I

    .line 1122
    return-void
.end method

.method public onCurrentSignalRSSI(I)V
    .locals 0
    .param p1, "rssi"    # I

    .line 1151
    return-void
.end method

.method public onCurrentSignalStrength(I)V
    .locals 0
    .param p1, "signal"    # I

    .line 1143
    return-void
.end method

.method public onDownloadLogState(II)V
    .locals 0
    .param p1, "state"    # I
    .param p2, "progress"    # I

    .line 1273
    return-void
.end method

.method public onFiveCodeInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "info"    # Ljava/lang/String;

    .line 1180
    return-void
.end method

.method public onGNSSLocationInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "info"    # Ljava/lang/String;

    .line 1323
    return-void
.end method

.method public onHighPrecisionLocationInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "info"    # Ljava/lang/String;

    .line 1302
    return-void
.end method

.method public onNetworkState(II)V
    .locals 0
    .param p1, "simState"    # I
    .param p2, "networkState"    # I

    .line 1164
    return-void
.end method

.method public onResetTBox(I)V
    .locals 0
    .param p1, "state"    # I

    .line 1222
    return-void
.end method

.method public onResetTBoxNetwork(I)V
    .locals 0
    .param p1, "state"    # I

    .line 1212
    return-void
.end method

.method public onServiceBind()V
    .locals 0

    .line 1109
    return-void
.end method

.method public onShutdownTBox(I)V
    .locals 0
    .param p1, "state"    # I

    .line 1232
    return-void
.end method

.method public onTBoxVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "version"    # Ljava/lang/String;

    .line 1172
    return-void
.end method

.method public onTimeZoneInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "info"    # Ljava/lang/String;

    .line 1310
    return-void
.end method

.method public onUpgradeState(II)V
    .locals 0
    .param p1, "state"    # I
    .param p2, "progress"    # I

    .line 1248
    return-void
.end method

.method public onUpgradeTip(Ljava/lang/String;)V
    .locals 0
    .param p1, "tip"    # Ljava/lang/String;

    .line 1256
    return-void
.end method
