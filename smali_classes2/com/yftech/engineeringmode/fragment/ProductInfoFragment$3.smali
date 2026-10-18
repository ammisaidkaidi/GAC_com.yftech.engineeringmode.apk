.class Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$3;
.super Ljava/lang/Object;
.source "ProductInfoFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->requestBspInfo()V
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

    .line 247
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 250
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.yftech.engineeringmode.ProductInfo"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 251
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 252
    return-void
.end method
