.class Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;
.super Landroid/os/Handler;
.source "BluetoothFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/BluetoothFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    .line 85
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .line 88
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 89
    iget v0, p1, Landroid/os/Message;->arg1:I

    const v1, 0x7f09015d

    const v2, 0x7f090161

    const v3, 0x7f090162

    const/4 v4, 0x2

    if-ne v0, v4, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$202(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;Z)Z

    .line 91
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/bluetooth/BluetoothDevice;

    invoke-static {v0, v4}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$302(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;Landroid/bluetooth/BluetoothDevice;)Landroid/bluetooth/BluetoothDevice;

    .line 92
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$100(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v3}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$300(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$100(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v2}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$300(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$100(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "\u5df2\u8fde\u63a5"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$400(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)V

    goto :goto_0

    .line 96
    :cond_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-nez v0, :cond_1

    .line 97
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    const/4 v4, 0x1

    invoke-static {v0, v4}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$202(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;Z)Z

    .line 98
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$302(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;Landroid/bluetooth/BluetoothDevice;)Landroid/bluetooth/BluetoothDevice;

    .line 99
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$100(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$100(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$100(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "\u672a\u8fde\u63a5"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$100(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09015c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "--"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    :cond_1
    :goto_0
    return-void
.end method
