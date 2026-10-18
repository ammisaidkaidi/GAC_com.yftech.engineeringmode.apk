.class public Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "FaultCodeFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final FAULT_SELECT_END:I = -0x1

.field private static final TAG:Ljava/lang/String; = "FaultInfo"


# instance fields
.field private adapter:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

.field public errorCodeInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/vehicle/internal/adapter/ICarMisc$ErrorCodeInfo;",
            ">;"
        }
    .end annotation
.end field

.field private faultListView:Landroid/widget/ListView;

.field private isQuery:Z

.field private mTimer:Ljava/util/Timer;

.field private mTimerTask:Ljava/util/TimerTask;

.field miscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

.field private root:Landroid/view/View;

.field private selectingTextview:Landroid/widget/TextView;

.field private updateListViewHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 70
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->isQuery:Z

    .line 42
    new-instance v0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->updateListViewHandler:Landroid/os/Handler;

    .line 55
    new-instance v0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$2;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->miscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

    .line 71
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    .line 27
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->selectingTextview:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    .line 27
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->adapter:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    return-object v0
.end method

.method static synthetic access$102(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;)Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;
    .param p1, "x1"    # Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    .line 27
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->adapter:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    return-object p1
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    .line 27
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->faultListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$302(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;
    .param p1, "x1"    # Z

    .line 27
    iput-boolean p1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->isQuery:Z

    return p1
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    .line 27
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->cancelTimer()V

    return-void
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    .line 27
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->updateListViewHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private cancelTimer()V
    .locals 2

    .line 153
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 154
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->mTimer:Ljava/util/Timer;

    .line 155
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->mTimerTask:Ljava/util/TimerTask;

    invoke-virtual {v1}, Ljava/util/TimerTask;->cancel()Z

    .line 156
    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->mTimerTask:Ljava/util/TimerTask;

    .line 157
    return-void
.end method

.method private clearListView()V
    .locals 3

    .line 131
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->errorCodeInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 132
    new-instance v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->errorCodeInfoList:Ljava/util/List;

    invoke-direct {v0, v1, v2}, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->adapter:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    .line 133
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->faultListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->adapter:Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 134
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 94
    const v0, 0x7f0900a6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 95
    .local v0, "tableTitle":Landroid/view/ViewGroup;
    const/16 v1, 0xc3

    const/16 v2, 0xc5

    invoke-static {v1, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    .line 96
    const v1, 0x7f090089

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->faultListView:Landroid/widget/ListView;

    .line 97
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->errorCodeInfoList:Ljava/util/List;

    .line 98
    const v1, 0x7f09008f

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->selectingTextview:Landroid/widget/TextView;

    .line 99
    const v1, 0x7f09008e

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    const v1, 0x7f090086

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    return-void
.end method

.method private startTimer()V
    .locals 4

    .line 138
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->mTimer:Ljava/util/Timer;

    .line 139
    new-instance v0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$3;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment$3;-><init>(Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->mTimerTask:Ljava/util/TimerTask;

    .line 148
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->mTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->mTimerTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x4e20

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 149
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 107
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090086

    if-eq v0, v1, :cond_2

    const v1, 0x7f09008e

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 109
    :cond_0
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->isQuery:Z

    if-eqz v0, :cond_1

    .line 110
    goto :goto_0

    .line 112
    :cond_1
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->clearListView()V

    .line 113
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->errorCodeInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 114
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setFactoryModeErrorCodeEnabled(Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->isQuery:Z

    .line 115
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->startTimer()V

    .line 116
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->selectingTextview:Landroid/widget/TextView;

    const v2, 0x7f0e00e0

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->selectingTextview:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "isQuery:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->isQuery:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FaultInfo"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    goto :goto_0

    .line 121
    :cond_2
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setFactoryModeClearDtc(Z)Z

    .line 122
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->clearListView()V

    .line 123
    nop

    .line 127
    :goto_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 87
    const v0, 0x7f0c0042

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->root:Landroid/view/View;

    .line 88
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->root:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->initView(Landroid/view/View;)V

    .line 89
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->root:Landroid/view/View;

    return-object v0
.end method

.method public onPause()V
    .locals 2

    .line 161
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onPause()V

    .line 162
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->miscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarMiscManager;->unregisterListener(Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;)V

    .line 163
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->updateListViewHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 164
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 75
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 78
    :try_start_0
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;->miscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarMiscManager;->registerListener(Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    goto :goto_0

    .line 79
    :catch_0
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 82
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
