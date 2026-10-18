.class Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;
.super Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;
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

    .line 220
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-direct {p0}, Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onUsbStatusChange(IZ)V
    .locals 5
    .param p1, "usbIndex"    # I
    .param p2, "isUsbExists"    # Z

    .line 230
    invoke-super {p0, p1, p2}, Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;->onUsbStatusChange(IZ)V

    .line 231
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v0, p1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$202(Lcom/yftech/engineeringmode/fragment/USBTestFragment;I)I

    .line 232
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v0, p2}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$702(Lcom/yftech/engineeringmode/fragment/USBTestFragment;Z)Z

    .line 233
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$800()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Usb\u4e0b\u6807-->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$800()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onUsbStatusChange: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 236
    .local v0, "message":Landroid/os/Message;
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 237
    const/4 v1, 0x1

    if-nez p1, :cond_0

    .line 238
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v2}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$900(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_0

    .line 239
    :cond_0
    if-ne p1, v1, :cond_1

    .line 240
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v2}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$1000(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 242
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v1, p1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$1102(Lcom/yftech/engineeringmode/fragment/USBTestFragment;I)I

    .line 243
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$1108(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)I

    .line 245
    const-string v1, "USB "

    const/4 v2, 0x0

    if-nez p2, :cond_2

    .line 246
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$1108(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " IS UNCONNECTED"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 247
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$900(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 248
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$1000(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 249
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$1200(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)V

    goto :goto_1

    .line 250
    :cond_2
    if-eqz p2, :cond_3

    .line 251
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$1108(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " IS CONNECTED"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 253
    :cond_3
    :goto_1
    return-void
.end method
