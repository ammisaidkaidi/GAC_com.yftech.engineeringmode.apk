.class Lcom/yftech/engineeringmode/EngineeringModeActivity$3;
.super Ljava/lang/Object;
.source "EngineeringModeActivity.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/EngineeringModeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/EngineeringModeActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/EngineeringModeActivity;

    .line 319
    iput-object p1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$3;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 4
    .param p1, "message"    # Landroid/os/Message;

    .line 322
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 323
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$3;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$3;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-static {v3}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$400(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$302(Lcom/yftech/engineeringmode/EngineeringModeActivity;Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;)Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;

    .line 324
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$3;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-static {v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$300(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->show()V

    .line 325
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$3;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-static {v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$300(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;

    move-result-object v0

    new-instance v1, Lcom/yftech/engineeringmode/-$$Lambda$EngineeringModeActivity$3$5MDyn73EudZFB5IGgsur8DyafZg;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/-$$Lambda$EngineeringModeActivity$3$5MDyn73EudZFB5IGgsur8DyafZg;-><init>(Lcom/yftech/engineeringmode/EngineeringModeActivity$3;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 327
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public synthetic lambda$handleMessage$0$EngineeringModeActivity$3(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .line 325
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$3;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$302(Lcom/yftech/engineeringmode/EngineeringModeActivity;Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;)Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;

    return-void
.end method
