.class Lcom/yftech/engineeringmode/fragment/OtherFragment$3;
.super Ljava/lang/Object;
.source "OtherFragment.java"

# interfaces
.implements Lcom/yftech/engineeringmode/dialog/InputDialog$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/OtherFragment;->showWriteSNDialog()V
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

    .line 91
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/OtherFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSure(Landroid/view/View;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "sn"    # Ljava/lang/String;

    .line 95
    :try_start_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment$3;->this$0:Lcom/yftech/engineeringmode/fragment/OtherFragment;

    invoke-static {v0, p2}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->access$200(Lcom/yftech/engineeringmode/fragment/OtherFragment;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    goto :goto_0

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 99
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
