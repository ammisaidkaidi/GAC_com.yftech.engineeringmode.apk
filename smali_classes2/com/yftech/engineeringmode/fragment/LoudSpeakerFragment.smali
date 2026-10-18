.class public Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "LoudSpeakerFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final PATH:Ljava/lang/String; = "audio/loudspeaker_test.MP3"

.field private static final TAG:Ljava/lang/String; = "LoudSpeakerTest"


# instance fields
.field private audioAttributes:Landroid/media/AudioAttributes;

.field private audioFocusRequest:Landroid/media/AudioFocusRequest;

.field private btnFl:Landroid/widget/Button;

.field private btnFr:Landroid/widget/Button;

.field private btnPlay:Landroid/widget/Button;

.field private btnRl:Landroid/widget/Button;

.field private btnRr:Landroid/widget/Button;

.field private fileDescriptor:Landroid/content/res/AssetFileDescriptor;

.field private fl:F

.field private focusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field private fr:F

.field private mAudioManager:Landroid/media/AudioManager;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mSbLoudspeakerVolumeCall:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

.field private mSbLoudspeakerVolumeMedia:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

.field private mSbLoudspeakerVolumeNavi:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

.field private mSbLoudspeakerVolumeVoice:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

.field private rl:F

.field private rr:F

.field private tempFl:F

.field private tempFr:F

.field private tempRl:F

.field private tempRr:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fl:F

    .line 44
    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fr:F

    .line 45
    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rl:F

    .line 46
    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rr:F

    .line 48
    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempFl:F

    .line 49
    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempFr:F

    .line 50
    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempRl:F

    .line 51
    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempRr:F

    .line 61
    new-instance v0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->focusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/MediaPlayer;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    .line 28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/AudioFocusRequest;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    .line 28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->audioFocusRequest:Landroid/media/AudioFocusRequest;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)Landroid/media/AudioManager;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    .line 28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mAudioManager:Landroid/media/AudioManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    .line 28
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnClickAble()V

    return-void
.end method

.method private audioPlay()V
    .locals 7

    .line 293
    :try_start_0
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 294
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$2;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 304
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "audio/loudspeaker_test.MP3"

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fileDescriptor:Landroid/content/res/AssetFileDescriptor;

    .line 305
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fileDescriptor:Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fileDescriptor:Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v3

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fileDescriptor:Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v5

    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 306
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 311
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mAudioManager:Landroid/media/AudioManager;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->audioFocusRequest:Landroid/media/AudioFocusRequest;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioFocusRequest;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 312
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 320
    :cond_0
    goto :goto_0

    .line 315
    :catch_0
    move-exception v0

    .line 316
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 317
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnClickAble()V

    .line 318
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const-string v3, "\u627e\u4e0d\u5230\u97f3\u9891\u6587\u4ef6"

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 319
    const-string v1, "LoudSpeakerTest"

    const-string v2, "Audio file not found."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method private audioStop()V
    .locals 1

    .line 324
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 325
    return-void

    .line 327
    :cond_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 328
    return-void
.end method

.method private getLoudSpeakerBalance(F)F
    .locals 1
    .param p1, "value"    # F

    .line 368
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    .line 369
    invoke-static {}, Lcom/yftech/car/audio/CarSoundEffectManager;->getInstance()Lcom/yftech/car/audio/CarSoundEffectManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/audio/CarSoundEffectManager;->getBalanceMaxValue()F

    move-result p1

    goto :goto_0

    .line 371
    :cond_0
    const/4 p1, 0x0

    .line 373
    :goto_0
    return p1
.end method

.method private handleVolumeChanged(II)V
    .locals 2
    .param p1, "streamType"    # I
    .param p2, "progress"    # I

    .line 221
    const/4 v0, 0x0

    .line 222
    .local v0, "min":I
    const/4 v1, 0x3

    if-ne p1, v1, :cond_0

    .line 223
    const/4 v0, 0x0

    goto :goto_0

    .line 224
    :cond_0
    const/4 v1, 0x6

    if-ne p1, v1, :cond_1

    .line 225
    const/4 v0, 0x3

    goto :goto_0

    .line 226
    :cond_1
    const/16 v1, 0x9

    if-ne p1, v1, :cond_2

    .line 227
    const/4 v0, 0x3

    goto :goto_0

    .line 228
    :cond_2
    const/16 v1, 0xb

    if-ne p1, v1, :cond_3

    .line 229
    const/4 v0, 0x0

    .line 231
    :cond_3
    :goto_0
    if-ge p2, v0, :cond_4

    .line 232
    invoke-direct {p0, p1, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setVolumeProgress(II)V

    .line 233
    return-void

    .line 235
    :cond_4
    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->slideVolume(II)V

    .line 236
    return-void
.end method

.method private initData()V
    .locals 2

    .line 152
    invoke-static {}, Lcom/yftech/car/audio/CarSoundEffectManager;->getInstance()Lcom/yftech/car/audio/CarSoundEffectManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/audio/CarSoundEffectManager;->getBalanceValueFL()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempFl:F

    .line 153
    invoke-static {}, Lcom/yftech/car/audio/CarSoundEffectManager;->getInstance()Lcom/yftech/car/audio/CarSoundEffectManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/audio/CarSoundEffectManager;->getBalanceValueFR()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempFr:F

    .line 154
    invoke-static {}, Lcom/yftech/car/audio/CarSoundEffectManager;->getInstance()Lcom/yftech/car/audio/CarSoundEffectManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/audio/CarSoundEffectManager;->getBalanceValueRL()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempRl:F

    .line 155
    invoke-static {}, Lcom/yftech/car/audio/CarSoundEffectManager;->getInstance()Lcom/yftech/car/audio/CarSoundEffectManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/audio/CarSoundEffectManager;->getBalanceValueRR()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempRr:F

    .line 156
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->audioAttributes:Landroid/media/AudioAttributes;

    .line 157
    new-instance v0, Landroid/media/AudioFocusRequest$Builder;

    invoke-direct {v0, v1}, Landroid/media/AudioFocusRequest$Builder;-><init>(I)V

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->audioAttributes:Landroid/media/AudioAttributes;

    .line 158
    invoke-virtual {v0, v1}, Landroid/media/AudioFocusRequest$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->focusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 159
    invoke-virtual {v0, v1}, Landroid/media/AudioFocusRequest$Builder;->setOnAudioFocusChangeListener(Landroid/media/AudioManager$OnAudioFocusChangeListener;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object v0

    .line 160
    invoke-virtual {v0}, Landroid/media/AudioFocusRequest$Builder;->build()Landroid/media/AudioFocusRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->audioFocusRequest:Landroid/media/AudioFocusRequest;

    .line 161
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 3
    .param p1, "root"    # Landroid/view/View;

    .line 119
    const v0, 0x7f0900fd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeMedia:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    .line 120
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeMedia:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getMaxVolume(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setMax(I)V

    .line 121
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeMedia:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 123
    const v0, 0x7f0900ff

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeVoice:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    .line 124
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeVoice:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v1

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getMaxVolume(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setMax(I)V

    .line 125
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeVoice:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 127
    const v0, 0x7f0900fc

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeCall:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    .line 128
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeCall:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v1

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getMaxVolume(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setMax(I)V

    .line 129
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeCall:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 131
    const v0, 0x7f0900fe

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeNavi:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    .line 132
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeNavi:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v1

    const/16 v2, 0xb

    invoke-virtual {v1, v2}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getMaxVolume(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setMax(I)V

    .line 133
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeNavi:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 135
    const v0, 0x7f0900c7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFl:Landroid/widget/Button;

    .line 136
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFl:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    const v0, 0x7f0900c8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFr:Landroid/widget/Button;

    .line 139
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFr:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    const v0, 0x7f0900ca

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRl:Landroid/widget/Button;

    .line 142
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRl:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    const v0, 0x7f0900cb

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRr:Landroid/widget/Button;

    .line 145
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRr:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    const v0, 0x7f0900c9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnPlay:Landroid/widget/Button;

    .line 148
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnPlay:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    return-void
.end method

.method private setBtnBackgroundColor(Landroid/widget/Button;F)V
    .locals 2
    .param p1, "button"    # Landroid/widget/Button;
    .param p2, "value"    # F

    .line 382
    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    .line 383
    const/16 v0, 0xc5

    const/16 v1, 0xc3

    invoke-static {v1, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_0

    .line 385
    :cond_0
    const/high16 v0, -0x10000

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 387
    :goto_0
    return-void
.end method

.method private setBtnClickAble()V
    .locals 4

    .line 350
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFl:Landroid/widget/Button;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fl:F

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 351
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFl:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setClickable(Z)V

    .line 352
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFr:Landroid/widget/Button;

    iget v2, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fr:F

    invoke-direct {p0, v0, v2}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 353
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFr:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setClickable(Z)V

    .line 354
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRl:Landroid/widget/Button;

    iget v2, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rl:F

    invoke-direct {p0, v0, v2}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 355
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRl:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setClickable(Z)V

    .line 356
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRr:Landroid/widget/Button;

    iget v2, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rr:F

    invoke-direct {p0, v0, v2}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 357
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRr:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setClickable(Z)V

    .line 358
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnPlay:Landroid/widget/Button;

    const/16 v2, 0xc3

    const/16 v3, 0xc5

    invoke-static {v2, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 359
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnPlay:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setClickable(Z)V

    .line 360
    return-void
.end method

.method private setBtnClickDisable()V
    .locals 4

    .line 334
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFl:Landroid/widget/Button;

    const/16 v1, 0x80

    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 335
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFl:Landroid/widget/Button;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setClickable(Z)V

    .line 336
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFr:Landroid/widget/Button;

    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 337
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFr:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setClickable(Z)V

    .line 338
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRl:Landroid/widget/Button;

    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 339
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRl:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setClickable(Z)V

    .line 340
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRr:Landroid/widget/Button;

    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 341
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRr:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setClickable(Z)V

    .line 342
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnPlay:Landroid/widget/Button;

    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 343
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnPlay:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setClickable(Z)V

    .line 344
    return-void
.end method

.method private setVolumeProgress(II)V
    .locals 1
    .param p1, "streamType"    # I
    .param p2, "progress"    # I

    .line 239
    const/4 v0, 0x3

    if-eq p1, v0, :cond_3

    const/4 v0, 0x6

    if-eq p1, v0, :cond_2

    const/16 v0, 0x9

    if-eq p1, v0, :cond_1

    const/16 v0, 0xb

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 250
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeNavi:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p2}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    .line 251
    goto :goto_0

    .line 247
    :cond_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeVoice:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p2}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    .line 248
    goto :goto_0

    .line 244
    :cond_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeCall:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p2}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    .line 245
    goto :goto_0

    .line 241
    :cond_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeMedia:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p2}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    .line 242
    nop

    .line 255
    :goto_0
    return-void
.end method


# virtual methods
.method public onChangedVolume(IIIZI)V
    .locals 1
    .param p1, "streamType"    # I
    .param p2, "curValue"    # I
    .param p3, "tolValue"    # I
    .param p4, "mute"    # Z
    .param p5, "flag"    # I

    .line 214
    const/high16 v0, 0x40000000    # 2.0f

    and-int/2addr v0, p5

    if-lez v0, :cond_0

    .line 215
    return-void

    .line 217
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setVolumeProgress(II)V

    .line 218
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .line 260
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 274
    :pswitch_0
    iget v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rr:F

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->getLoudSpeakerBalance(F)F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rr:F

    .line 275
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRr:Landroid/widget/Button;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rr:F

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 276
    goto/16 :goto_0

    .line 270
    :pswitch_1
    iget v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rl:F

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->getLoudSpeakerBalance(F)F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rl:F

    .line 271
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRl:Landroid/widget/Button;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rl:F

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 272
    goto :goto_0

    .line 278
    :pswitch_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "fl:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fl:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " fr:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fr:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " rl:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rl:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " rr\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rr:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LoudSpeakerTest"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    invoke-static {}, Lcom/yftech/car/audio/CarSoundEffectManager;->getInstance()Lcom/yftech/car/audio/CarSoundEffectManager;

    move-result-object v0

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fl:F

    iget v2, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fr:F

    iget v3, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rl:F

    iget v4, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rr:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/yftech/car/audio/CarSoundEffectManager;->setBalance(FFFF)Z

    .line 280
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnClickDisable()V

    .line 281
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->audioPlay()V

    .line 282
    goto :goto_0

    .line 266
    :pswitch_3
    iget v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fr:F

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->getLoudSpeakerBalance(F)F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fr:F

    .line 267
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFr:Landroid/widget/Button;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fr:F

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 268
    goto :goto_0

    .line 262
    :pswitch_4
    iget v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fl:F

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->getLoudSpeakerBalance(F)F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fl:F

    .line 263
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFl:Landroid/widget/Button;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fl:F

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 264
    nop

    .line 286
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0900c7
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 85
    const v0, 0x7f0c0044

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 86
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->initView(Landroid/view/View;)V

    .line 87
    return-object v0
.end method

.method public onPause()V
    .locals 5

    .line 104
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onPause()V

    .line 105
    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->removeSoundVolumeListener(Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;)V

    .line 106
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->audioStop()V

    .line 107
    invoke-static {}, Lcom/yftech/car/audio/CarSoundEffectManager;->getInstance()Lcom/yftech/car/audio/CarSoundEffectManager;

    move-result-object v0

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempFl:F

    iget v2, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempFr:F

    iget v3, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempRl:F

    iget v4, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->tempRr:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/yftech/car/audio/CarSoundEffectManager;->setBalance(FFFF)Z

    .line 108
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFl:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 109
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnFr:Landroid/widget/Button;

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 110
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRl:Landroid/widget/Button;

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 111
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->btnRr:Landroid/widget/Button;

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setBtnBackgroundColor(Landroid/widget/Button;F)V

    .line 112
    iput v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fl:F

    .line 113
    iput v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->fr:F

    .line 114
    iput v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rl:F

    .line 115
    iput v1, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->rr:F

    .line 116
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .line 165
    if-nez p3, :cond_0

    .line 166
    return-void

    .line 168
    :cond_0
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 177
    :pswitch_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeVoice:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->isMoveOutside()Z

    move-result v0

    const/16 v1, 0x9

    if-eqz v0, :cond_1

    .line 178
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeVoice:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getMoveOutsideProgress()I

    move-result v0

    invoke-direct {p0, v1, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setVolumeProgress(II)V

    goto :goto_0

    .line 180
    :cond_1
    invoke-direct {p0, v1, p2}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->handleVolumeChanged(II)V

    .line 182
    goto :goto_0

    .line 191
    :pswitch_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeNavi:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->isMoveOutside()Z

    move-result v0

    const/16 v1, 0xb

    if-eqz v0, :cond_2

    .line 192
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeNavi:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getMoveOutsideProgress()I

    move-result v0

    invoke-direct {p0, v1, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setVolumeProgress(II)V

    goto :goto_0

    .line 194
    :cond_2
    invoke-direct {p0, v1, p2}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->handleVolumeChanged(II)V

    .line 196
    goto :goto_0

    .line 170
    :pswitch_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeMedia:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->isMoveOutside()Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_3

    .line 171
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeMedia:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getMoveOutsideProgress()I

    move-result v0

    invoke-direct {p0, v1, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setVolumeProgress(II)V

    goto :goto_0

    .line 173
    :cond_3
    invoke-direct {p0, v1, p2}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->handleVolumeChanged(II)V

    .line 175
    goto :goto_0

    .line 184
    :pswitch_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeCall:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->isMoveOutside()Z

    move-result v0

    const/4 v1, 0x6

    if-eqz v0, :cond_4

    .line 185
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mSbLoudspeakerVolumeCall:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getMoveOutsideProgress()I

    move-result v0

    invoke-direct {p0, v1, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setVolumeProgress(II)V

    goto :goto_0

    .line 187
    :cond_4
    invoke-direct {p0, v1, p2}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->handleVolumeChanged(II)V

    .line 189
    nop

    .line 200
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0900fc
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onResume()V
    .locals 2

    .line 92
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 93
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->initData()V

    .line 94
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->mAudioManager:Landroid/media/AudioManager;

    .line 95
    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getVolume(I)I

    move-result v0

    invoke-direct {p0, v1, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setVolumeProgress(II)V

    .line 96
    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v0

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getVolume(I)I

    move-result v0

    invoke-direct {p0, v1, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setVolumeProgress(II)V

    .line 97
    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v0

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getVolume(I)I

    move-result v0

    invoke-direct {p0, v1, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setVolumeProgress(II)V

    .line 98
    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v0

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getVolume(I)I

    move-result v0

    invoke-direct {p0, v1, v0}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;->setVolumeProgress(II)V

    .line 99
    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->addSoundVolumeListener(Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;)V

    .line 100
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .line 205
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .line 210
    return-void
.end method
