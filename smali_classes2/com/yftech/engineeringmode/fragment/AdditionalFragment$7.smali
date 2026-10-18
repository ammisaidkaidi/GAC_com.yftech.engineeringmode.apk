.class Lcom/yftech/engineeringmode/fragment/AdditionalFragment$7;
.super Ljava/lang/Object;
.source "AdditionalFragment.java"

# interfaces
.implements Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->openRebootDialog()V
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

    .line 266
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$7;->this$0:Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancelButtonClick()V
    .locals 0

    .line 275
    return-void
.end method

.method public sureButtonClick()V
    .locals 0

    .line 269
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->access$800()V

    .line 270
    return-void
.end method
