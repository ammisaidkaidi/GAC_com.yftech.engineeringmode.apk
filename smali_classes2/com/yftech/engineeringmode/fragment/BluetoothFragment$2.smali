.class Lcom/yftech/engineeringmode/fragment/BluetoothFragment$2;
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

    .line 72
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .line 75
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 76
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$100(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09015c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    :cond_0
    return-void
.end method
