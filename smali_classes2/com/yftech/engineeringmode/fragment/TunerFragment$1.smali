.class Lcom/yftech/engineeringmode/fragment/TunerFragment$1;
.super Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;
.source "TunerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/TunerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/TunerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/TunerFragment;

    .line 97
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-direct {p0}, Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 0
    .param p1, "focusChange"    # I

    .line 133
    invoke-super {p0, p1}, Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;->onAudioFocusChange(I)V

    .line 134
    return-void
.end method

.method public onFreqChanage(ILcom/yftech/car/media/radio/entity/DataOfRadio;Lcom/yftech/car/media/radio/entity/DataOfRadio;)V
    .locals 4
    .param p1, "colorIndex"    # I
    .param p2, "newChannel"    # Lcom/yftech/car/media/radio/entity/DataOfRadio;
    .param p3, "oldChannel"    # Lcom/yftech/car/media/radio/entity/DataOfRadio;

    .line 121
    invoke-super {p0, p1, p2, p3}, Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;->onFreqChanage(ILcom/yftech/car/media/radio/entity/DataOfRadio;Lcom/yftech/car/media/radio/entity/DataOfRadio;)V

    .line 122
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-virtual {p2}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getType()I

    move-result v1

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->access$002(Lcom/yftech/engineeringmode/fragment/TunerFragment;I)I

    .line 124
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->access$000(Lcom/yftech/engineeringmode/fragment/TunerFragment;)I

    move-result v0

    if-nez v0, :cond_0

    .line 125
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->access$100(Lcom/yftech/engineeringmode/fragment/TunerFragment;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FM"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getFreq()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "MHz"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->access$100(Lcom/yftech/engineeringmode/fragment/TunerFragment;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AM"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getFreq()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "KHz"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    :goto_0
    return-void
.end method

.method public onFreqSignal(ILcom/yftech/car/media/radio/entity/DataOfRadio;I)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "channel"    # Lcom/yftech/car/media/radio/entity/DataOfRadio;
    .param p3, "level"    # I

    .line 100
    invoke-super {p0, p1, p2, p3}, Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;->onFreqSignal(ILcom/yftech/car/media/radio/entity/DataOfRadio;I)V

    .line 102
    invoke-virtual {p2}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getType()I

    move-result v0

    if-nez v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->access$100(Lcom/yftech/engineeringmode/fragment/TunerFragment;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FM"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getFreq()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "MHz"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->access$100(Lcom/yftech/engineeringmode/fragment/TunerFragment;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AM"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getFreq()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "KHz"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    :goto_0
    return-void
.end method

.method public onPlayPause(Z)V
    .locals 3
    .param p1, "isPlaying"    # Z

    .line 138
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->access$200(Lcom/yftech/engineeringmode/fragment/TunerFragment;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    if-eqz p1, :cond_0

    const v2, 0x7f0e00c2

    goto :goto_0

    :cond_0
    const v2, 0x7f0e00c3

    :goto_0
    invoke-virtual {v1, v2}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 139
    return-void
.end method

.method public onSeekStatusChange(III)V
    .locals 1
    .param p1, "scanType"    # I
    .param p2, "status"    # I
    .param p3, "operation"    # I

    .line 111
    invoke-super {p0, p1, p2, p3}, Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;->onSeekStatusChange(III)V

    .line 113
    if-nez p2, :cond_0

    const/4 v0, 0x1

    if-ne p3, v0, :cond_0

    .line 117
    :cond_0
    return-void
.end method
