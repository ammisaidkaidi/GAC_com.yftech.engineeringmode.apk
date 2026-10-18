.class public Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "StreelingWheelKeyFragment.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private chdown:Landroid/widget/Button;

.field private chup:Landroid/widget/Button;

.field mCarKeyEvent:Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;

.field private mCarKeyListener:Lcom/yftech/vehicle/sdk/CarKeyManager$CarKeyListener;

.field private mMainHandler:Landroid/os/Handler;

.field private mode:Landroid/widget/Button;

.field private mute:Landroid/widget/Button;

.field private offhook:Landroid/widget/Button;

.field private onhook:Landroid/widget/Button;

.field private voldown:Landroid/widget/Button;

.field private volup:Landroid/widget/Button;

.field private vr:Landroid/widget/Button;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    const-class v0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 26
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 30
    new-instance v0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->mCarKeyListener:Lcom/yftech/vehicle/sdk/CarKeyManager$CarKeyListener;

    .line 116
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->mMainHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 26
    sget-object v0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->volup:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->mMainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->voldown:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->mode:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->vr:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->offhook:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$600(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->onhook:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$700(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->mute:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$800(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->chup:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$900(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->chdown:Landroid/widget/Button;

    return-object v0
.end method

.method private initView(Landroid/view/View;)V
    .locals 1
    .param p1, "root"    # Landroid/view/View;

    .line 137
    const v0, 0x7f0901a6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->volup:Landroid/widget/Button;

    .line 138
    const v0, 0x7f0901a5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->voldown:Landroid/widget/Button;

    .line 139
    const v0, 0x7f0900d3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->mode:Landroid/widget/Button;

    .line 140
    const v0, 0x7f0901a7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->vr:Landroid/widget/Button;

    .line 141
    const v0, 0x7f0900e5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->offhook:Landroid/widget/Button;

    .line 142
    const v0, 0x7f0900e6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->onhook:Landroid/widget/Button;

    .line 143
    const v0, 0x7f0900dd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->mute:Landroid/widget/Button;

    .line 144
    const v0, 0x7f090056

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->chup:Landroid/widget/Button;

    .line 145
    const v0, 0x7f090055

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->chdown:Landroid/widget/Button;

    .line 148
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 130
    const v0, 0x7f0c0049

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 131
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->initView(Landroid/view/View;)V

    .line 132
    return-object v0
.end method

.method public onPause()V
    .locals 2

    .line 160
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onPause()V

    .line 161
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarKeyManager;->get()Lcom/yftech/vehicle/sdk/CarKeyManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->mCarKeyListener:Lcom/yftech/vehicle/sdk/CarKeyManager$CarKeyListener;

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarKeyManager;->unregisterReceiver(Ljava/lang/Object;)V

    .line 162
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 152
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 153
    const/16 v0, 0x270f

    .line 154
    .local v0, "event":I
    sget-object v1, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResume event"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarKeyManager;->get()Lcom/yftech/vehicle/sdk/CarKeyManager;

    move-result-object v1

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->mCarKeyListener:Lcom/yftech/vehicle/sdk/CarKeyManager$CarKeyListener;

    invoke-virtual {v1, v2}, Lcom/yftech/vehicle/sdk/CarKeyManager;->registerReceiver(Ljava/lang/Object;)V

    .line 156
    return-void
.end method

.method public onSteeringWheelKeyEvent(Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;
    .annotation runtime Lcom/yftech/vehicle/internal/SignalReceiver;
    .end annotation

    .line 165
    return-void
.end method
