.class Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$1;
.super Ljava/lang/Object;
.source "AtcMetazoneFragment.java"

# interfaces
.implements Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    .line 102
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public read(Ljava/lang/String;)V
    .locals 2
    .param p1, "index"    # Ljava/lang/String;

    .line 111
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->access$000(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)I

    move-result v1

    invoke-static {v0, v1, p1}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->access$200(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;ILjava/lang/String;)V

    .line 112
    return-void
.end method

.method public write(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "index"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 105
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->access$000(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)I

    move-result v1

    invoke-static {v0, v1, p1, p2}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->access$100(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;ILjava/lang/String;Ljava/lang/String;)V

    .line 106
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->access$000(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)I

    move-result v1

    invoke-static {v0, v1, p1}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->access$200(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;ILjava/lang/String;)V

    .line 107
    return-void
.end method
