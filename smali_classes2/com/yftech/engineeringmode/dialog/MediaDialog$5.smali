.class Lcom/yftech/engineeringmode/dialog/MediaDialog$5;
.super Lcom/yftech/car/media/video/VideoPlayer$VideoCallback;
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

    .line 304
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-direct {p0}, Lcom/yftech/car/media/video/VideoPlayer$VideoCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onPlayChange(Lcom/yftech/car/media/data/entity/MediaFile;)V
    .locals 3
    .param p1, "musicFile"    # Lcom/yftech/car/media/data/entity/MediaFile;

    .line 308
    invoke-super {p0, p1}, Lcom/yftech/car/media/video/VideoPlayer$VideoCallback;->onPlayChange(Lcom/yftech/car/media/data/entity/MediaFile;)V

    .line 309
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0, p1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$402(Lcom/yftech/engineeringmode/dialog/MediaDialog;Lcom/yftech/car/media/data/entity/MediaFile;)Lcom/yftech/car/media/data/entity/MediaFile;

    .line 311
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$500(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$400(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Lcom/yftech/car/media/data/entity/MediaFile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/data/entity/MediaFile;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    invoke-static {}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$900()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getTitle "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v2}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$400(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Lcom/yftech/car/media/data/entity/MediaFile;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/car/media/data/entity/MediaFile;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$600(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 314
    return-void
.end method

.method public onPrepared(I)V
    .locals 3
    .param p1, "duration"    # I

    .line 318
    invoke-super {p0, p1}, Lcom/yftech/car/media/video/VideoPlayer$VideoCallback;->onPrepared(I)V

    .line 319
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0, p1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$1202(Lcom/yftech/engineeringmode/dialog/MediaDialog;I)I

    .line 322
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$100(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;

    move-result-object v0

    int-to-long v1, p1

    invoke-static {v1, v2}, Lcom/yftech/engineeringmode/util/Utils;->getTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 323
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$700(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 324
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$600(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 325
    return-void
.end method

.method public onProgress(I)V
    .locals 3
    .param p1, "progress"    # I

    .line 329
    invoke-super {p0, p1}, Lcom/yftech/car/media/video/VideoPlayer$VideoCallback;->onProgress(I)V

    .line 330
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0, p1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$1302(Lcom/yftech/engineeringmode/dialog/MediaDialog;I)I

    .line 332
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$300(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$1300(Lcom/yftech/engineeringmode/dialog/MediaDialog;)I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Lcom/yftech/engineeringmode/util/Utils;->getTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 333
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$700(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 334
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$600(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 335
    return-void
.end method
