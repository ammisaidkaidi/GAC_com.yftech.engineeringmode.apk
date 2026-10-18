.class public final synthetic Lcom/yftech/engineeringmode/fragment/-$$Lambda$AdditionalFragment$5$aWXju1J-g_3v3EEA5VXGiHRU4Xw;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;

.field private final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/-$$Lambda$AdditionalFragment$5$aWXju1J-g_3v3EEA5VXGiHRU4Xw;->f$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;

    iput p2, p0, Lcom/yftech/engineeringmode/fragment/-$$Lambda$AdditionalFragment$5$aWXju1J-g_3v3EEA5VXGiHRU4Xw;->f$1:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/-$$Lambda$AdditionalFragment$5$aWXju1J-g_3v3EEA5VXGiHRU4Xw;->f$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;

    iget v1, p0, Lcom/yftech/engineeringmode/fragment/-$$Lambda$AdditionalFragment$5$aWXju1J-g_3v3EEA5VXGiHRU4Xw;->f$1:I

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;->lambda$onKeyboardBacklightChanged$0$AdditionalFragment$5(I)V

    return-void
.end method
