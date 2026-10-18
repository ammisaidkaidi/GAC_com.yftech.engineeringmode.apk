.class public final synthetic Lcom/yftech/engineeringmode/adapter/-$$Lambda$FaultCodeAdapter$L43IGu69XGXmRcZ7gkSzFVgJLfI;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final synthetic f$0:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

.field private final synthetic f$1:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$FaultCodeAdapter$L43IGu69XGXmRcZ7gkSzFVgJLfI;->f$0:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    iput-object p2, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$FaultCodeAdapter$L43IGu69XGXmRcZ7gkSzFVgJLfI;->f$1:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$FaultCodeAdapter$L43IGu69XGXmRcZ7gkSzFVgJLfI;->f$0:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$FaultCodeAdapter$L43IGu69XGXmRcZ7gkSzFVgJLfI;->f$1:Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;

    invoke-virtual {v0, v1, p1}, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;->lambda$getView$0$FaultCodeAdapter(Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;Landroid/view/View;)V

    return-void
.end method
