.class Lcom/yftech/engineeringmode/dialog/MediaDialog$2;
.super Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;
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

    .line 78
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-direct {p0}, Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onChangePlayMusic(Lcom/yftech/car/media/data/entity/MediaFile;)V
    .locals 2
    .param p1, "musicFile"    # Lcom/yftech/car/media/data/entity/MediaFile;

    .line 82
    invoke-super {p0, p1}, Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;->onChangePlayMusic(Lcom/yftech/car/media/data/entity/MediaFile;)V

    .line 83
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0, p1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$002(Lcom/yftech/engineeringmode/dialog/MediaDialog;Lcom/yftech/car/media/data/entity/MediaFile;)Lcom/yftech/car/media/data/entity/MediaFile;

    .line 85
    invoke-virtual {p1}, Lcom/yftech/car/media/data/entity/MediaFile;->getAlbum()Ljava/lang/String;

    .line 86
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$500(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$000(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Lcom/yftech/car/media/data/entity/MediaFile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/data/entity/MediaFile;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$600(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 88
    return-void
.end method

.method public onChangeProgress(I)V
    .locals 6
    .param p1, "progress"    # I

    .line 92
    invoke-super {p0, p1}, Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;->onChangeProgress(I)V

    .line 93
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0, p1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$202(Lcom/yftech/engineeringmode/dialog/MediaDialog;I)I

    .line 96
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$200(Lcom/yftech/engineeringmode/dialog/MediaDialog;)I

    move-result v0

    .line 97
    .local v0, "max":I
    int-to-float v1, p1

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float/2addr v1, v2

    int-to-float v3, v0

    div-float/2addr v1, v3

    .line 98
    .local v1, "progress_percent":F
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$200(Lcom/yftech/engineeringmode/dialog/MediaDialog;)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v1

    div-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 99
    .local v2, "posotionTime":I
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$700(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/ProgressBar;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 100
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$300(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;

    move-result-object v3

    int-to-long v4, p1

    invoke-static {v4, v5}, Lcom/yftech/engineeringmode/util/Utils;->getTime(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$700(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/ProgressBar;

    move-result-object v3

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v4}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$000(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Lcom/yftech/car/media/data/entity/MediaFile;

    move-result-object v4

    invoke-virtual {v4}, Lcom/yftech/car/media/data/entity/MediaFile;->getDuration()J

    move-result-wide v4

    long-to-int v4, v4

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 103
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$100(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;

    move-result-object v3

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v4}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$000(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Lcom/yftech/car/media/data/entity/MediaFile;

    move-result-object v4

    invoke-virtual {v4}, Lcom/yftech/car/media/data/entity/MediaFile;->getDuration()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/yftech/engineeringmode/util/Utils;->getTime(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$600(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/os/Handler;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 106
    return-void
.end method
