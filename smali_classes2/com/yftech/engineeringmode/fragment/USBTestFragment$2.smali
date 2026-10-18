.class Lcom/yftech/engineeringmode/fragment/USBTestFragment$2;
.super Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;
.source "USBTestFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/USBTestFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 180
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-direct {p0}, Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onChangePlayMusic(Lcom/yftech/car/media/data/entity/MediaFile;)V
    .locals 3
    .param p1, "musicFile"    # Lcom/yftech/car/media/data/entity/MediaFile;

    .line 184
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$600(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "MUSIC_SOURCE_OF_USB1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->access$600(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "MUSIC_SOURCE_OF_USB2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    return-void

    .line 187
    :cond_0
    if-eqz p1, :cond_1

    .line 188
    invoke-virtual {p1}, Lcom/yftech/car/media/data/entity/MediaFile;->getData()Ljava/lang/String;

    move-result-object v0

    .line 189
    .local v0, "path":Ljava/lang/String;
    invoke-static {}, Lcom/yftech/car/media/music/CarMusicManager;->getInstance()Lcom/yftech/car/media/music/CarMusicManager;

    move-result-object v1

    const/16 v2, 0xe0

    invoke-virtual {v1, v0, v2, v2}, Lcom/yftech/car/media/music/CarMusicManager;->getMusicAlbumBitmap(Ljava/lang/String;II)Landroid/graphics/Bitmap;

    .line 191
    .end local v0    # "path":Ljava/lang/String;
    :cond_1
    return-void
.end method
