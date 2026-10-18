.class public Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "ConfigReadAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field inputMethodManager:Landroid/view/inputmethod/InputMethodManager;

.field private mConfigModifyDialog:Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;

.field private mContext:Landroid/content/Context;

.field private mData:[B


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 28
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mContext:Landroid/content/Context;

    .line 30
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mContext:Landroid/content/Context;

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->inputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    .line 31
    return-void
.end method

.method private showConfigModifyDialog(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "pos"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "content"    # Ljava/lang/String;

    .line 100
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;

    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mConfigModifyDialog:Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;

    .line 101
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mConfigModifyDialog:Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;

    new-instance v1, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$uBQEBT-FcvuzhjlcdgGUT1JWStQ;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$uBQEBT-FcvuzhjlcdgGUT1JWStQ;-><init>(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 102
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mConfigModifyDialog:Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;

    new-instance v1, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$y9ivDAcg7FtOzkOgNqDltjQhW7w;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$y9ivDAcg7FtOzkOgNqDltjQhW7w;-><init>(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->setOnConfigModifyDialogListener(Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog$OnConfigModifyDialogListener;)V

    .line 106
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mConfigModifyDialog:Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->show()V

    .line 107
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mConfigModifyDialog:Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;

    invoke-virtual {v0, p1, p2, p3}, Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;->setView(ILjava/lang/String;Ljava/lang/String;)V

    .line 108
    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mData:[B

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mData:[B

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    array-length v0, v0

    :goto_0
    return v0
.end method

.method public synthetic lambda$onBindViewHolder$0$ConfigReadAdapter(ILcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;Landroid/view/View;)V
    .locals 2
    .param p1, "positon"    # I
    .param p2, "viewHolder"    # Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;
    .param p3, "v"    # Landroid/view/View;

    .line 62
    invoke-static {p2}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->access$000(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->access$100(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->showConfigModifyDialog(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public synthetic lambda$showConfigModifyDialog$1$ConfigReadAdapter(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mConfigModifyDialog:Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog;

    return-void
.end method

.method public synthetic lambda$showConfigModifyDialog$2$ConfigReadAdapter(IB)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "value"    # B

    .line 103
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mData:[B

    aput-byte p2, v0, p1

    .line 104
    invoke-virtual {p0, p1}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->notifyItemChanged(I)V

    .line 105
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 21
    check-cast p1, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->onBindViewHolder(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;I)V
    .locals 5
    .param p1, "viewHolder"    # Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;
    .param p2, "positon"    # I

    .line 57
    invoke-static {p1}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->access$000(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0xa

    if-ge p2, v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    const/16 v2, 0x8

    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 58
    invoke-static {p1}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->access$000(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mContext:Landroid/content/Context;

    const v4, 0x7f0e0058

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    invoke-static {p1}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->access$100(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mData:[B

    aget-byte v3, v3, p2

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    const-string v1, "%02x"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    invoke-static {}, Lcom/yftech/engineeringmode/util/Utils;->isSupportConfigSetting()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 61
    invoke-static {p1}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;->access$200(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$pT8wxNWuSEfUISmwRdYqn981Mqs;

    invoke-direct {v1, p0, p2, p1}, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$pT8wxNWuSEfUISmwRdYqn981Mqs;-><init>(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;ILcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    :cond_1
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;
    .locals 3
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;
    .param p2, "i"    # I

    .line 51
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c0052

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 52
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;-><init>(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;Landroid/view/View;)V

    return-object v1
.end method

.method public setData([B)V
    .locals 3
    .param p1, "data"    # [B

    .line 34
    if-eqz p1, :cond_1

    .line 35
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mData:[B

    if-eqz v0, :cond_0

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mData:[B

    .line 38
    :cond_0
    array-length v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mData:[B

    .line 39
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->mData:[B

    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->notifyDataSetChanged()V

    .line 42
    :cond_1
    return-void
.end method
