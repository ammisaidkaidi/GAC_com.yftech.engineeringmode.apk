.class Lcom/yftech/engineeringmode/fragment/TunerFragment$Listener;
.super Ljava/lang/Object;
.source "TunerFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/TunerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Listener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/TunerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/TunerFragment;

    .line 52
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$Listener;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 57
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$Listener;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->access$000(Lcom/yftech/engineeringmode/fragment/TunerFragment;)I

    move-result v0

    if-nez v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$Listener;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->access$100(Lcom/yftech/engineeringmode/fragment/TunerFragment;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, "FM"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment$Listener;->this$0:Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->access$100(Lcom/yftech/engineeringmode/fragment/TunerFragment;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, "AM"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    :goto_0
    return-void
.end method
