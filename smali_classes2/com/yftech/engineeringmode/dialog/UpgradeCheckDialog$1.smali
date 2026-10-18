.class Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;
.super Ljava/lang/Object;
.source "UpgradeCheckDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 81
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .line 84
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$000(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$100(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$200(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    .line 85
    return-void

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->dismiss()V

    .line 88
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 89
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$000(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$100(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$200(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v4}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;->onUpgrade(ZZZZ)V

    .line 91
    :cond_1
    return-void
.end method
