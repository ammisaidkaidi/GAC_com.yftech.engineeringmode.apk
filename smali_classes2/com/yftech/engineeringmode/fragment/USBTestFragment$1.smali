.class Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;
.super Landroid/os/Handler;
.source "USBTestFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/USBTestFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 52
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .line 55
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 57
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    new-instance v1, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v3}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$100(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v4}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$200(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$002(Lcom/yftech/engineeringmode/fragment/USBTestFragment;Lcom/yftech/engineeringmode/adapter/USBFileAdapter;)Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    .line 58
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$300(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Landroid/widget/ListView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$000(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 59
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    new-instance v1, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v3}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$400(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v4}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$200(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$002(Lcom/yftech/engineeringmode/fragment/USBTestFragment;Lcom/yftech/engineeringmode/adapter/USBFileAdapter;)Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    .line 60
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$500(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Landroid/widget/ListView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$000(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 61
    return-void
.end method
