.class Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$4;
.super Ljava/lang/Object;
.source "UpgradeCheckDialog.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 114
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$4;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 117
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 118
    return-void

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$4;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$500(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)V

    .line 121
    return-void
.end method
