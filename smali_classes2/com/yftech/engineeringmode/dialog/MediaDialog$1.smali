.class Lcom/yftech/engineeringmode/dialog/MediaDialog$1;
.super Landroid/os/Handler;
.source "MediaDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/dialog/MediaDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 58
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .line 63
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 66
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$100(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$000(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Lcom/yftech/car/media/data/entity/MediaFile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/data/entity/MediaFile;->getDuration()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/yftech/engineeringmode/util/Utils;->getTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$300(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$200(Lcom/yftech/engineeringmode/dialog/MediaDialog;)I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Lcom/yftech/engineeringmode/util/Utils;->getTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 69
    :cond_0
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 71
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$100(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$400(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Lcom/yftech/car/media/data/entity/MediaFile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/data/entity/MediaFile;->getDuration()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/yftech/engineeringmode/util/Utils;->getTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$300(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$400(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Lcom/yftech/car/media/data/entity/MediaFile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/data/entity/MediaFile;->getCurrentTime()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Lcom/yftech/engineeringmode/util/Utils;->getTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    :cond_1
    :goto_0
    return-void
.end method
