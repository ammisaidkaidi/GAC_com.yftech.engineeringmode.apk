.class public Lcom/yftech/engineeringmode/dialog/UpgradeDialog;
.super Landroid/app/Dialog;
.source "UpgradeDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCarUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

.field private mHandlerCarUpgradeCallback:Landroid/os/Handler;

.field private mIsUpgradeMCU:Z

.field private mIsUpgradeOS:Z

.field private mIsUpgradeScreen:Z

.field private mIsUpgradeScreenMcu:Z

.field private mUpgradeCount:I

.field private mUpgradeEndCount:I

.field private mbtnConfirm:Landroid/widget/Button;

.field private mpbUpgradeProgress:Landroid/widget/ProgressBar;

.field private mtvUpgradeProgress:Landroid/widget/TextView;

.field private mtvUpgradeTip:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    const-class v0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 46
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 43
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mHandlerCarUpgradeCallback:Landroid/os/Handler;

    .line 191
    new-instance v0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;-><init>(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mCarUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    .line 47
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 27
    sget-object v0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 27
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mpbUpgradeProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 27
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mtvUpgradeProgress:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 27
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeEndCount:I

    return v0
.end method

.method static synthetic access$308(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I
    .locals 2
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 27
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeEndCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeEndCount:I

    return v0
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 27
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mtvUpgradeTip:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 27
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeCount:I

    return v0
.end method

.method static synthetic access$600(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 27
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mbtnConfirm:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$700(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 27
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->requestBspInfo()V

    return-void
.end method

.method private initData()V
    .locals 3

    .line 143
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mtvUpgradeTip:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e0130

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mpbUpgradeProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 145
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mtvUpgradeProgress:Landroid/widget/TextView;

    const-string v1, "0%"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mbtnConfirm:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 147
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 1
    .param p1, "root"    # Landroid/view/View;

    .line 97
    const v0, 0x7f090154

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mtvUpgradeTip:Landroid/widget/TextView;

    .line 98
    const v0, 0x7f090153

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mtvUpgradeProgress:Landroid/widget/TextView;

    .line 99
    const v0, 0x7f0900ee

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mpbUpgradeProgress:Landroid/widget/ProgressBar;

    .line 100
    const v0, 0x7f09003b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mbtnConfirm:Landroid/widget/Button;

    .line 101
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mbtnConfirm:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    return-void
.end method

.method private requestBspInfo()V
    .locals 6

    .line 366
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    move-result v0

    .line 367
    .local v0, "hardwareResult":Z
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v1

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    move-result v1

    .line 369
    .local v1, "softwareResult":Z
    if-nez v0, :cond_0

    if-eqz v1, :cond_1

    .line 370
    :cond_0
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v3, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$2;

    invoke-direct {v3, p0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$2;-><init>(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)V

    const-wide/16 v4, 0x4b0

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 378
    :cond_1
    sget-object v2, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "requestBspInfo hardwareResult:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " softwareResult:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    return-void
.end method

.method private startUpgrade()V
    .locals 7

    .line 150
    const/4 v0, 0x0

    .line 151
    .local v0, "addMCUUpgradeModuleResult":I
    const/4 v1, 0x0

    .line 152
    .local v1, "addOSUpgradeModuleResult":I
    const/4 v2, 0x0

    .line 153
    .local v2, "addScreenUpgradeModuleResult":I
    const/4 v3, 0x0

    .line 154
    .local v3, "addScreenMcuUpgradeModuleResult":I
    iget-boolean v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeMCU:Z

    if-eqz v4, :cond_0

    .line 155
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v4

    sget-object v5, Lcom/yftech/engineeringmode/manager/UpgradeManager;->MCU_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/yftech/car/upgrade/CarUpgradeManager;->addMCUUpgradeModule(Ljava/lang/String;)I

    move-result v0

    .line 157
    :cond_0
    iget-boolean v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeOS:Z

    if-eqz v4, :cond_1

    .line 158
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v4

    sget-object v5, Lcom/yftech/engineeringmode/manager/UpgradeManager;->OS_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/yftech/car/upgrade/CarUpgradeManager;->addOSUpgradeModule(Ljava/lang/String;)I

    move-result v1

    .line 160
    :cond_1
    iget-boolean v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeScreen:Z

    if-eqz v4, :cond_2

    .line 161
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v4

    sget-object v5, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/yftech/car/upgrade/CarUpgradeManager;->addScreenUpgradeModule(Ljava/lang/String;)I

    move-result v2

    .line 163
    :cond_2
    iget-boolean v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeScreenMcu:Z

    if-eqz v4, :cond_3

    .line 164
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v4

    sget-object v5, Lcom/yftech/engineeringmode/manager/UpgradeManager;->SCREEN_MCU_UPGRADE_PATH:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/yftech/car/upgrade/CarUpgradeManager;->addScreenMcuUpgradeModule(Ljava/lang/String;)I

    move-result v3

    .line 166
    :cond_3
    sget-object v4, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "startUpgrade() addMCUUpgradeModuleResult:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", addOSUpgradeModuleResult:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", addScreenUpgradeModuleResult:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", addScreenMcuUpgradeModuleResult:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    const/4 v4, 0x1

    if-eq v0, v4, :cond_5

    if-eq v1, v4, :cond_5

    if-eq v2, v4, :cond_5

    if-ne v3, v4, :cond_4

    goto :goto_0

    .line 176
    :cond_4
    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mtvUpgradeTip:Landroid/widget/TextView;

    const-string v5, "\u5347\u7ea7\u6587\u4ef6\u6dfb\u52a0\u5931\u8d25"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mbtnConfirm:Landroid/widget/Button;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 178
    sput-boolean v5, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    goto :goto_1

    .line 174
    :cond_5
    :goto_0
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/yftech/car/upgrade/CarUpgradeManager;->startUpgrade()Z

    .line 180
    :goto_1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 184
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f09003b

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 186
    :cond_0
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->dismiss()V

    .line 189
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 77
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 78
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->requestWindowFeature(I)Z

    .line 79
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c0035

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 80
    .local v0, "root":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->setContentView(Landroid/view/View;)V

    .line 81
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 82
    .local v1, "window":Landroid/view/Window;
    if-eqz v1, :cond_0

    .line 83
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 84
    .local v2, "params":Landroid/view/WindowManager$LayoutParams;
    const/16 v3, 0x8

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 85
    const/16 v3, 0x11

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 86
    const/4 v3, -0x1

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 87
    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 88
    const/16 v3, 0x807

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 89
    invoke-virtual {v1, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 91
    .end local v2    # "params":Landroid/view/WindowManager$LayoutParams;
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->setCanceledOnTouchOutside(Z)V

    .line 92
    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->setCancelable(Z)V

    .line 93
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->initView(Landroid/view/View;)V

    .line 94
    return-void
.end method

.method protected onStart()V
    .locals 3

    .line 106
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 107
    sget-object v0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->TAG:Ljava/lang/String;

    const-string v1, "onStart()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->initData()V

    .line 109
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeMCU:Z

    if-eqz v0, :cond_0

    .line 110
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mCarUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mHandlerCarUpgradeCallback:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yftech/car/upgrade/CarUpgradeManager;->registerCarMCUUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;Landroid/os/Handler;)V

    .line 112
    :cond_0
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeOS:Z

    if-eqz v0, :cond_1

    .line 113
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mCarUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mHandlerCarUpgradeCallback:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yftech/car/upgrade/CarUpgradeManager;->registerCarOSUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;Landroid/os/Handler;)V

    .line 115
    :cond_1
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeScreen:Z

    if-eqz v0, :cond_2

    .line 116
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mCarUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mHandlerCarUpgradeCallback:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yftech/car/upgrade/CarUpgradeManager;->registerCarScreenUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;Landroid/os/Handler;)V

    .line 118
    :cond_2
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeScreenMcu:Z

    if-eqz v0, :cond_3

    .line 119
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mCarUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mHandlerCarUpgradeCallback:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yftech/car/upgrade/CarUpgradeManager;->registerCarScreenMcuUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;Landroid/os/Handler;)V

    .line 121
    :cond_3
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->startUpgrade()V

    .line 122
    return-void
.end method

.method protected onStop()V
    .locals 2

    .line 126
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 127
    sget-object v0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->TAG:Ljava/lang/String;

    const-string v1, "onStop()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeMCU:Z

    if-eqz v0, :cond_0

    .line 129
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mCarUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/upgrade/CarUpgradeManager;->unregisterCarMCUUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;)V

    .line 131
    :cond_0
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeOS:Z

    if-eqz v0, :cond_1

    .line 132
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mCarUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/upgrade/CarUpgradeManager;->unregisterCarOSUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;)V

    .line 134
    :cond_1
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeScreen:Z

    if-eqz v0, :cond_2

    .line 135
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mCarUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/upgrade/CarUpgradeManager;->unregisterCarScreenUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;)V

    .line 137
    :cond_2
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeScreenMcu:Z

    if-eqz v0, :cond_3

    .line 138
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mCarUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/upgrade/CarUpgradeManager;->unregisterCarScreenMcuUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;)V

    .line 140
    :cond_3
    return-void
.end method

.method public start(ZZZZ)V
    .locals 3
    .param p1, "isUpgradeMCU"    # Z
    .param p2, "isUpgradeOS"    # Z
    .param p3, "isUpgradeScreen"    # Z
    .param p4, "isUpgradeScreenMcu"    # Z

    .line 50
    sget-object v0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "start() isUpgradeMCU:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", isUpgradeOS:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", isUpgradeScreen:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", isUpgradeScreenMcu"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    if-nez p3, :cond_0

    if-nez p4, :cond_0

    .line 52
    return-void

    .line 54
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeCount:I

    .line 55
    iput v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeEndCount:I

    .line 56
    if-eqz p1, :cond_1

    .line 57
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeCount:I

    .line 59
    :cond_1
    if-eqz p2, :cond_2

    .line 60
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeCount:I

    .line 62
    :cond_2
    if-eqz p3, :cond_3

    .line 63
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeCount:I

    .line 65
    :cond_3
    if-eqz p4, :cond_4

    .line 66
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mUpgradeCount:I

    .line 68
    :cond_4
    iput-boolean p1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeMCU:Z

    .line 69
    iput-boolean p2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeOS:Z

    .line 70
    iput-boolean p3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeScreen:Z

    .line 71
    iput-boolean p4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->mIsUpgradeScreenMcu:Z

    .line 72
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->show()V

    .line 73
    return-void
.end method
