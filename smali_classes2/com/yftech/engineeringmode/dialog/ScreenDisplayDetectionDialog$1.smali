.class Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;
.super Ljava/lang/Object;
.source "ScreenDisplayDetectionDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    .line 43
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 46
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->access$008(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)I

    .line 47
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->access$000(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)I

    move-result v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->access$100(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)[I

    move-result-object v1

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 48
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->access$002(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;I)I

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->access$100(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)[I

    move-result-object v1

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    invoke-static {v2}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->access$000(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)I

    move-result v2

    aget v1, v1, v2

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->access$200(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;I)V

    .line 51
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->access$400(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->access$300(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 52
    return-void
.end method
