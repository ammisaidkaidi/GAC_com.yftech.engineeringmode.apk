.class Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$8;
.super Ljava/lang/Object;
.source "CarTBoxSdkManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->onFiveCodeInfo(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

.field final synthetic val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

.field final synthetic val$info:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    .line 903
    iput-object p1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$8;->this$0:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    iput-object p2, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$8;->val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    iput-object p3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$8;->val$info:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 906
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$8;->val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$8;->val$info:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;->onFiveCodeInfo(Ljava/lang/String;)V

    .line 907
    return-void
.end method
