.class Lcom/yftech/engineeringmode/EngineeringModeActivity$1;
.super Ljava/lang/Object;
.source "EngineeringModeActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/EngineeringModeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/EngineeringModeActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/EngineeringModeActivity;

    .line 85
    iput-object p1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$1;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 6

    .line 88
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$1;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-static {v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$100(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$1;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-static {v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$000(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 89
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$1;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-static {v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$100(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v0

    .line 90
    .local v0, "viewWidth":I
    iget-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$1;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0700e3

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    .line 91
    .local v1, "tabBtnWidth":F
    iget-object v2, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$1;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-static {v2}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$100(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v2

    new-instance v3, Landroid/support/v7/widget/GridLayoutManager;

    iget-object v4, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$1;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    int-to-float v5, v0

    div-float/2addr v5, v1

    float-to-int v5, v5

    invoke-direct {v3, v4, v5}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 92
    return-void
.end method
