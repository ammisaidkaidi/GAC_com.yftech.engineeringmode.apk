.class public Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;
.super Landroid/app/Dialog;
.source "AtcMetazoneInpuDialog.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private btn_cancel:Landroid/widget/Button;

.field private btn_sure:Landroid/widget/Button;

.field private dialogButtonClickListener:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;

.field private editValue:Landroid/widget/EditText;

.field private indexes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private isRead:Z

.field private layoutIndex:Landroid/widget/RelativeLayout;

.field private layoutValue:Landroid/widget/RelativeLayout;

.field private selectIndex:Ljava/lang/String;

.field private spIndex:Landroid/widget/Spinner;

.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    const-class v0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZLjava/util/List;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "isRead"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 42
    .local p3, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 43
    iput-boolean p2, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->isRead:Z

    .line 44
    iput-object p3, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->indexes:Ljava/util/List;

    .line 45
    return-void
.end method

.method private setEditTextRequestFocus(Landroid/widget/EditText;Z)V
    .locals 3
    .param p1, "editText"    # Landroid/widget/EditText;
    .param p2, "bFocus"    # Z

    .line 110
    if-nez p1, :cond_0

    .line 111
    return-void

    .line 113
    :cond_0
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 114
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    if-eqz p2, :cond_1

    .line 115
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 116
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 117
    invoke-virtual {p1}, Landroid/widget/EditText;->requestFocus()Z

    .line 118
    invoke-virtual {v0, p1, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto :goto_0

    .line 120
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 121
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 122
    invoke-virtual {p1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 124
    :goto_0
    return-void
.end method


# virtual methods
.method public synthetic lambda$onCreate$0$AtcMetazoneInpuDialog(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 77
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->isRead:Z

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->dialogButtonClickListener:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->selectIndex:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;->read(Ljava/lang/String;)V

    goto :goto_0

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->editValue:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->value:Ljava/lang/String;

    .line 81
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->dialogButtonClickListener:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->selectIndex:Ljava/lang/String;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->value:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;->write(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    :goto_0
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->dismiss()V

    .line 84
    return-void
.end method

.method public synthetic lambda$onCreate$1$AtcMetazoneInpuDialog(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 85
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->dismiss()V

    return-void
.end method

.method public synthetic lambda$onCreate$2$AtcMetazoneInpuDialog(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 87
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->editValue:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->setEditTextRequestFocus(Landroid/widget/EditText;Z)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 54
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 55
    const v0, 0x7f0c002b

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->setContentView(I)V

    .line 56
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->setCanceledOnTouchOutside(Z)V

    .line 57
    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->setCancelable(Z)V

    .line 59
    const v1, 0x7f09004c

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->btn_sure:Landroid/widget/Button;

    .line 60
    const v1, 0x7f09003d

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->btn_cancel:Landroid/widget/Button;

    .line 61
    const v1, 0x7f0900b2

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->layoutIndex:Landroid/widget/RelativeLayout;

    .line 62
    const v1, 0x7f0900bd

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->layoutValue:Landroid/widget/RelativeLayout;

    .line 64
    const v1, 0x7f090074

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->editValue:Landroid/widget/EditText;

    .line 65
    const v1, 0x7f090124

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->spIndex:Landroid/widget/Spinner;

    .line 66
    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->indexes:Ljava/util/List;

    const v4, 0x7f0c0064

    invoke-direct {v1, v2, v4, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 68
    .local v1, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v2, 0x7f0c0065

    invoke-virtual {v1, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 69
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->spIndex:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 70
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->spIndex:Landroid/widget/Spinner;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 71
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->spIndex:Landroid/widget/Spinner;

    invoke-virtual {v2, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 72
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->layoutValue:Landroid/widget/RelativeLayout;

    iget-boolean v3, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->isRead:Z

    if-eqz v3, :cond_0

    const/16 v3, 0x8

    goto :goto_0

    :cond_0
    move v3, v0

    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 74
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->indexes:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->selectIndex:Ljava/lang/String;

    .line 75
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->btn_sure:Landroid/widget/Button;

    new-instance v2, Lcom/yftech/engineeringmode/dialog/-$$Lambda$AtcMetazoneInpuDialog$0AoOH5a4KyU6UzBfjELObLJJihc;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$AtcMetazoneInpuDialog$0AoOH5a4KyU6UzBfjELObLJJihc;-><init>(Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->btn_cancel:Landroid/widget/Button;

    new-instance v2, Lcom/yftech/engineeringmode/dialog/-$$Lambda$AtcMetazoneInpuDialog$ACT736Ltq7JeujVLAQn6oiU-nXA;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$AtcMetazoneInpuDialog$ACT736Ltq7JeujVLAQn6oiU-nXA;-><init>(Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->editValue:Landroid/widget/EditText;

    new-instance v2, Lcom/yftech/engineeringmode/dialog/-$$Lambda$AtcMetazoneInpuDialog$Sh4znB3BDZOlpUOM9s84-CQ4Z4Q;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$AtcMetazoneInpuDialog$Sh4znB3BDZOlpUOM9s84-CQ4Z4Q;-><init>(Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    return-void
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 92
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getId()I

    move-result v0

    const v1, 0x7f090124

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->indexes:Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->selectIndex:Ljava/lang/String;

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onItemSelected selectIndex:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->selectIndex:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AtcMetazoneFragment"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    :goto_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 103
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public setEditIndex(Ljava/lang/String;)V
    .locals 0
    .param p1, "index"    # Ljava/lang/String;

    .line 128
    return-void
.end method

.method public setOnButtonClickListener(Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;

    .line 106
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->dialogButtonClickListener:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;

    .line 107
    return-void
.end method
