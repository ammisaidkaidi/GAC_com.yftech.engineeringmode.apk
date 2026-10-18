.class Lcom/yftech/engineeringmode/dialog/MediaDialog$3;
.super Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;
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

    .line 240
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$3;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-direct {p0}, Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onChangedVolume(IIIZI)V
    .locals 3
    .param p1, "streamType"    # I
    .param p2, "curValue"    # I
    .param p3, "tolValue"    # I
    .param p4, "mute"    # Z
    .param p5, "flag"    # I

    .line 243
    invoke-super/range {p0 .. p5}, Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;->onChangedVolume(IIIZI)V

    .line 244
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$3;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0, p2}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$802(Lcom/yftech/engineeringmode/dialog/MediaDialog;I)I

    .line 246
    invoke-static {}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$900()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onChangedVolume: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    const/4 v0, 0x4

    if-ne p5, v0, :cond_0

    .line 249
    return-void

    .line 251
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$3;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$1000(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/SeekBar;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 252
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$3;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$1000(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/SeekBar;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 253
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$3;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$600(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 254
    return-void
.end method
