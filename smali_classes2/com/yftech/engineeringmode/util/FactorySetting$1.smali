.class Lcom/yftech/engineeringmode/util/FactorySetting$1;
.super Ljava/lang/Thread;
.source "FactorySetting.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/util/FactorySetting;->clearOsData(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/util/FactorySetting;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/util/FactorySetting;Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/util/FactorySetting;
    .param p2, "arg0"    # Ljava/lang/String;

    .line 75
    iput-object p1, p0, Lcom/yftech/engineeringmode/util/FactorySetting$1;->this$0:Lcom/yftech/engineeringmode/util/FactorySetting;

    iput-object p3, p0, Lcom/yftech/engineeringmode/util/FactorySetting$1;->val$context:Landroid/content/Context;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 79
    :try_start_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/util/FactorySetting$1;->val$context:Landroid/content/Context;

    invoke-static {v0}, Landroid/os/RecoverySystem;->rebootWipeUserData(Landroid/content/Context;)V

    .line 80
    invoke-static {}, Lcom/yftech/engineeringmode/util/FactorySetting;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Still running after master clear?!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    goto :goto_0

    .line 81
    :catch_0
    move-exception v0

    .line 82
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/yftech/engineeringmode/util/FactorySetting;->access$000()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Can\'t perform master clear/factory reset"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 85
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
