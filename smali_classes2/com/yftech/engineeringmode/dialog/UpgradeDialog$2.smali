.class Lcom/yftech/engineeringmode/dialog/UpgradeDialog$2;
.super Ljava/lang/Object;
.source "UpgradeDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->requestBspInfo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 370
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 373
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.yftech.engineeringmode.ProductInfo"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 374
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 375
    return-void
.end method
