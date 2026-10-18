.class public Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;
.super Landroid/app/Dialog;
.source "CheckInfoDialog.java"


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


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
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

    .line 25
    .local p2, "checkInfos":Ljava/util/List;, "Ljava/util/List<Lcom/yftech/engineeringmode/model/CheckInfo;>;"
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 26
    iput-object p2, p0, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->mCheckInfos:Ljava/util/List;

    .line 27
    return-void
.end method


# virtual methods
.method public synthetic lambda$onCreate$0$CheckInfoDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 52
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->dismiss()V

    .line 53
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 31
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 32
    const v0, 0x7f0c002c

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->setContentView(I)V

    .line 33
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 34
    .local v0, "window":Landroid/view/Window;
    if-eqz v0, :cond_0

    .line 35
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 36
    .local v1, "params":Landroid/view/WindowManager$LayoutParams;
    const/16 v2, 0x8

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 37
    const/4 v2, -0x1

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 38
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 39
    const/16 v2, 0x807

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 40
    const/16 v2, 0x11

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 43
    .end local v1    # "params":Landroid/view/WindowManager$LayoutParams;
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->setCanceledOnTouchOutside(Z)V

    .line 44
    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->setCancelable(Z)V

    .line 46
    const v1, 0x7f0900f5

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    .line 47
    .local v1, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    new-instance v2, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->mCheckInfos:Ljava/util/List;

    invoke-direct {v2, v3, v4}, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 48
    .local v2, "checkInfoAdapter":Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;
    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 49
    new-instance v3, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 51
    const v3, 0x7f090040

    invoke-virtual {p0, v3}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/yftech/engineeringmode/dialog/-$$Lambda$CheckInfoDialog$6i2fiE-hk3S_oBDRCWushfzAn5c;

    invoke-direct {v4, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$CheckInfoDialog$6i2fiE-hk3S_oBDRCWushfzAn5c;-><init>(Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    return-void
.end method
