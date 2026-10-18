.class Lcom/yftech/engineeringmode/fragment/OtherFragment$1;
.super Ljava/lang/Object;
.source "OtherFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/OtherFragment;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/OtherFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/OtherFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/OtherFragment;

    .line 38
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/OtherFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 41
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/OtherFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->access$000(Lcom/yftech/engineeringmode/fragment/OtherFragment;)V

    .line 42
    return-void
.end method
