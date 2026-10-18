.class public Lcom/yftech/engineeringmode/util/FactorySetting;
.super Ljava/lang/Object;
.source "FactorySetting.java"


# static fields
.field private static COMMAND_FILE:Ljava/io/File; = null

.field private static final EARLIEST_SUPPORTED_TIME:J = 0x14aa1133c00L

.field private static LOG_FILE:Ljava/io/File;

.field private static RECOVERY_DIR:Ljava/io/File;

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 19
    const-class v0, Lcom/yftech/engineeringmode/util/FactorySetting;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/util/FactorySetting;->TAG:Ljava/lang/String;

    .line 21
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/cache/recovery"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/yftech/engineeringmode/util/FactorySetting;->RECOVERY_DIR:Ljava/io/File;

    .line 22
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/yftech/engineeringmode/util/FactorySetting;->RECOVERY_DIR:Ljava/io/File;

    const-string v2, "command"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lcom/yftech/engineeringmode/util/FactorySetting;->COMMAND_FILE:Ljava/io/File;

    .line 23
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/yftech/engineeringmode/util/FactorySetting;->RECOVERY_DIR:Ljava/io/File;

    const-string v2, "log"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lcom/yftech/engineeringmode/util/FactorySetting;->LOG_FILE:Ljava/io/File;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 17
    sget-object v0, Lcom/yftech/engineeringmode/util/FactorySetting;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private clearOsData(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .line 46
    const-string v0, "Can\'t close command"

    sget-object v1, Lcom/yftech/engineeringmode/util/FactorySetting;->TAG:Ljava/lang/String;

    const-string v2, "clearOsData() resetTime"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    const-wide v1, 0x14aa1133c00L

    invoke-static {v1, v2}, Landroid/os/SystemClock;->setCurrentTimeMillis(J)Z

    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "--locale="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .local v1, "args":Ljava/lang/StringBuilder;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n--wipe_data"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    sget-object v2, Lcom/yftech/engineeringmode/util/FactorySetting;->RECOVERY_DIR:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 52
    sget-object v2, Lcom/yftech/engineeringmode/util/FactorySetting;->COMMAND_FILE:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 53
    sget-object v2, Lcom/yftech/engineeringmode/util/FactorySetting;->LOG_FILE:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 55
    invoke-direct {p0}, Lcom/yftech/engineeringmode/util/FactorySetting;->deleteSystemFile()V

    .line 57
    const/4 v2, 0x0

    .line 59
    .local v2, "command":Ljava/io/FileWriter;
    :try_start_0
    new-instance v3, Ljava/io/FileWriter;

    sget-object v4, Lcom/yftech/engineeringmode/util/FactorySetting;->COMMAND_FILE:Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    move-object v2, v3

    .line 60
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 61
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 63
    sget-object v3, Lcom/yftech/engineeringmode/util/FactorySetting;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "clearOsData:  args=="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    nop

    .line 69
    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 73
    :cond_0
    :goto_0
    goto :goto_1

    .line 71
    :catch_0
    move-exception v3

    .line 72
    .local v3, "e2":Ljava/lang/Exception;
    sget-object v4, Lcom/yftech/engineeringmode/util/FactorySetting;->TAG:Ljava/lang/String;

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .end local v3    # "e2":Ljava/lang/Exception;
    goto :goto_1

    .line 67
    :catchall_0
    move-exception v3

    goto :goto_2

    .line 64
    :catch_1
    move-exception v3

    .line 65
    .local v3, "e":Ljava/io/IOException;
    :try_start_2
    sget-object v4, Lcom/yftech/engineeringmode/util/FactorySetting;->TAG:Ljava/lang/String;

    const-string v5, "Can\'t write command file"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 68
    .end local v3    # "e":Ljava/io/IOException;
    if-eqz v2, :cond_0

    .line 69
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 75
    :goto_1
    new-instance v0, Lcom/yftech/engineeringmode/util/FactorySetting$1;

    const-string v3, "Reboot"

    invoke-direct {v0, p0, v3, p1}, Lcom/yftech/engineeringmode/util/FactorySetting$1;-><init>(Lcom/yftech/engineeringmode/util/FactorySetting;Ljava/lang/String;Landroid/content/Context;)V

    .line 87
    .local v0, "thr":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 88
    return-void

    .line 68
    .end local v0    # "thr":Ljava/lang/Thread;
    :goto_2
    if-eqz v2, :cond_1

    .line 69
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    .line 71
    :catch_2
    move-exception v4

    .line 72
    .local v4, "e2":Ljava/lang/Exception;
    sget-object v5, Lcom/yftech/engineeringmode/util/FactorySetting;->TAG:Ljava/lang/String;

    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 73
    .end local v4    # "e2":Ljava/lang/Exception;
    :cond_1
    :goto_3
    nop

    .line 74
    :goto_4
    throw v3
.end method

.method private deleteSystemFile()V
    .locals 4

    .line 91
    const-string v0, "/sdcard/atclog"

    invoke-static {v0}, Lcom/yftech/engineeringmode/util/DeleteUtil;->delete(Ljava/lang/String;)Z

    move-result v0

    .line 92
    .local v0, "result":Z
    sget-object v1, Lcom/yftech/engineeringmode/util/FactorySetting;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "deleteSystemFile atclog result:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    return-void
.end method


# virtual methods
.method public factoryReset(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .line 37
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setFactoryModeReSetFactorySettingNotify()Z

    move-result v0

    .line 39
    .local v0, "result":Z
    sget-object v1, Lcom/yftech/engineeringmode/util/FactorySetting;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setFactoryModReSetFactorySettingNotify() result: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/util/FactorySetting;->clearOsData(Landroid/content/Context;)V

    .line 43
    return-void
.end method
