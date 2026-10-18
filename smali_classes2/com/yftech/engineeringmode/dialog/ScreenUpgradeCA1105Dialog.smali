.class public Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;
.super Landroid/app/Dialog;
.source "ScreenUpgradeCA1105Dialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;


# instance fields
.field private btn_cancel:Landroid/widget/Button;

.field private btn_sure:Landroid/widget/Button;

.field private mIsUsbUpgrade:Z

.field private mMainHandler:Landroid/os/Handler;

.field private tv_cur_version:Landroid/widget/TextView;

.field private tv_file_version:Landroid/widget/TextView;

.field private tv_state:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "isUsbUpgrade"    # Z

    .line 30
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 27
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->mMainHandler:Landroid/os/Handler;

    .line 31
    iput-boolean p2, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->mIsUsbUpgrade:Z

    .line 32
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 17
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->btn_sure:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 17
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->btn_cancel:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 17
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_state:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 17
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_cur_version:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 17
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_file_version:Landroid/widget/TextView;

    return-object v0
.end method

.method private initView()V
    .locals 6

    .line 54
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_cur_version:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getInstance()Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getCurScreenVersion()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const v4, 0x7f0e00f6

    invoke-virtual {v1, v4, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->mIsUsbUpgrade:Z

    if-eqz v0, :cond_1

    .line 56
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getInstance()Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->checkScreenUpgradeFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_state:Landroid/widget/TextView;

    const v1, 0x7f0e00fe

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 58
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_file_version:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f0e00f9

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getInstance()Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getScreenUpgradeFileVersion()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v5

    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->btn_sure:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 60
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->btn_cancel:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_state:Landroid/widget/TextView;

    const v1, 0x7f0e00fa

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 63
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_file_version:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->btn_sure:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 65
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->btn_cancel:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 68
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 88
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f09003d

    if-eq v0, v1, :cond_1

    const v1, 0x7f09004c

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 90
    :cond_0
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getInstance()Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->startUpgrade()V

    .line 91
    goto :goto_0

    .line 93
    :cond_1
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->dismiss()V

    .line 96
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 36
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 37
    const v0, 0x7f0c0034

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->setContentView(I)V

    .line 38
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x807

    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 39
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->setCanceledOnTouchOutside(Z)V

    .line 40
    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->setCancelable(Z)V

    .line 42
    const v0, 0x7f090185

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_state:Landroid/widget/TextView;

    .line 43
    const v0, 0x7f090168

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_cur_version:Landroid/widget/TextView;

    .line 44
    const v0, 0x7f09016d

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->tv_file_version:Landroid/widget/TextView;

    .line 45
    const v0, 0x7f09004c

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->btn_sure:Landroid/widget/Button;

    .line 46
    const v0, 0x7f09003d

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->btn_cancel:Landroid/widget/Button;

    .line 47
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->btn_sure:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->btn_cancel:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->initView()V

    .line 51
    return-void
.end method

.method public onScreenUpgradeCA1105State(I)V
    .locals 2
    .param p1, "state"    # I

    .line 100
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->mMainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;

    invoke-direct {v1, p0, p1}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;-><init>(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 125
    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 72
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 73
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getInstance()Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->addScreenUpgradeCA1105Listener(Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;)V

    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onStart() isUsbUpgrade:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->mIsUsbUpgrade:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ScreenUpgradeCA1105Dialog"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->mIsUsbUpgrade:Z

    if-nez v0, :cond_0

    .line 76
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getInstance()Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->start()V

    .line 78
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 82
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 83
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getInstance()Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->removeScreenUpgradeCA1105Listener(Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager$ScreenUpgradeCA1105Listener;)V

    .line 84
    return-void
.end method
