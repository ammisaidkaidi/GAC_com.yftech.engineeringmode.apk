.class Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;
.super Lcom/yftech/vehicle/sdk/MpuProjectManager$MpuProjectListener;
.source "CanLogFloatView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/widget/CanLogFloatView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/widget/CanLogFloatView;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    .line 44
    iput-object p1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;->this$0:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    invoke-direct {p0}, Lcom/yftech/vehicle/sdk/MpuProjectManager$MpuProjectListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCanLogInfoChanged(Ljava/lang/String;I)V
    .locals 3
    .param p1, "log"    # Ljava/lang/String;
    .param p2, "pid"    # I

    .line 47
    invoke-super {p0, p1, p2}, Lcom/yftech/vehicle/sdk/MpuProjectManager$MpuProjectListener;->onCanLogInfoChanged(Ljava/lang/String;I)V

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;->this$0:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    invoke-static {v1}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->access$000(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)Ljava/text/SimpleDateFormat;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\t"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 50
    .local v0, "info":Ljava/lang/String;
    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;->this$0:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    invoke-static {v1}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->access$100(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0xa

    if-lt v1, v2, :cond_0

    .line 51
    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;->this$0:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    invoke-static {v1}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->access$100(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 53
    :cond_0
    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;->this$0:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    invoke-static {v1}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->access$100(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;->this$0:Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    invoke-static {v1}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->access$300(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1$1;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1$1;-><init>(Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 60
    return-void
.end method
