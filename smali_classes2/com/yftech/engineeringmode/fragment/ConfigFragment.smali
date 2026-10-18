.class public Lcom/yftech/engineeringmode/fragment/ConfigFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "ConfigFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mConfigReadAdapter:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

.field private mSpinner:Landroid/widget/Spinner;

.field private final rebootRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 33
    const-class v0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 126
    new-instance v0, Lcom/yftech/engineeringmode/fragment/ConfigFragment$2;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/ConfigFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->rebootRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    .line 31
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->mConfigReadAdapter:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)Landroid/widget/Spinner;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    .line 31
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->mSpinner:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 31
    sget-object v0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    .line 31
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->rebootRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$400()V
    .locals 0

    .line 31
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->reboot()V

    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 5
    .param p1, "root"    # Landroid/view/View;

    .line 47
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/manager/ConfigManager;->init(Landroid/content/Context;)V

    .line 49
    const v0, 0x7f0900f5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    .line 50
    .local v0, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    new-instance v1, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const/16 v3, 0xa

    invoke-direct {v1, v2, v3}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 51
    new-instance v1, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->mConfigReadAdapter:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    .line 52
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->mConfigReadAdapter:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 54
    const v1, 0x7f09012b

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->mSpinner:Landroid/widget/Spinner;

    .line 55
    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getNames()Ljava/util/List;

    move-result-object v3

    const v4, 0x7f0c0064

    invoke-direct {v1, v2, v4, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 56
    .local v1, "arrayAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v2, 0x7f0c0065

    invoke-virtual {v1, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 57
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 58
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {v2, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 59
    const v2, 0x7f09004f

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-static {}, Lcom/yftech/engineeringmode/util/Utils;->isSupportConfigSetting()Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    const/16 v4, 0x8

    :goto_0
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 74
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Lcom/yftech/engineeringmode/fragment/-$$Lambda$ConfigFragment$VGRCGnuhVmBEw-FC-fiSaoTiZ4w;

    invoke-direct {v3, p0}, Lcom/yftech/engineeringmode/fragment/-$$Lambda$ConfigFragment$VGRCGnuhVmBEw-FC-fiSaoTiZ4w;-><init>(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    return-void
.end method

.method private openConfirmDialogDialog()V
    .locals 2

    .line 100
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;-><init>(Landroid/content/Context;)V

    .line 101
    .local v0, "confirmDialog":Lcom/yftech/engineeringmode/dialog/ConfirmDialog;
    new-instance v1, Lcom/yftech/engineeringmode/fragment/ConfigFragment$1;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/ConfigFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->setOnButtonClickListener(Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;)V

    .line 123
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->show()V

    .line 124
    return-void
.end method

.method private static reboot()V
    .locals 2

    .line 136
    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    sget-object v0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->TAG:Ljava/lang/String;

    const-string v1, "monkey not reboot"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    return-void

    .line 141
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    const-string v1, "reboot"

    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    .line 142
    .local v0, "process":Ljava/lang/Process;
    invoke-virtual {v0}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    nop

    .end local v0    # "process":Ljava/lang/Process;
    goto :goto_1

    .line 143
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 144
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 146
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method


# virtual methods
.method public synthetic lambda$initView$0$ConfigFragment(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 75
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->openConfirmDialogDialog()V

    .line 76
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 41
    const v0, 0x7f0c0040

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 42
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->initView(Landroid/view/View;)V

    .line 43
    return-object v0
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
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

    .line 87
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    if-ltz p3, :cond_0

    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getNames()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p3, v0, :cond_0

    .line 88
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getNames()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 89
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->mConfigReadAdapter:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getConfigs()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-virtual {v1, v2}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->setData([B)V

    .line 91
    .end local v0    # "key":Ljava/lang/String;
    :cond_0
    return-void
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

    .line 96
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 81
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 82
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->mSpinner:Landroid/widget/Spinner;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 83
    return-void
.end method
