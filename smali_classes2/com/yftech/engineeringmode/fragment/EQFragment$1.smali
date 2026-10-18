.class Lcom/yftech/engineeringmode/fragment/EQFragment$1;
.super Ljava/lang/Object;
.source "EQFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/EQFragment;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/EQFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/EQFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/EQFragment;

    .line 227
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/EQFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 230
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/EQFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->access$000(Lcom/yftech/engineeringmode/fragment/EQFragment;)V

    .line 231
    return-void
.end method
