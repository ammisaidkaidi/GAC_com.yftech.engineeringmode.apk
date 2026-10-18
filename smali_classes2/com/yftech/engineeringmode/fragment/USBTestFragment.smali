.class public Lcom/yftech/engineeringmode/fragment/USBTestFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "USBTestFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/fragment/USBTestFragment$USBStateForPhotoAndVideoEvent;,
        Lcom/yftech/engineeringmode/fragment/USBTestFragment$UsbInfomationReceiveer;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private adapter:Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

.field private final callback:Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;

.field private changeCallback:Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;

.field private index:I

.field private musicList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/car/media/data/entity/MediaFile;",
            ">;"
        }
    .end annotation
.end field

.field private musicListview:Landroid/widget/ListView;

.field private music_source:Ljava/lang/String;

.field private selectingTextview:Landroid/widget/TextView;

.field private updateListViewHandler:Landroid/os/Handler;

.field private usb:I

.field private usbState:Z

.field private usb_1:Landroid/view/View;

.field private usb_2:Landroid/view/View;

.field private videoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/car/media/data/entity/MediaFile;",
            ">;"
        }
    .end annotation
.end field

.field private videoListView:Landroid/widget/ListView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 213
    const-class v0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 51
    new-instance v0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->updateListViewHandler:Landroid/os/Handler;

    .line 180
    new-instance v0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$2;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->callback:Lcom/yftech/car/media/music/CarMusicManager$CarMusicControlCallback;

    .line 214
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->musicList:Ljava/util/List;

    .line 215
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->videoList:Ljava/util/List;

    .line 220
    new-instance v0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment$3;-><init>(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->changeCallback:Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Lcom/yftech/engineeringmode/adapter/USBFileAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->adapter:Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    return-object v0
.end method

.method static synthetic access$002(Lcom/yftech/engineeringmode/fragment/USBTestFragment;Lcom/yftech/engineeringmode/adapter/USBFileAdapter;)Lcom/yftech/engineeringmode/adapter/USBFileAdapter;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;
    .param p1, "x1"    # Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    .line 42
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->adapter:Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    return-object p1
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->musicList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_2:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/yftech/engineeringmode/fragment/USBTestFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;
    .param p1, "x1"    # I

    .line 42
    iput p1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->index:I

    return p1
.end method

.method static synthetic access$1108(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)I
    .locals 2
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    iget v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->index:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->index:I

    return v0
.end method

.method static synthetic access$1200(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->clearListView()V

    return-void
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    iget v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb:I

    return v0
.end method

.method static synthetic access$202(Lcom/yftech/engineeringmode/fragment/USBTestFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;
    .param p1, "x1"    # I

    .line 42
    iput p1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb:I

    return p1
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->musicListview:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->videoList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->videoListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->music_source:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$702(Lcom/yftech/engineeringmode/fragment/USBTestFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;
    .param p1, "x1"    # Z

    .line 42
    iput-boolean p1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usbState:Z

    return p1
.end method

.method static synthetic access$800()Ljava/lang/String;
    .locals 1

    .line 42
    sget-object v0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 42
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_1:Landroid/view/View;

    return-object v0
.end method

.method private clearListView()V
    .locals 2

    .line 275
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->musicList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 276
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->videoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 277
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->musicListview:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->adapter:Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 278
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->videoListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->adapter:Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 279
    return-void
.end method

.method private getMusic()V
    .locals 4

    .line 258
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v0

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb:I

    invoke-virtual {v0, v1}, Lcom/yftech/car/media/data/CarMediaDataManager;->getFileMusic(I)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->musicList:Ljava/util/List;

    .line 259
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->musicList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yftech/car/media/data/entity/MediaFile;

    .line 260
    .local v1, "mediaFile":Lcom/yftech/car/media/data/entity/MediaFile;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Lcom/yftech/car/media/data/entity/MediaFile;->getFileName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 261
    .end local v1    # "mediaFile":Lcom/yftech/car/media/data/entity/MediaFile;
    goto :goto_0

    .line 262
    :cond_0
    return-void
.end method

.method private getVideo()V
    .locals 4

    .line 265
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v0

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb:I

    invoke-virtual {v0, v1}, Lcom/yftech/car/media/data/CarMediaDataManager;->getFileVideo(I)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->videoList:Ljava/util/List;

    .line 266
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->videoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yftech/car/media/data/entity/MediaFile;

    .line 267
    .local v1, "mediaFile":Lcom/yftech/car/media/data/entity/MediaFile;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Lcom/yftech/car/media/data/entity/MediaFile;->getFileName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 268
    .end local v1    # "mediaFile":Lcom/yftech/car/media/data/entity/MediaFile;
    goto :goto_0

    .line 269
    :cond_0
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 7
    .param p1, "root"    # Landroid/view/View;

    .line 125
    const v0, 0x7f0901a2

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    const v1, 0x7f0901a3

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    const v2, 0x7f0900c5

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->musicListview:Landroid/widget/ListView;

    .line 128
    const v2, 0x7f0900c6

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->videoListView:Landroid/widget/ListView;

    .line 129
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_1:Landroid/view/View;

    .line 130
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_2:Landroid/view/View;

    .line 132
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/data/CarMediaDataManager;->getExistUdiskList()Ljava/util/List;

    move-result-object v0

    .line 133
    .local v0, "parms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 134
    .local v2, "o":Ljava/lang/String;
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v5

    invoke-virtual {v5, v2}, Lcom/yftech/car/media/data/CarMediaDataManager;->getUsbIndex(Ljava/lang/String;)I

    move-result v5

    .line 136
    .local v5, "i":I
    if-nez v5, :cond_0

    .line 137
    iget-object v6, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_1:Landroid/view/View;

    invoke-virtual {v6, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 138
    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_2:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_1

    .line 139
    :cond_0
    if-ne v5, v4, :cond_1

    .line 140
    iget-object v6, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_2:Landroid/view/View;

    invoke-virtual {v6, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 141
    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_1:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_1

    .line 142
    :cond_1
    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    if-ne v5, v6, :cond_2

    .line 143
    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_1:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 144
    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_2:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_1

    .line 146
    :cond_2
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_1:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 147
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_2:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 149
    :goto_1
    iput v5, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb:I

    .line 150
    .end local v2    # "o":Ljava/lang/String;
    .end local v5    # "i":I
    goto :goto_0

    .line 152
    :cond_3
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v1

    iget v2, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb:I

    invoke-virtual {v1, v2}, Lcom/yftech/car/media/data/CarMediaDataManager;->isUsbExists(I)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 153
    iget v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb:I

    if-nez v1, :cond_4

    .line 154
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_1:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_2

    .line 155
    :cond_4
    if-ne v1, v4, :cond_5

    .line 156
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_2:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_2

    .line 158
    :cond_5
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_1:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 159
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->usb_2:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 162
    :cond_6
    :goto_2
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 168
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 171
    :pswitch_0
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->getMusic()V

    .line 172
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->getVideo()V

    .line 173
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->updateListViewHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 174
    nop

    .line 177
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0901a2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 89
    invoke-super {p0, p1}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    .line 90
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 118
    const/4 v0, 0x0

    const v1, 0x7f0c004c

    invoke-virtual {p1, v1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 119
    .local v1, "root":Landroid/view/View;
    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->initView(Landroid/view/View;)V

    .line 120
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/yftech/car/media/data/CarMediaDataManager;->isUsbExists(I)Z

    .line 121
    return-object v1
.end method

.method public onPause()V
    .locals 2

    .line 111
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->changeCallback:Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/media/data/CarMediaDataManager;->unregisterCarDataControlCallback(Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;)V

    .line 112
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onPause()V

    .line 113
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 95
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->changeCallback:Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/media/data/CarMediaDataManager;->registerCarDataControlCallback(Lcom/yftech/car/media/data/CarMediaDataManager$OnDataChangeCallback;)V

    .line 96
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 98
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->music_source:Ljava/lang/String;

    const-string v1, "MUSIC_SOURCE_OF_USB1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment;->music_source:Ljava/lang/String;

    const-string v1, "MUSIC_SOURCE_OF_USB2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 100
    :cond_0
    invoke-static {}, Lcom/yftech/car/media/music/CarMusicManager;->getInstance()Lcom/yftech/car/media/music/CarMusicManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/music/CarMusicManager;->getPlayMusic()Lcom/yftech/car/media/data/entity/MediaFile;

    move-result-object v0

    .line 101
    .local v0, "playMusic":Lcom/yftech/car/media/data/entity/MediaFile;
    invoke-static {}, Lcom/yftech/car/media/music/CarMusicManager;->getInstance()Lcom/yftech/car/media/music/CarMusicManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/music/CarMusicManager;->getCurrentPlayProgress()I

    move-result v1

    .line 103
    .local v1, "playProgress":I
    invoke-static {}, Lcom/yftech/car/media/music/CarMusicManager;->getInstance()Lcom/yftech/car/media/music/CarMusicManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/car/media/music/CarMusicManager;->play()V

    .line 104
    invoke-static {}, Lcom/yftech/car/media/music/CarMusicManager;->getInstance()Lcom/yftech/car/media/music/CarMusicManager;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/yftech/car/media/music/CarMusicManager;->requestPlay(Z)Z

    .line 106
    .end local v0    # "playMusic":Lcom/yftech/car/media/data/entity/MediaFile;
    .end local v1    # "playProgress":I
    :cond_1
    return-void
.end method
