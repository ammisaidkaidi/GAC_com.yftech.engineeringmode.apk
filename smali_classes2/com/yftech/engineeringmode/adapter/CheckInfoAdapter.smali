.class public Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "CheckInfoAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final mCheckInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/model/CheckInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/model/CheckInfo;",
            ">;)V"
        }
    .end annotation

    .line 22
    .local p2, "checkInfos":Ljava/util/List;, "Ljava/util/List<Lcom/yftech/engineeringmode/model/CheckInfo;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;->mContext:Landroid/content/Context;

    .line 24
    iput-object p2, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;->mCheckInfos:Ljava/util/List;

    .line 25
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;->mCheckInfos:Ljava/util/List;

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

    .line 18
    check-cast p1, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;->onBindViewHolder(Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;I)V
    .locals 8
    .param p1, "viewHolder"    # Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;
    .param p2, "i"    # I

    .line 36
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;->mCheckInfos:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yftech/engineeringmode/model/CheckInfo;

    .line 37
    .local v0, "checkInfo":Lcom/yftech/engineeringmode/model/CheckInfo;
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/model/CheckInfo;->getResult()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    .line 38
    .local v1, "isResultOk":Z
    :goto_0
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/model/CheckInfo;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->setName(Ljava/lang/String;)V

    .line 39
    iget-object v4, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;->mContext:Landroid/content/Context;

    const v5, 0x7f0e0053

    new-array v6, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/model/CheckInfo;->getValue()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->setFileValue(Ljava/lang/String;)V

    .line 40
    iget-object v4, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;->mContext:Landroid/content/Context;

    const v5, 0x7f0e0052

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/model/CheckInfo;->getRealValue()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    invoke-virtual {v4, v5, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->setDeviceValue(Ljava/lang/String;)V

    .line 41
    iget-object v2, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;->mContext:Landroid/content/Context;

    if-eqz v1, :cond_1

    const v3, 0x7f0e0055

    goto :goto_1

    :cond_1
    const v3, 0x7f0e0054

    :goto_1
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 42
    iget-object v3, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;->mContext:Landroid/content/Context;

    if-eqz v1, :cond_2

    const v4, 0x7f06002c

    goto :goto_2

    :cond_2
    const v4, 0x7f06002b

    :goto_2
    invoke-virtual {v3, v4}, Landroid/content/Context;->getColor(I)I

    move-result v3

    .line 41
    invoke-virtual {p1, v2, v3}, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->setResult(Ljava/lang/String;I)V

    .line 44
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 18
    invoke-virtual {p0, p1, p2}, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;
    .locals 3
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;
    .param p2, "i"    # I

    .line 30
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c0051

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 31
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;-><init>(Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;Landroid/view/View;)V

    return-object v1
.end method
