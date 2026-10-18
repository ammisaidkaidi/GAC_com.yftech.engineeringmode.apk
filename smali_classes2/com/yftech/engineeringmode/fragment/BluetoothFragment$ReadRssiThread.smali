.class Lcom/yftech/engineeringmode/fragment/BluetoothFragment$ReadRssiThread;
.super Ljava/lang/Thread;
.source "BluetoothFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/BluetoothFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReadRssiThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    .line 214
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$ReadRssiThread;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 217
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 218
    :goto_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$ReadRssiThread;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$200(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 220
    :try_start_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$ReadRssiThread;->this$0:Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->access$600(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->readRemoteRssi()Z

    .line 221
    const-wide/16 v0, 0x1f4

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$ReadRssiThread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 222
    :catch_0
    move-exception v0

    .line 223
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 224
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_1
    goto :goto_0

    .line 226
    :cond_0
    const-string v0, "BluetoothInfo"

    const-string v1, "ReadRssiThread finished"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    return-void
.end method
