.class public Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;
.super Ljava/lang/Object;
.source "ScreenTpTestDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TouchScreenBean"
.end annotation


# instance fields
.field private select:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .param p1, "select"    # Z

    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 259
    iput-boolean p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;->select:Z

    .line 260
    return-void
.end method


# virtual methods
.method public isSelect()Z
    .locals 1

    .line 251
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;->select:Z

    return v0
.end method

.method public setSelect(Z)V
    .locals 0
    .param p1, "select"    # Z

    .line 255
    iput-boolean p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;->select:Z

    .line 256
    return-void
.end method
