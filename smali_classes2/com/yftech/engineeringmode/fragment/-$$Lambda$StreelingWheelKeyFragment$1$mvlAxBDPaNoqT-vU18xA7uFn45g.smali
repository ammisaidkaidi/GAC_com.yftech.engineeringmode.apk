.class public final synthetic Lcom/yftech/engineeringmode/fragment/-$$Lambda$StreelingWheelKeyFragment$1$mvlAxBDPaNoqT-vU18xA7uFn45g;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;


# direct methods
.method public synthetic constructor <init>(Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/-$$Lambda$StreelingWheelKeyFragment$1$mvlAxBDPaNoqT-vU18xA7uFn45g;->f$0:Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/-$$Lambda$StreelingWheelKeyFragment$1$mvlAxBDPaNoqT-vU18xA7uFn45g;->f$0:Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->lambda$onSteeringWheelKeyEvent$0(Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;)V

    return-void
.end method
