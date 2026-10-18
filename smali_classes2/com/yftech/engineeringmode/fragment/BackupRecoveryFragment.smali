.class public Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "BackupRecoveryFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field backupRelativeLayout:Landroid/widget/RelativeLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    const-class v0, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;

    .line 22
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->startFactory()V

    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 1
    .param p1, "root"    # Landroid/view/View;

    .line 36
    const v0, 0x7f090031

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->backupRelativeLayout:Landroid/widget/RelativeLayout;

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->backupRelativeLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->backupRelativeLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 39
    return-void
.end method

.method private openConfirmDialog()V
    .locals 2

    .line 68
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;-><init>(Landroid/content/Context;)V

    .line 69
    .local v0, "mConfirmDialog":Lcom/yftech/engineeringmode/dialog/ConfirmDialog;
    const v1, 0x7f0e00e5

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->setTipMessage(Ljava/lang/String;)V

    .line 70
    new-instance v1, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment$1;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->setOnButtonClickListener(Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;)V

    .line 81
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->show()V

    .line 82
    return-void
.end method

.method private startFactory()V
    .locals 3

    .line 45
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.yftech.action.factory"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 46
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 47
    const-string v1, "yf.factory"

    const-string v2, "1"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    new-instance v1, Lcom/yftech/engineeringmode/util/FactorySetting;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/util/FactorySetting;-><init>()V

    .line 49
    .local v1, "factorySetting":Lcom/yftech/engineeringmode/util/FactorySetting;
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/yftech/engineeringmode/util/FactorySetting;->factoryReset(Landroid/content/Context;)V

    .line 50
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 55
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090031

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 57
    :cond_0
    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 58
    sget-object v0, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->TAG:Ljava/lang/String;

    const-string v1, "backup_recovery monkey not factory recovery"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    return-void

    .line 61
    :cond_1
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->openConfirmDialog()V

    .line 62
    nop

    .line 65
    :goto_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 30
    const v0, 0x7f0c003d

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 31
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->initView(Landroid/view/View;)V

    .line 32
    return-object v0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .line 87
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->backupRelativeLayout:Landroid/widget/RelativeLayout;

    const/16 v1, 0x31

    const/16 v2, 0x29

    invoke-static {v2, v2, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 93
    goto :goto_0

    .line 89
    :cond_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->backupRelativeLayout:Landroid/widget/RelativeLayout;

    const/16 v1, 0x21

    const/16 v2, 0x47

    const/16 v3, 0x4f

    const/16 v4, 0x5c

    invoke-static {v1, v2, v3, v4}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 90
    nop

    .line 96
    :goto_0
    const/4 v0, 0x0

    return v0
.end method
