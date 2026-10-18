.class public Lcom/yftech/engineeringmode/adapter/ModuleAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "ModuleAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;,
        Lcom/yftech/engineeringmode/adapter/ModuleAdapter$OnItemClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private listener:Lcom/yftech/engineeringmode/adapter/ModuleAdapter$OnItemClickListener;

.field private modules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/model/Module;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/model/Module;",
            ">;)V"
        }
    .end annotation

    .line 32
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/yftech/engineeringmode/model/Module;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->modules:Ljava/util/List;

    .line 34
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->modules:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public synthetic lambda$onBindViewHolder$0$ModuleAdapter(Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;Landroid/view/View;)V
    .locals 3
    .param p1, "holder"    # Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;
    .param p2, "v"    # Landroid/view/View;

    .line 49
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->listener:Lcom/yftech/engineeringmode/adapter/ModuleAdapter$OnItemClickListener;

    if-eqz v0, :cond_0

    .line 50
    invoke-virtual {p1}, Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;->getAdapterPosition()I

    move-result v0

    .line 51
    .local v0, "pos":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->modules:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 52
    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->listener:Lcom/yftech/engineeringmode/adapter/ModuleAdapter$OnItemClickListener;

    iget-object v2, p0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->modules:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/engineeringmode/model/Module;

    invoke-interface {v1, p2, v0, v2}, Lcom/yftech/engineeringmode/adapter/ModuleAdapter$OnItemClickListener;->onItemClick(Landroid/view/View;ILcom/yftech/engineeringmode/model/Module;)V

    .line 55
    .end local v0    # "pos":I
    :cond_0
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 14
    check-cast p1, Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->onBindViewHolder(Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;I)V
    .locals 3
    .param p1, "holder"    # Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;
    .param p2, "position"    # I

    .line 46
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->modules:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yftech/engineeringmode/model/Module;

    .line 47
    .local v0, "module":Lcom/yftech/engineeringmode/model/Module;
    iget-object v1, p1, Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;->button:Landroid/widget/Button;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/model/Module;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 48
    iget-object v1, p1, Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;->button:Landroid/widget/Button;

    new-instance v2, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ModuleAdapter$aMpvB38uQR_K_Yp24KW8-1zmOp0;

    invoke-direct {v2, p0, p1}, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ModuleAdapter$aMpvB38uQR_K_Yp24KW8-1zmOp0;-><init>(Lcom/yftech/engineeringmode/adapter/ModuleAdapter;Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .line 38
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 39
    const v1, 0x7f0c0056

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 40
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;-><init>(Lcom/yftech/engineeringmode/adapter/ModuleAdapter;Landroid/view/View;)V

    .line 41
    .local v1, "holder":Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;
    return-object v1
.end method

.method public setOnItemClickListener(Lcom/yftech/engineeringmode/adapter/ModuleAdapter$OnItemClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/yftech/engineeringmode/adapter/ModuleAdapter$OnItemClickListener;

    .line 64
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->listener:Lcom/yftech/engineeringmode/adapter/ModuleAdapter$OnItemClickListener;

    .line 65
    return-void
.end method
