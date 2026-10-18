.class public Lcom/yftech/engineeringmode/adapter/USBFileAdapter;
.super Landroid/widget/BaseAdapter;
.source "USBFileAdapter.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final context:Landroid/content/Context;

.field private final inflater:Landroid/view/LayoutInflater;

.field private final mediaFileList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/car/media/data/entity/MediaFile;",
            ">;"
        }
    .end annotation
.end field

.field private final usbIndex:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    const-class v0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "usbIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/yftech/car/media/data/entity/MediaFile;",
            ">;I)V"
        }
    .end annotation

    .line 27
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/yftech/car/media/data/entity/MediaFile;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->context:Landroid/content/Context;

    .line 29
    iput-object p2, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->mediaFileList:Ljava/util/List;

    .line 30
    iput p3, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->usbIndex:I

    .line 31
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->inflater:Landroid/view/LayoutInflater;

    .line 32
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/adapter/USBFileAdapter;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    .line 19
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/adapter/USBFileAdapter;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    .line 19
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->mediaFileList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/adapter/USBFileAdapter;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    .line 19
    iget v0, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->usbIndex:I

    return v0
.end method

.method private openMedia(Lcom/yftech/car/media/data/entity/MediaFile;)V
    .locals 3
    .param p1, "mediaFile"    # Lcom/yftech/car/media/data/entity/MediaFile;

    .line 70
    new-instance v0, Lcom/yftech/engineeringmode/dialog/MediaDialog;

    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->context:Landroid/content/Context;

    iget v2, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->usbIndex:I

    invoke-direct {v0, v1, p1, v2}, Lcom/yftech/engineeringmode/dialog/MediaDialog;-><init>(Landroid/content/Context;Lcom/yftech/car/media/data/entity/MediaFile;I)V

    .line 71
    .local v0, "mediaDialog":Lcom/yftech/engineeringmode/dialog/MediaDialog;
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->show()V

    .line 73
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->mediaFileList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .line 42
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->mediaFileList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .line 47
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 54
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->inflater:Landroid/view/LayoutInflater;

    const v1, 0x7f0c0058

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 55
    const v0, 0x7f09019e

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 56
    .local v0, "media":Landroid/widget/TextView;
    new-instance v1, Lcom/yftech/engineeringmode/adapter/-$$Lambda$USBFileAdapter$5f1_THVxccH0ip1-mcOfkGMtIIo;

    invoke-direct {v1, p0, p1}, Lcom/yftech/engineeringmode/adapter/-$$Lambda$USBFileAdapter$5f1_THVxccH0ip1-mcOfkGMtIIo;-><init>(Lcom/yftech/engineeringmode/adapter/USBFileAdapter;I)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->mediaFileList:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yftech/car/media/data/entity/MediaFile;

    invoke-virtual {v1}, Lcom/yftech/car/media/data/entity/MediaFile;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    new-instance v1, Lcom/yftech/engineeringmode/adapter/USBFileAdapter$1;

    invoke-direct {v1, p0, p1}, Lcom/yftech/engineeringmode/adapter/USBFileAdapter$1;-><init>(Lcom/yftech/engineeringmode/adapter/USBFileAdapter;I)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    return-object p2
.end method

.method public synthetic lambda$getView$0$USBFileAdapter(ILandroid/view/View;)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "v"    # Landroid/view/View;

    .line 56
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->mediaFileList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yftech/car/media/data/entity/MediaFile;

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->openMedia(Lcom/yftech/car/media/data/entity/MediaFile;)V

    return-void
.end method
