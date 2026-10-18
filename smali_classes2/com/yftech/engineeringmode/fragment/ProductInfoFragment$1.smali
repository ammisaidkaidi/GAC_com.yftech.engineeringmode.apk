.class Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$1;
.super Ljava/lang/Object;
.source "ProductInfoFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    .line 94
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 97
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->access$100(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)V

    .line 98
    new-instance v0, Lcom/yftech/engineeringmode/dialog/LoadingDialog;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/LoadingDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/LoadingDialog;->show()V

    .line 99
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->access$300(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->access$200(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 100
    return-void
.end method
