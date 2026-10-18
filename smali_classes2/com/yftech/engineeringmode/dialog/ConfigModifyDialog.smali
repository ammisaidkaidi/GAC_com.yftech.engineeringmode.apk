.class public Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;
.super Landroid/app/Dialog;
.source "ConfigModifyDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog$OnConfigModifyDialogListener;
    }
.end annotation


# instance fields
.field private btn_cancel:Landroid/widget/Button;

.field private btn_sure:Landroid/widget/Button;

.field private editText:Landroid/widget/EditText;

.field private mOnConfigModifyDialogListener:Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog$OnConfigModifyDialogListener;

.field private mPosition:I

.field private tv_title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 31
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 32
    return-void
.end method

.method private setEditTextRequestFocus(Landroid/widget/EditText;Z)V
    .locals 3
    .param p1, "editText"    # Landroid/widget/EditText;
    .param p2, "bFocus"    # Z

    .line 79
    if-nez p1, :cond_0

    .line 80
    return-void

    .line 82
    :cond_0
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 83
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    if-eqz p2, :cond_1

    .line 84
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 85
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 86
    invoke-virtual {p1}, Landroid/widget/EditText;->requestFocus()Z

    .line 87
    invoke-virtual {v0, p1, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto :goto_0

    .line 89
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 90
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 91
    invoke-virtual {p1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 93
    :goto_0
    return-void
.end method


# virtual methods
.method public synthetic lambda$onCreate$0$ConfigModifyDialog(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 60
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->editText:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->setEditTextRequestFocus(Landroid/widget/EditText;Z)V

    return-void
.end method

.method public synthetic lambda$onCreate$1$ConfigModifyDialog(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 62
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->dismiss()V

    .line 63
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->mOnConfigModifyDialogListener:Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog$OnConfigModifyDialogListener;

    if-eqz v0, :cond_0

    .line 64
    iget v1, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->mPosition:I

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->editText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    int-to-byte v2, v2

    invoke-interface {v0, v1, v2}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog$OnConfigModifyDialogListener;->onValue(IB)V

    .line 66
    :cond_0
    return-void
.end method

.method public synthetic lambda$onCreate$2$ConfigModifyDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 67
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->dismiss()V

    return-void
.end method

.method public synthetic lambda$onCreate$3$ConfigModifyDialog(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .line 69
    const/4 v0, 0x0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    const/16 v2, 0x42

    if-ne v1, v2, :cond_0

    .line 70
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_0

    .line 71
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->editText:Landroid/widget/EditText;

    invoke-direct {p0, v1, v0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->setEditTextRequestFocus(Landroid/widget/EditText;Z)V

    .line 72
    const/4 v0, 0x1

    return v0

    .line 74
    :cond_0
    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 50
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 51
    const v0, 0x7f0c002e

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->setContentView(I)V

    .line 52
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x807

    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 53
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->setCanceledOnTouchOutside(Z)V

    .line 54
    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->setCancelable(Z)V

    .line 56
    const v0, 0x7f09004c

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->btn_sure:Landroid/widget/Button;

    .line 57
    const v0, 0x7f09003d

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->btn_cancel:Landroid/widget/Button;

    .line 58
    const v0, 0x7f09018c

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->tv_title:Landroid/widget/TextView;

    .line 59
    const v0, 0x7f090073

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->editText:Landroid/widget/EditText;

    .line 60
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->editText:Landroid/widget/EditText;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfigModifyDialog$Z2SV1xgof-ZbLcPMLxMG024BPLE;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfigModifyDialog$Z2SV1xgof-ZbLcPMLxMG024BPLE;-><init>(Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->btn_sure:Landroid/widget/Button;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfigModifyDialog$cx7xxkOvhEKKywaadtK4i0a4d6I;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfigModifyDialog$cx7xxkOvhEKKywaadtK4i0a4d6I;-><init>(Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->btn_cancel:Landroid/widget/Button;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfigModifyDialog$DbdTZXNalNoobD7I5bZmbRJ6cPg;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfigModifyDialog$DbdTZXNalNoobD7I5bZmbRJ6cPg;-><init>(Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->editText:Landroid/widget/EditText;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfigModifyDialog$QtOQV9rv8-7IQQlJbrijuIVXK0E;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ConfigModifyDialog$QtOQV9rv8-7IQQlJbrijuIVXK0E;-><init>(Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 76
    return-void
.end method

.method public setOnConfigModifyDialogListener(Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog$OnConfigModifyDialogListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog$OnConfigModifyDialogListener;

    .line 35
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->mOnConfigModifyDialogListener:Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog$OnConfigModifyDialogListener;

    .line 36
    return-void
.end method

.method public setView(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .line 39
    iput p1, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->mPosition:I

    .line 40
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->tv_title:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 41
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    .line 44
    invoke-virtual {v0, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 46
    :cond_1
    return-void
.end method
