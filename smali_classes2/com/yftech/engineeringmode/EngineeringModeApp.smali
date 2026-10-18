.class public Lcom/yftech/engineeringmode/EngineeringModeApp;
.super Landroid/app/Application;
.source "EngineeringModeApp.java"


# static fields
.field public static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    const-class v0, Lcom/yftech/engineeringmode/EngineeringModeApp;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/EngineeringModeApp;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method private requestBspInfo()V
    .locals 2

    .line 55
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 56
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 57
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 58
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 59
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 60
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 61
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 62
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 63
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 64
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 65
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 2
    .param p1, "base"    # Landroid/content/Context;

    .line 21
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 22
    sget-object v0, Lcom/yftech/engineeringmode/EngineeringModeApp;->TAG:Ljava/lang/String;

    const-string v1, "attachBaseContext"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    return-void
.end method

.method public onCreate()V
    .locals 2

    .line 27
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 28
    sget-object v0, Lcom/yftech/engineeringmode/EngineeringModeApp;->TAG:Ljava/lang/String;

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    invoke-static {}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->getInstance()Lcom/yftech/engineeringmode/manager/UpgradeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->init(Landroid/content/Context;)V

    .line 30
    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->init(Landroid/content/Context;)V

    .line 31
    invoke-static {}, Lcom/yftech/engineeringmode/util/LogManager;->getInstance()Lcom/yftech/engineeringmode/util/LogManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/util/LogManager;->init(Landroid/content/Context;)V

    .line 33
    invoke-direct {p0}, Lcom/yftech/engineeringmode/EngineeringModeApp;->requestBspInfo()V

    .line 34
    return-void
.end method

.method public onTerminate()V
    .locals 2

    .line 38
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 39
    sget-object v0, Lcom/yftech/engineeringmode/EngineeringModeApp;->TAG:Ljava/lang/String;

    const-string v1, "onTerminate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    invoke-static {}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->getInstance()Lcom/yftech/engineeringmode/manager/UpgradeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->deInit()V

    .line 41
    invoke-static {}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->getInstance()Lcom/yftech/engineeringmode/manager/SoundVolumeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/manager/SoundVolumeManager;->deInit()V

    .line 42
    invoke-static {}, Lcom/yftech/engineeringmode/util/LogManager;->getInstance()Lcom/yftech/engineeringmode/util/LogManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/util/LogManager;->deInit()V

    .line 43
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 3
    .param p1, "level"    # I

    .line 47
    invoke-super {p0, p1}, Landroid/app/Application;->onTrimMemory(I)V

    .line 48
    sget-object v0, Lcom/yftech/engineeringmode/EngineeringModeApp;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onTrimMemory level:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    return-void
.end method
