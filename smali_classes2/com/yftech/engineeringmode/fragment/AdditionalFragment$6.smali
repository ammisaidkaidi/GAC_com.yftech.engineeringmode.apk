.class Lcom/yftech/engineeringmode/fragment/AdditionalFragment$6;
.super Ljava/lang/Object;
.source "AdditionalFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    .line 211
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$6;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .line 214
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$6;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->access$702(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 215
    return-void
.end method
