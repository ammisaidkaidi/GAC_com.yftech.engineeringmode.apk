.class Lcom/yftech/engineeringmode/fragment/BluetoothFragment$4;
.super Lcom/yftech/car/bluetooth/callback/CarBluetoothSettingsCallback;
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

    .line 107
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$4;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-direct {p0}, Lcom/yftech/car/bluetooth/callback/CarBluetoothSettingsCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onBluetoothConnectStateChanged(Landroid/bluetooth/BluetoothDevice;I)V
    .locals 2
    .param p1, "bluetoothDevice"    # Landroid/bluetooth/BluetoothDevice;
    .param p2, "state"    # I

    .line 110
    invoke-super {p0, p1, p2}, Lcom/yftech/car/bluetooth/callback/CarBluetoothSettingsCallback;->onBluetoothConnectStateChanged(Landroid/bluetooth/BluetoothDevice;I)V

    .line 111
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 112
    .local v0, "message":Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 113
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 114
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$4;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$500(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 115
    return-void
.end method
