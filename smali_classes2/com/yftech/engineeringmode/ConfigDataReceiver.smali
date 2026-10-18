.class public Lcom/yftech/engineeringmode/ConfigDataReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ConfigDataReceiver.java"


# static fields
.field private static final INTENT_ACTION_CAR_TYPE:Ljava/lang/String; = "com.yftech.intent.action.engineeringmode.cartype"

.field private static final INTENT_ACTION_CHANGE_BIT_VALUE:Ljava/lang/String; = "com.yftech.intent.action.engineeringmode.config.bit"

.field private static final INTENT_ACTION_DID_INDEX_VALUE:Ljava/lang/String; = "com.yftech.intent.action.engineeringmode.config.DID_INDEX_VALUE"

.field private static final INTENT_ACTION_INDEX_VALUE:Ljava/lang/String; = "com.yftech.intent.action.engineeringmode.config.INDEX_VALUE"

.field private static final INTENT_ACTION_TYPE:Ljava/lang/String; = "com.yftech.intent.action.engineeringmode.config.TYPE"

.field private static final INTENT_FAST_SLEEP:Ljava/lang/String; = "com.yftech.intent.action.engineeringmode.fastsleep"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private carType:[Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    const-class v0, Lcom/yftech/engineeringmode/ConfigDataReceiver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/ConfigDataReceiver;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 12
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 28
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    sget-object v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;->IHU12_A88_A1:Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;->IHU12_A58_B1:Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;->IHU12_A79_C1:Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;->IHU12_A79_C2:Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/yftech/engineeringmode/ConfigDataReceiver;->carType:[Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 33
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/yftech/engineeringmode/manager/ConfigManager;->init(Landroid/content/Context;)V

    .line 34
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.yftech.intent.action.engineeringmode.config.TYPE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "type"

    if-eqz v0, :cond_0

    .line 35
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, "type":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/ConfigDataReceiver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "type:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfig0101(Ljava/lang/String;)V

    .line 38
    .end local v0    # "type":Ljava/lang/String;
    goto/16 :goto_2

    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v2, "com.yftech.intent.action.engineeringmode.config.INDEX_VALUE"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v2, " value:"

    const-string v3, "value"

    const-string v4, "index"

    if-eqz v0, :cond_1

    .line 39
    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "index":Ljava/lang/String;
    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 41
    .local v1, "value":Ljava/lang/String;
    sget-object v3, Lcom/yftech/engineeringmode/ConfigDataReceiver;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "index:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfig0101(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .end local v0    # "index":Ljava/lang/String;
    .end local v1    # "value":Ljava/lang/String;
    goto/16 :goto_2

    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v5, "com.yftech.intent.action.engineeringmode.config.DID_INDEX_VALUE"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v5, "did"

    if-eqz v0, :cond_2

    .line 44
    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "did":Ljava/lang/String;
    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 46
    .local v1, "index":Ljava/lang/String;
    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 47
    .local v3, "value":Ljava/lang/String;
    sget-object v4, Lcom/yftech/engineeringmode/ConfigDataReceiver;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "did: index:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v2

    invoke-virtual {v2, v0, v1, v3}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .end local v0    # "did":Ljava/lang/String;
    .end local v1    # "index":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    goto/16 :goto_2

    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v2, "com.yftech.intent.action.engineeringmode.config.bit"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 50
    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 51
    .restart local v0    # "did":Ljava/lang/String;
    const-string v1, "bytePos"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 52
    .local v1, "bytePos":Ljava/lang/String;
    const-string v2, "bitPos"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, "bitPos":Ljava/lang/String;
    const-string v3, "bitValue"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 54
    .local v3, "bitValue":Ljava/lang/String;
    sget-object v4, Lcom/yftech/engineeringmode/ConfigDataReceiver;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onReceive: did:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " bytePos:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " bitPos:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " bitValue:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    invoke-static {}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v0, v5, v6, v7}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setBitValue(Ljava/lang/String;III)V

    .line 56
    .end local v0    # "did":Ljava/lang/String;
    .end local v1    # "bytePos":Ljava/lang/String;
    .end local v2    # "bitPos":Ljava/lang/String;
    .end local v3    # "bitValue":Ljava/lang/String;
    goto/16 :goto_2

    :cond_3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v2, "com.yftech.intent.action.engineeringmode.cartype"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 57
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "type":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/ConfigDataReceiver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceive carType:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/yftech/engineeringmode/ConfigDataReceiver;->carType:[Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    array-length v3, v2

    if-ge v1, v3, :cond_5

    .line 61
    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 62
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/ConfigDataReceiver;->carType:[Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setAteCarType(Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;)Z

    move-result v2

    .line 63
    .local v2, "result":Z
    sget-object v3, Lcom/yftech/engineeringmode/ConfigDataReceiver;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setAteCarType carType:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/yftech/engineeringmode/ConfigDataReceiver;->carType:[Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    aget-object v5, v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " result:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .end local v2    # "result":Z
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0    # "type":Ljava/lang/String;
    .end local v1    # "i":I
    :cond_5
    goto :goto_1

    .line 66
    :cond_6
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.yftech.intent.action.engineeringmode.fastsleep"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 67
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setFastSleep()Z

    move-result v0

    .line 68
    .local v0, "result":Z
    sget-object v1, Lcom/yftech/engineeringmode/ConfigDataReceiver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CarMiscManager.get().setFastSleep():"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 66
    .end local v0    # "result":Z
    :cond_7
    :goto_1
    nop

    .line 70
    :goto_2
    return-void
.end method
