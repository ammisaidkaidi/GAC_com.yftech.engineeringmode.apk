.class Lcom/yftech/engineeringmode/fragment/OtherFragment$2;
.super Ljava/lang/Object;
.source "OtherFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/OtherFragment;->showWriteSNDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/OtherFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/OtherFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/OtherFragment;

    .line 85
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/OtherFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;

    .line 88
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/OtherFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->access$102(Lcom/yftech/engineeringmode/fragment/OtherFragment;Lcom/yftech/engineeringmode/dialog/InputDialog;)Lcom/yftech/engineeringmode/dialog/InputDialog;

    .line 89
    return-void
.end method
