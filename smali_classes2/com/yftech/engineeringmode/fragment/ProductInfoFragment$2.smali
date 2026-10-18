.class Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$2;
.super Ljava/lang/Object;
.source "ProductInfoFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;
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

    .line 224
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 227
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->access$500(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)Landroid/view/View;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->access$600(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;Landroid/view/View;)V

    .line 228
    return-void
.end method
