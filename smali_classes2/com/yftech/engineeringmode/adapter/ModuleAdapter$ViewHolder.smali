.class public Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ModuleAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/adapter/ModuleAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ViewHolder"
.end annotation


# instance fields
.field button:Landroid/widget/Button;

.field final synthetic this$0:Lcom/yftech/engineeringmode/adapter/ModuleAdapter;


# direct methods
.method public constructor <init>(Lcom/yftech/engineeringmode/adapter/ModuleAdapter;Landroid/view/View;)V
    .locals 1
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/adapter/ModuleAdapter;
    .param p2, "view"    # Landroid/view/View;

    .line 26
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;->this$0:Lcom/yftech/engineeringmode/adapter/ModuleAdapter;

    .line 27
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 28
    const v0, 0x7f09004f

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;->button:Landroid/widget/Button;

    .line 29
    return-void
.end method
