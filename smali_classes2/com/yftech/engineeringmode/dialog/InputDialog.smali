.class public Lcom/yftech/engineeringmode/dialog/InputDialog;
.super Landroid/app/Dialog;
.source "InputDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/dialog/InputDialog$Callback;
    }
.end annotation


# instance fields
.field private editText:Landroid/widget/EditText;

.field private mCallback:Lcom/yftech/engineeringmode/dialog/InputDialog$Callback;

.field private mToast:Landroid/widget/Toast;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 19
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->mCallback:Lcom/yftech/engineeringmode/dialog/InputDialog$Callback;

    .line 20
    return-void
.end method

.method private setEditTextRequestFocus(Landroid/widget/EditText;Z)V
    .locals 3
    .param p1, "editText"    # Landroid/widget/EditText;
    .param p2, "bFocus"    # Z

    .line 48
    if-nez p1, :cond_0

    .line 49
    return-void

    .line 51
    :cond_0
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 52
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    if-eqz p2, :cond_1

    .line 53
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 54
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 55
    invoke-virtual {p1}, Landroid/widget/EditText;->requestFocus()Z

    .line 56
    invoke-virtual {v0, p1, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto :goto_0

    .line 58
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 59
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 60
    invoke-virtual {p1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 62
    :goto_0
    return-void
.end method


# virtual methods
.method public synthetic lambda$onCreate$0$InputDialog(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 30
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->editText:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/dialog/InputDialog;->setEditTextRequestFocus(Landroid/widget/EditText;Z)V

    return-void
.end method

.method public synthetic lambda$onCreate$1$InputDialog(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 32
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 33
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->mCallback:Lcom/yftech/engineeringmode/dialog/InputDialog$Callback;

    if-eqz v1, :cond_0

    .line 34
    invoke-interface {v1, p1, v0}, Lcom/yftech/engineeringmode/dialog/InputDialog$Callback;->onSure(Landroid/view/View;Ljava/lang/String;)V

    .line 36
    :cond_0
    return-void
.end method

.method public synthetic lambda$onCreate$2$InputDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 37
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->dismiss()V

    return-void
.end method

.method public synthetic lambda$onCreate$3$InputDialog(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .line 39
    const/4 v0, 0x0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    const/16 v2, 0x42

    if-ne v1, v2, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_0

    .line 40
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->editText:Landroid/widget/EditText;

    invoke-direct {p0, v1, v0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->setEditTextRequestFocus(Landroid/widget/EditText;Z)V

    .line 41
    const/4 v0, 0x1

    return v0

    .line 43
    :cond_0
    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 24
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 25
    const v0, 0x7f0c0037

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->setContentView(I)V

    .line 26
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->setCanceledOnTouchOutside(Z)V

    .line 27
    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->setCancelable(Z)V

    .line 29
    const v0, 0x7f090073

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->editText:Landroid/widget/EditText;

    .line 30
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->editText:Landroid/widget/EditText;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$eHiQ4HfTWrbI08NgeMgQfpSLUR0;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$eHiQ4HfTWrbI08NgeMgQfpSLUR0;-><init>(Lcom/yftech/engineeringmode/dialog/InputDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    const v0, 0x7f09004c

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$xAvESScvtxMnVZPaEssrev7adF8;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$xAvESScvtxMnVZPaEssrev7adF8;-><init>(Lcom/yftech/engineeringmode/dialog/InputDialog;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    const v0, 0x7f09003d

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$Qocq47uAKVzvjlqq09Dxowcsy1g;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$Qocq47uAKVzvjlqq09Dxowcsy1g;-><init>(Lcom/yftech/engineeringmode/dialog/InputDialog;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->editText:Landroid/widget/EditText;

    new-instance v1, Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$u0GBr00EknZDBI4FvZHUcvm81Go;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$u0GBr00EknZDBI4FvZHUcvm81Go;-><init>(Lcom/yftech/engineeringmode/dialog/InputDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 45
    return-void
.end method

.method public setCallback(Lcom/yftech/engineeringmode/dialog/InputDialog$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/yftech/engineeringmode/dialog/InputDialog$Callback;

    .line 78
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->mCallback:Lcom/yftech/engineeringmode/dialog/InputDialog$Callback;

    .line 79
    return-void
.end method

.method public setHint(Ljava/lang/String;)V
    .locals 1
    .param p1, "hintText"    # Ljava/lang/String;

    .line 65
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 66
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 68
    :cond_0
    return-void
.end method

.method public showToast(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .line 70
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->mToast:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 71
    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 73
    :cond_0
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->mToast:Landroid/widget/Toast;

    .line 74
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/InputDialog;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 75
    return-void
.end method
