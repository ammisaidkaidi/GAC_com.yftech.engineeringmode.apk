.class Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;
.super Ljava/lang/Object;
.source "ScreenTpTestDialog.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 48
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 9

    .line 51
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$100(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Landroid/widget/GridView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/GridView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v1}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$000(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 52
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 53
    .local v0, "dm":Landroid/util/DisplayMetrics;
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 55
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 57
    .local v1, "viewWidth":I
    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 58
    .local v2, "viewHeight":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "width:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "  height:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "ScreenTpTestDialog"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    div-int/lit8 v4, v2, 0x48

    invoke-static {v3, v4}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$202(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;I)I

    .line 60
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    div-int/lit16 v4, v1, 0x80

    invoke-static {v3, v4}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$302(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;I)I

    .line 62
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$300(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v4

    iget-object v5, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v5}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$200(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v5

    mul-int/2addr v4, v5

    invoke-static {v3, v4}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$402(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;I)I

    .line 63
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v4}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$400(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 64
    new-instance v4, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;-><init>(Z)V

    .line 65
    .local v4, "bean":Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;
    iget-object v5, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v5}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$500(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .end local v4    # "bean":Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 67
    .end local v3    # "i":I
    :cond_0
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$100(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Landroid/widget/GridView;

    move-result-object v3

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v4}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$300(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 68
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    new-instance v4, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$700(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Landroid/content/Context;

    move-result-object v5

    iget-object v6, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v6}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$500(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Ljava/util/List;

    move-result-object v6

    iget-object v7, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v7}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$300(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v7

    iget-object v8, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v8}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$200(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;-><init>(Landroid/content/Context;Ljava/util/List;II)V

    invoke-static {v3, v4}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$602(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;)Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

    .line 69
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v3}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$100(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Landroid/widget/GridView;

    move-result-object v3

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;->this$0:Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-static {v4}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->access$600(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 70
    return-void
.end method
