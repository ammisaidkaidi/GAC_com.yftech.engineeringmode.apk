.class Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ConfigReadAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field private mLayoutItem:Landroid/view/View;

.field private mTvPositon:Landroid/widget/TextView;

.field private mTvValue:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;


# direct methods
.method public constructor <init>(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;Landroid/view/View;)V
    .locals 1
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;
    .param p2, "itemView"    # Landroid/view/View;

    .line 91
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->this$0:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    .line 92
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 93
    const v0, 0x7f0900b3

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->mLayoutItem:Landroid/view/View;

    .line 94
    const v0, 0x7f090176

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->mTvPositon:Landroid/widget/TextView;

    .line 95
    const v0, 0x7f090193

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->mTvValue:Landroid/widget/TextView;

    .line 96
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;

    .line 86
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->mTvPositon:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;

    .line 86
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->mTvValue:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;

    .line 86
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->mLayoutItem:Landroid/view/View;

    return-object v0
.end method
