.class Lcom/yftech/engineeringmode/fragment/ScreenFragment$1;
.super Lcom/yftech/car/screen/CarScreenManager$CarScreenCallback;
.source "ScreenFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/ScreenFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/ScreenFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/ScreenFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/ScreenFragment;

    .line 33
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ScreenFragment;

    invoke-direct {p0}, Lcom/yftech/car/screen/CarScreenManager$CarScreenCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onChangedScreenBrightness(ZI)V
    .locals 1
    .param p1, "open"    # Z
    .param p2, "brightness"    # I

    .line 36
    invoke-super {p0, p1, p2}, Lcom/yftech/car/screen/CarScreenManager$CarScreenCallback;->onChangedScreenBrightness(ZI)V

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ScreenFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->access$000(Lcom/yftech/engineeringmode/fragment/ScreenFragment;)Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getProgress()I

    move-result v0

    if-eq p2, v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/ScreenFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->access$000(Lcom/yftech/engineeringmode/fragment/ScreenFragment;)Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    .line 40
    :cond_0
    return-void
.end method
