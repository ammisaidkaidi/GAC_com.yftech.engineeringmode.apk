.class Lcom/yftech/engineeringmode/fragment/AdditionalFragment$4;
.super Lcom/yftech/vehicle/sdk/CarSwcManager$CarSwcListener;
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

    .line 83
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$4;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-direct {p0}, Lcom/yftech/vehicle/sdk/CarSwcManager$CarSwcListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onSwcAngleChanged(F)V
    .locals 2
    .param p1, "angle"    # F

    .line 86
    invoke-super {p0, p1}, Lcom/yftech/vehicle/sdk/CarSwcManager$CarSwcListener;->onSwcAngleChanged(F)V

    .line 87
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 88
    .local v0, "angleMessage":Landroid/os/Message;
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 89
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$4;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->access$300(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 90
    return-void
.end method
