.class Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$5;
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

    .line 124
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 127
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 128
    return-void

    .line 130
    :cond_0
    const/4 v0, 0x0

    if-eqz p2, :cond_1

    .line 131
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$200(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 132
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_0

    .line 134
    :cond_1
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$200(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 136
    :goto_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$5;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->access$500(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)V

    .line 137
    return-void
.end method
