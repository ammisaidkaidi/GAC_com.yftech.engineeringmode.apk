.class Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;
.super Ljava/lang/Object;
.source "AtcMetazoneFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->readMetazone(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

.field final synthetic val$byteValue:[B

.field final synthetic val$index:Ljava/lang/String;

.field final synthetic val$intValue:[I

.field final synthetic val$option:I


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;Ljava/lang/String;I[I[B)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    .line 139
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    iput-object p2, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->val$index:Ljava/lang/String;

    iput p3, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->val$option:I

    iput-object p4, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->val$intValue:[I

    iput-object p5, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->val$byteValue:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 142
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->access$300(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->val$index:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    iget v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->val$option:I

    if-nez v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->access$400(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->val$intValue:[I

    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 145
    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 146
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->access$400(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;->val$byteValue:[B

    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    :cond_1
    :goto_0
    return-void
.end method
