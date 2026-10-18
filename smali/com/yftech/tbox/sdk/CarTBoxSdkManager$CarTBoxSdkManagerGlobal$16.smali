.class Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$16;
.super Ljava/lang/Object;
.source "CarTBoxSdkManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->onActiveDisconnect(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

.field final synthetic val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

.field final synthetic val$state:I


# direct methods
.method constructor <init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    .line 1039
    iput-object p1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$16;->this$0:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    iput-object p2, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$16;->val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    iput p3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$16;->val$state:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1042
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$16;->val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    iget v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$16;->val$state:I

    invoke-virtual {v0, v1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;->onActiveDisconnect(I)V

    .line 1043
    return-void
.end method
