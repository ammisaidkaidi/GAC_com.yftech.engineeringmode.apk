.class Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;
.super Ljava/lang/Object;
.source "ScreenTpTestDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
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

    .line 143
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 146
    invoke-static {}, Lcom/yftech/car/screen/CarScreenManager;->getInstance()Lcom/yftech/car/screen/CarScreenManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/screen/CarScreenManager;->getBrightness()I

    move-result v0

    .line 147
    .local v0, "brightness":I
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$800(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 148
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$1000(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v2

    neg-int v2, v2

    invoke-static {v1, v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$902(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;I)I

    .line 150
    :cond_0
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$1100(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 151
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$1000(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$902(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;I)I

    .line 153
    :cond_1
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$900(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v1

    add-int/2addr v1, v0

    .line 154
    .local v1, "value":I
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$800(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v2

    if-le v1, v2, :cond_2

    .line 155
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$800(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v1

    .line 157
    :cond_2
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$1100(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 158
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$1100(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v1

    .line 160
    :cond_3
    invoke-static {}, Lcom/yftech/car/screen/CarScreenManager;->getInstance()Lcom/yftech/car/screen/CarScreenManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/yftech/car/screen/CarScreenManager;->setBrightness(I)Z

    .line 161
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$1300(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$1200(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Ljava/lang/Runnable;

    move-result-object v3

    const-wide/16 v4, 0x64

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 162
    return-void
.end method
