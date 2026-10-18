.class Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$15;
.super Ljava/lang/Object;
.source "CarTBoxSdkManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->onDownloadLogState(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

.field final synthetic val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

.field final synthetic val$progress:I

.field final synthetic val$state:I


# direct methods
.method constructor <init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    .line 1022
    iput-object p1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$15;->this$0:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    iput-object p2, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$15;->val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    iput p3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$15;->val$state:I

    iput p4, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$15;->val$progress:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1025
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$15;->val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    iget v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$15;->val$state:I

    iget v2, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$15;->val$progress:I

    invoke-virtual {v0, v1, v2}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;->onDownloadLogState(II)V

    .line 1026
    return-void
.end method
