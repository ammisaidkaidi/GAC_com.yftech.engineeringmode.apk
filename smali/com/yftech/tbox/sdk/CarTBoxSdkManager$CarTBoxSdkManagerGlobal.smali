.class final Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;
.super Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback$Stub;
.source "CarTBoxSdkManager.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;
.implements Lcom/yftech/car/utils/MonitorServiceRestartManager$IMonitorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/tbox/sdk/CarTBoxSdkManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CarTBoxSdkManagerGlobal"
.end annotation


# static fields
.field private static final CAR_TBOX_SDK_GLOBAL:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

.field private static mCarTBoxSdkService:Lcom/yftech/tbox/sdk/ICarTBoxSdkService;


# instance fields
.field private final mCallbackMap:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;",
            "Landroid/os/Handler;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 426
    new-instance v0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    invoke-direct {v0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;-><init>()V

    sput-object v0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->CAR_TBOX_SDK_GLOBAL:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 434
    invoke-direct {p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback$Stub;-><init>()V

    .line 427
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    .line 432
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    .line 435
    return-void
.end method

.method private connectCarTBoxSdkServiceLocked()Z
    .locals 8

    .line 467
    sget-object v0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCarTBoxSdkService:Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCarTBoxSdkService:Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-interface {v0}, Landroid/os/IBinder;->isBinderAlive()Z

    move-result v0

    if-nez v0, :cond_2

    .line 468
    :cond_0
    const-string v0, "car_tbox_sdk"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 470
    .local v0, "binder":Landroid/os/IBinder;
    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 471
    :try_start_0
    invoke-interface {v0, p0, v1}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 472
    invoke-static {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v2

    sput-object v2, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCarTBoxSdkService:Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    .line 474
    sget-object v2, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCarTBoxSdkService:Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    invoke-interface {v2, p0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->registerCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/ICarTBoxSdkCallback;)V

    .line 475
    iget-object v2, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 476
    :try_start_1
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3}, Landroid/util/ArrayMap;->size()I

    move-result v3

    .line 477
    .local v3, "callbackCount":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 478
    iget-object v5, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v5, v4}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/Handler;

    .line 479
    .local v5, "handler":Landroid/os/Handler;
    iget-object v6, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v6, v4}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 480
    .local v6, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v7, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$1;

    invoke-direct {v7, p0, v6}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$1;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;)V

    invoke-virtual {v5, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 477
    nop

    .end local v5    # "handler":Landroid/os/Handler;
    .end local v6    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 487
    .end local v3    # "callbackCount":I
    .end local v4    # "i":I
    :cond_1
    monitor-exit v2

    .line 496
    nop

    .line 498
    .end local v0    # "binder":Landroid/os/IBinder;
    :cond_2
    const/4 v0, 0x1

    return v0

    .line 487
    .restart local v0    # "binder":Landroid/os/IBinder;
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v0    # "binder":Landroid/os/IBinder;
    :try_start_2
    throw v3

    .line 489
    .restart local v0    # "binder":Landroid/os/IBinder;
    :cond_3
    const-string v2, "CarTBoxSdkManager"

    const-string v3, "the car screen service not started!connected service fail!"

    invoke-static {v2, v3}, Lcom/yftech/tbox/sdk/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    .line 490
    return v1

    .line 492
    :catch_0
    move-exception v2

    .line 493
    .local v2, "e":Landroid/os/RemoteException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "link to death error!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "CarTBoxSdkManager"

    invoke-static {v4, v3}, Lcom/yftech/tbox/sdk/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 494
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    .line 495
    return v1
.end method

.method public static get()Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;
    .locals 1

    .line 438
    sget-object v0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->CAR_TBOX_SDK_GLOBAL:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    return-object v0
.end method

.method private startReconnectThread()V
    .locals 2

    .line 455
    invoke-static {}, Lcom/yftech/car/utils/MonitorServiceRestartManager;->getInstance()Lcom/yftech/car/utils/MonitorServiceRestartManager;

    move-result-object v0

    const-string v1, "car_tbox_sdk"

    invoke-virtual {v0, v1, p0}, Lcom/yftech/car/utils/MonitorServiceRestartManager;->addMonitor(Ljava/lang/String;Lcom/yftech/car/utils/MonitorServiceRestartManager$IMonitorCallback;)V

    .line 456
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 504
    return-object p0
.end method

.method public binderDied()V
    .locals 2

    .line 510
    const-string v0, "CarTBoxSdkManager"

    const-string v1, "binder died,reconnect service car_tbox_sdk after 1000ms!"

    invoke-static {v0, v1}, Lcom/yftech/tbox/sdk/LogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 513
    :try_start_0
    sget-object v1, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCarTBoxSdkService:Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    if-nez v1, :cond_0

    .line 514
    monitor-exit v0

    return-void

    .line 516
    :cond_0
    const/4 v1, 0x0

    sput-object v1, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCarTBoxSdkService:Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    .line 517
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 519
    invoke-direct {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->startReconnectThread()V

    .line 521
    :cond_1
    monitor-exit v0

    .line 522
    return-void

    .line 521
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;
    .locals 3

    .line 442
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 443
    :try_start_0
    invoke-direct {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->connectCarTBoxSdkServiceLocked()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCarTBoxSdkService:Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    if-nez v1, :cond_1

    .line 444
    :cond_0
    const-string v1, "CarTBoxSdkManager"

    const-string v2, "car screen service is unavailable"

    invoke-static {v1, v2}, Lcom/yftech/tbox/sdk/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 445
    invoke-direct {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->startReconnectThread()V

    .line 447
    :cond_1
    sget-object v1, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCarTBoxSdkService:Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    monitor-exit v0

    return-object v1

    .line 448
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onActiveDisconnect(I)V
    .locals 6
    .param p1, "state"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1034
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1035
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 1036
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1037
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 1038
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 1039
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$16;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$16;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;I)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1036
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1046
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 1047
    return-void

    .line 1046
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onBaseStationInfo(ILjava/lang/String;I)V
    .locals 11
    .param p1, "networkType"    # I
    .param p2, "operator"    # Ljava/lang/String;
    .param p3, "cell"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 915
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 916
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 917
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 918
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 919
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 920
    .local v7, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;

    move-object v5, v4

    move-object v6, p0

    move v8, p1

    move-object v9, p2

    move v10, p3

    invoke-direct/range {v5 .. v10}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;ILjava/lang/String;I)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 917
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v7    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 927
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 928
    return-void

    .line 927
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onCurrentNetworkType(I)V
    .locals 6
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 813
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 814
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 815
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 816
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 817
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 818
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$3;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$3;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;I)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 815
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 825
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 826
    return-void

    .line 825
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onCurrentOperator(I)V
    .locals 6
    .param p1, "operator"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 796
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 797
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 798
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 799
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 800
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 801
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$2;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$2;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;I)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 798
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 808
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 809
    return-void

    .line 808
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onCurrentSignalRSSI(I)V
    .locals 6
    .param p1, "rssi"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 847
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 848
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 849
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 850
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 851
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 852
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$5;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$5;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;I)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 849
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 859
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 860
    return-void

    .line 859
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onCurrentSignalStrength(I)V
    .locals 6
    .param p1, "signal"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 830
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 831
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 832
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 833
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 834
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 835
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$4;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$4;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;I)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 832
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 842
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 843
    return-void

    .line 842
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onDownloadLogState(II)V
    .locals 6
    .param p1, "state"    # I
    .param p2, "progress"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1017
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1018
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 1019
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1020
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 1021
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 1022
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$15;

    invoke-direct {v5, p0, v4, p1, p2}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$15;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;II)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1019
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1029
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 1030
    return-void

    .line 1029
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onFiveCodeInfo(Ljava/lang/String;)V
    .locals 6
    .param p1, "info"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 898
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 899
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 900
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 901
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 902
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 903
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$8;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$8;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 900
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 910
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 911
    return-void

    .line 910
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onGNSSLocationInfo(Ljava/lang/String;)V
    .locals 6
    .param p1, "info"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1085
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1086
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 1087
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1088
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 1089
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 1090
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$19;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$19;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1087
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1097
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 1098
    return-void

    .line 1097
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onHighPrecisionLocationInfo(Ljava/lang/String;)V
    .locals 6
    .param p1, "info"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1051
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1052
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 1053
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1054
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 1055
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 1056
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$17;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$17;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1053
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1063
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 1064
    return-void

    .line 1063
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onNetworkState(II)V
    .locals 6
    .param p1, "simState"    # I
    .param p2, "networkState"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 864
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 865
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 866
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 867
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 868
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 869
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$6;

    invoke-direct {v5, p0, v4, p1, p2}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$6;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;II)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 866
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 876
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 877
    return-void

    .line 876
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onResetTBox(I)V
    .locals 6
    .param p1, "state"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 949
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 950
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 951
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 952
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 953
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 954
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$11;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$11;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;I)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 951
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 961
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 962
    return-void

    .line 961
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onResetTBoxNetwork(I)V
    .locals 6
    .param p1, "state"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 932
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 933
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 934
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 935
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 936
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 937
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$10;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$10;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;I)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 934
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 944
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 945
    return-void

    .line 944
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onServiceStart(Ljava/lang/String;)V
    .locals 0
    .param p1, "serviceName"    # Ljava/lang/String;

    .line 460
    invoke-direct {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->connectCarTBoxSdkServiceLocked()Z

    .line 461
    return-void
.end method

.method public onShutdownTBox(I)V
    .locals 6
    .param p1, "state"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 966
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 967
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 968
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 969
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 970
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 971
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$12;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$12;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;I)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 968
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 978
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 979
    return-void

    .line 978
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onTBoxVersion(Ljava/lang/String;)V
    .locals 6
    .param p1, "version"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 881
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 882
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 883
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 884
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 885
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 886
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$7;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$7;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 883
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 893
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 894
    return-void

    .line 893
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onTimeZoneInfo(Ljava/lang/String;)V
    .locals 6
    .param p1, "info"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1068
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1069
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 1070
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1071
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 1072
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 1073
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$18;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$18;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1070
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1080
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 1081
    return-void

    .line 1080
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onUpgradeState(II)V
    .locals 6
    .param p1, "state"    # I
    .param p2, "progress"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 983
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 984
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 985
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 986
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 987
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 988
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$13;

    invoke-direct {v5, p0, v4, p1, p2}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$13;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;II)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 985
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 995
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 996
    return-void

    .line 995
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onUpgradeTip(Ljava/lang/String;)V
    .locals 6
    .param p1, "tip"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1000
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1001
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    move-result v1

    .line 1002
    .local v1, "callbackCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1003
    iget-object v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Handler;

    .line 1004
    .local v3, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 1005
    .local v4, "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    new-instance v5, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$14;

    invoke-direct {v5, p0, v4, p1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$14;-><init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1002
    nop

    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "callback":Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1012
    .end local v1    # "callbackCount":I
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 1013
    return-void

    .line 1012
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public registerCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Landroid/os/Handler;)V
    .locals 2
    .param p1, "callback"    # Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
    .param p2, "handler"    # Landroid/os/Handler;

    .line 531
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 532
    :try_start_0
    invoke-direct {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->connectCarTBoxSdkServiceLocked()Z

    move-result v1

    if-nez v1, :cond_0

    .line 533
    invoke-direct {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->startReconnectThread()V

    .line 535
    :cond_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 536
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1, p2}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    :cond_1
    monitor-exit v0

    .line 539
    return-void

    .line 538
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method requestActiveDisconnect()Z
    .locals 1

    .line 759
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestActiveDisconnect()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 760
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 761
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 763
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestCurrentNetworkType()Z
    .locals 1

    .line 573
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestCurrentNetworkType()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 574
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 575
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 577
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestCurrentOperator()Z
    .locals 1

    .line 559
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestCurrentOperator()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 560
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 561
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 563
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestCurrentSignalRSSI()Z
    .locals 1

    .line 615
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestCurrentSignalRSSI()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 616
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 617
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 619
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestCurrentSignalStrength()Z
    .locals 1

    .line 587
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestCurrentSignalStrength()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 588
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 589
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 591
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestDownloadLog(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "logPath"    # Ljava/lang/String;
    .param p2, "savePath"    # Ljava/lang/String;

    .line 717
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestDownloadLog(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 718
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 719
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 721
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestFiveCodeInfo()Z
    .locals 1

    .line 685
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestFiveCodeInfo()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 686
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 687
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 689
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestHighPrecisionLocationInfo()Z
    .locals 1

    .line 773
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestHighPrecisionLocationInfo()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 774
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 775
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 777
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestNetworkStatus()Z
    .locals 1

    .line 629
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestNetworkStatus()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 630
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 631
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 633
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestTBoxVersion()Z
    .locals 1

    .line 671
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestTBoxVersion()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 672
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 673
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 675
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestTimeZoneInfo()Z
    .locals 1

    .line 787
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestTimeZoneInfo()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 788
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 789
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 791
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method requestUpgrade(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .line 701
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->requestUpgrade(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 702
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 703
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 705
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method resetTBox()Z
    .locals 1

    .line 643
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->resetTBox()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 644
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 645
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 647
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method resetTBoxNetwork()Z
    .locals 1

    .line 601
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->resetTBoxNetwork()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 602
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 603
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 605
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method shutdownTBox()Z
    .locals 1

    .line 657
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->shutdownTBox()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 658
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 659
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 661
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method stopDownloadLog()Z
    .locals 1

    .line 745
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->stopDownloadLog()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 746
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 747
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 749
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method stopUpgrade()Z
    .locals 1

    .line 731
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->getCarScreenService()Lcom/yftech/tbox/sdk/ICarTBoxSdkService;

    move-result-object v0

    invoke-interface {v0}, Lcom/yftech/tbox/sdk/ICarTBoxSdkService;->stopUpgrade()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 732
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 733
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 735
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return v0
.end method

.method public unregisterCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;)V
    .locals 2
    .param p1, "callback"    # Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    .line 547
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 548
    :try_start_0
    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->mCallbackMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 549
    monitor-exit v0

    .line 550
    return-void

    .line 549
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
