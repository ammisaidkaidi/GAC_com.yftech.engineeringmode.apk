.class public Lcom/yftech/engineeringmode/util/LogManager;
.super Ljava/lang/Object;
.source "LogManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "LogManager"

.field private static sLogManager:Lcom/yftech/engineeringmode/util/LogManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mLogDownloadUsbIndex:I

.field private final mMainHandler:Landroid/os/Handler;

.field private final mOnDataChangeCallback:Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;

.field private mToast:Landroid/widget/Toast;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/util/LogManager;->mMainHandler:Landroid/os/Handler;

    .line 24
    new-instance v0, Lcom/yftech/engineeringmode/util/LogManager$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/util/LogManager$1;-><init>(Lcom/yftech/engineeringmode/util/LogManager;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/util/LogManager;->mOnDataChangeCallback:Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;

    .line 45
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/util/LogManager;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/util/LogManager;

    .line 15
    iget v0, p0, Lcom/yftech/engineeringmode/util/LogManager;->mLogDownloadUsbIndex:I

    return v0
.end method

.method static synthetic access$002(Lcom/yftech/engineeringmode/util/LogManager;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/util/LogManager;
    .param p1, "x1"    # I

    .line 15
    iput p1, p0, Lcom/yftech/engineeringmode/util/LogManager;->mLogDownloadUsbIndex:I

    return p1
.end method

.method public static declared-synchronized getInstance()Lcom/yftech/engineeringmode/util/LogManager;
    .locals 2

    const-class v0, Lcom/yftech/engineeringmode/util/LogManager;

    monitor-enter v0

    .line 48
    :try_start_0
    sget-object v1, Lcom/yftech/engineeringmode/util/LogManager;->sLogManager:Lcom/yftech/engineeringmode/util/LogManager;

    if-nez v1, :cond_0

    .line 49
    new-instance v1, Lcom/yftech/engineeringmode/util/LogManager;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/util/LogManager;-><init>()V

    sput-object v1, Lcom/yftech/engineeringmode/util/LogManager;->sLogManager:Lcom/yftech/engineeringmode/util/LogManager;

    .line 51
    :cond_0
    sget-object v1, Lcom/yftech/engineeringmode/util/LogManager;->sLogManager:Lcom/yftech/engineeringmode/util/LogManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 47
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private showToast(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .line 98
    iget-object v0, p0, Lcom/yftech/engineeringmode/util/LogManager;->mToast:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/util/LogManager;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/util/LogManager;->mToast:Landroid/widget/Toast;

    .line 102
    iget-object v0, p0, Lcom/yftech/engineeringmode/util/LogManager;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 103
    return-void
.end method


# virtual methods
.method public deInit()V
    .locals 2

    .line 61
    const-string v0, "LogManager"

    const-string v1, "deInit()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/util/LogManager;->mOnDataChangeCallback:Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/media/data/CarMediaDataManager;->unregisterCarDataControlCallback(Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;)V

    .line 63
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 55
    const-string v0, "LogManager"

    const-string v1, "init()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    iput-object p1, p0, Lcom/yftech/engineeringmode/util/LogManager;->mContext:Landroid/content/Context;

    .line 57
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/util/LogManager;->mOnDataChangeCallback:Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;

    iget-object v2, p0, Lcom/yftech/engineeringmode/util/LogManager;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yftech/car/media/data/CarMediaDataManager;->registerCarDataControlCallback(Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;Landroid/os/Handler;)V

    .line 58
    return-void
.end method

.method public startLog()V
    .locals 8

    .line 66
    const-string v0, "init.svc.yflog"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "yflogstatus":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startLog() yflogstatus:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LogManager"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    const-string v1, "running"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 69
    const-string v1, "\u6b63\u5728\u53d6\u65e5\u5fd7\uff0c\u8bf7\u7a0d\u7b49"

    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/util/LogManager;->showToast(Ljava/lang/String;)V

    .line 70
    return-void

    .line 72
    :cond_0
    const/4 v1, -0x1

    iput v1, p0, Lcom/yftech/engineeringmode/util/LogManager;->mLogDownloadUsbIndex:I

    .line 73
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/data/CarMediaDataManager;->getExistUdiskList()Ljava/util/List;

    move-result-object v1

    .line 75
    .local v1, "udiskPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v3, ""

    .line 76
    .local v3, "path":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 77
    .local v5, "udiskPath":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "startLog() udiskPath:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    const-string v6, "/storage/udisk"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 79
    move-object v3, v5

    .line 80
    goto :goto_1

    .line 82
    .end local v5    # "udiskPath":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 84
    :cond_2
    :goto_1
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 86
    const-string v4, "startLog() no usb"

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    const-string v2, "\u53d6\u65e5\u5fd7\uff0c\u8bf7\u5148\u63a5\u5165U\u76d8"

    invoke-direct {p0, v2}, Lcom/yftech/engineeringmode/util/LogManager;->showToast(Ljava/lang/String;)V

    .line 88
    return-void

    .line 91
    :cond_3
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/yftech/car/media/data/CarMediaDataManager;->getUsbIndex(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/yftech/engineeringmode/util/LogManager;->mLogDownloadUsbIndex:I

    .line 92
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "startLog() path:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " logDownloadUsbIndex:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Lcom/yftech/engineeringmode/util/LogManager;->mLogDownloadUsbIndex:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    const-string v2, "yf.log.capture.save.path"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    const-string v2, "ctl.start"

    const-string v4, "yflog"

    invoke-static {v2, v4}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    return-void
.end method
