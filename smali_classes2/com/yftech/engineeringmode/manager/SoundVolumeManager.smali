.class public Lcom/yftech/engineeringmode/manager/SoundVolumeManager;
.super Ljava/lang/Object;
.source "SoundVolumeManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;
    }
.end annotation


# static fields
.field public static final STREAM_CALL:I = 0x6

.field public static final STREAM_MUSIC:I = 0x3

.field public static final STREAM_NAVI:I = 0xb

.field public static final STREAM_VOICE:I = 0x9

.field private static final TAG:Ljava/lang/String;

.field public static final VOLUME_CALL_MIN:I = 0x3

.field public static final VOLUME_MEDIA_MIN:I = 0x0

.field public static final VOLUME_NAVI_MIN:I = 0x0

.field public static final VOLUME_VOICE_MIN:I = 0x3

.field private static mSoundVolumeManager:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mCarAudioCallback:Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;

.field private mCarAudioCallbackHandler:Landroid/os/Handler;

.field private mContext:Landroid/content/Context;

.field private mIsRecoverCallVolume:Z

.field private mIsRecoverMediaVolume:Z

.field private mIsRecoverNaviVolume:Z

.field private mIsRecoverVoiceVolume:Z

.field private mSoundVolumeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-class v0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverMediaVolume:Z

    .line 32
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverCallVolume:Z

    .line 33
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverVoiceVolume:Z

    .line 34
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverNaviVolume:Z

    .line 37
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mCarAudioCallbackHandler:Landroid/os/Handler;

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mSoundVolumeListeners:Ljava/util/List;

    .line 64
    new-instance v0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager$1;-><init>(Lcom/yftech/engineeringmode/manager/SoundVolumeManager;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mCarAudioCallback:Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;

    .line 45
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 13
    sget-object v0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/manager/SoundVolumeManager;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    .line 13
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mSoundVolumeListeners:Ljava/util/List;

    return-object v0
.end method

.method public static declared-synchronized getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;
    .locals 2

    const-class v0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    monitor-enter v0

    .line 48
    :try_start_0
    sget-object v1, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mSoundVolumeManager:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    if-nez v1, :cond_0

    .line 49
    new-instance v1, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;-><init>()V

    sput-object v1, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mSoundVolumeManager:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    .line 51
    :cond_0
    sget-object v1, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mSoundVolumeManager:Lcom/yftech/engineeringmode/manager/SoundVolumeManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 47
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private setVolume(III)V
    .locals 3
    .param p1, "streamType"    # I
    .param p2, "value"    # I
    .param p3, "flags"    # I

    .line 167
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_0

    .line 168
    invoke-virtual {v0, p1, p2, p3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 169
    sget-object v0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setVolume, streamType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", value:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", flags:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    :cond_0
    return-void
.end method


# virtual methods
.method public addSoundVolumeListener(Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;

    .line 114
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mSoundVolumeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mSoundVolumeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    :cond_0
    return-void
.end method

.method public deInit()V
    .locals 2

    .line 61
    invoke-static {}, Lcom/yftech/car/audio/CarAudioManager;->getInstance()Lcom/yftech/car/audio/CarAudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mCarAudioCallback:Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/audio/CarAudioManager;->unregisterCarAudioCallback(Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;)V

    .line 62
    return-void
.end method

.method public getMaxVolume(I)I
    .locals 1
    .param p1, "streamType"    # I

    .line 156
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_0

    .line 157
    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    return v0

    .line 159
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getRecoverVolume(I)Z
    .locals 1
    .param p1, "streamType"    # I

    .line 194
    const/4 v0, 0x3

    if-eq p1, v0, :cond_3

    const/4 v0, 0x6

    if-eq p1, v0, :cond_2

    const/16 v0, 0x9

    if-eq p1, v0, :cond_1

    const/16 v0, 0xb

    if-eq p1, v0, :cond_0

    .line 204
    const/4 v0, 0x0

    return v0

    .line 202
    :cond_0
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverNaviVolume:Z

    return v0

    .line 200
    :cond_1
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverVoiceVolume:Z

    return v0

    .line 198
    :cond_2
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverCallVolume:Z

    return v0

    .line 196
    :cond_3
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverMediaVolume:Z

    return v0
.end method

.method public getVolume(I)I
    .locals 1
    .param p1, "streamType"    # I

    .line 144
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    return v0

    .line 147
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public init(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 55
    iput-object p1, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mContext:Landroid/content/Context;

    .line 56
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mAudioManager:Landroid/media/AudioManager;

    .line 57
    invoke-static {}, Lcom/yftech/car/audio/CarAudioManager;->getInstance()Lcom/yftech/car/audio/CarAudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mCarAudioCallback:Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;

    iget-object v2, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mCarAudioCallbackHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yftech/car/audio/CarAudioManager;->registerCarAudioCallback(Lcom/yftech/car/audio/CarAudioManager$CarAudioCallback;Landroid/os/Handler;)V

    .line 58
    return-void
.end method

.method public removeSoundVolumeListener(Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/yftech/engineeringmode/manager/SoundVolumeManager$SoundVolumeListener;

    .line 124
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mSoundVolumeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mSoundVolumeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 127
    :cond_0
    return-void
.end method

.method public setRecoverVolume(IZ)V
    .locals 3
    .param p1, "streamType"    # I
    .param p2, "isRecover"    # Z

    .line 174
    sget-object v0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setRecoverVolume, streamType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", isRecover:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    const/4 v0, 0x3

    if-eq p1, v0, :cond_3

    const/4 v0, 0x6

    if-eq p1, v0, :cond_2

    const/16 v0, 0x9

    if-eq p1, v0, :cond_1

    const/16 v0, 0xb

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 186
    :cond_0
    iput-boolean p2, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverNaviVolume:Z

    .line 187
    goto :goto_0

    .line 183
    :cond_1
    iput-boolean p2, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverVoiceVolume:Z

    .line 184
    goto :goto_0

    .line 180
    :cond_2
    iput-boolean p2, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverCallVolume:Z

    .line 181
    goto :goto_0

    .line 177
    :cond_3
    iput-boolean p2, p0, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->mIsRecoverMediaVolume:Z

    .line 178
    nop

    .line 191
    :goto_0
    return-void
.end method

.method public setVolume(II)V
    .locals 1
    .param p1, "streamType"    # I
    .param p2, "value"    # I

    .line 135
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->setVolume(III)V

    .line 136
    return-void
.end method

.method public slideVolume(II)V
    .locals 1
    .param p1, "streamType"    # I
    .param p2, "value"    # I

    .line 163
    const/high16 v0, 0x40000000    # 2.0f

    invoke-direct {p0, p1, p2, v0}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->setVolume(III)V

    .line 164
    return-void
.end method
