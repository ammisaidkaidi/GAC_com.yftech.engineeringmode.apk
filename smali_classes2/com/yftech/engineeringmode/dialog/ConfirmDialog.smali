.class public Lcom/yftech/engineeringmode/dialog/ConfirmDialog;
.super Landroid/app/Dialog;
.source "ConfirmDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;
    }
.end annotation


# instance fields
.field private btn_cancel:Landroid/widget/Button;

.field private btn_sure:Landroid/widget/Button;

.field private dialogButtonClickListener:Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;

.field private tvTipMessage:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 22
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 23
    return-void
.end method


# virtual methods
.method public synthetic lambda$onCreate$0$ConfirmDialog(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 55
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->dismiss()V

    .line 56
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->dialogButtonClickListener:Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;

    if-eqz v0, :cond_0

    .line 57
    invoke-interface {v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;->sureButtonClick()V

    .line 59
    :cond_0
    return-void
.end method

.method public synthetic lambda$onCreate$1$ConfirmDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 60
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->dismiss()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 46
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 47
    const v0, 0x7f0c002d

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->setContentView(I)V

    .line 48
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x807

    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 49
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->setCanceledOnTouchOutside(Z)V

    .line 50
    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->setCancelable(Z)V

    .line 52
    const v0, 0x7f09004c

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->btn_sure:Landroid/widget/Button;

    .line 53
    const v0, 0x7f09003d

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->btn_cancel:Landroid/widget/Button;

    .line 54
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->btn_sure:Landroid/widget/Button;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfirmDialog$6ph7k78A-nZ-CEz7Z0Yu2NDYY4Q;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfirmDialog$6ph7k78A-nZ-CEz7Z0Yu2NDYY4Q;-><init>(Lcom/yftech/engineeringmode/dialog/ConfirmDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->btn_cancel:Landroid/widget/Button;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfirmDialog$02Docu704MtvC9yJj7V3Ji0j5I0;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfirmDialog$02Docu704MtvC9yJj7V3Ji0j5I0;-><init>(Lcom/yftech/engineeringmode/dialog/ConfirmDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 37
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 38
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->tvTipMessage:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 39
    const v0, 0x7f09018c

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->tvTipMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    :cond_0
    return-void
.end method

.method public setOnButtonClickListener(Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;

    .line 64
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->dialogButtonClickListener:Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;

    .line 65
    return-void
.end method

.method public setTipMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 32
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->tvTipMessage:Ljava/lang/String;

    .line 33
    return-void
.end method
