.class public Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;
.super Landroid/app/Dialog;
.source "FaultCodeDetailDialog.java"


# instance fields
.field private codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "code"    # Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    .line 18
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 19
    iput-object p2, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    .line 20
    return-void
.end method

.method private initView()V
    .locals 5

    .line 32
    const v0, 0x7f090092

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v1, v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->vehicleSpeed:I

    .line 33
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    const v0, 0x7f09008a

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v1, v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->motorSpeed:I

    .line 36
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    const v0, 0x7f09008d

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v1, v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->voltage:I

    .line 39
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    const v0, 0x7f09008c

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v1, v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->odoMeter:I

    .line 42
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v1, v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->year:I

    add-int/lit16 v1, v1, 0x7d0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v2, v2, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->month:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v1, v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->day:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v1, v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->hour:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v2, v2, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->minute:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v1, v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->sec:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 50
    .local v0, "faultTime":Ljava/lang/String;
    const v1, 0x7f090091

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 51
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    const v1, 0x7f090090

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->codeInfo:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    iget v3, v3, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->dtc_state:I

    .line 54
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "%X"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    const v1, 0x7f090030

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    new-instance v2, Lcom/yftech/engineeringmode/dialog/-$$Lambda$FaultCodeDetailDialog$QvCKcyoMAbZG9GztGQB6Ai1fboU;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$FaultCodeDetailDialog$QvCKcyoMAbZG9GztGQB6Ai1fboU;-><init>(Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    return-void
.end method


# virtual methods
.method public synthetic lambda$initView$0$FaultCodeDetailDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 56
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->dismiss()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 24
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 25
    const v0, 0x7f0c002f

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->setContentView(I)V

    .line 27
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->initView()V

    .line 28
    return-void
.end method
