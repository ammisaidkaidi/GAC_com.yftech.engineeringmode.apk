.class Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$1;
.super Ljava/lang/Object;
.source "LoudSpeakerFragment.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    .line 61
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 3
    .param p1, "focusChange"    # I

    .line 64
    const/4 v0, -0x3

    if-eq p1, v0, :cond_3

    const/4 v0, -0x2

    if-eq p1, v0, :cond_3

    const/4 v0, -0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->access$000(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 78
    goto :goto_0

    .line 66
    :cond_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->access$000(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 67
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->access$000(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 69
    :cond_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->access$200(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->access$100(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/AudioFocusRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocusRequest(Landroid/media/AudioFocusRequest;)I

    move-result v0

    .line 70
    .local v0, "result":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onAudioFocusChange: AudioManager.AUDIOFOCUS_LOSS: abandonAudioFocusRequest: result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LoudSpeakerTest"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    goto :goto_0

    .line 74
    .end local v0    # "result":I
    :cond_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->access$000(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 75
    nop

    .line 81
    :goto_0
    return-void
.end method
