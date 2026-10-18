.class Lcom/yftech/engineeringmode/fragment/AdditionalFragment$3;
.super Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;
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

    .line 73
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-direct {p0}, Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onVehicleSpeedChanged(I)V
    .locals 2
    .param p1, "speed"    # I

    .line 76
    invoke-super {p0, p1}, Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;->onVehicleSpeedChanged(I)V

    .line 77
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 78
    .local v0, "speedMessage":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 79
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->access$200(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 80
    return-void
.end method
