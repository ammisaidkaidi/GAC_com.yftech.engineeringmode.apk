.class Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;
.super Ljava/lang/Object;
.source "ScreenUpgradeCA1105Dialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->onScreenUpgradeCA1105State(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

.field final synthetic val$state:I


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 100
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    iput p2, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->val$state:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 103
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$000(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 104
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$100(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 105
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->val$state:I

    const/4 v2, 0x1

    const/16 v3, 0x8

    if-ne v0, v2, :cond_0

    .line 106
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$200(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0e00ff

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 107
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$000(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_0

    .line 108
    :cond_0
    const/4 v4, 0x2

    if-ne v0, v4, :cond_1

    .line 109
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$200(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/TextView;

    move-result-object v0

    const v4, 0x7f0e00fd

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(I)V

    .line 110
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$300(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-virtual {v4}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0e00f6

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getInstance()Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/yftech/engineeringmode/manager/ScreenUpgradeCA1105Manager;->getCurScreenVersion()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v1

    invoke-virtual {v4, v5, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$000(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 112
    :cond_1
    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 113
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$200(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0e00fa

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 114
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$400(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$000(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 116
    :cond_2
    const/4 v1, 0x5

    if-ne v0, v1, :cond_3

    .line 117
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$200(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0e00f5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 118
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$000(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 119
    :cond_3
    const/4 v1, 0x3

    if-ne v0, v1, :cond_4

    .line 120
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$200(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0e00fc

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 121
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->access$000(Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 123
    :cond_4
    :goto_0
    return-void
.end method
