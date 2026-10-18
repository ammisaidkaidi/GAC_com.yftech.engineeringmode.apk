.class Lcom/yftech/engineeringmode/fragment/AdditionalFragment$2;
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

    .line 65
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .line 68
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 69
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->access$100(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    return-void
.end method
