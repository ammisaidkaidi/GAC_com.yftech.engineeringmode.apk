.class public Lcom/yftech/engineeringmode/widget/SeekBarNumber;
.super Landroid/support/v7/widget/AppCompatSeekBar;
.source "SeekBarNumber.java"


# instance fields
.field private mIsMoveOutside:Z

.field private mIsPaintProgress:Z

.field private mLetterSpace:Ljava/lang/String;

.field private mNumberMin:I

.field private mProgress:I

.field private mProgressPaint:Landroid/graphics/Paint;

.field private mSetVolume:Z

.field private mTextPaint:Landroid/graphics/Paint;

.field private mTextSize:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 25
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatSeekBar;-><init>(Landroid/content/Context;)V

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mNumberMin:I

    .line 18
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mSetVolume:Z

    .line 21
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsPaintProgress:Z

    .line 22
    const/high16 v1, 0x41c00000    # 24.0f

    iput v1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextSize:F

    .line 108
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsMoveOutside:Z

    .line 109
    iput v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mProgress:I

    .line 26
    invoke-direct {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->initTextPaint()V

    .line 27
    invoke-direct {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->initProgressPaint()V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 31
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/AppCompatSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mNumberMin:I

    .line 18
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mSetVolume:Z

    .line 21
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsPaintProgress:Z

    .line 22
    const/high16 v1, 0x41c00000    # 24.0f

    iput v1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextSize:F

    .line 108
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsMoveOutside:Z

    .line 109
    iput v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mProgress:I

    .line 32
    invoke-direct {p0, p1, p2}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setAttrsFromXml(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    invoke-direct {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->initTextPaint()V

    .line 34
    invoke-direct {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->initProgressPaint()V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/AppCompatSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mNumberMin:I

    .line 18
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mSetVolume:Z

    .line 21
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsPaintProgress:Z

    .line 22
    const/high16 v1, 0x41c00000    # 24.0f

    iput v1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextSize:F

    .line 108
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsMoveOutside:Z

    .line 109
    iput v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mProgress:I

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setAttrsFromXml(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    invoke-direct {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->initTextPaint()V

    .line 41
    invoke-direct {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->initProgressPaint()V

    .line 42
    return-void
.end method

.method private drawProgressPaint(ILandroid/graphics/Rect;Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "progress"    # I
    .param p2, "rectThumb"    # Landroid/graphics/Rect;
    .param p3, "canvas"    # Landroid/graphics/Canvas;

    .line 145
    const/4 v0, 0x0

    .line 146
    .local v0, "startX":I
    const/4 v1, 0x0

    .line 147
    .local v1, "startY":I
    const/4 v2, 0x0

    .line 148
    .local v2, "stopX":I
    const/4 v3, 0x0

    .line 149
    .local v3, "stopY":I
    if-nez p1, :cond_0

    .line 150
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getWidth()I

    move-result v4

    div-int/lit8 v0, v4, 0x2

    .line 151
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getHeight()I

    move-result v4

    div-int/lit8 v1, v4, 0x2

    .line 152
    iget v4, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    add-int v2, v4, v5

    .line 153
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getHeight()I

    move-result v4

    div-int/lit8 v3, v4, 0x2

    goto :goto_0

    .line 154
    :cond_0
    if-gez p1, :cond_1

    .line 155
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/lit8 v0, v4, 0x3

    .line 156
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getHeight()I

    move-result v4

    div-int/lit8 v1, v4, 0x2

    .line 157
    iget v4, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v5

    add-int v2, v4, v5

    .line 158
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getHeight()I

    move-result v4

    div-int/lit8 v3, v4, 0x2

    goto :goto_0

    .line 159
    :cond_1
    if-lez p1, :cond_2

    .line 160
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/lit8 v0, v4, -0x3

    .line 161
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getHeight()I

    move-result v4

    div-int/lit8 v1, v4, 0x2

    .line 162
    iget v2, p2, Landroid/graphics/Rect;->left:I

    .line 163
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getHeight()I

    move-result v4

    div-int/lit8 v3, v4, 0x2

    .line 165
    :cond_2
    :goto_0
    int-to-float v5, v0

    int-to-float v6, v1

    int-to-float v7, v2

    int-to-float v8, v3

    iget-object v9, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mProgressPaint:Landroid/graphics/Paint;

    move-object v4, p3

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 166
    return-void
.end method

.method private initProgressPaint()V
    .locals 2

    .line 135
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mProgressPaint:Landroid/graphics/Paint;

    .line 136
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mProgressPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 137
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mProgressPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40800000    # 4.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 138
    return-void
.end method

.method private initTextPaint()V
    .locals 2

    .line 51
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    .line 52
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 53
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    iget-object v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 55
    return-void
.end method

.method private setAttrsFromXml(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 58
    sget-object v0, Lcom/yftech/engineeringmode/R$styleable;->SeekBarNumber:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 59
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mLetterSpace:Ljava/lang/String;

    .line 60
    const/4 v1, 0x1

    const/high16 v2, 0x41c00000    # 24.0f

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iput v1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextSize:F

    .line 61
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 62
    return-void
.end method


# virtual methods
.method public getMoveOutsideProgress()I
    .locals 1

    .line 131
    iget v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mProgress:I

    return v0
.end method

.method public getNumberMin()I
    .locals 1

    .line 97
    iget v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mNumberMin:I

    return v0
.end method

.method public getSetVolume()Z
    .locals 1

    .line 105
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mSetVolume:Z

    return v0
.end method

.method public isMoveOutside()Z
    .locals 1

    .line 127
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsMoveOutside:Z

    return v0
.end method

.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    monitor-enter p0

    .line 66
    :try_start_0
    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatSeekBar;->onDraw(Landroid/graphics/Canvas;)V

    .line 69
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 70
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getProgress()I

    move-result v0

    iget v1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mNumberMin:I

    add-int/2addr v0, v1

    .line 71
    .local v0, "value":I
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 72
    .local v1, "number":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 73
    .local v2, "rect":Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mLetterSpace:Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 74
    const/16 v3, -0xa

    if-le v0, v3, :cond_1

    const/16 v3, 0xa

    if-lt v0, v3, :cond_0

    goto :goto_0

    .line 78
    :cond_0
    iget-object v3, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    const v4, 0x3d4ccccd    # 0.05f

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    goto :goto_1

    .line 75
    .end local p0    # "this":Lcom/yftech/engineeringmode/widget/SeekBarNumber;
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mLetterSpace:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    .line 81
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->isSelected()Z

    move-result v4

    if-eqz v4, :cond_3

    const v4, -0xef341b

    goto :goto_2

    :cond_3
    const/4 v4, -0x1

    :goto_2
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 82
    iget-object v3, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    .line 83
    .local v3, "fontwidth":F
    iget v4, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v3

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getThumbOffset()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v4, v5

    .line 84
    .local v4, "x":F
    iget v5, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    iget-object v7, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v7}, Landroid/graphics/Paint;->ascent()F

    move-result v7

    sub-float/2addr v5, v7

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v7

    int-to-float v7, v7

    iget-object v8, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v8}, Landroid/graphics/Paint;->descent()F

    move-result v8

    iget-object v9, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v9}, Landroid/graphics/Paint;->ascent()F

    move-result v9

    sub-float/2addr v8, v9

    sub-float/2addr v7, v8

    div-float/2addr v7, v6

    add-float/2addr v5, v7

    .line 85
    .local v5, "y":F
    iget-object v6, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 86
    iget-boolean v6, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsPaintProgress:Z

    if-eqz v6, :cond_4

    .line 87
    invoke-direct {p0, v0, v2, p1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->drawProgressPaint(ILandroid/graphics/Rect;Landroid/graphics/Canvas;)V

    .line 89
    :cond_4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    monitor-exit p0

    return-void

    .line 65
    .end local v0    # "value":I
    .end local v1    # "number":Ljava/lang/String;
    .end local v2    # "rect":Landroid/graphics/Rect;
    .end local v3    # "fontwidth":F
    .end local v4    # "x":F
    .end local v5    # "y":F
    .end local p1    # "canvas":Landroid/graphics/Canvas;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 112
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    const/high16 v1, -0x3cea0000    # -150.0f

    cmpg-float v0, v0, v1

    const/4 v1, 0x1

    if-ltz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getWidth()I

    move-result v2

    add-int/lit16 v2, v2, 0x96

    int-to-float v2, v2

    cmpl-float v0, v0, v2

    if-gtz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    const/high16 v2, -0x3e100000    # -30.0f

    cmpg-float v0, v0, v2

    if-ltz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getHeight()I

    move-result v2

    add-int/lit8 v2, v2, 0x1e

    int-to-float v2, v2

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1

    .line 113
    :cond_0
    iput-boolean v1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsMoveOutside:Z

    .line 114
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getProgress()I

    move-result v0

    iput v0, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mProgress:I

    .line 117
    :cond_1
    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatSeekBar;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 119
    .local v0, "ret":Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-ne v2, v1, :cond_2

    .line 120
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsMoveOutside:Z

    .line 123
    :cond_2
    return v0
.end method

.method public setNumberMin(I)V
    .locals 0
    .param p1, "min"    # I

    .line 93
    iput p1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mNumberMin:I

    .line 94
    return-void
.end method

.method public setPaintProgress(Z)V
    .locals 0
    .param p1, "isPaintProgress"    # Z

    .line 141
    iput-boolean p1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mIsPaintProgress:Z

    .line 142
    return-void
.end method

.method public setSetVolume(Z)V
    .locals 0
    .param p1, "set"    # Z

    .line 101
    iput-boolean p1, p0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->mSetVolume:Z

    .line 102
    return-void
.end method
