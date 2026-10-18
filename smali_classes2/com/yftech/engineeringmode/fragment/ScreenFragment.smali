.class public Lcom/yftech/engineeringmode/fragment/ScreenFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "ScreenFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# static fields
.field private static final PRIMARY_DISPLAY:I = 0x0

.field private static final SECONDARY_DISPLAY:I = 0x1


# instance fields
.field private mCarScreenCallback:Lcom/yftech/car/screen/CarScreenManager$CarScreenCallback;

.field private mMainHandler:Landroid/os/Handler;

.field private mSbScreenBrightnessDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

.field private mSbScreenGammaDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

.field private mScreenDisplayDetectionDialog:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 24
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 26
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mMainHandler:Landroid/os/Handler;

    .line 33
    new-instance v0, Lcom/yftech/engineeringmode/fragment/ScreenFragment$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/ScreenFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/ScreenFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mCarScreenCallback:Lcom/yftech/car/screen/CarScreenManager$CarScreenCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/ScreenFragment;)Lcom/yftech/engineeringmode/widget/SeekBarNumber;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/ScreenFragment;

    .line 24
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenBrightnessDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    return-object v0
.end method

.method private initView(Landroid/view/View;)V
    .locals 3
    .param p1, "root"    # Landroid/view/View;

    .line 63
    const v0, 0x7f090100

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenBrightnessDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    .line 64
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenBrightnessDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-static {}, Lcom/yftech/car/screen/CarScreenManager;->getInstance()Lcom/yftech/car/screen/CarScreenManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/screen/CarScreenManager;->getBrightnessMaxValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setMax(I)V

    .line 65
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenBrightnessDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 67
    const v0, 0x7f090102

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenGammaDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    .line 68
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenGammaDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/autochips/pq/AtcPq;->getColorTemperature(I)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    .line 69
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenGammaDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-static {v1}, Lcom/autochips/pq/AtcPq;->getMaxColorTemperatureIndex(I)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setMax(I)V

    .line 70
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenGammaDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-static {v1}, Lcom/autochips/pq/AtcPq;->getMinColorTemperatureIndex(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setMin(I)V

    .line 71
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenGammaDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 73
    const v0, 0x7f090048

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    const v0, 0x7f09004a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    const v0, 0x7f090043

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    const v0, 0x7f090044

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    const v0, 0x7f090049

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    const v0, 0x7f090047

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    const v0, 0x7f090045

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    const v0, 0x7f090046

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    const v0, 0x7f090142

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    const v0, 0x7f090141

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    const v0, 0x7f090051

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 85
    .local v0, "cb_screen_tp_detection":Landroid/widget/CheckBox;
    invoke-static {}, Lcom/yftech/engineeringmode/util/Utils;->getScreenTpAutoBrightnessEnable()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 86
    new-instance v1, Lcom/yftech/engineeringmode/fragment/ScreenFragment$2;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/ScreenFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/ScreenFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 97
    return-void
.end method

.method private showScreenDisplayDetectionDialog(II)V
    .locals 2
    .param p1, "color"    # I
    .param p2, "mode"    # I

    .line 137
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mScreenDisplayDetectionDialog:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    .line 138
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mScreenDisplayDetectionDialog:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    invoke-virtual {v0, p1, p2}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->showColor(II)V

    .line 139
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mScreenDisplayDetectionDialog:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/-$$Lambda$ScreenFragment$QgV0uut-79KFYY2McNMjn_wKNME;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/-$$Lambda$ScreenFragment$QgV0uut-79KFYY2McNMjn_wKNME;-><init>(Lcom/yftech/engineeringmode/fragment/ScreenFragment;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 140
    return-void
.end method


# virtual methods
.method public synthetic lambda$showScreenDisplayDetectionDialog$0$ScreenFragment(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .line 139
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mScreenDisplayDetectionDialog:Lcom/yftech/engineeringmode/dialog/ScreenDisplayDetectionDialog;

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 101
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x1

    const/16 v2, 0xff

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 127
    :pswitch_0
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;-><init>(Landroid/content/Context;)V

    .line 128
    .local v0, "screenTpTestDialog":Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;->show()V

    .line 129
    goto :goto_0

    .line 131
    .end local v0    # "screenTpTestDialog":Lcom/yftech/engineeringmode/dialog/ScreenTpTestDialog;
    :pswitch_1
    invoke-static {}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->getInstance()Lcom/yftech/engineeringmode/manager/UpgradeManager;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v1}, Lcom/yftech/engineeringmode/manager/UpgradeManager;->checkUpgradeFile(ZLjava/lang/String;Z)V

    goto :goto_0

    .line 106
    :pswitch_2
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    invoke-direct {p0, v0, v3}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->showScreenDisplayDetectionDialog(II)V

    .line 107
    goto :goto_0

    .line 115
    :pswitch_3
    invoke-static {v2, v3, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    invoke-direct {p0, v0, v3}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->showScreenDisplayDetectionDialog(II)V

    .line 116
    goto :goto_0

    .line 103
    :pswitch_4
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->showScreenDisplayDetectionDialog(II)V

    .line 104
    goto :goto_0

    .line 118
    :pswitch_5
    invoke-static {v3, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    invoke-direct {p0, v0, v3}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->showScreenDisplayDetectionDialog(II)V

    .line 119
    goto :goto_0

    .line 124
    :pswitch_6
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    invoke-direct {p0, v0, v1}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->showScreenDisplayDetectionDialog(II)V

    .line 125
    goto :goto_0

    .line 121
    :pswitch_7
    invoke-static {v3, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    invoke-direct {p0, v0, v3}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->showScreenDisplayDetectionDialog(II)V

    .line 122
    goto :goto_0

    .line 112
    :pswitch_8
    const/16 v0, 0x3e8

    invoke-direct {p0, v0, v3}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->showScreenDisplayDetectionDialog(II)V

    .line 113
    goto :goto_0

    .line 109
    :pswitch_9
    invoke-static {v3, v3, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    invoke-direct {p0, v0, v3}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->showScreenDisplayDetectionDialog(II)V

    .line 110
    nop

    .line 134
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f090043
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x7f090141
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 44
    const v0, 0x7f0c0048

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 45
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->initView(Landroid/view/View;)V

    .line 46
    return-object v0
.end method

.method public onPause()V
    .locals 2

    .line 58
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onPause()V

    .line 59
    invoke-static {}, Lcom/yftech/car/screen/CarScreenManager;->getInstance()Lcom/yftech/car/screen/CarScreenManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mCarScreenCallback:Lcom/yftech/car/screen/CarScreenManager$CarScreenCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/screen/CarScreenManager;->unregisterCarScreenCallback(Lcom/yftech/car/screen/CarScreenManager$CarScreenCallback;)V

    .line 60
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .line 144
    if-nez p3, :cond_0

    .line 145
    return-void

    .line 147
    :cond_0
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getId()I

    move-result v0

    const v1, 0x7f090100

    if-ne v0, v1, :cond_2

    .line 148
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenBrightnessDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->isMoveOutside()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 149
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenBrightnessDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getMoveOutsideProgress()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    goto :goto_0

    .line 151
    :cond_1
    invoke-static {}, Lcom/yftech/car/screen/CarScreenManager;->getInstance()Lcom/yftech/car/screen/CarScreenManager;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/yftech/car/screen/CarScreenManager;->setBrightness(I)Z

    .line 154
    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getId()I

    move-result v0

    const v1, 0x7f090102

    if-ne v0, v1, :cond_4

    .line 155
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenGammaDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->isMoveOutside()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 156
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenGammaDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getMoveOutsideProgress()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    goto :goto_1

    .line 158
    :cond_3
    const/4 v0, 0x0

    invoke-static {v0, p2}, Lcom/autochips/pq/AtcPq;->setColorTemperature(II)I

    .line 161
    :cond_4
    :goto_1
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 51
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 52
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mSbScreenBrightnessDebugging:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-static {}, Lcom/yftech/car/screen/CarScreenManager;->getInstance()Lcom/yftech/car/screen/CarScreenManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/screen/CarScreenManager;->getBrightness()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    .line 53
    invoke-static {}, Lcom/yftech/car/screen/CarScreenManager;->getInstance()Lcom/yftech/car/screen/CarScreenManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mCarScreenCallback:Lcom/yftech/car/screen/CarScreenManager$CarScreenCallback;

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/ScreenFragment;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yftech/car/screen/CarScreenManager;->registerCarScreenCallback(Lcom/yftech/car/screen/CarScreenManager$CarScreenCallback;Landroid/os/Handler;)V

    .line 54
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .line 166
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .line 171
    return-void
.end method
