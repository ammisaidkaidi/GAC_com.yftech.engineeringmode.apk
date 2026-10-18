.class public Lcom/yftech/engineeringmode/manager/UpgradeManager;
.super Ljava/lang/Object;
.source "UpgradeManager.java"


# static fields
.field public static MCU_PATH_SUFFIX:Ljava/lang/String;

.field public static MCU_UPGRADE_PATH:Ljava/lang/String;

.field public static OS_PATH_SUFFIX:Ljava/lang/String;

.field public static OS_UPGRADE_PATH:Ljava/lang/String;

.field public static SCREEN_MCU_PATH_SUFFIX:Ljava/lang/String;

.field public static SCREEN_MCU_UPGRADE_PATH:Ljava/lang/String;

.field public static SCREEN_PATH_SUFFIX:Ljava/lang/String;

.field public static SCREEN_UPGRADE_PATH:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String;

.field public static isAlreadyHasUpdateFile:Z

.field public static isUpdating:Z

.field private static sUpgradeManager:Lcom/yftech/engineeringmode/manager/UpgradeManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mHasUpgradeFileUdiskPath:Ljava/lang/String;

.field private mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

.field private mUpgradeDialog:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    const-class v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    .line 27
    const-string v0, ""

    sput-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_UPGRADE_PATH:Ljava/lang/String;

    .line 28
    sput-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_UPGRADE_PATH:Ljava/lang/String;

    .line 29
    sput-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_UPGRADE_PATH:Ljava/lang/String;

    .line 30
    sput-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_UPGRADE_PATH:Ljava/lang/String;

    .line 31
    sput-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_PATH_SUFFIX:Ljava/lang/String;

    .line 32
    sput-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_PATH_SUFFIX:Ljava/lang/String;

    .line 33
    sput-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_PATH_SUFFIX:Ljava/lang/String;

    .line 34
    sput-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_PATH_SUFFIX:Ljava/lang/String;

    .line 35
    const/4 v0, 0x0

    sput-boolean v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isAlreadyHasUpdateFile:Z

    .line 42
    sput-boolean v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mHasUpgradeFileUdiskPath:Ljava/lang/String;

    .line 69
    return-void
.end method

.method static synthetic access$002(Lcom/yftech/engineeringmode/manager/UpgradeManager;Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/manager/UpgradeManager;
    .param p1, "x1"    # Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 23
    iput-object p1, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    return-object p1
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/manager/UpgradeManager;ZZZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/manager/UpgradeManager;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z
    .param p4, "x4"    # Z

    .line 23
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->startUpgrade(ZZZZ)V

    return-void
.end method

.method static synthetic access$202(Lcom/yftech/engineeringmode/manager/UpgradeManager;Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Lcom/yftech/engineeringmode/dialog/UpgradeDialog;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/manager/UpgradeManager;
    .param p1, "x1"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 23
    iput-object p1, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeDialog:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    return-object p1
.end method

.method public static declared-synchronized getInstance()Lcom/yftech/engineeringmode/manager/UpgradeManager;
    .locals 2

    const-class v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;

    monitor-enter v0

    .line 72
    :try_start_0
    sget-object v1, Lcom/yftech/engineeringmode/manager/UpgradeManager;->sUpgradeManager:Lcom/yftech/engineeringmode/manager/UpgradeManager;

    if-nez v1, :cond_0

    .line 73
    new-instance v1, Lcom/yftech/engineeringmode/manager/UpgradeManager;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/manager/UpgradeManager;-><init>()V

    sput-object v1, Lcom/yftech/engineeringmode/manager/UpgradeManager;->sUpgradeManager:Lcom/yftech/engineeringmode/manager/UpgradeManager;

    .line 75
    :cond_0
    sget-object v1, Lcom/yftech/engineeringmode/manager/UpgradeManager;->sUpgradeManager:Lcom/yftech/engineeringmode/manager/UpgradeManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 71
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private getMcuVersion()Ljava/lang/String;
    .locals 2

    .line 385
    const-string v0, "persist.version.mcu"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private matchMCUUpgradeFile(Ljava/lang/String;)Z
    .locals 7
    .param p1, "path"    # Ljava/lang/String;

    .line 254
    const/4 v0, 0x0

    const-string v1, "sys.engineeringmode.mcu.upgrade.match"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 255
    .local v1, "match":I
    sget-object v2, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "matchMCUUpgradeFile() match:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 257
    return v2

    .line 259
    :cond_0
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "mcuupgrade.bin"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 260
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 261
    sget-object v3, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "matchMCUUpgradeFile() file is not exist. path:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    return v0

    .line 264
    :cond_1
    const-string v3, "persist.version.mcu"

    const-string v4, ""

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 265
    .local v3, "mcuVersion":Ljava/lang/String;
    sget-object v4, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "matchMCUUpgradeFile() mcuVersion:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 267
    return v0

    .line 269
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->getMcuUpgradeFileVersion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 270
    .local v0, "mcuUpgradeFileVersion":Ljava/lang/String;
    sget-object v4, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "matchMCUUpgradeFile() mcuUpgradeFileVersion:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    return v4
.end method

.method private matchMCUUpgradeFileSoc(Ljava/lang/String;)Z
    .locals 12
    .param p1, "path"    # Ljava/lang/String;

    .line 323
    const-string v0, "ro.build.product"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 324
    .local v0, "product":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "matchMCUUpgradeFileSoc: ro.build.product --> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    const-string v1, "CDC007"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 326
    return v2

    .line 329
    :cond_0
    const/4 v1, 0x0

    const-string v3, "sys.engineeringmode.mcu.upgrade.match"

    invoke-static {v3, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 330
    .local v3, "match":I
    sget-object v4, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "matchMCUUpgradeFileSoc() match:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    if-ne v3, v2, :cond_1

    .line 332
    return v2

    .line 334
    :cond_1
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "mcuupgrade.bin"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 335
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2

    .line 336
    sget-object v2, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "matchMCUUpgradeFileSoc() file is not exist. path:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    return v1

    .line 340
    :cond_2
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->getMcuUpgradeFileVersion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 357
    .local v5, "mcuUpgradeFileVersion":Ljava/lang/String;
    invoke-direct {p0}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->getMcuVersion()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 358
    .local v6, "mcuVersion":Ljava/lang/String;
    sget-object v7, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "matchMCUUpgradeFileSoc() mcuVersion:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " mcuUpgradeFileVersion:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 360
    return v2

    .line 362
    :cond_3
    invoke-virtual {v6, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 363
    return v2

    .line 366
    :cond_4
    const-string v7, "\\."

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 367
    .local v7, "strings":[Ljava/lang/String;
    sget-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "matchMCUUpgradeFileSoc: --->"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    move-object v8, v6

    .line 369
    .local v8, "mcuVersionPrefix":Ljava/lang/String;
    array-length v9, v7

    const/4 v10, 0x3

    if-lt v9, v10, :cond_5

    .line 370
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v10, v7, v1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v11, v7, v2

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v10, 0x2

    aget-object v10, v7, v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 371
    sget-object v9, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "matchMCUUpgradeFileSoc: mcuVersionPrefix:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    :cond_5
    invoke-virtual {v5, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 374
    return v2

    .line 377
    :cond_6
    const-string v9, "1.12.58"

    invoke-virtual {v5, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    const-string v11, "1.12.9E"

    if-nez v10, :cond_7

    invoke-virtual {v5, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 378
    :cond_7
    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_9

    invoke-virtual {v6, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_8

    goto :goto_0

    .line 381
    :cond_8
    return v1

    .line 379
    :cond_9
    :goto_0
    return v2
.end method

.method private matchSocVersionAndMcuUpgradeFileVersion(Ljava/lang/String;)Z
    .locals 4
    .param p1, "mcuUpgradeFileVersion"    # Ljava/lang/String;

    .line 395
    const-string v0, "ro.build.display.id"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 396
    .local v0, "socVersion":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "matchSocVersionAndMcuUpgradeFileVersion() socVersion:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    const-string v1, "A88"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "1.12.88A1"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 398
    :cond_0
    const-string v1, "A9E"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "1.12.9EB1"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 399
    :cond_1
    const-string v1, "A58"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "1.12.58"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 400
    :cond_2
    const-string v1, "A79"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "1.12.79C1"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 401
    :cond_3
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "1.12.79C2"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 402
    :cond_4
    const-string v1, "A79_G"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v2, "1.12.79C3"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 403
    :cond_5
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "1.12.79C4"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 404
    :cond_6
    const-string v1, "A8E"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    const-string v1, "1.12.8EA2"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    :cond_7
    const/4 v1, 0x1

    goto :goto_0

    :cond_8
    const/4 v1, 0x0

    .line 397
    :goto_0
    return v1
.end method

.method private showCheckUpgradeFileDialog(ZZZZ)V
    .locals 2
    .param p1, "hasMCUUpgradeFile"    # Z
    .param p2, "hasOSUpgradeFile"    # Z
    .param p3, "hasScreenUpgradeFile"    # Z
    .param p4, "hasScreenMcuUpgradeFile"    # Z

    .line 211
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeDialog:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeDialog:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->dismiss()V

    .line 214
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    if-nez v0, :cond_1

    .line 215
    new-instance v0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 216
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    new-instance v1, Lcom/yftech/engineeringmode/manager/UpgradeManager$1;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/manager/UpgradeManager$1;-><init>(Lcom/yftech/engineeringmode/manager/UpgradeManager;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 223
    :cond_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->show(ZZZZ)V

    .line 224
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    new-instance v1, Lcom/yftech/engineeringmode/manager/UpgradeManager$2;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/manager/UpgradeManager$2;-><init>(Lcom/yftech/engineeringmode/manager/UpgradeManager;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->setOnUpgradeCheckDialogListener(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;)V

    .line 236
    return-void
.end method

.method private startUpgrade(ZZZZ)V
    .locals 2
    .param p1, "isUpgradeMCU"    # Z
    .param p2, "isUpgradeOS"    # Z
    .param p3, "isUpgradeScreen"    # Z
    .param p4, "isUpgradeScreenMcu"    # Z

    .line 239
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeDialog:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    if-nez v0, :cond_0

    .line 240
    new-instance v0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeDialog:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 241
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeDialog:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    new-instance v1, Lcom/yftech/engineeringmode/manager/UpgradeManager$3;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/manager/UpgradeManager$3;-><init>(Lcom/yftech/engineeringmode/manager/UpgradeManager;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 248
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    .line 249
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeDialog:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->start(ZZZZ)V

    .line 250
    return-void
.end method


# virtual methods
.method public checkUpgradeFile(ZLjava/lang/String;Z)V
    .locals 26
    .param p1, "isShowNoUpgradeFileDialog"    # Z
    .param p2, "udiskPath"    # Ljava/lang/String;
    .param p3, "isOnlyScreen"    # Z

    .line 94
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 95
    return-void

    .line 97
    :cond_0
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCBIHU12Project()Z

    move-result v3

    .line 99
    .local v3, "isCBIHU12":Z
    sget-object v4, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "checkUpgradeFile() isShowNoUpgradeFileDialog:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v6, ", udiskPath:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " ,isCBIHU12:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    const/4 v4, 0x0

    .line 101
    .local v4, "hasMCUUpgradeFile":Z
    const/4 v5, 0x0

    .line 102
    .local v5, "hasOSUpgradeFile":Z
    const/4 v6, 0x0

    .line 103
    .local v6, "hasScreenUpgradeFile":Z
    const/4 v7, 0x0

    .line 104
    .local v7, "hasScreenMcuUpgradeFile":Z
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    const-string v9, ", hasScreenUpgradeFile:"

    const-string v10, ", hasOSUpgradeFile:"

    const-string v11, ", hasMCUUpgradeFile:"

    const-string v12, "/storage/udisk1"

    if-nez v8, :cond_4

    .line 106
    if-nez v3, :cond_1

    .line 107
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v12, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_UPGRADE_PATH:Ljava/lang/String;

    .line 108
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v12, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_UPGRADE_PATH:Ljava/lang/String;

    .line 109
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v12, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_UPGRADE_PATH:Ljava/lang/String;

    .line 110
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v12, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_UPGRADE_PATH:Ljava/lang/String;

    goto :goto_0

    .line 113
    :cond_1
    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 114
    return-void

    .line 117
    :cond_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v13, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_UPGRADE_PATH:Ljava/lang/String;

    .line 118
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v13, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_UPGRADE_PATH:Ljava/lang/String;

    .line 119
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v13, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_UPGRADE_PATH:Ljava/lang/String;

    .line 120
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v12, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_UPGRADE_PATH:Ljava/lang/String;

    .line 122
    :goto_0
    sget-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_UPGRADE_PATH:Ljava/lang/String;

    invoke-direct {v0, v8}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->matchMCUUpgradeFileSoc(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 123
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v8

    sget-object v12, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v8, v12}, Lcom/yftech/car/upgrade/CarUpgradeManager;->checkMCUUpgradeFile(Ljava/lang/String;)Z

    move-result v4

    .line 125
    :cond_3
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v8

    sget-object v12, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v8, v12}, Lcom/yftech/car/upgrade/CarUpgradeManager;->checkOSUpgradeFile(Ljava/lang/String;)Z

    move-result v5

    .line 126
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v8

    sget-object v12, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v8, v12}, Lcom/yftech/car/upgrade/CarUpgradeManager;->checkScreenUpgradeFile(Ljava/lang/String;)Z

    move-result v6

    .line 127
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v8

    sget-object v12, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v8, v12}, Lcom/yftech/car/upgrade/CarUpgradeManager;->checkScreenMcuUpgradeFile(Ljava/lang/String;)Z

    move-result v7

    move/from16 v23, v3

    goto/16 :goto_4

    .line 129
    :cond_4
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/yftech/car/media/data/CarMediaDataManager;->getExistUdiskList()Ljava/util/List;

    move-result-object v8

    .line 130
    .local v8, "udiskPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v8, :cond_5

    .line 131
    sget-object v9, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    const-string v10, "checkUpgradeFile() udiskPaths == null"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    return-void

    .line 134
    :cond_5
    const/4 v13, 0x0

    .line 135
    .local v13, "hasMCUPath":Z
    const/4 v14, 0x0

    .line 136
    .local v14, "hasOSPath":Z
    const/4 v15, 0x0

    .line 137
    .local v15, "hasScreenPath":Z
    const/16 v16, 0x0

    .line 138
    .local v16, "hasScreenMcuPath":Z
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_1
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_c

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    move/from16 v19, v4

    .end local v4    # "hasMCUUpgradeFile":Z
    .local v19, "hasMCUUpgradeFile":Z
    move-object/from16 v4, v18

    check-cast v4, Ljava/lang/String;

    .line 139
    .local v4, "path":Ljava/lang/String;
    const/16 v18, 0x0

    .line 140
    .local v18, "mcuPath":Ljava/lang/String;
    const/16 v20, 0x0

    .line 141
    .local v20, "osPath":Ljava/lang/String;
    const/16 v21, 0x0

    .line 142
    .local v21, "screenPath":Ljava/lang/String;
    const/16 v22, 0x0

    .line 144
    .local v22, "screenMcuPath":Ljava/lang/String;
    if-nez v3, :cond_6

    .line 145
    move/from16 v23, v3

    .end local v3    # "isCBIHU12":Z
    .local v23, "isCBIHU12":Z
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v24, v5

    .end local v5    # "hasOSUpgradeFile":Z
    .local v24, "hasOSUpgradeFile":Z
    sget-object v5, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 146
    .end local v18    # "mcuPath":Ljava/lang/String;
    .local v3, "mcuPath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v18, v3

    .end local v3    # "mcuPath":Ljava/lang/String;
    .restart local v18    # "mcuPath":Ljava/lang/String;
    sget-object v3, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 147
    .end local v20    # "osPath":Ljava/lang/String;
    .local v3, "osPath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v20, v3

    .end local v3    # "osPath":Ljava/lang/String;
    .restart local v20    # "osPath":Ljava/lang/String;
    sget-object v3, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 148
    .end local v21    # "screenPath":Ljava/lang/String;
    .local v3, "screenPath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v21, v3

    .end local v3    # "screenPath":Ljava/lang/String;
    .restart local v21    # "screenPath":Ljava/lang/String;
    sget-object v3, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v5, v20

    move/from16 v20, v6

    move-object v6, v3

    move-object/from16 v3, v18

    move-object/from16 v18, v4

    move-object/from16 v4, v21

    .end local v22    # "screenMcuPath":Ljava/lang/String;
    .local v3, "screenMcuPath":Ljava/lang/String;
    goto :goto_2

    .line 151
    .end local v23    # "isCBIHU12":Z
    .end local v24    # "hasOSUpgradeFile":Z
    .local v3, "isCBIHU12":Z
    .restart local v5    # "hasOSUpgradeFile":Z
    .restart local v22    # "screenMcuPath":Ljava/lang/String;
    :cond_6
    move/from16 v23, v3

    move/from16 v24, v5

    .end local v3    # "isCBIHU12":Z
    .end local v5    # "hasOSUpgradeFile":Z
    .restart local v23    # "isCBIHU12":Z
    .restart local v24    # "hasOSUpgradeFile":Z
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 152
    .end local v18    # "mcuPath":Ljava/lang/String;
    .local v3, "mcuPath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v18, v3

    .end local v3    # "mcuPath":Ljava/lang/String;
    .restart local v18    # "mcuPath":Ljava/lang/String;
    sget-object v3, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 153
    .end local v20    # "osPath":Ljava/lang/String;
    .local v3, "osPath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v20, v3

    .end local v3    # "osPath":Ljava/lang/String;
    .restart local v20    # "osPath":Ljava/lang/String;
    sget-object v3, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 154
    .end local v21    # "screenPath":Ljava/lang/String;
    .local v3, "screenPath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v21, v3

    .end local v3    # "screenPath":Ljava/lang/String;
    .restart local v21    # "screenPath":Ljava/lang/String;
    sget-object v3, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_PATH_SUFFIX:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v5, v20

    move/from16 v20, v6

    move-object v6, v3

    move-object/from16 v3, v18

    move-object/from16 v18, v4

    move-object/from16 v4, v21

    .line 156
    .end local v21    # "screenPath":Ljava/lang/String;
    .end local v22    # "screenMcuPath":Ljava/lang/String;
    .local v3, "mcuPath":Ljava/lang/String;
    .local v4, "screenPath":Ljava/lang/String;
    .local v5, "osPath":Ljava/lang/String;
    .local v6, "screenMcuPath":Ljava/lang/String;
    .local v18, "path":Ljava/lang/String;
    .local v20, "hasScreenUpgradeFile":Z
    :goto_2
    invoke-direct {v0, v3}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->matchMCUUpgradeFileSoc(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_7

    .line 157
    move/from16 v21, v7

    .end local v7    # "hasScreenMcuUpgradeFile":Z
    .local v21, "hasScreenMcuUpgradeFile":Z
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v7

    invoke-virtual {v7, v3}, Lcom/yftech/car/upgrade/CarUpgradeManager;->checkMCUUpgradeFile(Ljava/lang/String;)Z

    move-result v7

    .end local v19    # "hasMCUUpgradeFile":Z
    .local v7, "hasMCUUpgradeFile":Z
    goto :goto_3

    .line 156
    .end local v21    # "hasScreenMcuUpgradeFile":Z
    .local v7, "hasScreenMcuUpgradeFile":Z
    .restart local v19    # "hasMCUUpgradeFile":Z
    :cond_7
    move/from16 v21, v7

    .end local v7    # "hasScreenMcuUpgradeFile":Z
    .restart local v21    # "hasScreenMcuUpgradeFile":Z
    move/from16 v7, v19

    .line 159
    .end local v19    # "hasMCUUpgradeFile":Z
    .local v7, "hasMCUUpgradeFile":Z
    :goto_3
    move-object/from16 v22, v8

    .end local v8    # "udiskPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v22, "udiskPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v8

    invoke-virtual {v8, v5}, Lcom/yftech/car/upgrade/CarUpgradeManager;->checkOSUpgradeFile(Ljava/lang/String;)Z

    move-result v8

    .line 160
    .end local v24    # "hasOSUpgradeFile":Z
    .local v8, "hasOSUpgradeFile":Z
    move-object/from16 v25, v12

    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v12

    invoke-virtual {v12, v4}, Lcom/yftech/car/upgrade/CarUpgradeManager;->checkScreenUpgradeFile(Ljava/lang/String;)Z

    move-result v12

    .line 161
    .end local v20    # "hasScreenUpgradeFile":Z
    .local v12, "hasScreenUpgradeFile":Z
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/yftech/car/upgrade/CarUpgradeManager;->checkScreenMcuUpgradeFile(Ljava/lang/String;)Z

    move-result v0

    .line 162
    .end local v21    # "hasScreenMcuUpgradeFile":Z
    .local v0, "hasScreenMcuUpgradeFile":Z
    sget-object v2, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v19, v2

    const-string v2, "checkUpgradeFile() mcuPath:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", hasMCUPath:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", osPath:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", hasOSPath:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", screenPath:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", hasScreenPath:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", screenMcuPath:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", hanScreenMcuUpgrade:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v2, v19

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    if-eqz v7, :cond_8

    if-nez v13, :cond_8

    .line 167
    const/4 v1, 0x1

    .line 168
    .end local v13    # "hasMCUPath":Z
    .local v1, "hasMCUPath":Z
    sput-object v3, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_UPGRADE_PATH:Ljava/lang/String;

    move v13, v1

    .line 170
    .end local v1    # "hasMCUPath":Z
    .restart local v13    # "hasMCUPath":Z
    :cond_8
    if-eqz v8, :cond_9

    if-nez v14, :cond_9

    .line 171
    const/4 v1, 0x1

    .line 172
    .end local v14    # "hasOSPath":Z
    .local v1, "hasOSPath":Z
    sput-object v5, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_UPGRADE_PATH:Ljava/lang/String;

    move v14, v1

    .line 174
    .end local v1    # "hasOSPath":Z
    .restart local v14    # "hasOSPath":Z
    :cond_9
    if-eqz v12, :cond_a

    if-nez v15, :cond_a

    .line 175
    const/4 v1, 0x1

    .line 176
    .end local v15    # "hasScreenPath":Z
    .local v1, "hasScreenPath":Z
    sput-object v4, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_UPGRADE_PATH:Ljava/lang/String;

    move v15, v1

    .line 178
    .end local v1    # "hasScreenPath":Z
    .restart local v15    # "hasScreenPath":Z
    :cond_a
    if-eqz v0, :cond_b

    if-nez v16, :cond_b

    .line 179
    const/4 v1, 0x1

    .line 180
    .end local v16    # "hasScreenMcuPath":Z
    .local v1, "hasScreenMcuPath":Z
    sput-object v6, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_UPGRADE_PATH:Ljava/lang/String;

    move/from16 v16, v1

    .line 182
    .end local v1    # "hasScreenMcuPath":Z
    .end local v3    # "mcuPath":Ljava/lang/String;
    .end local v4    # "screenPath":Ljava/lang/String;
    .end local v5    # "osPath":Ljava/lang/String;
    .end local v6    # "screenMcuPath":Ljava/lang/String;
    .end local v18    # "path":Ljava/lang/String;
    .restart local v16    # "hasScreenMcuPath":Z
    :cond_b
    move/from16 v1, p1

    move-object/from16 v2, p2

    move v4, v7

    move v5, v8

    move v6, v12

    move-object/from16 v8, v22

    move/from16 v3, v23

    move-object/from16 v12, v25

    move v7, v0

    move-object/from16 v0, p0

    goto/16 :goto_1

    .line 138
    .end local v0    # "hasScreenMcuUpgradeFile":Z
    .end local v12    # "hasScreenUpgradeFile":Z
    .end local v22    # "udiskPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v23    # "isCBIHU12":Z
    .local v3, "isCBIHU12":Z
    .local v4, "hasMCUUpgradeFile":Z
    .local v5, "hasOSUpgradeFile":Z
    .local v6, "hasScreenUpgradeFile":Z
    .local v7, "hasScreenMcuUpgradeFile":Z
    .local v8, "udiskPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_c
    move/from16 v23, v3

    move/from16 v19, v4

    move/from16 v24, v5

    move/from16 v20, v6

    move/from16 v21, v7

    move-object/from16 v22, v8

    .line 184
    .end local v3    # "isCBIHU12":Z
    .end local v8    # "udiskPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v13    # "hasMCUPath":Z
    .end local v14    # "hasOSPath":Z
    .end local v15    # "hasScreenPath":Z
    .end local v16    # "hasScreenMcuPath":Z
    .restart local v23    # "isCBIHU12":Z
    :goto_4
    sget-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "checkUpgradeFile() MCU_UPGRADE_PATH:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", OS_UPGRADE_PATH:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", SCREEN_UPGRADE_PATH"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", SCREEN_MCU_UPGRADE_PATH:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", hasScreenMcuFile\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    if-nez p1, :cond_d

    if-nez v4, :cond_d

    if-nez v5, :cond_d

    if-nez v6, :cond_d

    if-nez v7, :cond_d

    .line 189
    return-void

    .line 191
    :cond_d
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iput-object v1, v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mHasUpgradeFileUdiskPath:Ljava/lang/String;

    .line 192
    if-eqz p3, :cond_e

    .line 193
    const/4 v2, 0x0

    invoke-direct {v0, v2, v2, v6, v7}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->showCheckUpgradeFileDialog(ZZZZ)V

    goto :goto_5

    .line 196
    :cond_e
    sget-boolean v2, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    if-nez v2, :cond_f

    .line 197
    invoke-direct {v0, v4, v5, v6, v7}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->showCheckUpgradeFileDialog(ZZZZ)V

    .line 200
    :cond_f
    :goto_5
    return-void
.end method

.method public deInit()V
    .locals 2

    .line 87
    sget-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    const-string v1, "deInit()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    return-void
.end method

.method public getMcuUpgradeFileVersion(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "path"    # Ljava/lang/String;

    .line 276
    const-string v0, ""

    .line 277
    .local v0, "version":Ljava/lang/String;
    const/4 v1, 0x0

    .line 278
    .local v1, "fileInputStream":Ljava/io/FileInputStream;
    const/4 v2, 0x0

    .line 280
    .local v2, "outputStream":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 281
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_2

    .line 282
    nop

    .line 304
    if-eqz v1, :cond_0

    .line 306
    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 309
    goto :goto_0

    .line 307
    :catch_0
    move-exception v4

    .line 308
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 311
    .end local v4    # "e":Ljava/io/IOException;
    :cond_0
    :goto_0
    if-eqz v2, :cond_1

    .line 313
    :try_start_2
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 316
    goto :goto_1

    .line 314
    :catch_1
    move-exception v4

    .line 315
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 282
    .end local v4    # "e":Ljava/io/IOException;
    :cond_1
    :goto_1
    return-object v0

    .line 284
    :cond_2
    :try_start_3
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v1, v4

    .line 285
    const/16 v4, 0x400

    new-array v4, v4, [B

    .line 286
    .local v4, "buffer":[B
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v2, v5

    .line 288
    :goto_2
    invoke-virtual {v1, v4}, Ljava/io/FileInputStream;->read([B)I

    move-result v5

    move v6, v5

    .local v6, "len":I
    const/4 v7, -0x1

    if-eq v5, v7, :cond_3

    .line 289
    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_2

    .line 291
    :cond_3
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    .line 292
    .local v5, "data":[B
    const-string v7, "420"

    const/16 v8, 0x10

    invoke-static {v7, v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v7

    add-int/lit8 v7, v7, 0x6

    .line 293
    .local v7, "versionIndex":I
    sget-object v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getMcuUpgradeFileVersion() versionIndex:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 295
    .local v8, "stringBuilder":Ljava/lang/StringBuilder;
    :goto_3
    aget-byte v9, v5, v7

    if-eqz v9, :cond_4

    .line 296
    aget-byte v9, v5, v7

    int-to-char v9, v9

    .line 297
    .local v9, "value":C
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 298
    nop

    .end local v9    # "value":C
    add-int/lit8 v7, v7, 0x1

    .line 299
    goto :goto_3

    .line 300
    :cond_4
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v0, v9

    .line 304
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "buffer":[B
    .end local v5    # "data":[B
    .end local v6    # "len":I
    .end local v7    # "versionIndex":I
    .end local v8    # "stringBuilder":Ljava/lang/StringBuilder;
    nop

    .line 306
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 309
    goto :goto_4

    .line 307
    :catch_2
    move-exception v3

    .line 308
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 311
    .end local v3    # "e":Ljava/io/IOException;
    :goto_4
    nop

    .line 313
    :try_start_5
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 316
    :goto_5
    goto :goto_7

    .line 314
    :catch_3
    move-exception v3

    .line 315
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .end local v3    # "e":Ljava/io/IOException;
    goto :goto_5

    .line 304
    :catchall_0
    move-exception v3

    goto :goto_8

    .line 301
    :catch_4
    move-exception v3

    .line 302
    .restart local v3    # "e":Ljava/io/IOException;
    :try_start_6
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 304
    .end local v3    # "e":Ljava/io/IOException;
    if-eqz v1, :cond_5

    .line 306
    :try_start_7
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 309
    goto :goto_6

    .line 307
    :catch_5
    move-exception v3

    .line 308
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 311
    .end local v3    # "e":Ljava/io/IOException;
    :cond_5
    :goto_6
    if-eqz v2, :cond_6

    .line 313
    :try_start_8
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3

    goto :goto_5

    .line 319
    :cond_6
    :goto_7
    return-object v0

    .line 304
    :goto_8
    if-eqz v1, :cond_7

    .line 306
    :try_start_9
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    .line 309
    goto :goto_9

    .line 307
    :catch_6
    move-exception v4

    .line 308
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 311
    .end local v4    # "e":Ljava/io/IOException;
    :cond_7
    :goto_9
    if-eqz v2, :cond_8

    .line 313
    :try_start_a
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_7

    .line 316
    goto :goto_a

    .line 314
    :catch_7
    move-exception v4

    .line 315
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 318
    .end local v4    # "e":Ljava/io/IOException;
    :cond_8
    :goto_a
    throw v3
.end method

.method public hideCheckUpgradeFileDialog(Ljava/lang/String;)V
    .locals 1
    .param p1, "udiskPath"    # Ljava/lang/String;

    .line 203
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mHasUpgradeFileUdiskPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 205
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->dismiss()V

    .line 206
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mUpgradeCheckDialog:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 208
    :cond_0
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 79
    sget-object v0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->TAG:Ljava/lang/String;

    const-string v1, "init()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    iput-object p1, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager;->mContext:Landroid/content/Context;

    .line 84
    return-void
.end method
