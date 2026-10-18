.class Lcom/yftech/engineeringmode/adapter/USBFileAdapter$1;
.super Ljava/lang/Object;
.source "USBFileAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/adapter/USBFileAdapter;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    .line 58
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter$1;->this$0:Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    iput p2, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 61
    new-instance v0, Lcom/yftech/engineeringmode/dialog/MediaDialog;

    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter$1;->this$0:Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    invoke-static {v1}, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->access$000(Lcom/yftech/engineeringmode/adapter/USBFileAdapter;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter$1;->this$0:Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    invoke-static {v2}, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->access$100(Lcom/yftech/engineeringmode/adapter/USBFileAdapter;)Ljava/util/List;

    move-result-object v2

    iget v3, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter$1;->val$position:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/car/media/data/entity/MediaFile;

    iget-object v3, p0, Lcom/yftech/engineeringmode/adapter/USBFileAdapter$1;->this$0:Lcom/yftech/engineeringmode/adapter/USBFileAdapter;

    invoke-static {v3}, Lcom/yftech/engineeringmode/adapter/USBFileAdapter;->access$200(Lcom/yftech/engineeringmode/adapter/USBFileAdapter;)I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/yftech/engineeringmode/dialog/MediaDialog;-><init>(Landroid/content/Context;Lcom/yftech/car/media/data/entity/MediaFile;I)V

    .line 62
    .local v0, "mediaDialog":Lcom/yftech/engineeringmode/dialog/MediaDialog;
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->show()V

    .line 63
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/MediaDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 64
    .local v1, "dialogWindow":Landroid/view/Window;
    return-void
.end method
