.class public Lcom/yftech/engineeringmode/fragment/AppInfoFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "AppInfoFragment.java"


# instance fields
.field private mAppInfoAdapter:Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method private getPackageInfos()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/pm/PackageInfo;",
            ">;"
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AppInfoFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 44
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_0

    .line 45
    const/4 v1, 0x0

    return-object v1

    .line 47
    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method private initView(Landroid/view/View;)V
    .locals 3
    .param p1, "root"    # Landroid/view/View;

    .line 36
    const v0, 0x7f0900f5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    .line 37
    .local v0, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    new-instance v1, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AppInfoFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/AppInfoFragment;->mAppInfoAdapter:Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;

    .line 38
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AppInfoFragment;->mAppInfoAdapter:Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 39
    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AppInfoFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 40
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 24
    const v0, 0x7f0c003a

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 25
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/AppInfoFragment;->initView(Landroid/view/View;)V

    .line 26
    return-object v0
.end method

.method public onResume()V
    .locals 2

    .line 31
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 32
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AppInfoFragment;->mAppInfoAdapter:Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AppInfoFragment;->getPackageInfos()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->setPackageInfos(Ljava/util/List;)V

    .line 33
    return-void
.end method
