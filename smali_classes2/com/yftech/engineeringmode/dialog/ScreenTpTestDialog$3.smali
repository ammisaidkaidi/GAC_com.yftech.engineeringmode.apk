.class Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$3;
.super Ljava/lang/Object;
.source "ScreenTpTestDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 210
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$3;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 213
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$3;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->dismiss()V

    .line 214
    return-void
.end method
