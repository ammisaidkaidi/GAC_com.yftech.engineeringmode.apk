.class public Lcom/yftech/engineeringmode/fragment/EQFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "EQFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final BANDS:[I

.field private static final BAND_MAX_VALUE:F = 15.0f

.field private static final BAND_MIN_VALUE:F = -15.0f

.field private static final CUSTOM_BAND_PRESET_TYPE:I = 0xa

.field private static final EQ_FREQ_KEY:Ljava/lang/String; = "eq.freq"

.field private static final EQ_GAIN_KEY:Ljava/lang/String; = "eq.gain"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private freq:[I

.field private freqEditTexts:[Landroid/widget/EditText;

.field private gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

.field private gains:[I

.field private isEmpty:Z

.field private layoutBand0:Landroid/widget/LinearLayout;

.field private layoutBand1:Landroid/widget/LinearLayout;

.field private layoutBand2:Landroid/widget/LinearLayout;

.field private layoutBand3:Landroid/widget/LinearLayout;

.field private layoutBand4:Landroid/widget/LinearLayout;

.field private layoutBand5:Landroid/widget/LinearLayout;

.field private layoutBand6:Landroid/widget/LinearLayout;

.field private layoutBand7:Landroid/widget/LinearLayout;

.field private layoutBand8:Landroid/widget/LinearLayout;

.field private layoutBand9:Landroid/widget/LinearLayout;

.field private tempFreq:[I

.field private tempGains:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    const-class v0, Lcom/yftech/engineeringmode/fragment/EQFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/EQFragment;->TAG:Ljava/lang/String;

    .line 66
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/EQFragment;->BANDS:[I

    return-void

    :array_0
    .array-data 4
        0x1f
        0x3e
        0x7d
        0xfa
        0x1f4
        0x3e8
        0x7d0
        0xfa0
        0x1f40
        0x3e80
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 29
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 47
    const/16 v0, 0xa

    new-array v1, v0, [Landroid/widget/EditText;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    .line 48
    new-array v1, v0, [Lcom/yftech/engineeringmode/widget/GainEditText;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    .line 49
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freq:[I

    .line 50
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gains:[I

    .line 53
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->isEmpty:Z

    .line 57
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->tempFreq:[I

    .line 61
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->tempGains:[I

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/EQFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/EQFragment;

    .line 29
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->setEq()V

    return-void
.end method

.method private addFreqOne(Landroid/widget/EditText;)V
    .locals 4
    .param p1, "editText"    # Landroid/widget/EditText;

    .line 455
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 456
    .local v0, "num":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 457
    const/4 v1, 0x1

    .local v1, "src":I
    goto :goto_0

    .line 459
    .end local v1    # "src":I
    :cond_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 460
    .restart local v1    # "src":I
    add-int/lit8 v1, v1, 0x1

    .line 462
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 463
    return-void
.end method

.method private addGainOne(Landroid/widget/EditText;)V
    .locals 4
    .param p1, "editText"    # Landroid/widget/EditText;

    .line 484
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 485
    .local v0, "num":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 486
    const/4 v1, 0x0

    .local v1, "src":I
    goto :goto_0

    .line 488
    .end local v1    # "src":I
    :cond_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 490
    .restart local v1    # "src":I
    const/16 v2, 0xf

    if-ge v1, v2, :cond_1

    .line 493
    add-int/lit8 v1, v1, 0x1

    .line 496
    :cond_1
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 497
    return-void
.end method

.method private copyIntArray([II[III)V
    .locals 3
    .param p1, "src"    # [I
    .param p2, "srcOffset"    # I
    .param p3, "des"    # [I
    .param p4, "desOffset"    # I
    .param p5, "length"    # I

    .line 551
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p5, :cond_0

    .line 552
    add-int v1, v0, p4

    add-int v2, v0, p2

    aget v2, p1, v2

    aput v2, p3, v1

    .line 551
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 554
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private decFreqOne(Landroid/widget/EditText;)V
    .locals 4
    .param p1, "editText"    # Landroid/widget/EditText;

    .line 441
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 442
    .local v0, "num":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 443
    const/4 v1, 0x1

    .local v1, "src":I
    goto :goto_0

    .line 445
    .end local v1    # "src":I
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 446
    .restart local v1    # "src":I
    const/4 v2, 0x1

    if-le v1, v2, :cond_1

    .line 447
    add-int/lit8 v1, v1, -0x1

    .line 450
    :cond_1
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 451
    return-void
.end method

.method private decGainOne(Landroid/widget/EditText;)V
    .locals 4
    .param p1, "editText"    # Landroid/widget/EditText;

    .line 467
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 468
    .local v0, "num":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 469
    const/4 v1, 0x0

    .local v1, "src":I
    goto :goto_0

    .line 471
    .end local v1    # "src":I
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 473
    .restart local v1    # "src":I
    const/16 v2, -0xf

    if-le v1, v2, :cond_1

    .line 476
    add-int/lit8 v1, v1, -0x1

    .line 479
    :cond_1
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 480
    return-void
.end method

.method private getFreqValues([Landroid/widget/EditText;)[I
    .locals 5
    .param p1, "freqEditTexts"    # [Landroid/widget/EditText;

    .line 600
    const/16 v0, 0xa

    new-array v0, v0, [I

    .line 602
    .local v0, "freq":[I
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_0
    :try_start_0
    array-length v3, p1

    if-ge v2, v3, :cond_0

    .line 603
    aget-object v3, p1, v2

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aput v3, v0, v2

    .line 602
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 605
    .end local v2    # "i":I
    :cond_0
    iput-boolean v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->isEmpty:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 611
    goto :goto_1

    .line 606
    :catch_0
    move-exception v1

    .line 607
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 608
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->isEmpty:Z

    .line 609
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->tempFreq:[I

    array-length v4, v3

    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    .line 610
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f0e0072

    invoke-virtual {p0, v4}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 612
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    sget-object v1, Lcom/yftech/engineeringmode/fragment/EQFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getFreqValues: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    return-object v0
.end method

.method private getGainValues([Landroid/widget/EditText;)[I
    .locals 5
    .param p1, "gainEditTexts"    # [Landroid/widget/EditText;

    .line 623
    const/16 v0, 0xa

    new-array v0, v0, [I

    .line 625
    .local v0, "gains":[I
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_0
    :try_start_0
    array-length v3, p1

    if-ge v2, v3, :cond_0

    .line 626
    aget-object v3, p1, v2

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aput v3, v0, v2

    .line 625
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 628
    .end local v2    # "i":I
    :cond_0
    iput-boolean v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->isEmpty:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 634
    goto :goto_1

    .line 629
    :catch_0
    move-exception v1

    .line 630
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 631
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->isEmpty:Z

    .line 632
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->tempGains:[I

    array-length v4, v3

    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    .line 633
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f0e0072

    invoke-virtual {p0, v4}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 635
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    sget-object v1, Lcom/yftech/engineeringmode/fragment/EQFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getGainValues: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 636
    return-object v0
.end method

.method private initData()V
    .locals 5

    .line 253
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "eq.freq"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 254
    .local v0, "freqString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "eq.gain"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 255
    .local v1, "gainString":Ljava/lang/String;
    sget-object v2, Lcom/yftech/engineeringmode/fragment/EQFragment;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initData: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " -- "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    if-nez v0, :cond_1

    .line 257
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    array-length v4, v3

    if-ge v2, v4, :cond_0

    .line 258
    aget-object v3, v3, v2

    sget-object v4, Lcom/yftech/engineeringmode/fragment/EQFragment;->BANDS:[I

    aget v4, v4, v2

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 257
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v2    # "i":I
    :cond_0
    goto :goto_1

    .line 261
    :cond_1
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    invoke-direct {p0, v0, v2}, Lcom/yftech/engineeringmode/fragment/EQFragment;->intStringToIntArray(Ljava/lang/String;[Landroid/widget/EditText;)V

    .line 263
    :goto_1
    if-eqz v1, :cond_2

    .line 264
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    invoke-direct {p0, v1, v2}, Lcom/yftech/engineeringmode/fragment/EQFragment;->intStringToIntArray(Ljava/lang/String;[Landroid/widget/EditText;)V

    .line 266
    :cond_2
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getFreqValues([Landroid/widget/EditText;)[I

    move-result-object v2

    iput-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->tempFreq:[I

    .line 267
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    invoke-direct {p0, v2}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getGainValues([Landroid/widget/EditText;)[I

    move-result-object v2

    iput-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->tempGains:[I

    .line 269
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 11
    .param p1, "root"    # Landroid/view/View;

    .line 89
    const v0, 0x7f090079

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    .line 90
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    const v2, 0x7f09016b

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v3, "Band0"

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    const v4, 0x7f090032

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    const/4 v5, 0x0

    aput-object v3, v0, v5

    .line 92
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    const v5, 0x7f090035

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/yftech/engineeringmode/widget/GainEditText;

    const/4 v6, 0x0

    aput-object v3, v0, v6

    .line 93
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    const v3, 0x7f090034

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 94
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    const v6, 0x7f090033

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 95
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    const v7, 0x7f090037

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 96
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    const v8, 0x7f090036

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 97
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand0:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    const v0, 0x7f09007a

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    .line 104
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v9, "Band1"

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    const/4 v10, 0x1

    aput-object v9, v0, v10

    .line 106
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/yftech/engineeringmode/widget/GainEditText;

    aput-object v9, v0, v10

    .line 107
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 108
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 109
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 110
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 111
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    const v0, 0x7f09007b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    .line 118
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v9, "Band2"

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    const/4 v10, 0x2

    aput-object v9, v0, v10

    .line 120
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/yftech/engineeringmode/widget/GainEditText;

    aput-object v9, v0, v10

    .line 121
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 122
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 123
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 124
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 125
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand2:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    const v0, 0x7f09007c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    .line 132
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v9, "Band3"

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    const/4 v10, 0x3

    aput-object v9, v0, v10

    .line 134
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/yftech/engineeringmode/widget/GainEditText;

    aput-object v9, v0, v10

    .line 135
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 136
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 137
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 138
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 139
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 142
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand3:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    const v0, 0x7f09007d

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    .line 145
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v9, "Band4"

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    const/4 v10, 0x4

    aput-object v9, v0, v10

    .line 147
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/yftech/engineeringmode/widget/GainEditText;

    aput-object v9, v0, v10

    .line 148
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 149
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 150
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 151
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 152
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 155
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand4:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    const v0, 0x7f09007e

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    .line 159
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v9, "Band5"

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    const/4 v10, 0x5

    aput-object v9, v0, v10

    .line 161
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/yftech/engineeringmode/widget/GainEditText;

    aput-object v9, v0, v10

    .line 162
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 163
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 164
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 165
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 166
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand5:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    const v0, 0x7f09007f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    .line 173
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v9, "Band6"

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    const/4 v10, 0x6

    aput-object v9, v0, v10

    .line 175
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/yftech/engineeringmode/widget/GainEditText;

    aput-object v9, v0, v10

    .line 176
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 177
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 178
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 179
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 180
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 181
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand6:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    const v0, 0x7f090080

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    .line 187
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const-string v9, "Band7"

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    const/4 v10, 0x7

    aput-object v9, v1, v10

    .line 189
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    iget-object v9, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/yftech/engineeringmode/widget/GainEditText;

    aput-object v9, v1, v10

    .line 190
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v1, v9}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 191
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v1, v9}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 192
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v1, v9}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 193
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 194
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 196
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 197
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand7:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    const v0, 0x7f090081

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    .line 201
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "Band8"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const/16 v9, 0x8

    aput-object v1, v0, v9

    .line 203
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/yftech/engineeringmode/widget/GainEditText;

    aput-object v1, v0, v9

    .line 204
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090081

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 205
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090081

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 206
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090081

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 207
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090081

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 208
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 209
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand8:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 214
    const v0, 0x7f090082

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    .line 215
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "Band9"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 216
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    .line 217
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/yftech/engineeringmode/widget/GainEditText;

    aput-object v1, v0, v2

    .line 218
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090082

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 219
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090082

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 220
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090082

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 221
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090082

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 222
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 223
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->layoutBand9:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 227
    const v0, 0x7f090041

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/EQFragment$1;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/EQFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/EQFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 234
    return-void
.end method

.method private intStringToIntArray(Ljava/lang/String;[Landroid/widget/EditText;)V
    .locals 5
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "editTexts"    # [Landroid/widget/EditText;

    .line 641
    const-string v0, ","

    .line 643
    .local v0, "regex":Ljava/lang/String;
    const-string v1, "(?:\\[|null|\\]| +)"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 644
    .local v1, "strings":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p2

    if-ge v2, v3, :cond_0

    .line 645
    aget-object v3, p2, v2

    aget-object v4, v1, v2

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 644
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 647
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method private setBandGains([I[IIZ)Z
    .locals 18
    .param p1, "freq"    # [I
    .param p2, "gains"    # [I
    .param p3, "presetType"    # I
    .param p4, "enable"    # Z

    .line 500
    move/from16 v0, p3

    move/from16 v1, p4

    const/16 v2, 0x1d4

    new-array v2, v2, [I

    .line 502
    .local v2, "eqValues":[I
    const/4 v9, 0x5

    new-array v3, v9, [I

    fill-array-data v3, :array_0

    move-object v10, v3

    .line 504
    .local v10, "minGainIndex":[I
    new-array v3, v9, [I

    fill-array-data v3, :array_1

    move-object v11, v3

    .line 506
    .local v11, "maxGainIndex":[I
    new-array v3, v9, [I

    fill-array-data v3, :array_2

    move-object v12, v3

    .line 508
    .local v12, "minQIndex":[I
    new-array v3, v9, [I

    fill-array-data v3, :array_3

    move-object v13, v3

    .line 510
    .local v13, "maxQIndex":[I
    const/16 v3, 0xa

    new-array v4, v3, [I

    fill-array-data v4, :array_4

    move-object v14, v4

    .line 512
    .local v14, "defaultPositiveQ":[I
    new-array v4, v3, [I

    fill-array-data v4, :array_5

    move-object v15, v4

    .line 514
    .local v15, "defaultNegativeQ":[I
    const/16 v16, 0x0

    aput v1, v2, v16

    .line 516
    const/4 v8, 0x1

    aput v3, v2, v8

    .line 518
    const/4 v3, 0x2

    aput v0, v2, v3

    .line 520
    const/4 v5, 0x0

    const/4 v7, 0x3

    const/16 v17, 0xa

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object v6, v2

    move/from16 v8, v17

    invoke-direct/range {v3 .. v8}, Lcom/yftech/engineeringmode/fragment/EQFragment;->copyIntArray([II[III)V

    .line 521
    const/16 v7, 0x22

    const/16 v8, 0xa

    invoke-direct/range {v3 .. v8}, Lcom/yftech/engineeringmode/fragment/EQFragment;->copyIntArray([II[III)V

    .line 522
    const/16 v7, 0x41

    invoke-direct/range {v3 .. v8}, Lcom/yftech/engineeringmode/fragment/EQFragment;->copyIntArray([II[III)V

    .line 523
    const/16 v7, 0x60

    invoke-direct/range {v3 .. v8}, Lcom/yftech/engineeringmode/fragment/EQFragment;->copyIntArray([II[III)V

    .line 524
    const/16 v7, 0x7f

    invoke-direct/range {v3 .. v8}, Lcom/yftech/engineeringmode/fragment/EQFragment;->copyIntArray([II[III)V

    .line 526
    const/16 v7, 0x139

    move-object/from16 v4, p2

    invoke-direct/range {v3 .. v8}, Lcom/yftech/engineeringmode/fragment/EQFragment;->copyIntArray([II[III)V

    .line 527
    const/16 v7, 0x158

    invoke-direct/range {v3 .. v8}, Lcom/yftech/engineeringmode/fragment/EQFragment;->copyIntArray([II[III)V

    .line 528
    const/16 v7, 0x177

    invoke-direct/range {v3 .. v8}, Lcom/yftech/engineeringmode/fragment/EQFragment;->copyIntArray([II[III)V

    .line 529
    const/16 v7, 0x196

    invoke-direct/range {v3 .. v8}, Lcom/yftech/engineeringmode/fragment/EQFragment;->copyIntArray([II[III)V

    .line 530
    const/16 v7, 0x1b5

    invoke-direct/range {v3 .. v8}, Lcom/yftech/engineeringmode/fragment/EQFragment;->copyIntArray([II[III)V

    .line 532
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v9, :cond_2

    .line 533
    const/4 v4, 0x0

    .local v4, "j":I
    aget v5, v12, v3

    .local v5, "qIndex":I
    aget v6, v10, v3

    .line 534
    .local v6, "gainIndex":I
    :goto_1
    aget v7, v13, v3

    if-gt v5, v7, :cond_1

    aget v7, v11, v3

    if-gt v6, v7, :cond_1

    .line 535
    aget v7, v2, v6

    const/16 v8, 0xf

    if-lt v7, v8, :cond_0

    .line 536
    aget v7, v14, v4

    aput v7, v2, v5

    goto :goto_2

    .line 538
    :cond_0
    aget v7, v15, v4

    aput v7, v2, v5

    .line 534
    :goto_2
    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 532
    .end local v4    # "j":I
    .end local v5    # "qIndex":I
    .end local v6    # "gainIndex":I
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 542
    .end local v3    # "i":I
    :cond_2
    array-length v3, v2

    const/4 v4, 0x1

    invoke-static {v4, v2, v3}, Lcom/autochips/audiosettings/AudioSettings;->SetValue(I[II)I

    move-result v3

    .line 543
    .local v3, "ret":I
    if-eqz v3, :cond_3

    .line 544
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setBandGains, failed: presetType:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", enable:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/yftech/car/utils/Loger;->e(Ljava/lang/String;)V

    .line 545
    return v16

    .line 547
    :cond_3
    return v4

    nop

    :array_0
    .array-data 4
        0x139
        0x158
        0x177
        0x196
        0x1b5
    .end array-data

    :array_1
    .array-data 4
        0x142
        0x161
        0x180
        0x19f
        0x1be
    .end array-data

    :array_2
    .array-data 4
        0x9e
        0xbd
        0xdc
        0xfb
        0x11a
    .end array-data

    :array_3
    .array-data 4
        0xa7
        0xc6
        0xe5
        0x104
        0x123
    .end array-data

    :array_4
    .array-data 4
        0xc8
        0xc8
        0xc8
        0xc8
        0xc8
        0xc8
        0xc8
        0xc8
        0xc8
        0xc8
    .end array-data

    :array_5
    .array-data 4
        0x32
        0x32
        0x32
        0x32
        0x32
        0x32
        0x32
        0x32
        0x32
        0x32
    .end array-data
.end method

.method private setEq()V
    .locals 5

    .line 574
    const/4 v0, 0x1

    new-array v1, v0, [F

    .line 576
    .local v1, "qs":[F
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->tempFreq:[I

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->tempGains:[I

    invoke-virtual {p0, v2, v3, v1}, Lcom/yftech/engineeringmode/fragment/EQFragment;->setBandValue([I[I[F)Z

    .line 578
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getFreqValues([Landroid/widget/EditText;)[I

    move-result-object v2

    iput-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freq:[I

    .line 579
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    invoke-direct {p0, v2}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getGainValues([Landroid/widget/EditText;)[I

    move-result-object v2

    iput-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gains:[I

    .line 580
    iget-boolean v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->isEmpty:Z

    if-eqz v2, :cond_0

    .line 581
    return-void

    .line 583
    :cond_0
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freq:[I

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gains:[I

    invoke-virtual {p0, v2, v3, v1}, Lcom/yftech/engineeringmode/fragment/EQFragment;->setBandValue([I[I[F)Z

    move-result v2

    .line 584
    .local v2, "result":Z
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freq:[I

    array-length v4, v3

    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v3

    iput-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->tempFreq:[I

    .line 585
    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gains:[I

    array-length v4, v3

    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v3

    iput-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->tempGains:[I

    .line 586
    if-eqz v2, :cond_1

    .line 587
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f0e0104

    invoke-virtual {p0, v4}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 588
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freq:[I

    invoke-static {v3}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "eq.freq"

    invoke-static {v0, v4, v3}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 589
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gains:[I

    invoke-static {v3}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "eq.gain"

    invoke-static {v0, v4, v3}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 591
    :cond_1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 274
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_9

    .line 420
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/16 v1, 0x9

    packed-switch v0, :pswitch_data_1

    :pswitch_1
    goto/16 :goto_9

    .line 428
    :pswitch_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decGainOne(Landroid/widget/EditText;)V

    .line 429
    goto/16 :goto_9

    .line 431
    :pswitch_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addGainOne(Landroid/widget/EditText;)V

    goto/16 :goto_9

    .line 422
    :pswitch_4
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decFreqOne(Landroid/widget/EditText;)V

    .line 423
    goto/16 :goto_9

    .line 425
    :pswitch_5
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addFreqOne(Landroid/widget/EditText;)V

    .line 426
    goto/16 :goto_9

    .line 404
    :pswitch_6
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/16 v1, 0x8

    packed-switch v0, :pswitch_data_2

    :pswitch_7
    goto :goto_0

    .line 412
    :pswitch_8
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decGainOne(Landroid/widget/EditText;)V

    .line 413
    goto :goto_0

    .line 415
    :pswitch_9
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addGainOne(Landroid/widget/EditText;)V

    goto :goto_0

    .line 406
    :pswitch_a
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decFreqOne(Landroid/widget/EditText;)V

    .line 407
    goto :goto_0

    .line 409
    :pswitch_b
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addFreqOne(Landroid/widget/EditText;)V

    .line 410
    nop

    .line 418
    :goto_0
    goto/16 :goto_9

    .line 388
    :pswitch_c
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x7

    packed-switch v0, :pswitch_data_3

    :pswitch_d
    goto :goto_1

    .line 396
    :pswitch_e
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decGainOne(Landroid/widget/EditText;)V

    .line 397
    goto :goto_1

    .line 399
    :pswitch_f
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addGainOne(Landroid/widget/EditText;)V

    goto :goto_1

    .line 390
    :pswitch_10
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decFreqOne(Landroid/widget/EditText;)V

    .line 391
    goto :goto_1

    .line 393
    :pswitch_11
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addFreqOne(Landroid/widget/EditText;)V

    .line 394
    nop

    .line 402
    :goto_1
    goto/16 :goto_9

    .line 372
    :pswitch_12
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x6

    packed-switch v0, :pswitch_data_4

    :pswitch_13
    goto :goto_2

    .line 380
    :pswitch_14
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decGainOne(Landroid/widget/EditText;)V

    .line 381
    goto :goto_2

    .line 383
    :pswitch_15
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addGainOne(Landroid/widget/EditText;)V

    goto :goto_2

    .line 374
    :pswitch_16
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decFreqOne(Landroid/widget/EditText;)V

    .line 375
    goto :goto_2

    .line 377
    :pswitch_17
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addFreqOne(Landroid/widget/EditText;)V

    .line 378
    nop

    .line 386
    :goto_2
    goto/16 :goto_9

    .line 356
    :pswitch_18
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x5

    packed-switch v0, :pswitch_data_5

    :pswitch_19
    goto :goto_3

    .line 364
    :pswitch_1a
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decGainOne(Landroid/widget/EditText;)V

    .line 365
    goto :goto_3

    .line 367
    :pswitch_1b
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addGainOne(Landroid/widget/EditText;)V

    goto :goto_3

    .line 358
    :pswitch_1c
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decFreqOne(Landroid/widget/EditText;)V

    .line 359
    goto :goto_3

    .line 361
    :pswitch_1d
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addFreqOne(Landroid/widget/EditText;)V

    .line 362
    nop

    .line 370
    :goto_3
    goto/16 :goto_9

    .line 340
    :pswitch_1e
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x4

    packed-switch v0, :pswitch_data_6

    :pswitch_1f
    goto :goto_4

    .line 348
    :pswitch_20
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decGainOne(Landroid/widget/EditText;)V

    .line 349
    goto :goto_4

    .line 351
    :pswitch_21
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addGainOne(Landroid/widget/EditText;)V

    goto :goto_4

    .line 342
    :pswitch_22
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decFreqOne(Landroid/widget/EditText;)V

    .line 343
    goto :goto_4

    .line 345
    :pswitch_23
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addFreqOne(Landroid/widget/EditText;)V

    .line 346
    nop

    .line 354
    :goto_4
    goto/16 :goto_9

    .line 324
    :pswitch_24
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x3

    packed-switch v0, :pswitch_data_7

    :pswitch_25
    goto :goto_5

    .line 332
    :pswitch_26
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decGainOne(Landroid/widget/EditText;)V

    .line 333
    goto :goto_5

    .line 335
    :pswitch_27
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addGainOne(Landroid/widget/EditText;)V

    goto :goto_5

    .line 326
    :pswitch_28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decFreqOne(Landroid/widget/EditText;)V

    .line 327
    goto :goto_5

    .line 329
    :pswitch_29
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addFreqOne(Landroid/widget/EditText;)V

    .line 330
    nop

    .line 338
    :goto_5
    goto/16 :goto_9

    .line 308
    :pswitch_2a
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x2

    packed-switch v0, :pswitch_data_8

    :pswitch_2b
    goto :goto_6

    .line 316
    :pswitch_2c
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decGainOne(Landroid/widget/EditText;)V

    .line 317
    goto :goto_6

    .line 319
    :pswitch_2d
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addGainOne(Landroid/widget/EditText;)V

    goto :goto_6

    .line 310
    :pswitch_2e
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decFreqOne(Landroid/widget/EditText;)V

    .line 311
    goto :goto_6

    .line 313
    :pswitch_2f
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addFreqOne(Landroid/widget/EditText;)V

    .line 314
    nop

    .line 322
    :goto_6
    goto :goto_9

    .line 292
    :pswitch_30
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_9

    :pswitch_31
    goto :goto_7

    .line 300
    :pswitch_32
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decGainOne(Landroid/widget/EditText;)V

    .line 301
    goto :goto_7

    .line 303
    :pswitch_33
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addGainOne(Landroid/widget/EditText;)V

    goto :goto_7

    .line 294
    :pswitch_34
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decFreqOne(Landroid/widget/EditText;)V

    .line 295
    goto :goto_7

    .line 297
    :pswitch_35
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addFreqOne(Landroid/widget/EditText;)V

    .line 298
    nop

    .line 306
    :goto_7
    goto :goto_9

    .line 276
    :pswitch_36
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_a

    :pswitch_37
    goto :goto_8

    .line 284
    :pswitch_38
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decGainOne(Landroid/widget/EditText;)V

    .line 285
    goto :goto_8

    .line 287
    :pswitch_39
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->gainEditTexts:[Lcom/yftech/engineeringmode/widget/GainEditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addGainOne(Landroid/widget/EditText;)V

    goto :goto_8

    .line 278
    :pswitch_3a
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->decFreqOne(Landroid/widget/EditText;)V

    .line 279
    goto :goto_8

    .line 281
    :pswitch_3b
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/EQFragment;->freqEditTexts:[Landroid/widget/EditText;

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->addFreqOne(Landroid/widget/EditText;)V

    .line 282
    nop

    .line 290
    :goto_8
    nop

    .line 437
    :goto_9
    return-void

    :pswitch_data_0
    .packed-switch 0x7f090079
        :pswitch_36
        :pswitch_30
        :pswitch_2a
        :pswitch_24
        :pswitch_1e
        :pswitch_18
        :pswitch_12
        :pswitch_c
        :pswitch_6
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x7f090033
        :pswitch_5
        :pswitch_4
        :pswitch_1
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x7f090033
        :pswitch_b
        :pswitch_a
        :pswitch_7
        :pswitch_9
        :pswitch_8
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x7f090033
        :pswitch_11
        :pswitch_10
        :pswitch_d
        :pswitch_f
        :pswitch_e
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x7f090033
        :pswitch_17
        :pswitch_16
        :pswitch_13
        :pswitch_15
        :pswitch_14
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x7f090033
        :pswitch_1d
        :pswitch_1c
        :pswitch_19
        :pswitch_1b
        :pswitch_1a
    .end packed-switch

    :pswitch_data_6
    .packed-switch 0x7f090033
        :pswitch_23
        :pswitch_22
        :pswitch_1f
        :pswitch_21
        :pswitch_20
    .end packed-switch

    :pswitch_data_7
    .packed-switch 0x7f090033
        :pswitch_29
        :pswitch_28
        :pswitch_25
        :pswitch_27
        :pswitch_26
    .end packed-switch

    :pswitch_data_8
    .packed-switch 0x7f090033
        :pswitch_2f
        :pswitch_2e
        :pswitch_2b
        :pswitch_2d
        :pswitch_2c
    .end packed-switch

    :pswitch_data_9
    .packed-switch 0x7f090033
        :pswitch_35
        :pswitch_34
        :pswitch_31
        :pswitch_33
        :pswitch_32
    .end packed-switch

    :pswitch_data_a
    .packed-switch 0x7f090033
        :pswitch_3b
        :pswitch_3a
        :pswitch_37
        :pswitch_39
        :pswitch_38
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 82
    const v0, 0x7f0c0041

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 83
    .local v0, "view":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->initView(Landroid/view/View;)V

    .line 84
    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .line 249
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onDestroy()V

    .line 250
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 238
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 239
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/EQFragment;->initData()V

    .line 240
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 244
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onStop()V

    .line 245
    return-void
.end method

.method public setBandValue([I[I[F)Z
    .locals 4
    .param p1, "freq"    # [I
    .param p2, "values"    # [I
    .param p3, "qs"    # [F

    .line 557
    if-eqz p2, :cond_2

    array-length v0, p2

    sget-object v1, Lcom/yftech/engineeringmode/fragment/EQFragment;->BANDS:[I

    array-length v1, v1

    if-eq v0, v1, :cond_0

    goto :goto_1

    .line 561
    :cond_0
    array-length v0, p2

    new-array v0, v0, [I

    .line 562
    .local v0, "gains":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_1

    .line 563
    aget v2, p2, v1

    int-to-float v2, v2

    const/high16 v3, -0x3e900000    # -15.0f

    sub-float/2addr v2, v3

    float-to-int v2, v2

    aput v2, v0, v1

    .line 562
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 570
    .end local v1    # "i":I
    :cond_1
    const/16 v1, 0xa

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/yftech/engineeringmode/fragment/EQFragment;->setBandGains([I[IIZ)Z

    move-result v1

    return v1

    .line 558
    .end local v0    # "gains":[I
    :cond_2
    :goto_1
    const-string v0, "setBandValue, param error"

    invoke-static {v0}, Lcom/yftech/car/utils/Loger;->e(Ljava/lang/String;)V

    .line 559
    const/4 v0, 0x0

    return v0
.end method
