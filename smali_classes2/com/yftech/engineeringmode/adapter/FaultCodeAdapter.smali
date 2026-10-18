.class public Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;
.super Landroid/widget/BaseAdapter;
.source "FaultCodeAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;,
        Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "FaultDetail"


# instance fields
.field private final context:Landroid/content/Context;

.field private faultMapping:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;

.field private final list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;",
            ">;)V"
        }
    .end annotation

    .line 31
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->context:Landroid/content/Context;

    .line 33
    iput-object p2, p0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->list:Ljava/util/List;

    .line 34
    return-void
.end method

.method private openDialog(Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;)V
    .locals 2
    .param p1, "codeInfo"    # Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    .line 80
    invoke-virtual {p1}, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FaultDetail"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    new-instance v0, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;

    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;-><init>(Landroid/content/Context;Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;)V

    .line 82
    .local v0, "detailDialog":Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/FaultCodeDetailDialog;->show()V

    .line 83
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "i"    # I

    .line 43
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "i"    # I

    .line 48
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "i"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "viewGroup"    # Landroid/view/ViewGroup;

    .line 54
    invoke-virtual {p0, p1}, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    .line 56
    .local v0, "codeInfo":Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;
    new-instance v1, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;-><init>()V

    iput-object v1, p0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->faultMapping:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;

    .line 57
    if-nez p2, :cond_0

    .line 58
    new-instance v1, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;-><init>()V

    .line 59
    .local v1, "viewHolder":Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;
    iget-object v2, p0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->context:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0c0054

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 60
    const v2, 0x7f090087

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;->faultCode:Landroid/widget/TextView;

    .line 61
    const v2, 0x7f09008b

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;->faultName:Landroid/widget/TextView;

    .line 62
    const v2, 0x7f090088

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, v1, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;->faultDetail:Landroid/widget/Button;

    .line 63
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 65
    .end local v1    # "viewHolder":Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;

    .line 68
    .restart local v1    # "viewHolder":Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;
    :goto_0
    iget-object v2, v1, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;->faultCode:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->faultMapping:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;

    iget-object v3, v3, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->indexAndCodeMap:Ljava/util/Map;

    iget v4, v0, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->dtc_index:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    iget-object v2, v1, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;->faultName:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->faultMapping:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;

    iget-object v3, v3, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->codeAndFaultMap:Ljava/util/Map;

    iget-object v4, p0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->faultMapping:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;

    iget-object v4, v4, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->indexAndCodeMap:Ljava/util/Map;

    iget v5, v0, Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;->dtc_index:I

    .line 70
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    .line 69
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    iget-object v2, v1, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;->faultDetail:Landroid/widget/Button;

    new-instance v3, Lcom/yftech/engineeringmode/adapter/-$$Lambda$FaultCodeAdapter$L43IGu69XGXmRcZ7gkSzFVgJLfI;

    invoke-direct {v3, p0, v0}, Lcom/yftech/engineeringmode/adapter/-$$Lambda$FaultCodeAdapter$L43IGu69XGXmRcZ7gkSzFVgJLfI;-><init>(Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    return-object p2
.end method

.method public synthetic lambda$getView$0$FaultCodeAdapter(Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;Landroid/view/View;)V
    .locals 0
    .param p1, "codeInfo"    # Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;
    .param p2, "viewList"    # Landroid/view/View;

    .line 71
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->openDialog(Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;)V

    return-void
.end method
