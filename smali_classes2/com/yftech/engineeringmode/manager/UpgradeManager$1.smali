.class Lcom/yftech/engineeringmode/manager/UpgradeManager$1;
.super Ljava/lang/Object;
.source "UpgradeManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/manager/UpgradeManager;->showCheckUpgradeFileDialog(ZZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/manager/UpgradeManager;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/manager/UpgradeManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/manager/UpgradeManager;

    .line 216
    iput-object p1, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/UpgradeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .line 219
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager$1;->this$0:Lcom/yftech/engineeringmode/manager/UpgradeManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->access$002(Lcom/yftech/engineeringmode/manager/UpgradeManager;Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 220
    return-void
.end method
