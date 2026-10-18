.class Lcom/yftech/engineeringmode/widget/CanLogFloatView$1$1;
.super Ljava/lang/Object;
.source "CanLogFloatView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;->onCanLogInfoChanged(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;

    .line 54
    iput-object p1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1$1;->this$1:Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1$1;->this$1:Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;

    iget-object v0, v0, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;->this$0:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    invoke-static {v0}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->access$200(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)V

    .line 58
    return-void
.end method
