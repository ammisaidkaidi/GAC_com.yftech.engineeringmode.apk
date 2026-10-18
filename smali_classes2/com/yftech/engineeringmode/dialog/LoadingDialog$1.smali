.class Lcom/yftech/engineeringmode/dialog/LoadingDialog$1;
.super Ljava/lang/Object;
.source "LoadingDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/dialog/LoadingDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/dialog/LoadingDialog;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/dialog/LoadingDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/dialog/LoadingDialog;

    .line 30
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/LoadingDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/LoadingDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/LoadingDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/LoadingDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/LoadingDialog;->dismiss()V

    .line 34
    return-void
.end method
