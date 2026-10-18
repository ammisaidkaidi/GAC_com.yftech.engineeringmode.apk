.class public Lcom/yftech/engineeringmode/widget/CanLogFloatView;
.super Ljava/lang/Object;
.source "CanLogFloatView.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# static fields
.field private static final DISPLAY_LOG_COUNT_MAX:I = 0xa

.field private static final TAG:Ljava/lang/String; = "CanLogFloatView"


# instance fields
.field private mDownInScreenX:F

.field private mDownInScreenY:F

.field private mFloatLayout:Landroid/view/View;

.field private mInScreenX:F

.field private mInScreenY:F

.field private mInViewX:F

.field private mInViewY:F

.field private final mLogInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mMainHandler:Landroid/os/Handler;

.field private final mMpuProjectListener:Lcom/yftech/vehicle/sdk/MpuProjectManager$MpuProjectListener;

.field private final mSimpleDateFormat:Ljava/text/SimpleDateFormat;

.field private mTvInfo:Landroid/widget/TextView;

.field private mWindowManager:Landroid/view/WindowManager;

.field private mWindowParams:Landroid/view/WindowManager$LayoutParams;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mLogInfoList:Ljava/util/List;

    .line 29
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss.SSS"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mSimpleDateFormat:Ljava/text/SimpleDateFormat;

    .line 30
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mMainHandler:Landroid/os/Handler;

    .line 44
    new-instance v0, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/widget/CanLogFloatView$1;-><init>(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mMpuProjectListener:Lcom/yftech/vehicle/sdk/MpuProjectManager$MpuProjectListener;

    .line 64
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->initFloatView(Landroid/content/Context;)V

    .line 65
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)Ljava/text/SimpleDateFormat;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    .line 23
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mSimpleDateFormat:Ljava/text/SimpleDateFormat;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    .line 23
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mLogInfoList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    .line 23
    invoke-direct {p0}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->setInfoText()V

    return-void
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/widget/CanLogFloatView;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/widget/CanLogFloatView;

    .line 23
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mMainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private floatLayoutTouch(Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "motionEvent"    # Landroid/view/MotionEvent;

    .line 93
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    goto :goto_0

    .line 106
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInScreenX:F

    .line 107
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInScreenY:F

    .line 108
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v2, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInScreenX:F

    iget v3, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInViewX:F

    sub-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 109
    iget v2, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInScreenY:F

    iget v3, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInViewY:F

    sub-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 111
    iget-object v2, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mWindowManager:Landroid/view/WindowManager;

    iget-object v3, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mFloatLayout:Landroid/view/View;

    invoke-interface {v2, v3, v0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    goto :goto_0

    .line 115
    :cond_1
    iget v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mDownInScreenX:F

    iget v2, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInScreenX:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_3

    iget v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mDownInScreenY:F

    iget v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInScreenY:F

    goto :goto_0

    .line 96
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInViewX:F

    .line 97
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInViewY:F

    .line 99
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mDownInScreenX:F

    .line 100
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mDownInScreenY:F

    .line 101
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInScreenX:F

    .line 102
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mInScreenY:F

    .line 103
    nop

    .line 120
    :cond_3
    :goto_0
    return v1
.end method

.method private initFloatView(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 68
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 69
    .local v0, "inflater":Landroid/view/LayoutInflater;
    if-nez v0, :cond_0

    .line 70
    const-string v1, "CanLogFloatView"

    const-string v2, "initFloatView->inflater is null"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    return-void

    .line 73
    :cond_0
    const v1, 0x7f0c0068

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mFloatLayout:Landroid/view/View;

    .line 74
    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mFloatLayout:Landroid/view/View;

    const v2, 0x7f090170

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mTvInfo:Landroid/widget/TextView;

    .line 75
    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mFloatLayout:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 77
    const-string v1, "window"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    iput-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mWindowManager:Landroid/view/WindowManager;

    .line 78
    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v1}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    iput-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    .line 79
    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v2, 0x807

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 80
    const/4 v2, 0x1

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 81
    const/16 v2, 0x8

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 82
    const v2, 0x800033

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 83
    const/16 v2, 0x258

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 84
    const/4 v2, -0x2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 85
    return-void
.end method

.method private setInfoText()V
    .locals 4

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 143
    .local v0, "text":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mLogInfoList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 144
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .end local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 146
    :cond_0
    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mTvInfo:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    return-void
.end method


# virtual methods
.method public hideFloatWindow()V
    .locals 2

    .line 134
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mFloatLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 135
    const-string v0, "CanLogFloatView"

    const-string v1, "hideFloatWindow"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mWindowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mFloatLayout:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    .line 137
    invoke-static {}, Lcom/yftech/vehicle/sdk/MpuProjectManager;->get()Lcom/yftech/vehicle/sdk/MpuProjectManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mMpuProjectListener:Lcom/yftech/vehicle/sdk/MpuProjectManager$MpuProjectListener;

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/MpuProjectManager;->unregisterListener(Lcom/yftech/vehicle/sdk/MpuProjectManager$MpuProjectListener;)V

    .line 139
    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .line 89
    invoke-direct {p0, p2}, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->floatLayoutTouch(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public showFloatWindow()V
    .locals 3

    .line 124
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mFloatLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_0

    .line 125
    const-string v0, "CanLogFloatView"

    const-string v1, "showFloatWindow"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v1, 0x0

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 127
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 128
    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mWindowManager:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mFloatLayout:Landroid/view/View;

    invoke-interface {v1, v2, v0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    invoke-static {}, Lcom/yftech/vehicle/sdk/MpuProjectManager;->get()Lcom/yftech/vehicle/sdk/MpuProjectManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/widget/CanLogFloatView;->mMpuProjectListener:Lcom/yftech/vehicle/sdk/MpuProjectManager$MpuProjectListener;

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/MpuProjectManager;->registerListener(Lcom/yftech/vehicle/sdk/MpuProjectManager$MpuProjectListener;)V

    .line 131
    :cond_0
    return-void
.end method
