.class public Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
.super Landroid/app/Dialog;
.source "ScreenTpTestDialog.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;
    }
.end annotation


# static fields
.field private static final AUTO_BRIGHTNESS_INTERVAL_TIME:I = 0x64

.field private static final AUTO_BRIGHTNESS_TOTAL_TIME:I = 0x7d0

.field private static final TAG:Ljava/lang/String; = "ScreenTpTestDialog"


# instance fields
.field private AUTO_BRIGHTNESS_STEP_VALUE:I

.field private count:I

.field private heightCount:I

.field private isLongTouch:Z

.field private mAutoBrightnessEnable:Z

.field private final mAutoBrightnessHandler:Landroid/os/Handler;

.field private final mAutoBrightnessRunnable:Ljava/lang/Runnable;

.field private mAutoBrightnessStep:I

.field private mContext:Landroid/content/Context;

.field private mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private mGridView:Landroid/widget/GridView;

.field private mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;",
            ">;"
        }
    .end annotation
.end field

.field private mMaxBrightness:I

.field private mMinBrightness:I

.field private mRestBrightness:I

.field private screenTpGridViewAdapter:Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

.field private widthCount:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 74
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->isLongTouch:Z

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mList:Ljava/util/List;

    .line 48
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$1;-><init>(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 118
    const/4 v0, 0x1

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->AUTO_BRIGHTNESS_STEP_VALUE:I

    .line 126
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessHandler:Landroid/os/Handler;

    .line 143
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$2;-><init>(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessRunnable:Ljava/lang/Runnable;

    .line 75
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mContext:Landroid/content/Context;

    .line 76
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Landroid/widget/GridView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mGridView:Landroid/widget/GridView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->AUTO_BRIGHTNESS_STEP_VALUE:I

    return v0
.end method

.method static synthetic access$1100(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mMinBrightness:I

    return v0
.end method

.method static synthetic access$1200(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->heightCount:I

    return v0
.end method

.method static synthetic access$202(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
    .param p1, "x1"    # I

    .line 33
    iput p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->heightCount:I

    return p1
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->widthCount:I

    return v0
.end method

.method static synthetic access$302(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
    .param p1, "x1"    # I

    .line 33
    iput p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->widthCount:I

    return p1
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->count:I

    return v0
.end method

.method static synthetic access$402(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
    .param p1, "x1"    # I

    .line 33
    iput p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->count:I

    return p1
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$600(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->screenTpGridViewAdapter:Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

    return-object v0
.end method

.method static synthetic access$602(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;)Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
    .param p1, "x1"    # Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

    .line 33
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->screenTpGridViewAdapter:Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

    return-object p1
.end method

.method static synthetic access$700(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$800(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mMaxBrightness:I

    return v0
.end method

.method static synthetic access$900(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    .line 33
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessStep:I

    return v0
.end method

.method static synthetic access$902(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
    .param p1, "x1"    # I

    .line 33
    iput p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessStep:I

    return p1
.end method

.method private startAutoBrightness()V
    .locals 4

    .line 129
    invoke-static {}, Lcom/yftech/engineeringmode/util/Utils;->getScreenTpAutoBrightnessEnable()Z

    move-result v0

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessEnable:Z

    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "startAutoBrightness() autoBrightnessEnable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessEnable:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ScreenTpTestDialog"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessEnable:Z

    if-eqz v0, :cond_0

    .line 132
    invoke-static {}, Lcom/yftech/car/screen/CarScreenManager;->getInstance()Lcom/yftech/car/screen/CarScreenManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/screen/CarScreenManager;->getBrightnessMaxValue()I

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mMaxBrightness:I

    .line 133
    const/4 v0, 0x0

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mMinBrightness:I

    .line 134
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mMaxBrightness:I

    div-int/lit8 v0, v0, 0x14

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->AUTO_BRIGHTNESS_STEP_VALUE:I

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startAutoBrightness() maxBrightness="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mMaxBrightness:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " minBrightness="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mMinBrightness:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " AUTO_BRIGHTNESS_STEP_VALUE="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->AUTO_BRIGHTNESS_STEP_VALUE:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->AUTO_BRIGHTNESS_STEP_VALUE:I

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessStep:I

    .line 137
    invoke-static {}, Lcom/yftech/car/screen/CarScreenManager;->getInstance()Lcom/yftech/car/screen/CarScreenManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/screen/CarScreenManager;->getBrightness()I

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mRestBrightness:I

    .line 138
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 139
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 141
    :cond_0
    return-void
.end method

.method private stopAutoBrightness()V
    .locals 2

    .line 166
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessEnable:Z

    if-eqz v0, :cond_0

    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "stopAutoBrightness() restBrightness="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mRestBrightness:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ScreenTpTestDialog"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mAutoBrightnessRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 169
    invoke-static {}, Lcom/yftech/car/screen/CarScreenManager;->getInstance()Lcom/yftech/car/screen/CarScreenManager;

    move-result-object v0

    iget v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mRestBrightness:I

    invoke-virtual {v0, v1}, Lcom/yftech/car/screen/CarScreenManager;->setBrightness(I)Z

    .line 171
    :cond_0
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 82
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 84
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c0033

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 85
    .local v0, "root":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->setContentView(Landroid/view/View;)V

    .line 86
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 87
    .local v1, "window":Landroid/view/Window;
    if-eqz v1, :cond_0

    .line 88
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 89
    .local v2, "params":Landroid/view/WindowManager$LayoutParams;
    const/16 v3, 0x8

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 90
    const/16 v3, 0x11

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 91
    const/4 v3, -0x1

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 92
    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 93
    const/16 v3, 0x807

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 94
    invoke-virtual {v1, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 96
    .end local v2    # "params":Landroid/view/WindowManager$LayoutParams;
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->setCanceledOnTouchOutside(Z)V

    .line 97
    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->setCancelable(Z)V

    .line 99
    const v2, 0x7f09009b

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/GridView;

    iput-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mGridView:Landroid/widget/GridView;

    .line 100
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2}, Landroid/widget/GridView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 101
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2, p0}, Landroid/widget/GridView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 102
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2, p0}, Landroid/widget/GridView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 104
    return-void
.end method

.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 7
    .param p2, "view"    # Landroid/view/View;
    .param p3, "i"    # I
    .param p4, "l"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .line 228
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    if-ne p3, v0, :cond_0

    .line 229
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->dismiss()V

    goto :goto_1

    .line 230
    :cond_0
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->widthCount:I

    iget v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->heightCount:I

    sub-int/2addr v3, v1

    mul-int/2addr v0, v3

    if-ne p3, v0, :cond_2

    .line 231
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;

    .line 232
    .local v3, "touch":Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;
    invoke-virtual {v3, v2}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;->setSelect(Z)V

    .line 233
    .end local v3    # "touch":Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;
    goto :goto_0

    .line 234
    :cond_1
    new-instance v0, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mList:Ljava/util/List;

    iget v5, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->widthCount:I

    iget v6, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->heightCount:I

    invoke-direct {v0, v3, v4, v5, v6}, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;-><init>(Landroid/content/Context;Ljava/util/List;II)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->screenTpGridViewAdapter:Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

    .line 235
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mGridView:Landroid/widget/GridView;

    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->screenTpGridViewAdapter:Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

    invoke-virtual {v0, v3}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 236
    iput-boolean v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->isLongTouch:Z

    .line 237
    const-string v0, "ScreenTpTestDialog"

    const-string v1, "TouchScreen is clear"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    :cond_2
    :goto_1
    return v2
.end method

.method protected onStart()V
    .locals 0

    .line 108
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 109
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->startAutoBrightness()V

    .line 110
    return-void
.end method

.method protected onStop()V
    .locals 0

    .line 114
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 115
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->stopAutoBrightness()V

    .line 116
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .line 176
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 177
    .local v0, "currentXPosition":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 179
    .local v1, "currentYPosition":F
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mGridView:Landroid/widget/GridView;

    float-to-int v3, v0

    float-to-int v4, v1

    invoke-virtual {v2, v3, v4}, Landroid/widget/GridView;->pointToPosition(II)I

    move-result v2

    .line 180
    .local v2, "position":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v3, :cond_6

    if-eq v3, v6, :cond_0

    const/4 v7, 0x2

    if-eq v3, v7, :cond_6

    goto :goto_1

    .line 193
    :cond_0
    iget-boolean v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->isLongTouch:Z

    if-eqz v3, :cond_1

    .line 194
    iput-boolean v5, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->isLongTouch:Z

    .line 195
    return v5

    .line 197
    :cond_1
    if-ne v2, v4, :cond_2

    goto :goto_1

    .line 199
    :cond_2
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;

    invoke-virtual {v3, v6}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;->setSelect(Z)V

    .line 200
    const/4 v3, 0x0

    .line 201
    .local v3, "a":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget-object v6, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mList:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v4, v6, :cond_5

    .line 203
    iget-object v6, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mList:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;

    invoke-virtual {v6}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;->isSelect()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 204
    add-int/lit8 v3, v3, 0x1

    .line 207
    :cond_3
    iget-object v6, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mList:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ne v3, v6, :cond_4

    .line 208
    iget-object v6, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mContext:Landroid/content/Context;

    const-string v7, "\u6d4b\u8bd5\u901a\u8fc7\uff01"

    invoke-static {v6, v7, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 209
    new-instance v6, Landroid/os/Handler;

    invoke-direct {v6}, Landroid/os/Handler;-><init>()V

    .line 210
    .local v6, "handler":Landroid/os/Handler;
    new-instance v7, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$3;

    invoke-direct {v7, p0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$3;-><init>(Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;)V

    const-wide/16 v8, 0x3e8

    invoke-virtual {v6, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 201
    .end local v6    # "handler":Landroid/os/Handler;
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 219
    .end local v3    # "a":I
    .end local v4    # "i":I
    :cond_5
    goto :goto_1

    .line 183
    :cond_6
    iget-boolean v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->isLongTouch:Z

    if-eqz v3, :cond_7

    .line 184
    goto :goto_1

    .line 186
    :cond_7
    if-ne v2, v4, :cond_8

    goto :goto_1

    .line 189
    :cond_8
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->mList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;

    invoke-virtual {v3, v6}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog$TouchScreenBean;->setSelect(Z)V

    .line 191
    nop

    .line 222
    :goto_1
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->screenTpGridViewAdapter:Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;

    invoke-virtual {v3}, Lcom/yftech/engineeringmode/adapter/ScreenTpGridViewAdapter;->notifyDataSetChanged()V

    .line 223
    return v5
.end method
