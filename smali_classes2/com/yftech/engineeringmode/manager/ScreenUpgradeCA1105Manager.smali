.class public Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;
.super Ljava/lang/Object;
.source "ScreenUpgradeCA1105Manager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;
    }
.end annotation


# static fields
.field private static final SCREEN_UPGRADE_ATUO_FILE_PATH:Ljava/lang/String; = "/vendor/firmware"

.field private static final SCREEN_UPGRADE_FILE_DST_PATH:Ljava/lang/String; = "/sdcard"

.field private static final SCREEN_UPGRADE_FILE_NAME:Ljava/lang/String; = "screen.bin"

.field private static final SCREEN_UPGRADE_NODE:Ljava/lang/String; = "/sys/bus/i2c/devices/3-0038/fts_upgrade_bin"

.field private static final SCREEN_VERSION_NODE:Ljava/lang/String; = "/sys/bus/i2c/devices/3-0038/fts_fw_version"

.field private static final TAG:Ljava/lang/String; = "ScreenUpgradeCA1105Manager"

.field public static final UPGRADE_FAIL:I = 0x3

.field public static final UPGRADE_FAIL_COPY_FAIL:I = 0x5

.field public static final UPGRADE_FAIL_NOT_FILE:I = 0x4

.field public static final UPGRADE_FINISH:I = 0x2

.field public static final UPGRADE_START:I = 0x1

.field private static sScreenUpgradeCA1105Manager:Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;


# instance fields
.field private mFilePath:Ljava/lang/String;

.field private mScreenUpgradeCA1105Dialog:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

.field private final mScreenUpgradeCA1105Listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mScreenUpgradeCA1105Listeners:Ljava/util/List;

    .line 57
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    .line 28
    invoke-direct {p0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->writeUpgradeBin()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;
    .locals 2

    const-class v0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    monitor-enter v0

    .line 60
    :try_start_0
    sget-object v1, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->sScreenUpgradeCA1105Manager:Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    if-nez v1, :cond_0

    .line 61
    new-instance v1, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;-><init>()V

    sput-object v1, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->sScreenUpgradeCA1105Manager:Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    .line 63
    :cond_0
    sget-object v1, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->sScreenUpgradeCA1105Manager:Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 59
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private notifyOnScreenUpgradeCA1105State(I)V
    .locals 2
    .param p1, "status"    # I

    .line 228
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "status:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ScreenUpgradeCA1105Manager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    .line 231
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/sdcard"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "screen.bin"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/yftech/engineeringmode/util/DeleteUtil;->delete(Ljava/lang/String;)Z

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mScreenUpgradeCA1105Listeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;

    .line 234
    .local v1, "listener":Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;
    invoke-interface {v1, p1}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;->onScreenUpgradeCA1105State(I)V

    .line 235
    .end local v1    # "listener":Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;
    goto :goto_0

    .line 236
    :cond_1
    return-void
.end method

.method private writeUpgradeBin()V
    .locals 5

    .line 199
    const-string v0, "ScreenUpgradeCA1105Manager"

    const-string v1, "writeUpgradeBin()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    const/4 v0, 0x0

    .line 202
    .local v0, "bufferedWriter":Ljava/io/BufferedWriter;
    const/4 v1, 0x3

    :try_start_0
    new-instance v2, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/FileWriter;

    const-string v4, "/sys/bus/i2c/devices/3-0038/fts_upgrade_bin"

    invoke-direct {v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    move-object v0, v2

    .line 203
    const-string v2, "screen.bin"

    invoke-virtual {v0, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 204
    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 205
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->flush()V

    .line 206
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->notifyOnScreenUpgradeCA1105State(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    nop

    .line 213
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 218
    :cond_0
    :goto_0
    goto :goto_1

    .line 215
    :catch_0
    move-exception v2

    .line 216
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 217
    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->notifyOnScreenUpgradeCA1105State(I)V

    .line 219
    .end local v2    # "e":Ljava/io/IOException;
    goto :goto_1

    .line 211
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 207
    :catch_1
    move-exception v2

    .line 208
    .restart local v2    # "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 209
    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->notifyOnScreenUpgradeCA1105State(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 212
    .end local v2    # "e":Ljava/io/IOException;
    if-eqz v0, :cond_0

    .line 213
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 220
    :goto_1
    return-void

    .line 212
    :goto_2
    if-eqz v0, :cond_1

    .line 213
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    .line 215
    :catch_2
    move-exception v3

    .line 216
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 217
    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->notifyOnScreenUpgradeCA1105State(I)V

    goto :goto_4

    .line 218
    .end local v3    # "e":Ljava/io/IOException;
    :cond_1
    :goto_3
    nop

    .line 219
    :goto_4
    throw v2
.end method


# virtual methods
.method public addScreenUpgradeCA1105Listener(Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;

    .line 72
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mScreenUpgradeCA1105Listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mScreenUpgradeCA1105Listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    :cond_0
    return-void
.end method

.method public checkAutoScreenUpgrade(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .line 240
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCA1105Project()Z

    move-result v0

    const-string v1, "ScreenUpgradeCA1105Manager"

    if-nez v0, :cond_0

    .line 241
    const-string v0, "checkAutoScreenUpgrade() is not 1105, killProcess"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    invoke-static {}, Lcom/yftech/engineeringmode/util/Utils;->killProcess()V

    .line 243
    return-void

    .line 245
    :cond_0
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/vendor/firmware"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "screen.bin"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 247
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 248
    const-string v2, "checkAutoScreenUpgrade() upgrade file is not exists, killProcess"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    invoke-static {}, Lcom/yftech/engineeringmode/util/Utils;->killProcess()V

    .line 250
    return-void

    .line 253
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mFilePath:Ljava/lang/String;

    .line 255
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getCurScreenVersion()Ljava/lang/String;

    move-result-object v2

    .line 256
    .local v2, "curVersion":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getScreenUpgradeFileVersion()Ljava/lang/String;

    move-result-object v3

    .line 257
    .local v3, "fileVersion":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "checkAutoScreenUpgrade() curVersion:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " fileVersion:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " path:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mFilePath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 259
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 260
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 261
    const-string v4, "checkAutoScreenUpgrade() upgrade"

    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    new-instance v1, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    const/4 v4, 0x0

    invoke-direct {v1, p1, v4}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;-><init>(Landroid/content/Context;Z)V

    iput-object v1, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mScreenUpgradeCA1105Dialog:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 263
    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mScreenUpgradeCA1105Dialog:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    new-instance v4, Lcom/yftech/engineeringmode/manager/-$$Lambda$ScreenUpgradeCA1105Manager$FJ3RzWmZoVoTNrMtWhmrIcLbVt4;

    invoke-direct {v4, p0}, Lcom/yftech/engineeringmode/manager/-$$Lambda$ScreenUpgradeCA1105Manager$FJ3RzWmZoVoTNrMtWhmrIcLbVt4;-><init>(Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;)V

    invoke-virtual {v1, v4}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 268
    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mScreenUpgradeCA1105Dialog:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->show()V

    goto :goto_0

    .line 270
    :cond_2
    const-string v4, "checkAutoScreenUpgrade() no upgrade, killProcess"

    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    invoke-static {}, Lcom/yftech/engineeringmode/util/Utils;->killProcess()V

    .line 273
    :goto_0
    return-void
.end method

.method public checkScreenUpgradeFile()Z
    .locals 6

    .line 120
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/data/CarMediaDataManager;->getExistUdiskList()Ljava/util/List;

    move-result-object v0

    .line 121
    .local v0, "udiskList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 122
    .local v2, "udisk":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "screen.bin"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 123
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 124
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mFilePath:Ljava/lang/String;

    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "checkScreenUpgradeFile() FilePath:"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mFilePath:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, "ScreenUpgradeCA1105Manager"

    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    const/4 v1, 0x1

    return v1

    .line 128
    .end local v2    # "udisk":Ljava/lang/String;
    .end local v3    # "file":Ljava/io/File;
    :cond_0
    goto :goto_0

    .line 129
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public getCurScreenVersion()Ljava/lang/String;
    .locals 5

    .line 138
    const-string v0, ""

    .line 139
    .local v0, "version":Ljava/lang/String;
    const/4 v1, 0x0

    .line 141
    .local v1, "bufferedReader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/FileReader;

    const-string v4, "/sys/bus/i2c/devices/3-0038/fts_fw_version"

    invoke-direct {v3, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object v1, v2

    .line 142
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v2

    .line 146
    nop

    .line 148
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 151
    :goto_0
    goto :goto_1

    .line 149
    :catch_0
    move-exception v2

    .line 150
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .end local v2    # "e":Ljava/io/IOException;
    goto :goto_0

    .line 146
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 143
    :catch_1
    move-exception v2

    .line 144
    .restart local v2    # "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 146
    .end local v2    # "e":Ljava/io/IOException;
    if-eqz v1, :cond_0

    .line 148
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 154
    :cond_0
    :goto_1
    return-object v0

    .line 146
    :goto_2
    if-eqz v1, :cond_1

    .line 148
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 151
    goto :goto_3

    .line 149
    :catch_2
    move-exception v3

    .line 150
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 153
    .end local v3    # "e":Ljava/io/IOException;
    :cond_1
    :goto_3
    throw v2
.end method

.method public getScreenUpgradeFileVersion()Ljava/lang/String;
    .locals 12

    .line 163
    const-string v0, ""

    .line 164
    .local v0, "version":Ljava/lang/String;
    const/4 v1, 0x0

    .line 166
    .local v1, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mFilePath:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 167
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_1

    .line 168
    nop

    .line 184
    if-eqz v1, :cond_0

    .line 186
    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 189
    goto :goto_0

    .line 187
    :catch_0
    move-exception v3

    .line 188
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 168
    .end local v3    # "e":Ljava/io/IOException;
    :cond_0
    :goto_0
    return-object v0

    .line 170
    :cond_1
    :try_start_2
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v1, v3

    .line 171
    const/16 v3, 0x400

    new-array v3, v3, [B

    .line 172
    .local v3, "buffer":[B
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 173
    .local v4, "outputStream":Ljava/io/ByteArrayOutputStream;
    const/4 v5, 0x0

    move v6, v5

    .line 174
    .local v6, "len":I
    :goto_1
    invoke-virtual {v1, v3}, Ljava/io/FileInputStream;->read([B)I

    move-result v7

    move v6, v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_2

    .line 175
    invoke-virtual {v4, v3, v5, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 177
    :cond_2
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    .line 178
    .local v7, "data":[B
    const-string v8, "2100"

    const/16 v9, 0x10

    invoke-static {v8, v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v8

    add-int/lit8 v8, v8, 0xe

    .line 180
    .local v8, "versionIndex":I
    const-string v9, "%02x"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    aget-byte v11, v7, v8

    and-int/lit16 v11, v11, 0xff

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v5

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v0, v5

    .line 184
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "buffer":[B
    .end local v4    # "outputStream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "len":I
    .end local v7    # "data":[B
    .end local v8    # "versionIndex":I
    nop

    .line 186
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 189
    :goto_2
    goto :goto_3

    .line 187
    :catch_1
    move-exception v2

    .line 188
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .end local v2    # "e":Ljava/io/IOException;
    goto :goto_2

    .line 184
    :catchall_0
    move-exception v2

    goto :goto_4

    .line 181
    :catch_2
    move-exception v2

    .line 182
    .restart local v2    # "e":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 184
    .end local v2    # "e":Ljava/io/IOException;
    if-eqz v1, :cond_3

    .line 186
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 192
    :cond_3
    :goto_3
    return-object v0

    .line 184
    :goto_4
    if-eqz v1, :cond_4

    .line 186
    :try_start_6
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 189
    goto :goto_5

    .line 187
    :catch_3
    move-exception v3

    .line 188
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 191
    .end local v3    # "e":Ljava/io/IOException;
    :cond_4
    :goto_5
    throw v2
.end method

.method public synthetic lambda$checkAutoScreenUpgrade$0$ScreenUpgradeCA1105Manager(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .line 264
    const-string v0, "ScreenUpgradeCA1105Manager"

    const-string v1, "checkAutoScreenUpgrade() onDismiss, killProcess"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mScreenUpgradeCA1105Dialog:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 266
    invoke-static {}, Lcom/yftech/engineeringmode/util/Utils;->killProcess()V

    .line 267
    return-void
.end method

.method public removeScreenUpgradeCA1105Listener(Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;

    .line 83
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mScreenUpgradeCA1105Listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mScreenUpgradeCA1105Listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 86
    :cond_0
    return-void
.end method

.method public start()V
    .locals 3

    .line 101
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->mFilePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/io/File;

    const-string v2, "/sdcard"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/yftech/engineeringmode/util/Copier;->copy(Ljava/io/File;Ljava/io/File;Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 102
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->notifyOnScreenUpgradeCA1105State(I)V

    .line 103
    return-void

    .line 105
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->notifyOnScreenUpgradeCA1105State(I)V

    .line 106
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$1;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$1;-><init>(Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 111
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 112
    return-void
.end method

.method public startUpgrade()V
    .locals 2

    .line 92
    const-string v0, "ScreenUpgradeCA1105Manager"

    const-string v1, "startUpgrade()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->checkScreenUpgradeFile()Z

    move-result v0

    if-nez v0, :cond_0

    .line 94
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->notifyOnScreenUpgradeCA1105State(I)V

    .line 95
    return-void

    .line 97
    :cond_0
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->start()V

    .line 98
    return-void
.end method
