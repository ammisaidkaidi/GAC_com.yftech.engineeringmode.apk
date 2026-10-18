.class Lcom/yftech/engineeringmode/fragment/AdditionalFragment$1;
.super Landroid/os/Handler;
.source "AdditionalFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/AdditionalFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    .line 56
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .line 59
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 60
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->access$000(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " km/h"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    return-void
.end method
