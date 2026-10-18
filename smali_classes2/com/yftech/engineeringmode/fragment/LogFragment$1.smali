.class Lcom/yftech/engineeringmode/fragment/LogFragment$1;
.super Ljava/lang/Object;
.source "LogFragment.java"

# interfaces
.implements Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/LogFragment;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/LogFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/LogFragment;

    .line 224
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancelButtonClick()V
    .locals 0

    .line 233
    return-void
.end method

.method public sureButtonClick()V
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->access$000(Lcom/yftech/engineeringmode/fragment/LogFragment;)V

    .line 228
    return-void
.end method
