.class Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;
.super Ljava/lang/Object;
.source "CarTBoxSdkManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->onBaseStationInfo(ILjava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

.field final synthetic val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

.field final synthetic val$cell:I

.field final synthetic val$networkType:I

.field final synthetic val$operator:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;ILjava/lang/String;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    .line 920
    iput-object p1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;->this$0:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    iput-object p2, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;->val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    iput p3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;->val$networkType:I

    iput-object p4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;->val$operator:Ljava/lang/String;

    iput p5, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;->val$cell:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 923
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;->val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    iget v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;->val$networkType:I

    iget-object v2, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;->val$operator:Ljava/lang/String;

    iget v3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$9;->val$cell:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;->onBaseStationInfo(ILjava/lang/String;I)V

    .line 924
    return-void
.end method
