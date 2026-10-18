.class Lcom/yftech/engineeringmode/fragment/ConfigFragment$2;
.super Ljava/lang/Object;
.source "ConfigFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/ConfigFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/ConfigFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/ConfigFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    .line 126
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/ConfigFragment$2;->this$0:Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 129
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->access$200()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Start reboot system."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;->access$400()V

    .line 131
    return-void
.end method
