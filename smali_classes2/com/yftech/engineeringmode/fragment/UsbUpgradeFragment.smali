.class public Lcom/yftech/engineeringmode/fragment/UsbUpgradeFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "UsbUpgradeFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;

    .line 23
    const v0, 0x7f090166

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/ScrollingMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 24
    const v0, 0x7f09003e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-object v1, Lcom/yftech/engineeringmode/fragment/-$$Lambda$UsbUpgradeFragment$yaUHj_XyHW1UDrnCNtOnb-XYnkg;->INSTANCE:Lcom/yftech/engineeringmode/fragment/-$$Lambda$UsbUpgradeFragment$yaUHj_XyHW1UDrnCNtOnb-XYnkg;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    return-void
.end method

.method static synthetic lambda$initView$0(Landroid/view/View;)V
    .locals 4
    .param p0, "v"    # Landroid/view/View;

    .line 25
    invoke-static {}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->getInstance()Lcom/yftech/engineeringmode/manager/UpgradeManager;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->checkUpgradeFile(ZLjava/lang/String;Z)V

    .line 26
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 17
    const v0, 0x7f0c004d

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 18
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/UsbUpgradeFragment;->initView(Landroid/view/View;)V

    .line 19
    return-object v0
.end method
