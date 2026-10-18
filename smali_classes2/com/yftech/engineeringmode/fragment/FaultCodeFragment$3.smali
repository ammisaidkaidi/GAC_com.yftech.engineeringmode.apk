.class Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$3;
.super Ljava/util/TimerTask;
.source "FaultCodeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->startTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    .line 139
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 142
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->access$000(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    const v2, 0x7f0e00df

    invoke-virtual {v1, v2}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 144
    .local v0, "message":Landroid/os/Message;
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    iget-object v1, v1, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->errorCodeInfoList:Ljava/util/List;

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 145
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->access$500(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)Landroid/os/Handler;

    move-result-object v1

    const-wide/16 v2, 0x5dc

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 146
    return-void
.end method
