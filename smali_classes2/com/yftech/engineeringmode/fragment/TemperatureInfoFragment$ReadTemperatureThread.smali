.class Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;
.super Ljava/lang/Thread;
.source "TemperatureInfoFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReadTemperatureThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    .line 178
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;->this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 181
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 182
    :goto_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;->this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->access$000(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 184
    :try_start_0
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 185
    .local v0, "message":Landroid/os/Message;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 186
    .local v1, "bundle":Landroid/os/Bundle;
    const-string v2, "soc"

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;->this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-static {v3}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->access$100(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    const-string v2, "cpu"

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;->this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-static {v3}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->access$200(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    const-string v2, "tft"

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;->this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-static {v3}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->access$300(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 190
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;->this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-static {v2}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->access$400(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 191
    const-wide/16 v2, 0x5dc

    invoke-static {v2, v3}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    .end local v0    # "message":Landroid/os/Message;
    .end local v1    # "bundle":Landroid/os/Bundle;
    goto :goto_0

    .line 192
    :catch_0
    move-exception v0

    .line 193
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 197
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    const-string v0, "TemperatureInfo"

    const-string v1, "Read temperature thread finished."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    return-void
.end method
