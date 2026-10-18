.class public Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;
.super Landroid/widget/BaseAdapter;
.source "ScreenTpGridViewAdapter.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private heightCount:I

.field private list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;",
            ">;"
        }
    .end annotation
.end field

.field private widthCount:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;II)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "wCount"    # I
    .param p4, "hCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;",
            ">;II)V"
        }
    .end annotation

    .line 24
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->context:Landroid/content/Context;

    .line 26
    iput-object p2, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->list:Ljava/util/List;

    .line 27
    iput p3, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->widthCount:I

    .line 28
    iput p4, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->heightCount:I

    .line 29
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "i"    # I

    .line 38
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "i"    # I

    .line 43
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "i"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "viewGroup"    # Landroid/view/ViewGroup;

    .line 49
    const/4 v0, 0x0

    .line 50
    .local v0, "viewHolder":Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter$ViewHolder;
    if-nez p2, :cond_3

    .line 51
    new-instance v1, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter$ViewHolder;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter$ViewHolder;-><init>(Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;)V

    move-object v0, v1

    .line 52
    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0c0057

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 53
    const v1, 0x7f090106

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter$ViewHolder;->title:Landroid/widget/TextView;

    .line 54
    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->list:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne p1, v1, :cond_0

    .line 55
    iget-object v1, v0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter$ViewHolder;->title:Landroid/widget/TextView;

    const-string v2, "\u957f\u6309\u6b64\u5904\u9000\u51fa"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto :goto_0

    .line 57
    :cond_0
    iget v1, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->widthCount:I

    iget v2, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->heightCount:I

    add-int/lit8 v3, v2, -0x1

    mul-int/2addr v3, v1

    if-ne p1, v3, :cond_1

    .line 58
    iget-object v1, v0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter$ViewHolder;->title:Landroid/widget/TextView;

    const-string v2, "\u957f\u6309\u6b64\u5904\u6e05\u9664\u5df2\u89e6\u6478\u70b9"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto :goto_0

    .line 60
    :cond_1
    div-int/lit8 v2, v2, 0x2

    mul-int/2addr v2, v1

    div-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    sub-int/2addr v2, v1

    if-ne p1, v2, :cond_2

    .line 61
    iget-object v1, v0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter$ViewHolder;->title:Landroid/widget/TextView;

    const-string v2, "\u6ed1\u52a8\u5c4f\u5e55\uff0c\u4f7f\u8272\u5757\u5168\u90e8\u53d8\u8272"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 63
    :cond_2
    iget-object v1, v0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter$ViewHolder;->title:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 68
    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter$ViewHolder;

    .line 70
    :goto_0
    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->list:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;->isSelect()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 71
    const/high16 v1, -0x10000

    invoke-virtual {p2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_1

    .line 72
    :cond_4
    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->list:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;->isSelect()Z

    move-result v1

    if-nez v1, :cond_5

    .line 73
    const/4 v1, -0x1

    invoke-virtual {p2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 75
    :cond_5
    :goto_1
    return-object p2
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 80
    const/4 v0, 0x0

    return v0
.end method
