.class Lcom/yftech/engineeringmode/EngineeringModeActivity$2;
.super Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;
.source "EngineeringModeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/EngineeringModeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/EngineeringModeActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/EngineeringModeActivity;

    .line 303
    iput-object p1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$2;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-direct {p0}, Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFactoryModeUds31EngineerInfoChanged(Lcom/yftech/vehicle/internal/adapter/ICarMisc$EngineerMode;)V
    .locals 3
    .param p1, "mode"    # Lcom/yftech/vehicle/internal/adapter/ICarMisc$EngineerMode;

    .line 307
    invoke-super {p0, p1}, Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;->onFactoryModeUds31EngineerInfoChanged(Lcom/yftech/vehicle/internal/adapter/ICarMisc$EngineerMode;)V

    .line 308
    invoke-static {}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$200()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onFactoryModeUds31EngineerInfoChanged() mode:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    sget-object v0, Lcom/yftech/vehicle/internal/adapter/ICarMisc$EngineerMode;->RESULT:Lcom/yftech/vehicle/internal/adapter/ICarMisc$EngineerMode;

    if-ne p1, v0, :cond_0

    .line 310
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$2;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->finish()V

    .line 312
    :cond_0
    return-void
.end method
