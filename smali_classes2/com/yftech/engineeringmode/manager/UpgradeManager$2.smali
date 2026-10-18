.class Lcom/yftech/engineeringmode/manager/UpgradeManager$2;
.super Ljava/lang/Object;
.source "UpgradeManager.java"

# interfaces
.implements Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;


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

    .line 224
    iput-object p1, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager$2;->this$0:Lcom/yftech/engineeringmode/manager/UpgradeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 0

    .line 234
    return-void
.end method

.method public onUpgrade(ZZZZ)V
    .locals 1
    .param p1, "isUpgradeMCU"    # Z
    .param p2, "isUpgradeOS"    # Z
    .param p3, "isUpgradeScreen"    # Z
    .param p4, "isUpgradeScreenMcu"    # Z

    .line 227
    invoke-static {}, Lcom/yftech/engineeringmode/util/DeleteUtil;->deleFotaData()V

    .line 228
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/UpgradeManager$2;->this$0:Lcom/yftech/engineeringmode/manager/UpgradeManager;

    invoke-static {v0, p1, p2, p3, p4}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->access$100(Lcom/yftech/engineeringmode/manager/UpgradeManager;ZZZZ)V

    .line 229
    return-void
.end method
