.class Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$2;
.super Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;
.source "FaultCodeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    .line 55
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-direct {p0}, Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFactoryModeErrorCodeChanged(Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;)V
    .locals 2
    .param p1, "code"    # Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    .line 58
    invoke-virtual {p1}, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FaultInfo"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget v0, p1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->dtc_index:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->dtc_state:I

    if-eq v0, v1, :cond_0

    .line 60
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    iget-object v0, v0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->errorCodeInfoList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 63
    :cond_0
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 64
    .local v0, "message":Landroid/os/Message;
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    iget-object v1, v1, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->errorCodeInfoList:Ljava/util/List;

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 65
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->access$500(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 67
    .end local v0    # "message":Landroid/os/Message;
    :goto_0
    return-void
.end method
