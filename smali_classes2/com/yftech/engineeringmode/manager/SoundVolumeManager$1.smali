.class Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;
.super Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;
.source "SoundVolumeManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/manager/SoundVolumeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/manager/SoundVolumeManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    .line 64
    iput-object p1, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-direct {p0}, Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onChangedVolume(IIIZI)V
    .locals 8
    .param p1, "streamType"    # I
    .param p2, "curValue"    # I
    .param p3, "tolValue"    # I
    .param p4, "mute"    # Z
    .param p5, "flag"    # I

    .line 67
    invoke-super/range {p0 .. p5}, Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;->onChangedVolume(IIIZI)V

    .line 68
    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onChangedVolume streamType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", curValue:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", tolValue:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mute:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", flag:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    const/16 v0, 0xb

    const/16 v1, 0x9

    const/4 v2, 0x6

    const/4 v3, 0x3

    if-eq p1, v3, :cond_0

    if-eq p1, v2, :cond_0

    if-eq p1, v1, :cond_0

    if-ne p1, v0, :cond_6

    .line 74
    :cond_0
    const/4 v4, 0x0

    if-eq p1, v3, :cond_4

    if-eq p1, v2, :cond_3

    if-eq p1, v1, :cond_2

    if-eq p1, v0, :cond_1

    goto :goto_0

    .line 94
    :cond_1
    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-virtual {v1, v0}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getRecoverVolume(I)Z

    move-result v1

    if-eqz v1, :cond_5

    if-eqz p2, :cond_5

    .line 96
    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-virtual {v1, v0, v4}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->setRecoverVolume(IZ)V

    goto :goto_0

    .line 88
    :cond_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getRecoverVolume(I)Z

    move-result v0

    if-eqz v0, :cond_5

    if-eq p2, v3, :cond_5

    .line 90
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-virtual {v0, v1, v4}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->setRecoverVolume(IZ)V

    goto :goto_0

    .line 82
    :cond_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-virtual {v0, v2}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getRecoverVolume(I)Z

    move-result v0

    if-eqz v0, :cond_5

    if-eq p2, v3, :cond_5

    .line 84
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-virtual {v0, v2, v4}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->setRecoverVolume(IZ)V

    goto :goto_0

    .line 76
    :cond_4
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-virtual {v0, v3}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getRecoverVolume(I)Z

    move-result v0

    if-eqz v0, :cond_5

    if-eqz p2, :cond_5

    .line 78
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-virtual {v0, v3, v4}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->setRecoverVolume(IZ)V

    .line 102
    :cond_5
    :goto_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-static {v1}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->access$100(Lcom/yftech/engineeringmode/manager/SoundVolumeManager;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_6

    .line 103
    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-static {v1}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->access$100(Lcom/yftech/engineeringmode/manager/SoundVolumeManager;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-interface/range {v2 .. v7}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;->onChangedVolume(IIIZI)V

    .line 102
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 106
    .end local v0    # "i":I
    :cond_6
    return-void
.end method
