.class Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;
.super Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;
.source "UpgradeDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/dialog/UpgradeDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    .line 191
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-direct {p0}, Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onUpgradeProgress(II)V
    .locals 3
    .param p1, "module"    # I
    .param p2, "progress"    # I

    .line 194
    invoke-super {p0, p1, p2}, Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;->onUpgradeProgress(II)V

    .line 195
    invoke-static {}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onUpgradeProgress() module:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", progress:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$100(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 197
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$200(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    return-void
.end method

.method public onUpgradeState(II)V
    .locals 12
    .param p1, "module"    # I
    .param p2, "state"    # I

    .line 202
    invoke-super {p0, p1, p2}, Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;->onUpgradeState(II)V

    .line 203
    invoke-static {}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onUpgradeState() module:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    const v0, 0x7f0e0136

    const v1, 0x7f0e0124

    const v2, 0x7f0e0125

    const v3, 0x7f0e0134

    const v4, 0x7f0e0129

    const-string v5, "100%"

    const/16 v6, 0x64

    const v7, 0x7f0e0135

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-ne p1, v9, :cond_1

    .line 205
    iget-object v9, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v9}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0e012f

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 206
    .local v9, "prefix":Ljava/lang/String;
    packed-switch p2, :pswitch_data_0

    goto/16 :goto_0

    .line 235
    :pswitch_0
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 232
    :pswitch_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    goto/16 :goto_0

    .line 229
    :pswitch_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    goto/16 :goto_0

    .line 226
    :pswitch_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    goto/16 :goto_0

    .line 218
    :pswitch_4
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$308(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    .line 219
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 220
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$500(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 221
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$600(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 222
    sput-boolean v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    goto :goto_0

    .line 208
    :pswitch_5
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$308(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    .line 209
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$100(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 211
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$200(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$500(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 213
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$600(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 214
    sput-boolean v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    .line 238
    .end local v9    # "prefix":Ljava/lang/String;
    :cond_0
    :goto_0
    goto/16 :goto_3

    :cond_1
    const/4 v9, 0x2

    const v10, 0x7f0e0131

    if-ne p1, v9, :cond_3

    .line 239
    iget-object v9, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v9}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f0e012d

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 240
    .restart local v9    # "prefix":Ljava/lang/String;
    packed-switch p2, :pswitch_data_1

    goto/16 :goto_1

    .line 272
    :pswitch_6
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 269
    :pswitch_7
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    goto/16 :goto_1

    .line 266
    :pswitch_8
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 267
    goto/16 :goto_1

    .line 263
    :pswitch_9
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 264
    goto/16 :goto_1

    .line 260
    :pswitch_a
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    goto/16 :goto_1

    .line 252
    :pswitch_b
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$308(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    .line 253
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 254
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$500(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v1

    if-lt v0, v1, :cond_2

    .line 255
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$600(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 256
    sput-boolean v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    goto :goto_1

    .line 242
    :pswitch_c
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$308(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    .line 243
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 244
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$100(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 245
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$200(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$500(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v1

    if-lt v0, v1, :cond_2

    .line 247
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$600(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 248
    sput-boolean v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    .line 275
    .end local v9    # "prefix":Ljava/lang/String;
    :cond_2
    :goto_1
    goto/16 :goto_3

    :cond_3
    const/4 v9, 0x3

    if-ne p1, v9, :cond_4

    .line 276
    iget-object v9, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v9}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f0e0132

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 277
    .restart local v9    # "prefix":Ljava/lang/String;
    packed-switch p2, :pswitch_data_2

    goto/16 :goto_2

    .line 310
    :pswitch_d
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 311
    goto/16 :goto_2

    .line 307
    :pswitch_e
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 308
    goto/16 :goto_2

    .line 304
    :pswitch_f
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 305
    goto/16 :goto_2

    .line 301
    :pswitch_10
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 302
    goto/16 :goto_2

    .line 298
    :pswitch_11
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 299
    goto/16 :goto_2

    .line 290
    :pswitch_12
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$308(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    .line 291
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$500(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v1

    if-lt v0, v1, :cond_5

    .line 293
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$600(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 294
    sput-boolean v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    goto/16 :goto_2

    .line 279
    :pswitch_13
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$308(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    .line 280
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$100(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 282
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$200(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 283
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$500(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v1

    if-lt v0, v1, :cond_5

    .line 284
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$600(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 285
    sput-boolean v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    .line 286
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$700(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)V

    goto/16 :goto_2

    .line 314
    .end local v9    # "prefix":Ljava/lang/String;
    :cond_4
    const/4 v9, 0x5

    if-ne p1, v9, :cond_5

    .line 315
    iget-object v9, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v9}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f0e0133

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 316
    .restart local v9    # "prefix":Ljava/lang/String;
    packed-switch p2, :pswitch_data_3

    goto/16 :goto_3

    .line 349
    :pswitch_14
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 350
    goto/16 :goto_3

    .line 346
    :pswitch_15
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    goto/16 :goto_3

    .line 343
    :pswitch_16
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 344
    goto/16 :goto_3

    .line 340
    :pswitch_17
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 341
    goto/16 :goto_3

    .line 337
    :pswitch_18
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 338
    goto/16 :goto_3

    .line 329
    :pswitch_19
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$308(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    .line 330
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 331
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$500(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v1

    if-lt v0, v1, :cond_6

    .line 332
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$600(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 333
    sput-boolean v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    goto :goto_3

    .line 318
    :pswitch_1a
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$308(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    .line 319
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v2}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 320
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$100(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 321
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$200(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 322
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$300(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$500(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)I

    move-result v1

    if-lt v0, v1, :cond_6

    .line 323
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$600(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 324
    sput-boolean v8, Lcom/yftech/engineeringmode/manager/UpgradeManager;->isUpdating:Z

    .line 325
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$700(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)V

    goto :goto_3

    .line 314
    .end local v9    # "prefix":Ljava/lang/String;
    :cond_5
    :goto_2
    nop

    .line 355
    :cond_6
    :goto_3
    const v0, 0x7fffffff

    if-ne p2, v0, :cond_7

    .line 356
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$400(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e0122

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 357
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/UpgradeDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/UpgradeDialog;->access$600(Lcom/yftech/engineeringmode/dialog/UpgradeDialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 359
    :cond_7
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
    .end packed-switch
.end method
