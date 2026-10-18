.class public Lcom/yftech/tbox/sdk/CarTBoxSdkManager;
.super Ljava/lang/Object;
.source "CarTBoxSdkManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;,
        Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;
    }
.end annotation


# static fields
.field public static final BASE_STATION_CELL_ADJACENT_COMMUNITIES:I = 0x0

.field public static final BASE_STATION_CELL_CURRENT_COMMUNITY:I = 0x1

.field public static final BASE_STATION_NETWORK_TYPE_2G:I = 0x2

.field public static final BASE_STATION_NETWORK_TYPE_3G:I = 0x3

.field public static final BASE_STATION_NETWORK_TYPE_4G:I = 0x4

.field public static final BASE_STATION_NETWORK_TYPE_CONNECTING:I = 0x1

.field public static final BASE_STATION_NETWORK_TYPE_NO_NETWORK:I = 0x0

.field public static final BASE_STATION_OPERATOR_CHINA_MOBILE:Ljava/lang/String; = "46000"

.field public static final BASE_STATION_OPERATOR_CHINA_TELECOM:Ljava/lang/String; = "46002"

.field public static final BASE_STATION_OPERATOR_CHINA_UNICOM:Ljava/lang/String; = "46001"

.field public static final BASE_STATION_OPERATOR_NOT_REGISTERED:Ljava/lang/String; = "00000"

.field public static final BASE_STATION_OPERATOR_OTHER:Ljava/lang/String; = "N.A."

.field public static final LOG_STATE_EXPORTING:I = 0xa0

.field public static final LOG_STATE_EXPORT_COMPLETE:I = 0x80

.field public static final LOG_STATE_EXPORT_FAILED:I = 0x82

.field public static final LOG_STATE_EXPORT_FAILED_FTP_ERROR:I = 0xa3

.field public static final LOG_STATE_EXPORT_FAILED_INVALID_PATH:I = 0x81

.field public static final LOG_STATE_EXPORT_FAILED_PARAM_ERROR:I = 0xa1

.field public static final LOG_STATE_EXPORT_FAILED_UNCONNECTED:I = 0xa2

.field public static final LOG_STATE_EXPORT_START:I = 0x0

.field public static final NETWORK_STATE_NETWORK_AVAILABLE:I = 0x1

.field public static final NETWORK_STATE_NETWORK_UNAVAILABLE:I = 0x0

.field public static final NETWORK_STATE_SIM_CARD_AVAILABLE:I = 0x1

.field public static final NETWORK_STATE_SIM_CARD_UNAVAILABLE:I = 0x0

.field public static final NETWORK_TYPE_2G:I = 0x1

.field public static final NETWORK_TYPE_3G:I = 0x2

.field public static final NETWORK_TYPE_4G:I = 0x3

.field public static final NETWORK_TYPE_SIM_CARD_FAULT:I = 0x10

.field public static final NETWORK_TYPE_UNKNOWN:I = 0x0

.field public static final OPERATOR_CHINA_MOBILE:I = 0x2

.field public static final OPERATOR_CHINA_TELECOM:I = 0x3

.field public static final OPERATOR_CHINA_UNICOM:I = 0x1

.field public static final OPERATOR_SIM_CARD_FAULT:I = 0x10

.field public static final OPERATOR_UNKNOWN:I = 0x0

.field public static final SERVICE_NAME:Ljava/lang/String; = "car_tbox_sdk"

.field public static final STATE_FAILED:I = 0x1

.field public static final STATE_SUCCESS:I = 0x0

.field private static final TAG:Ljava/lang/String; = "CarTBoxSdkManager"

.field public static final UPGRADE_STATE_COMPLETE:I = 0x80

.field public static final UPGRADE_STATE_FAILED:I = 0x81

.field public static final UPGRADE_STATE_FAILED_FTP_ERROR:I = 0xa3

.field public static final UPGRADE_STATE_FAILED_PARAM_ERROR:I = 0xa1

.field public static final UPGRADE_STATE_FAILED_UNCONNECTED:I = 0xa2

.field public static final UPGRADE_STATE_START:I = 0x0

.field public static final UPGRADE_STATE_UPGRADING:I = 0xa0

.field private static volatile mInstance:Lcom/yftech/tbox/sdk/CarTBoxSdkManager;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 195
    return-void
.end method

.method public static getInstance()Lcom/yftech/tbox/sdk/CarTBoxSdkManager;
    .locals 2

    .line 203
    sget-object v0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;->mInstance:Lcom/yftech/tbox/sdk/CarTBoxSdkManager;

    if-nez v0, :cond_1

    .line 204
    const-class v0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;

    monitor-enter v0

    .line 205
    :try_start_0
    sget-object v1, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;->mInstance:Lcom/yftech/tbox/sdk/CarTBoxSdkManager;

    if-nez v1, :cond_0

    .line 206
    new-instance v1, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;

    invoke-direct {v1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;-><init>()V

    sput-object v1, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;->mInstance:Lcom/yftech/tbox/sdk/CarTBoxSdkManager;

    .line 208
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 210
    :cond_1
    :goto_0
    sget-object v0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;->mInstance:Lcom/yftech/tbox/sdk/CarTBoxSdkManager;

    return-object v0
.end method


# virtual methods
.method public getVersionName()Ljava/lang/String;
    .locals 1

    .line 418
    const-string v0, "1.0.240625"

    return-object v0
.end method

.method public registerCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Landroid/os/Handler;)V
    .locals 3
    .param p1, "callback"    # Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    .param p2, "handler"    # Landroid/os/Handler;

    .line 220
    if-nez p2, :cond_1

    .line 221
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    .line 222
    .local v0, "looper":Landroid/os/Looper;
    if-eqz v0, :cond_0

    .line 225
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    move-object p2, v1

    goto :goto_0

    .line 223
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No handler given, and current thread has no looper!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 227
    .end local v0    # "looper":Landroid/os/Looper;
    :cond_1
    :goto_0
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->registerCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Landroid/os/Handler;)V

    .line 228
    return-void
.end method

.method public requestActiveDisconnect()Z
    .locals 1

    .line 389
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestActiveDisconnect()Z

    move-result v0

    return v0
.end method

.method public requestCurrentNetworkType()Z
    .locals 1

    .line 256
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestCurrentNetworkType()Z

    move-result v0

    return v0
.end method

.method public requestCurrentOperator()Z
    .locals 1

    .line 246
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestCurrentOperator()Z

    move-result v0

    return v0
.end method

.method public requestCurrentSignalRSSI()Z
    .locals 1

    .line 286
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestCurrentSignalRSSI()Z

    move-result v0

    return v0
.end method

.method public requestCurrentSignalStrength()Z
    .locals 1

    .line 266
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestCurrentSignalStrength()Z

    move-result v0

    return v0
.end method

.method public requestDownloadLog(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "logPath"    # Ljava/lang/String;
    .param p2, "savePath"    # Ljava/lang/String;

    .line 370
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestDownloadLog(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public requestFiveCodeInfo()Z
    .locals 1

    .line 336
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestFiveCodeInfo()Z

    move-result v0

    return v0
.end method

.method public requestHighPrecisionLocationInfo()Z
    .locals 1

    .line 399
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestHighPrecisionLocationInfo()Z

    move-result v0

    return v0
.end method

.method public requestNetworkStatus()Z
    .locals 1

    .line 296
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestNetworkStatus()Z

    move-result v0

    return v0
.end method

.method public requestTBoxVersion()Z
    .locals 1

    .line 326
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestTBoxVersion()Z

    move-result v0

    return v0
.end method

.method public requestTimeZoneInfo()Z
    .locals 1

    .line 409
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestTimeZoneInfo()Z

    move-result v0

    return v0
.end method

.method public requestUpgrade(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .line 349
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->requestUpgrade(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public resetTBox()Z
    .locals 1

    .line 306
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->resetTBox()Z

    move-result v0

    return v0
.end method

.method public resetTBoxNetwork()Z
    .locals 1

    .line 276
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->resetTBoxNetwork()Z

    move-result v0

    return v0
.end method

.method public shutdownTBox()Z
    .locals 1

    .line 316
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->shutdownTBox()Z

    move-result v0

    return v0
.end method

.method public stopDownloadLog()Z
    .locals 1

    .line 379
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->stopDownloadLog()Z

    move-result v0

    return v0
.end method

.method public stopUpgrade()Z
    .locals 1

    .line 358
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->stopUpgrade()Z

    move-result v0

    return v0
.end method

.method public unregisterCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;)V
    .locals 1
    .param p1, "callback"    # Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 236
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->unregisterCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;)V

    .line 237
    return-void
.end method
