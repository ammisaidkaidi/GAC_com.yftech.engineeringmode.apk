.class Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;
.super Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;
.source "AdditionalFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/AdditionalFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    .line 93
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-direct {p0}, Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic lambda$onKeyboardBacklightChanged$0$AdditionalFragment$5(I)V
    .locals 1
    .param p1, "level"    # I

    .line 99
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->access$600(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getProgress()I

    move-result v0

    if-eq p1, v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->access$600(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    .line 102
    :cond_0
    return-void
.end method

.method public onKeyboardBacklightChanged(I)V
    .locals 3
    .param p1, "level"    # I

    .line 96
    invoke-super {p0, p1}, Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;->onKeyboardBacklightChanged(I)V

    .line 97
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->access$400()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onKeyboardBacklightChanged level:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->access$500(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/yftech/engineeringmode/fragment/-$$Lambda$AdditionalFragment$5$aWXju1J-g_3v3EEA5VXGiHRU4Xw;

    invoke-direct {v1, p0, p1}, Lcom/yftech/engineeringmode/fragment/-$$Lambda$AdditionalFragment$5$aWXju1J-g_3v3EEA5VXGiHRU4Xw;-><init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 103
    return-void
.end method
