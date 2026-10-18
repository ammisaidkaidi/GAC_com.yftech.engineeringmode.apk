.class public Lcom/yftech/engineeringmode/fragment/USBTestFragment$USBStateForPhotoAndVideoEvent;
.super Ljava/lang/Object;
.source "USBTestFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/USBTestFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "USBStateForPhotoAndVideoEvent"
.end annotation


# instance fields
.field public isUsbExists:Z

.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

.field public usbIndex:I


# direct methods
.method public constructor <init>(Lcom/yftech/engineeringmode/fragment/USBTestFragment;IZ)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;
    .param p2, "usbIndex"    # I
    .param p3, "isUsbExists"    # Z

    .line 198
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$USBStateForPhotoAndVideoEvent;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 199
    iput p2, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$USBStateForPhotoAndVideoEvent;->usbIndex:I

    .line 200
    iput-boolean p3, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$USBStateForPhotoAndVideoEvent;->isUsbExists:Z

    .line 201
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 206
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "usbIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$USBStateForPhotoAndVideoEvent;->usbIndex:I

    .line 207
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 208
    const-string v1, ", isUsbExists="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$USBStateForPhotoAndVideoEvent;->isUsbExists:Z

    .line 209
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 206
    return-object v0
.end method
