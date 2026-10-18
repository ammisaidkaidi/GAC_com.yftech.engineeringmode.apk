.class public Lcom/yftech/engineeringmode/fragment/LogFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "LogFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# static fields
.field private static final PERSIST_FLOGCAT_LOG_LEVEL:Ljava/lang/String; = "persist.flogcat.log.level"

.field private static final PERSIST_FLOGCAT_LOG_TIME:Ljava/lang/String; = "persist.flogcat.log.tim"

.field private static final PERSIST_FLOGCAT_MCU_ENABLE:Ljava/lang/String; = "persist.flogcat.mcu.enable"

.field private static final PERSIST_FLOGCAT_MPU_ENABLE:Ljava/lang/String; = "persist.flogcat.mpu.enable"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private btn_tbox_log:Landroid/widget/Button;

.field private mCanLogFloatView:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

.field private final mCarTBoxSdkCallback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

.field private mConfirmDialog:Lcom/yftech/engineeringmode/dialog/ConfirmDialog;

.field private mLevelValues:[Ljava/lang/String;

.field private mMCUValues:[Ljava/lang/String;

.field private mMPUValues:[Ljava/lang/String;

.field private mRlTboxLog:Landroid/widget/RelativeLayout;

.field private mTimeValues:[Ljava/lang/String;

.field private mToast:Landroid/widget/Toast;

.field private sp_display_time:Landroid/widget/Spinner;

.field private sp_level:Landroid/widget/Spinner;

.field private sp_save_option:Landroid/widget/Spinner;

.field private sp_spi_save:Landroid/widget/Spinner;

.field private tv_tbox_log_tip:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    const-class v0, Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 7

    .line 34
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 40
    const-string v0, "1"

    const-string v1, "0"

    filled-new-array {v1, v0}, [Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mMPUValues:[Ljava/lang/String;

    .line 43
    filled-new-array {v1, v0}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mMCUValues:[Ljava/lang/String;

    .line 46
    const-string v1, "V"

    const-string v2, "D"

    const-string v3, "I"

    const-string v4, "W"

    const-string v5, "E"

    const-string v6, "S"

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mLevelValues:[Ljava/lang/String;

    .line 49
    const-string v0, "thread"

    const-string v1, "threadtime"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mTimeValues:[Ljava/lang/String;

    .line 298
    new-instance v0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/LogFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/LogFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mCarTBoxSdkCallback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/LogFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/LogFragment;

    .line 34
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->cleanLog()V

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 34
    sget-object v0, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/LogFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/LogFragment;

    .line 34
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->tv_tbox_log_tip:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/fragment/LogFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/LogFragment;
    .param p1, "x1"    # Z

    .line 34
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/fragment/LogFragment;->setTBoxLogButtonEnabled(Z)V

    return-void
.end method

.method private cleanLog()V
    .locals 5

    .line 245
    const-string v0, "/sdcard/atclog"

    invoke-static {v0}, Lcom/yftech/engineeringmode/util/DeleteUtil;->delete(Ljava/lang/String;)Z

    move-result v0

    .line 247
    .local v0, "delAtclog":Z
    const-string v1, "/log"

    invoke-static {v1}, Lcom/yftech/engineeringmode/util/DeleteUtil;->delete(Ljava/lang/String;)Z

    move-result v1

    .line 248
    .local v1, "delLog":Z
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0e007a

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 249
    sget-object v2, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cleanLog: del /sdcard/atclog:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " del /log:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    return-void
.end method

.method private downloadTBoxLog()V
    .locals 7

    .line 330
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/data/CarMediaDataManager;->getExistUdiskList()Ljava/util/List;

    move-result-object v0

    .line 331
    .local v0, "udiskPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 333
    sget-object v1, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    const-string v2, "downloadTBoxLog->get udiskPaths fail"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    const v1, 0x7f0e0086

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/fragment/LogFragment;->showToast(Ljava/lang/String;)V

    .line 335
    return-void

    .line 338
    :cond_0
    const-string v1, ""

    .line 339
    .local v1, "path":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 340
    .local v3, "udiskPath":Ljava/lang/String;
    sget-object v4, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "downloadTBoxLog->udiskPath="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 342
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 343
    sget-object v5, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    const-string v6, "downloadTBoxLog->udiskPath is not exists"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    goto :goto_0

    .line 346
    :cond_1
    const-string v5, "/storage/udisk"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 347
    move-object v1, v3

    .line 348
    goto :goto_1

    .line 350
    .end local v3    # "udiskPath":Ljava/lang/String;
    .end local v4    # "file":Ljava/io/File;
    :cond_2
    goto :goto_0

    .line 351
    :cond_3
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 353
    sget-object v2, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    const-string v3, "downloadTBoxLog->no usb"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 354
    const v2, 0x7f0e0087

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/yftech/engineeringmode/fragment/LogFragment;->showToast(Ljava/lang/String;)V

    .line 355
    return-void

    .line 357
    :cond_4
    sget-object v2, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "downloadTBoxLog->path="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;->getInstance()Lcom/yftech/tbox/sdk/CarTBoxSdkManager;

    move-result-object v2

    const-string v3, "/mnt/sdcard/log"

    invoke-virtual {v2, v3, v1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;->requestDownloadLog(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    .line 359
    .local v2, "result":Z
    if-nez v2, :cond_5

    .line 360
    sget-object v3, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "downloadTBoxLog->result="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->tv_tbox_log_tip:Landroid/widget/TextView;

    const v4, 0x7f0e0085

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 363
    :cond_5
    return-void
.end method

.method private getLevelLogState()I
    .locals 4

    .line 183
    const-string v0, "persist.flogcat.log.level"

    const-string v1, "V"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 184
    .local v0, "value":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getLevelLogState() value:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mLevelValues:[Ljava/lang/String;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 186
    aget-object v2, v2, v1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 187
    return v1

    .line 185
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 190
    .end local v1    # "index":I
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method private getMCULogState()I
    .locals 4

    .line 165
    const-string v0, "persist.flogcat.mcu.enable"

    const-string v1, "1"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 166
    .local v0, "value":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getMCULogState() value:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mMCUValues:[Ljava/lang/String;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 168
    aget-object v2, v2, v1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 169
    return v1

    .line 167
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 172
    .end local v1    # "index":I
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method private getMPULogState()I
    .locals 4

    .line 147
    const-string v0, "persist.flogcat.mpu.enable"

    const-string v1, "1"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "value":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getMPULogState() value:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mMPUValues:[Ljava/lang/String;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 150
    aget-object v2, v2, v1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 151
    return v1

    .line 149
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 154
    .end local v1    # "index":I
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method private getTimeLogState()I
    .locals 4

    .line 201
    const-string v0, "persist.flogcat.log.tim"

    const-string v1, "threadtime"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "value":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getTimeLogState() value:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mTimeValues:[Ljava/lang/String;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 204
    aget-object v2, v2, v1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 205
    return v1

    .line 203
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 208
    .end local v1    # "index":I
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method private initView(Landroid/view/View;)V
    .locals 9
    .param p1, "root"    # Landroid/view/View;

    .line 72
    const v0, 0x7f090127

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_save_option:Landroid/widget/Spinner;

    .line 73
    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 74
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f030005

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0c0064

    invoke-direct {v0, v1, v3, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 75
    .local v0, "saveOptionAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v1, 0x7f0c0065

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 76
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_save_option:Landroid/widget/Spinner;

    invoke-virtual {v2, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 77
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_save_option:Landroid/widget/Spinner;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getMPULogState()I

    move-result v4

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 78
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_save_option:Landroid/widget/Spinner;

    invoke-virtual {v2, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 80
    new-instance v2, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 81
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f030004

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v4, v3, v6}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 82
    .local v2, "openCloseAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v2, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 84
    const v4, 0x7f090129

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Spinner;

    iput-object v4, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_spi_save:Landroid/widget/Spinner;

    .line 85
    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_spi_save:Landroid/widget/Spinner;

    invoke-virtual {v4, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 86
    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_spi_save:Landroid/widget/Spinner;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getMCULogState()I

    move-result v6

    invoke-virtual {v4, v6, v5}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 87
    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_spi_save:Landroid/widget/Spinner;

    invoke-virtual {v4, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 89
    const v4, 0x7f090125

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Spinner;

    iput-object v4, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_level:Landroid/widget/Spinner;

    .line 90
    new-instance v4, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getContext()Landroid/content/Context;

    move-result-object v6

    .line 91
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f030003

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v6, v3, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    move-object v3, v4

    .line 92
    .local v3, "levelAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v3, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 93
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_level:Landroid/widget/Spinner;

    invoke-virtual {v1, v3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 94
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_level:Landroid/widget/Spinner;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getLevelLogState()I

    move-result v4

    invoke-virtual {v1, v4, v5}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 95
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_level:Landroid/widget/Spinner;

    invoke-virtual {v1, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 97
    const v1, 0x7f090123

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_display_time:Landroid/widget/Spinner;

    .line 98
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_display_time:Landroid/widget/Spinner;

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 99
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_display_time:Landroid/widget/Spinner;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getTimeLogState()I

    move-result v4

    invoke-virtual {v1, v4, v5}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 100
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->sp_display_time:Landroid/widget/Spinner;

    invoke-virtual {v1, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 102
    const v1, 0x7f09003f

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    const v1, 0x7f090136

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Switch;

    const/4 v6, 0x0

    const-string v7, "persist.canlog.state"

    invoke-static {v7, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v7

    if-ne v7, v5, :cond_0

    move v7, v5

    goto :goto_0

    :cond_0
    move v7, v6

    :goto_0
    invoke-virtual {v4, v7}, Landroid/widget/Switch;->setChecked(Z)V

    .line 106
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    invoke-virtual {v1, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 109
    const v1, 0x7f090137

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Switch;

    const-string v7, "yf.canlog.display"

    invoke-static {v7, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v7

    if-ne v7, v5, :cond_1

    goto :goto_1

    :cond_1
    move v5, v6

    :goto_1
    invoke-virtual {v4, v5}, Landroid/widget/Switch;->setChecked(Z)V

    .line 110
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    invoke-virtual {v1, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 112
    const v1, 0x7f0900cc

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mRlTboxLog:Landroid/widget/RelativeLayout;

    .line 113
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->isSupportTboxLog()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 114
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mRlTboxLog:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v6}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 115
    const v1, 0x7f09004d

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->btn_tbox_log:Landroid/widget/Button;

    .line 116
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->btn_tbox_log:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    const v1, 0x7f090188

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->tv_tbox_log_tip:Landroid/widget/TextView;

    goto :goto_2

    .line 119
    :cond_2
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mRlTboxLog:Landroid/widget/RelativeLayout;

    const/16 v4, 0x8

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 121
    :goto_2
    return-void
.end method

.method private isSupportTboxLog()Z
    .locals 6

    .line 379
    const/4 v0, 0x0

    .line 380
    .local v0, "r":Z
    const-string v1, ""

    const-string v2, "ro.product.name"

    invoke-static {v2, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 381
    .local v2, "name":Ljava/lang/String;
    const-string v3, "ro.product.vendor.brand"

    invoke-static {v3, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 382
    .local v1, "brand":Ljava/lang/String;
    sget-object v3, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "name="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ", brand="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 384
    const-string v3, "CB_IHU12_C7"

    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "T79_G"

    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 385
    const/4 v0, 0x1

    goto :goto_0

    .line 386
    :cond_0
    const-string v3, "CB_IHU23"

    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "A29_AIO"

    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 387
    const/4 v0, 0x1

    goto :goto_0

    .line 388
    :cond_1
    const-string v3, "CB_IHU23_C1"

    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "A29_Y"

    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 389
    const/4 v0, 0x1

    .line 392
    :cond_2
    :goto_0
    sget-object v3, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "r="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    return v0
.end method

.method private setCanLogDisplayView(Z)V
    .locals 3
    .param p1, "show"    # Z

    .line 266
    sget-object v0, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setCanLogDisplayView->show="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    if-eqz p1, :cond_1

    .line 268
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mCanLogFloatView:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    if-nez v0, :cond_0

    .line 269
    new-instance v0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mCanLogFloatView:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    .line 271
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mCanLogFloatView:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->showFloatWindow()V

    goto :goto_0

    .line 273
    :cond_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mCanLogFloatView:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    if-eqz v0, :cond_2

    .line 274
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->hideFloatWindow()V

    .line 275
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mCanLogFloatView:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    .line 278
    :cond_2
    :goto_0
    return-void
.end method

.method private setLevelLogState(I)V
    .locals 3
    .param p1, "index"    # I

    .line 194
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mLevelValues:[Ljava/lang/String;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    .line 195
    sget-object v0, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setLevelLogState() index:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", value:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mLevelValues:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mLevelValues:[Ljava/lang/String;

    aget-object v0, v0, p1

    const-string v1, "persist.flogcat.log.level"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    :cond_0
    return-void
.end method

.method private setMCULogState(I)V
    .locals 3
    .param p1, "index"    # I

    .line 176
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mMCUValues:[Ljava/lang/String;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    .line 177
    sget-object v0, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMCULogState() index:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", value:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mMCUValues:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mMCUValues:[Ljava/lang/String;

    aget-object v0, v0, p1

    const-string v1, "persist.flogcat.mcu.enable"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    :cond_0
    return-void
.end method

.method private setMPULogState(I)V
    .locals 3
    .param p1, "index"    # I

    .line 158
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mMPUValues:[Ljava/lang/String;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    .line 159
    sget-object v0, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMPULogState() index:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", value:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mMPUValues:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mMPUValues:[Ljava/lang/String;

    aget-object v0, v0, p1

    const-string v1, "persist.flogcat.mpu.enable"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    :cond_0
    return-void
.end method

.method private setTBoxLogButtonEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 324
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->btn_tbox_log:Landroid/widget/Button;

    if-eqz v0, :cond_0

    .line 325
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 327
    :cond_0
    return-void
.end method

.method private setTimeLogState(I)V
    .locals 3
    .param p1, "index"    # I

    .line 212
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mTimeValues:[Ljava/lang/String;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    .line 213
    sget-object v0, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setTimeLogState() index:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", value:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mTimeValues:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mTimeValues:[Ljava/lang/String;

    aget-object v0, v0, p1

    const-string v1, "persist.flogcat.log.tim"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    :cond_0
    return-void
.end method

.method private showToast(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .line 366
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mToast:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 367
    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 369
    :cond_0
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mToast:Landroid/widget/Toast;

    .line 370
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 371
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4
    .param p1, "compoundButton"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 254
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 255
    return-void

    .line 257
    :cond_0
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v0

    const v1, 0x7f090136

    const-string v2, "1"

    const-string v3, "0"

    if-ne v0, v1, :cond_2

    .line 258
    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    move-object v2, v3

    :goto_0
    const-string v0, "persist.canlog.state"

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 259
    :cond_2
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v0

    const v1, 0x7f090137

    if-ne v0, v1, :cond_4

    .line 260
    if-eqz p2, :cond_3

    goto :goto_1

    :cond_3
    move-object v2, v3

    :goto_1
    const-string v0, "yf.canlog.display"

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    invoke-direct {p0, p2}, Lcom/yftech/engineeringmode/fragment/LogFragment;->setCanLogDisplayView(Z)V

    .line 263
    :cond_4
    :goto_2
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 220
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f09003f

    if-eq v0, v1, :cond_1

    const v1, 0x7f09004d

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 238
    :cond_0
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->downloadTBoxLog()V

    goto :goto_0

    .line 222
    :cond_1
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mConfirmDialog:Lcom/yftech/engineeringmode/dialog/ConfirmDialog;

    .line 223
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mConfirmDialog:Lcom/yftech/engineeringmode/dialog/ConfirmDialog;

    const v1, 0x7f0e007b

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->setTipMessage(Ljava/lang/String;)V

    .line 224
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mConfirmDialog:Lcom/yftech/engineeringmode/dialog/ConfirmDialog;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/LogFragment$1;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/LogFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/LogFragment;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->setOnButtonClickListener(Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;)V

    .line 235
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mConfirmDialog:Lcom/yftech/engineeringmode/dialog/ConfirmDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->show()V

    .line 236
    nop

    .line 241
    :goto_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 66
    const v0, 0x7f0c0043

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 67
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->initView(Landroid/view/View;)V

    .line 68
    return-object v0
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 125
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 130
    :pswitch_1
    invoke-direct {p0, p3}, Lcom/yftech/engineeringmode/fragment/LogFragment;->setMCULogState(I)V

    .line 131
    goto :goto_0

    .line 127
    :pswitch_2
    invoke-direct {p0, p3}, Lcom/yftech/engineeringmode/fragment/LogFragment;->setMPULogState(I)V

    .line 128
    goto :goto_0

    .line 133
    :pswitch_3
    invoke-direct {p0, p3}, Lcom/yftech/engineeringmode/fragment/LogFragment;->setLevelLogState(I)V

    .line 134
    goto :goto_0

    .line 136
    :pswitch_4
    invoke-direct {p0, p3}, Lcom/yftech/engineeringmode/fragment/LogFragment;->setTimeLogState(I)V

    .line 139
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f090123
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 144
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onStart()V
    .locals 4

    .line 282
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onStart()V

    .line 283
    sget-object v0, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    const-string v1, "onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->isSupportTboxLog()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 285
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;->getInstance()Lcom/yftech/tbox/sdk/CarTBoxSdkManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mCarTBoxSdkCallback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v0, v1, v2}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;->registerCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Landroid/os/Handler;)V

    .line 287
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 291
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onStop()V

    .line 292
    sget-object v0, Lcom/yftech/engineeringmode/fragment/LogFragment;->TAG:Ljava/lang/String;

    const-string v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->isSupportTboxLog()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    invoke-static {}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;->getInstance()Lcom/yftech/tbox/sdk/CarTBoxSdkManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment;->mCarTBoxSdkCallback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager;->unregisterCarTBoxSdkCallback(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;)V

    .line 296
    :cond_0
    return-void
.end method
