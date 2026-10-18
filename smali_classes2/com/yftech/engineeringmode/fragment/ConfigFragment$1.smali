.class Lcom/yftech/engineeringmode/fragment/ConfigFragment$1;
.super Ljava/lang/Object;
.source "ConfigFragment.java"

# interfaces
.implements Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/ConfigFragment;->openConfirmDialogDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/ConfigFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    .line 101
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancelButtonClick()V
    .locals 0

    .line 121
    return-void
.end method

.method public sureButtonClick()V
    .locals 6

    .line 104
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->access$000(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->getData()[B

    move-result-object v0

    .line 105
    .local v0, "data":[B
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->access$100(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)Landroid/widget/Spinner;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, "selectItem":Ljava/lang/String;
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->access$200()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sureButtonClick() --> selectItem:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    const-string v2, "0100"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 109
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfig0100([B)V

    goto :goto_0

    .line 112
    :cond_0
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfig0101([B)V

    .line 115
    :goto_0
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    .line 116
    .local v2, "rebootHandler":Landroid/os/Handler;
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    invoke-static {v3}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->access$300(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)Ljava/lang/Runnable;

    move-result-object v3

    const-wide/16 v4, 0xbb8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 117
    return-void
.end method
