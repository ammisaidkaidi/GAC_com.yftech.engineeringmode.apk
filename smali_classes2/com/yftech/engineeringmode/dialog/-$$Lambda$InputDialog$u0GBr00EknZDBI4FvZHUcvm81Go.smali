.class public final synthetic Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$u0GBr00EknZDBI4FvZHUcvm81Go;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field private final synthetic f$0:Lcom/yftech/engineeringmode/dialog/InputDialog;


# direct methods
.method public synthetic constructor <init>(Lcom/yftech/engineeringmode/dialog/InputDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$u0GBr00EknZDBI4FvZHUcvm81Go;->f$0:Lcom/yftech/engineeringmode/dialog/InputDialog;

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/-$$Lambda$InputDialog$u0GBr00EknZDBI4FvZHUcvm81Go;->f$0:Lcom/yftech/engineeringmode/dialog/InputDialog;

    invoke-virtual {v0, p1, p2, p3}, Lcom/yftech/engineeringmode/dialog/InputDialog;->lambda$onCreate$3$InputDialog(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
