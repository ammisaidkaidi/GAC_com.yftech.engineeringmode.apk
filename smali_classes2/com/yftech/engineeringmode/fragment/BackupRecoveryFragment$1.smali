.class Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment$1;
.super Ljava/lang/Object;
.source "BackupRecoveryFragment.java"

# interfaces
.implements Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->openConfirmDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;

    .line 70
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancelButtonClick()V
    .locals 0

    .line 79
    return-void
.end method

.method public sureButtonClick()V
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;->access$000(Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;)V

    .line 74
    return-void
.end method
