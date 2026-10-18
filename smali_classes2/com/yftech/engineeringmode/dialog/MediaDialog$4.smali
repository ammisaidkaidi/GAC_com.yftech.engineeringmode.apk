.class Lcom/yftech/engineeringmode/dialog/MediaDialog$4;
.super Ljava/lang/Object;
.source "MediaDialog.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/dialog/MediaDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private max:I

.field private resourceId:I

.field final synthetic this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/dialog/MediaDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/dialog/MediaDialog;

    .line 258
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private switchImageResource(I)V
    .locals 5
    .param p1, "progress"    # I

    .line 288
    int-to-float v0, p1

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    iget v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->max:I

    int-to-float v2, v2

    div-float/2addr v0, v2

    .line 289
    .local v0, "percent":F
    const/4 v2, 0x0

    cmpl-float v2, v0, v2

    const/high16 v3, 0x41f00000    # 30.0f

    if-ltz v2, :cond_0

    cmpg-float v2, v0, v3

    if-gez v2, :cond_0

    iget v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->resourceId:I

    const v4, 0x7f080072

    if-eq v2, v4, :cond_0

    .line 290
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$1100(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 291
    iput v4, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->resourceId:I

    goto :goto_0

    .line 292
    :cond_0
    cmpl-float v2, v0, v3

    const/high16 v3, 0x42700000    # 60.0f

    if-ltz v2, :cond_1

    cmpg-float v2, v0, v3

    if-gez v2, :cond_1

    iget v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->resourceId:I

    const v4, 0x7f080073

    if-eq v2, v4, :cond_1

    .line 293
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$1100(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 294
    iput v4, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->resourceId:I

    goto :goto_0

    .line 295
    :cond_1
    cmpl-float v2, v0, v3

    if-ltz v2, :cond_2

    cmpg-float v1, v0, v1

    if-gez v1, :cond_2

    iget v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->resourceId:I

    const v2, 0x7f080074

    if-eq v1, v2, :cond_2

    .line 296
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$1100(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 297
    iput v2, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->resourceId:I

    .line 299
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .line 267
    invoke-direct {p0, p2}, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->switchImageResource(I)V

    .line 268
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .line 272
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->this$0:Lcom/yftech/engineeringmode/dialog/MediaDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->access$1000(Lcom/yftech/engineeringmode/dialog/MediaDialog;)Landroid/widget/SeekBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getMax()I

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->max:I

    .line 273
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 3
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .line 278
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog$4;->switchImageResource(I)V

    .line 280
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    .line 281
    .local v0, "progress":I
    invoke-static {}, Landroid/security/KeyStore;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x3

    invoke-static {v1, v2, v0}, Lcom/yftech/engineeringmode/util/AudioSettingUtil;->setStreamVolume(Landroid/content/Context;II)V

    .line 282
    return-void
.end method
