.class Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$1;
.super Landroid/os/Handler;
.source "TemperatureInfoFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    .line 203
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .line 206
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 207
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 208
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->access$500(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f090184

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "soc"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->access$500(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f090167

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "cpu"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-static {v1}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->access$500(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f090189

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "tft"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    return-void
.end method
