.class Lcom/yftech/engineeringmode/fragment/ScreenFragment$2;
.super Ljava/lang/Object;
.source "ScreenFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/ScreenFragment;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/ScreenFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/ScreenFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/ScreenFragment;

    .line 86
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/ScreenFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 89
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 90
    return-void

    .line 92
    :cond_0
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v0

    const v1, 0x7f090051

    if-ne v0, v1, :cond_1

    .line 93
    invoke-static {p2}, Lcom/yftech/engineeringmode/util/Utils;->setScreenTpAutoBrightnessEnable(Z)V

    .line 95
    :cond_1
    return-void
.end method
