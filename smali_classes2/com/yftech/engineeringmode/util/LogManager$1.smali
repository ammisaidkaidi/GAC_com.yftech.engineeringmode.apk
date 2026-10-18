.class Lcom/yftech/engineeringmode/util/LogManager$1;
.super Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;
.source "LogManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/util/LogManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/util/LogManager;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/util/LogManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/util/LogManager;

    .line 24
    iput-object p1, p0, Lcom/yftech/engineeringmode/util/LogManager$1;->this$0:Lcom/yftech/engineeringmode/util/LogManager;

    invoke-direct {p0}, Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onUsbStatusChange(IZ)V
    .locals 2
    .param p1, "usbIndex"    # I
    .param p2, "isUsbExists"    # Z

    .line 27
    invoke-super {p0, p1, p2}, Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;->onUsbStatusChange(IZ)V

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onUsbStatusChange() isUsbExists:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " usbIndex:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " logDownloadUsbIndex:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yftech/engineeringmode/util/LogManager$1;->this$0:Lcom/yftech/engineeringmode/util/LogManager;

    invoke-static {v1}, Lcom/yftech/engineeringmode/util/LogManager;->access$000(Lcom/yftech/engineeringmode/util/LogManager;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LogManager"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/util/LogManager$1;->this$0:Lcom/yftech/engineeringmode/util/LogManager;

    invoke-static {v0}, Lcom/yftech/engineeringmode/util/LogManager;->access$000(Lcom/yftech/engineeringmode/util/LogManager;)I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 31
    iget-object v0, p0, Lcom/yftech/engineeringmode/util/LogManager$1;->this$0:Lcom/yftech/engineeringmode/util/LogManager;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/util/LogManager;->access$002(Lcom/yftech/engineeringmode/util/LogManager;I)I

    .line 38
    :cond_0
    return-void
.end method
