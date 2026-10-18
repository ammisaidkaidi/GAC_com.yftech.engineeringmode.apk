.class public Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;
.super Landroid/app/Dialog;
.source "ScreenDisplayDetectionDialog.java"


# static fields
.field public static final BLACK_TO_WHITE_GRADIENT:I = 0x3e8

.field public static final DETECTION_MODE_AUTO_CYCLIC_COLOR:I = 0x1

.field public static final DETECTION_MODE_MANUAL_SWITCHING_COLOR:I = 0x2

.field public static final DETECTION_MODE_SINGLE_COLOR:I = 0x0

.field private static final INTERVAL:I = 0xbb8


# instance fields
.field private mColors:[I

.field private mGradientBlackToWhite:Landroid/graphics/drawable/GradientDrawable;

.field private mHandler:Landroid/os/Handler;

.field private mIndex:I

.field private mMode:I

.field private mRunnable:Ljava/lang/Runnable;

.field private mStartIndex:I

.field private mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .line 56
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 28
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v2, 0x2

    new-array v3, v2, [I

    .line 29
    const/4 v4, 0x0

    invoke-static {v4, v4, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v5

    aput v5, v3, v4

    const/16 v5, 0xff

    invoke-static {v5, v5, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    const/4 v7, 0x1

    aput v6, v3, v7

    invoke-direct {v0, v1, v3}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mGradientBlackToWhite:Landroid/graphics/drawable/GradientDrawable;

    .line 30
    const/4 v0, 0x6

    new-array v0, v0, [I

    invoke-static {v5, v5, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    aput v1, v0, v4

    .line 31
    invoke-static {v4, v4, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    aput v1, v0, v7

    const/16 v1, 0x3e8

    aput v1, v0, v2

    .line 33
    invoke-static {v5, v4, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 34
    invoke-static {v4, v5, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    const/4 v2, 0x4

    aput v1, v0, v2

    .line 35
    invoke-static {v4, v4, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    const/4 v2, 0x5

    aput v1, v0, v2

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mColors:[I

    .line 37
    iput v4, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mStartIndex:I

    .line 38
    iput v4, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    .line 39
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mHandler:Landroid/os/Handler;

    .line 43
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog$1;-><init>(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mRunnable:Ljava/lang/Runnable;

    .line 57
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    .line 19
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    return v0
.end method

.method static synthetic access$002(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;
    .param p1, "x1"    # I

    .line 19
    iput p1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    return p1
.end method

.method static synthetic access$008(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)I
    .locals 2
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    .line 19
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    return v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)[I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    .line 19
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mColors:[I

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;I)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;
    .param p1, "x1"    # I

    .line 19
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->setBackgroundColor(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    .line 19
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    .line 19
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private setBackgroundColor(I)V
    .locals 2
    .param p1, "color"    # I

    .line 135
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mView:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 136
    const/16 v1, 0x3e8

    if-ne p1, v1, :cond_0

    .line 137
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mGradientBlackToWhite:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 139
    :cond_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 142
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 2

    .line 110
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 111
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 112
    return-void
.end method

.method public synthetic lambda$onCreate$0$ScreenDisplayDetectionDialog(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .line 80
    iget v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 81
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->next()Z

    move-result v0

    .local v0, "isDismiss":Z
    goto :goto_0

    .line 83
    .end local v0    # "isDismiss":Z
    :cond_0
    const/4 v0, 0x1

    .line 85
    .restart local v0    # "isDismiss":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 86
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->dismiss()V

    .line 88
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public next()Z
    .locals 3

    .line 93
    const/4 v0, 0x0

    .line 94
    .local v0, "isDismiss":Z
    iget v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mMode:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 95
    iget v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    .line 96
    iget v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mColors:[I

    array-length v2, v2

    if-lt v1, v2, :cond_0

    .line 97
    const/4 v1, 0x0

    iput v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    .line 99
    :cond_0
    iget v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mStartIndex:I

    iget v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    if-ne v1, v2, :cond_1

    .line 100
    const/4 v0, 0x1

    goto :goto_0

    .line 102
    :cond_1
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mColors:[I

    aget v1, v1, v2

    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->setBackgroundColor(I)V

    .line 105
    :cond_2
    :goto_0
    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 61
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 62
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->requestWindowFeature(I)Z

    .line 63
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c0032

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 64
    .local v0, "root":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->setContentView(Landroid/view/View;)V

    .line 65
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 66
    .local v1, "window":Landroid/view/Window;
    if-eqz v1, :cond_0

    .line 67
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 68
    .local v2, "params":Landroid/view/WindowManager$LayoutParams;
    const/16 v3, 0x8

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 69
    const/16 v3, 0x11

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 70
    const/4 v3, -0x1

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 71
    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 72
    const/16 v3, 0x807

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 73
    invoke-virtual {v1, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 75
    .end local v2    # "params":Landroid/view/WindowManager$LayoutParams;
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->setCanceledOnTouchOutside(Z)V

    .line 76
    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->setCancelable(Z)V

    .line 77
    const v2, 0x7f0900af

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mView:Landroid/view/View;

    .line 78
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mView:Landroid/view/View;

    new-instance v3, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ScreenDisplayDetectionDialog$CG7Yb1VTiCcsi9XY2fR_9RtMENg;

    invoke-direct {v3, p0}, Lcom/yftech/engineeringmode/dialog/-$$Lambda$ScreenDisplayDetectionDialog$CG7Yb1VTiCcsi9XY2fR_9RtMENg;-><init>(Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 90
    return-void
.end method

.method public showColor(II)V
    .locals 4
    .param p1, "color"    # I
    .param p2, "mode"    # I

    .line 115
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->show()V

    .line 116
    iput p2, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mMode:I

    .line 117
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->setBackgroundColor(I)V

    .line 118
    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    const/4 v1, 0x2

    if-ne p2, v1, :cond_3

    .line 119
    :cond_0
    const/4 v1, 0x0

    iput v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    .line 120
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mColors:[I

    array-length v3, v2

    if-ge v1, v3, :cond_2

    .line 121
    aget v2, v2, v1

    if-ne p1, v2, :cond_1

    .line 122
    iput v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    .line 123
    goto :goto_1

    .line 120
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 126
    .end local v1    # "i":I
    :cond_2
    :goto_1
    iget v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mIndex:I

    iput v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mStartIndex:I

    .line 127
    if-ne p2, v0, :cond_3

    .line 128
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 129
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->mRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 132
    :cond_3
    return-void
.end method
