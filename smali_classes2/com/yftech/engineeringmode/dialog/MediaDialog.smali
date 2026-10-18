.class public Lcom/yftech/engineeringmode/dialog/MediaDialog;
.super Landroid/app/Dialog;
.source "MediaDialog.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private audioCallback:Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;

.field private back:Landroid/widget/Button;

.field private currentValue:I

.field private durationVideo:I

.field private fileName:Landroid/widget/TextView;

.field private iv_control:Landroid/widget/ImageView;

.field private iv_next:Landroid/widget/ImageView;

.field private iv_volume:Landroid/widget/ImageView;

.field private mHandler:Landroid/os/Handler;

.field private mVideoPlayer:Lcom/yftech/car/media/video/VideoPlayer;

.field private mediaFile:Lcom/yftech/car/media/data/entity/MediaFile;

.field private musicControlCallback:Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;

.field private player:Lcom/yftech/car/media/video/VideoPlayer;

.field private progressMusic:I

.field private progressVideo:I

.field private sb_video:Landroid/widget/ProgressBar;

.field private sb_volume:Landroid/widget/SeekBar;

.field private timeIndex:Landroid/widget/TextView;

.field private timeTotal:Landroid/widget/TextView;

.field private usbIndex:I

.field videoCallback:Lcom/yftech/car/media/video/VideoPlayer$VideoCallback;

.field private videoFile:Lcom/yftech/car/media/data/entity/MediaFile;

.field private final volumeCallbackListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 39
    const-class v0, Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/yftech/car/media/data/entity/MediaFile;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mediaFile"    # Lcom/yftech/car/media/data/entity/MediaFile;
    .param p3, "usb"    # I

    .line 110
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 57
    new-instance v0, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog$1;-><init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mHandler:Landroid/os/Handler;

    .line 78
    new-instance v0, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog$2;-><init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->musicControlCallback:Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;

    .line 240
    new-instance v0, Lcom/yftech/engineeringmode/dialog/MediaDialog$3;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog$3;-><init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->audioCallback:Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;

    .line 258
    new-instance v0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;-><init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->volumeCallbackListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 304
    new-instance v0, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog$5;-><init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->videoCallback:Lcom/yftech/car/media/video/VideoPlayer$VideoCallback;

    .line 111
    iput-object p2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mediaFile:Lcom/yftech/car/media/data/entity/MediaFile;

    .line 112
    iput p3, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->usbIndex:I

    .line 113
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Lcom/yftech/car/media/data/entity/MediaFile;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mediaFile:Lcom/yftech/car/media/data/entity/MediaFile;

    return-object v0
.end method

.method static synthetic access$002(Lcom/yftech/engineeringmode/dialog/MediaDialog;Lcom/yftech/car/media/data/entity/MediaFile;)Lcom/yftech/car/media/data/entity/MediaFile;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;
    .param p1, "x1"    # Lcom/yftech/car/media/data/entity/MediaFile;

    .line 37
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mediaFile:Lcom/yftech/car/media/data/entity/MediaFile;

    return-object p1
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->timeTotal:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/SeekBar;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->sb_volume:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_volume:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/yftech/engineeringmode/dialog/MediaDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;
    .param p1, "x1"    # I

    .line 37
    iput p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->durationVideo:I

    return p1
.end method

.method static synthetic access$1300(Lcom/yftech/engineeringmode/dialog/MediaDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->progressVideo:I

    return v0
.end method

.method static synthetic access$1302(Lcom/yftech/engineeringmode/dialog/MediaDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;
    .param p1, "x1"    # I

    .line 37
    iput p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->progressVideo:I

    return p1
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/dialog/MediaDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->progressMusic:I

    return v0
.end method

.method static synthetic access$202(Lcom/yftech/engineeringmode/dialog/MediaDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;
    .param p1, "x1"    # I

    .line 37
    iput p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->progressMusic:I

    return p1
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->timeIndex:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Lcom/yftech/car/media/data/entity/MediaFile;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->videoFile:Lcom/yftech/car/media/data/entity/MediaFile;

    return-object v0
.end method

.method static synthetic access$402(Lcom/yftech/engineeringmode/dialog/MediaDialog;Lcom/yftech/car/media/data/entity/MediaFile;)Lcom/yftech/car/media/data/entity/MediaFile;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;
    .param p1, "x1"    # Lcom/yftech/car/media/data/entity/MediaFile;

    .line 37
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->videoFile:Lcom/yftech/car/media/data/entity/MediaFile;

    return-object p1
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->fileName:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$700(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->sb_video:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$802(Lcom/yftech/engineeringmode/dialog/MediaDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;
    .param p1, "x1"    # I

    .line 37
    iput p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->currentValue:I

    return p1
.end method

.method static synthetic access$900()Ljava/lang/String;
    .locals 1

    .line 37
    sget-object v0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private currentPlay()V
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mVideoPlayer:Lcom/yftech/car/media/video/VideoPlayer;

    invoke-virtual {v0}, Lcom/yftech/car/media/video/VideoPlayer;->getCurrentPlay()Lcom/yftech/car/media/data/entity/MediaFile;

    .line 229
    return-void
.end method

.method private initView(Lcom/yftech/car/media/data/entity/MediaFile;)V
    .locals 10
    .param p1, "playItem"    # Lcom/yftech/car/media/data/entity/MediaFile;

    .line 141
    const-class v0, Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mediaFile:Lcom/yftech/car/media/data/entity/MediaFile;

    invoke-virtual {v1}, Lcom/yftech/car/media/data/entity/MediaFile;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    const v0, 0x7f0900ed

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yftech/car/media/video/VideoPlayer;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mVideoPlayer:Lcom/yftech/car/media/video/VideoPlayer;

    .line 144
    const v0, 0x7f0900a8

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_control:Landroid/widget/ImageView;

    .line 145
    const v1, 0x7f0900aa

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_next:Landroid/widget/ImageView;

    .line 146
    const v2, 0x7f090103

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    iput-object v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->sb_video:Landroid/widget/ProgressBar;

    .line 147
    const v2, 0x7f090104

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/SeekBar;

    iput-object v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->sb_volume:Landroid/widget/SeekBar;

    .line 148
    const v2, 0x7f0900ac

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_volume:Landroid/widget/ImageView;

    .line 149
    const v2, 0x7f09018a

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->timeIndex:Landroid/widget/TextView;

    .line 150
    const v2, 0x7f09018b

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->timeTotal:Landroid/widget/TextView;

    .line 151
    const v2, 0x7f0900cf

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->fileName:Landroid/widget/TextView;

    .line 154
    invoke-static {}, Landroid/security/KeyStore;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x3

    invoke-static {v2, v3}, Lcom/yftech/engineeringmode/util/AudioSettingUtil;->getStreamMaxVolume(Landroid/content/Context;I)I

    move-result v2

    .line 155
    .local v2, "maxVolume":I
    invoke-static {}, Landroid/security/KeyStore;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/yftech/engineeringmode/util/AudioSettingUtil;->getStreamVolume(Landroid/content/Context;I)I

    move-result v3

    .line 158
    .local v3, "volume":I
    int-to-float v4, v3

    const/high16 v5, 0x42c80000    # 100.0f

    mul-float/2addr v4, v5

    int-to-float v6, v2

    div-float/2addr v4, v6

    .line 159
    .local v4, "percent":F
    const/4 v6, 0x0

    cmpl-float v7, v4, v6

    if-nez v7, :cond_0

    .line 160
    iget-object v5, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_volume:Landroid/widget/ImageView;

    const v6, 0x7f0d000e

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 161
    :cond_0
    cmpl-float v6, v4, v6

    const/high16 v7, 0x41f00000    # 30.0f

    if-ltz v6, :cond_1

    cmpg-float v6, v4, v7

    if-gez v6, :cond_1

    .line 162
    iget-object v5, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_volume:Landroid/widget/ImageView;

    const v6, 0x7f0d000f

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 163
    :cond_1
    cmpl-float v6, v4, v7

    const/high16 v7, 0x42700000    # 60.0f

    if-ltz v6, :cond_2

    cmpg-float v6, v4, v7

    if-gez v6, :cond_2

    .line 164
    iget-object v5, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_volume:Landroid/widget/ImageView;

    const v6, 0x7f0d0010

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 165
    :cond_2
    cmpl-float v6, v4, v7

    if-ltz v6, :cond_3

    cmpg-float v5, v4, v5

    if-gez v5, :cond_3

    .line 166
    iget-object v5, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_volume:Landroid/widget/ImageView;

    const v6, 0x7f0d0011

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 169
    :cond_3
    :goto_0
    iget-object v5, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->sb_volume:Landroid/widget/SeekBar;

    invoke-virtual {v5, v2}, Landroid/widget/SeekBar;->setMax(I)V

    .line 170
    iget-object v5, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->sb_volume:Landroid/widget/SeekBar;

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 171
    iget-object v5, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->sb_volume:Landroid/widget/SeekBar;

    iget-object v6, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->volumeCallbackListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 172
    iget-object v5, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mVideoPlayer:Lcom/yftech/car/media/video/VideoPlayer;

    iget-object v6, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->videoCallback:Lcom/yftech/car/media/video/VideoPlayer$VideoCallback;

    invoke-virtual {v5, v6}, Lcom/yftech/car/media/video/VideoPlayer;->setVideoCallback(Lcom/yftech/car/media/video/VideoPlayer$VideoCallback;)V

    .line 173
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 174
    .local v5, "message":Landroid/os/Message;
    iput-object p1, v5, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 175
    invoke-virtual {p1}, Lcom/yftech/car/media/data/entity/MediaFile;->getType()I

    move-result v6

    const/4 v7, 0x1

    if-nez v6, :cond_4

    .line 176
    invoke-static {}, Lcom/yftech/car/media/music/CarMusicManager;->getInstance()Lcom/yftech/car/media/music/CarMusicManager;

    move-result-object v6

    iget-object v8, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mediaFile:Lcom/yftech/car/media/data/entity/MediaFile;

    const/4 v9, 0x2

    invoke-virtual {v6, v8, v9}, Lcom/yftech/car/media/music/CarMusicManager;->start(Lcom/yftech/car/media/data/entity/MediaFile;I)Z

    .line 179
    iget-object v6, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_control:Landroid/widget/ImageView;

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 180
    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    new-instance v6, Lcom/yftech/engineeringmode/dialog/-$$Lambda$MediaDialog$Q17gyblLym_kjEIRtZL-cEy6POI;

    invoke-direct {v6, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$MediaDialog$Q17gyblLym_kjEIRtZL-cEy6POI;-><init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V

    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 181
    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$MediaDialog$vmQ0_sRuE2BQ99N5G_bkRV0jbLI;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$MediaDialog$vmQ0_sRuE2BQ99N5G_bkRV0jbLI;-><init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    sget-object v0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "title= "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mediaFile:Lcom/yftech/car/media/data/entity/MediaFile;

    invoke-virtual {v6}, Lcom/yftech/car/media/data/entity/MediaFile;->getFileName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 183
    :cond_4
    invoke-virtual {p1}, Lcom/yftech/car/media/data/entity/MediaFile;->getType()I

    move-result v6

    if-ne v6, v7, :cond_6

    .line 186
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v6

    iget v8, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->usbIndex:I

    invoke-virtual {v6, v8}, Lcom/yftech/car/media/data/CarMediaDataManager;->getFileVideo(I)Ljava/util/List;

    move-result-object v6

    .line 190
    .local v6, "videoList":Ljava/util/List;, "Ljava/util/List<Lcom/yftech/car/media/data/entity/MediaFile;>;"
    if-eqz v6, :cond_5

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_5

    .line 191
    iget-object v8, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mVideoPlayer:Lcom/yftech/car/media/video/VideoPlayer;

    iget v9, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->usbIndex:I

    invoke-virtual {v8, v6, v9, v7}, Lcom/yftech/car/media/video/VideoPlayer;->startPlayList(Ljava/util/List;IZ)Z

    .line 192
    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    new-instance v8, Lcom/yftech/engineeringmode/dialog/-$$Lambda$MediaDialog$zXN6ewPZ8R_6JTpOrCxzwMOPvSM;

    invoke-direct {v8, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$MediaDialog$zXN6ewPZ8R_6JTpOrCxzwMOPvSM;-><init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_control:Landroid/widget/ImageView;

    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 194
    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$MediaDialog$DxNSb5-FWIpwEz4rLoQs6MCi31o;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$MediaDialog$DxNSb5-FWIpwEz4rLoQs6MCi31o;-><init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 196
    .end local v6    # "videoList":Ljava/util/List;, "Ljava/util/List<Lcom/yftech/car/media/data/entity/MediaFile;>;"
    :cond_5
    goto :goto_1

    .line 197
    :cond_6
    const-string v0, "media.dialog"

    const-string v1, "not support this type"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    :goto_1
    const v0, 0x7f090030

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$MediaDialog$UEilW5f-RVeLCacc8AMfmPty_P8;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$MediaDialog$UEilW5f-RVeLCacc8AMfmPty_P8;-><init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    return-void
.end method

.method private next()V
    .locals 1

    .line 203
    invoke-static {}, Lcom/yftech/car/media/music/CarMusicManager;->getInstance()Lcom/yftech/car/media/music/CarMusicManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/music/CarMusicManager;->next()V

    .line 204
    return-void
.end method

.method private nextVideo()V
    .locals 2

    .line 216
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mVideoPlayer:Lcom/yftech/car/media/video/VideoPlayer;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/yftech/car/media/video/VideoPlayer;->setPlayState(I)Z

    .line 217
    return-void
.end method

.method private pause()V
    .locals 2

    .line 207
    invoke-static {}, Lcom/yftech/car/media/music/CarMusicManager;->getInstance()Lcom/yftech/car/media/music/CarMusicManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/music/CarMusicManager;->switchPlayPause()V

    .line 208
    invoke-static {}, Lcom/yftech/car/media/music/CarMusicManager;->getInstance()Lcom/yftech/car/media/music/CarMusicManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/music/CarMusicManager;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_control:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setSelected(Z)V

    goto :goto_0

    .line 211
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_control:Landroid/widget/ImageView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 213
    :goto_0
    return-void
.end method

.method private playAndPause()V
    .locals 2

    .line 220
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mVideoPlayer:Lcom/yftech/car/media/video/VideoPlayer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/yftech/car/media/video/VideoPlayer;->setPlayState(I)Z

    .line 221
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mVideoPlayer:Lcom/yftech/car/media/video/VideoPlayer;

    invoke-virtual {v0}, Lcom/yftech/car/media/video/VideoPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_control:Landroid/widget/ImageView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setSelected(Z)V

    goto :goto_0

    .line 224
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->iv_control:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 226
    :goto_0
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 233
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 234
    invoke-static {}, Lcom/yftech/car/media/music/CarMusicManager;->getInstance()Lcom/yftech/car/media/music/CarMusicManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/music/CarMusicManager;->stopPlaying()Z

    .line 235
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->musicControlCallback:Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;

    invoke-static {v0}, Lcom/yftech/car/media/music/CarMusicManager;->unregisterMusicControlCallback(Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;)V

    .line 237
    return-void
.end method

.method public synthetic lambda$initView$0$MediaDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 180
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->pause()V

    return-void
.end method

.method public synthetic lambda$initView$1$MediaDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 181
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->next()V

    return-void
.end method

.method public synthetic lambda$initView$2$MediaDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 192
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->playAndPause()V

    return-void
.end method

.method public synthetic lambda$initView$3$MediaDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 194
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->nextVideo()V

    return-void
.end method

.method public synthetic lambda$initView$4$MediaDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 199
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->dismiss()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 118
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 119
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->requestWindowFeature(I)Z

    .line 120
    const v0, 0x7f0c004e

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->setContentView(I)V

    .line 121
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->musicControlCallback:Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;

    invoke-static {v0}, Lcom/yftech/car/media/music/CarMusicManager;->registerMusicControlCallback(Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;)V

    .line 122
    invoke-static {}, Lcom/yftech/car/audio/CarAudioManager;->getInstance()Lcom/yftech/car/audio/CarAudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->audioCallback:Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/yftech/car/audio/CarAudioManager;->registerCarAudioCallback(Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;Landroid/os/Handler;)V

    .line 124
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 125
    .local v0, "window":Landroid/view/Window;
    if-eqz v0, :cond_0

    .line 126
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 127
    .local v1, "params":Landroid/view/WindowManager$LayoutParams;
    const/16 v2, 0x8

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 128
    const/16 v2, 0x11

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 129
    const/4 v2, -0x1

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 130
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 131
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 136
    .end local v1    # "params":Landroid/view/WindowManager$LayoutParams;
    :cond_0
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog;->mediaFile:Lcom/yftech/car/media/data/entity/MediaFile;

    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->initView(Lcom/yftech/car/media/data/entity/MediaFile;)V

    .line 137
    return-void
.end method
