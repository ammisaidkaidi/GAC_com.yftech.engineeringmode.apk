.class Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$2;
.super Ljava/lang/Object;
.source "LoudSpeakerFragment.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->audioPlay()V
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

    .line 294
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 4
    .param p1, "mediaPlayer"    # Landroid/media/MediaPlayer;

    .line 297
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->access$300(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)V

    .line 299
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->access$200(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->access$100(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/AudioFocusRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocusRequest(Landroid/media/AudioFocusRequest;)I

    move-result v0

    .line 300
    .local v0, "result":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "abandonAudioFocusRequest: result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LoudSpeakerTest"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e008c

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 302
    return-void
.end method
