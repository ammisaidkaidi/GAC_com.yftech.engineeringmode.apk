.class Lcom/yftech/engineeringmode/fragment/LogFragment$2;
.super Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;
.source "LogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/LogFragment;
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

    .line 298
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-direct {p0}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadLogState(II)V
    .locals 5
    .param p1, "state"    # I
    .param p2, "progress"    # I

    .line 301
    invoke-super {p0, p1, p2}, Lcom/yftech/tbox/sdk/CarTBoxSdkManager$CarTBoxSdkCallback;->onDownloadLogState(II)V

    .line 302
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/LogFragment;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDownloadLogState state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " progress="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    const/4 v0, 0x0

    const v1, 0x7f0e0084

    if-nez p1, :cond_0

    .line 304
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-static {v2}, Lcom/yftech/engineeringmode/fragment/LogFragment;->access$200(Lcom/yftech/engineeringmode/fragment/LogFragment;)Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-virtual {v3, v1}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 305
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-static {v1, v0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->access$300(Lcom/yftech/engineeringmode/fragment/LogFragment;Z)V

    goto/16 :goto_0

    .line 306
    :cond_0
    const/16 v2, 0x80

    const/4 v3, 0x1

    if-ne p1, v2, :cond_1

    .line 307
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->access$200(Lcom/yftech/engineeringmode/fragment/LogFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    const v2, 0x7f0e0083

    invoke-virtual {v1, v2}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 308
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-static {v0, v3}, Lcom/yftech/engineeringmode/fragment/LogFragment;->access$300(Lcom/yftech/engineeringmode/fragment/LogFragment;Z)V

    goto :goto_0

    .line 309
    :cond_1
    const/16 v2, 0xa0

    if-ne p1, v2, :cond_2

    .line 310
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-static {v2}, Lcom/yftech/engineeringmode/fragment/LogFragment;->access$200(Lcom/yftech/engineeringmode/fragment/LogFragment;)Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-virtual {v3, v1}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 311
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-static {v1, v0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->access$300(Lcom/yftech/engineeringmode/fragment/LogFragment;Z)V

    goto :goto_0

    .line 312
    :cond_2
    const/16 v0, 0x82

    if-eq p1, v0, :cond_3

    const/16 v0, 0x81

    if-eq p1, v0, :cond_3

    const/16 v0, 0xa1

    if-eq p1, v0, :cond_3

    const/16 v0, 0xa2

    if-eq p1, v0, :cond_3

    const/16 v0, 0xa3

    if-ne p1, v0, :cond_4

    .line 317
    :cond_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/LogFragment;->access$200(Lcom/yftech/engineeringmode/fragment/LogFragment;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    const v4, 0x7f0e0085

    invoke-virtual {v2, v4}, Lcom/yftech/engineeringmode/fragment/LogFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "(code="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 318
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/LogFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-static {v0, v3}, Lcom/yftech/engineeringmode/fragment/LogFragment;->access$300(Lcom/yftech/engineeringmode/fragment/LogFragment;Z)V

    .line 320
    :cond_4
    :goto_0
    return-void
.end method
