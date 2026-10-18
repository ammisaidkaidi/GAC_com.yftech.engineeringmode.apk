.class Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$18;
.super Ljava/lang/Object;
.source "CarTBoxSdkManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;->onTimeZoneInfo(Ljava/lang/String;)V
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

    .line 1073
    iput-object p1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$18;->this$0:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal;

    iput-object p2, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$18;->val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    iput-object p3, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$18;->val$info:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1076
    iget-object v0, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$18;->val$callback:Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;

    iget-object v1, p0, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkManagerGlobal$18;->val$info:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;->onTimeZoneInfo(Ljava/lang/String;)V

    .line 1077
    return-void
.end method
