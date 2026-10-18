.class public Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AppInfoAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mPackageInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/content/pm/PackageInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mPackageManager:Landroid/content/pm/PackageManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 24
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->mContext:Landroid/content/Context;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 27
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->mPackageInfos:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 19
    check-cast p1, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->onBindViewHolder(Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;I)V
    .locals 3
    .param p1, "viewHolder"    # Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;
    .param p2, "i"    # I

    .line 43
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->mPackageInfos:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    .line 44
    .local v0, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v2, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v1, v2}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->setAppIcon(Landroid/graphics/drawable/Drawable;)V

    .line 45
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v2, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v1, v2}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->setAppName(Ljava/lang/String;)V

    .line 46
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->setAppPackage(Ljava/lang/String;)V

    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "versionCode\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->setVersionCode(Ljava/lang/String;)V

    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "versionName\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->setVersionName(Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;
    .locals 3
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;
    .param p2, "i"    # I

    .line 37
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c0050

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 38
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;-><init>(Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;Landroid/view/View;)V

    return-object v1
.end method

.method public setPackageInfos(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/content/pm/PackageInfo;",
            ">;)V"
        }
    .end annotation

    .line 30
    .local p1, "packageInfos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->mPackageInfos:Ljava/util/List;

    .line 31
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;->notifyDataSetChanged()V

    .line 32
    return-void
.end method
