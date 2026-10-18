.class Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$1;
.super Landroid/os/Handler;
.source "FaultCodeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;
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

    .line 42
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .line 45
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 46
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->access$000(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 47
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    new-instance v1, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    invoke-direct {v1, v2, v3}, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->access$102(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;)Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    .line 48
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->access$200(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)Landroid/widget/ListView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->access$100(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 49
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->access$302(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;Z)Z

    .line 50
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->access$400(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)V

    .line 51
    return-void
.end method
