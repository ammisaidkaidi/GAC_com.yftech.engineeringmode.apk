.class public Lcom/yftech/engineeringmode/fragment/TunerFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "TunerFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/fragment/TunerFragment$Listener;
    }
.end annotation


# instance fields
.field private final mCarRadioControlCallback:Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;

.field private mPlay:Landroid/widget/Button;

.field private mTvFreq:Landroid/widget/TextView;

.field private mType:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 97
    new-instance v0, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/TunerFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/TunerFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mCarRadioControlCallback:Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;

    .line 25
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/TunerFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/TunerFragment;

    .line 18
    iget v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mType:I

    return v0
.end method

.method static synthetic access$002(Lcom/yftech/engineeringmode/fragment/TunerFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/TunerFragment;
    .param p1, "x1"    # I

    .line 18
    iput p1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mType:I

    return p1
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/TunerFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/TunerFragment;

    .line 18
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mTvFreq:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/TunerFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/TunerFragment;

    .line 18
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mPlay:Landroid/widget/Button;

    return-object v0
.end method

.method private initDate()V
    .locals 5

    .line 78
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/radio/CarRadioManager;->requestAudioFocus()V

    .line 79
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/radio/CarRadioManager;->getFreq()Lcom/yftech/car/media/radio/entity/DataOfRadio;

    move-result-object v0

    .line 80
    .local v0, "freq":Lcom/yftech/car/media/radio/entity/DataOfRadio;
    invoke-virtual {v0}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getType()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 81
    invoke-virtual {v0}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getType()I

    move-result v1

    iput v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mType:I

    .line 82
    invoke-virtual {v0}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getType()I

    move-result v1

    if-nez v1, :cond_0

    .line 83
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mTvFreq:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "FM"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getFreq()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x447a0000    # 1000.0f

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, "MHz"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 85
    :cond_0
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mTvFreq:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AM"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/yftech/car/media/radio/entity/DataOfRadio;->getFreq()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "KHz"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mPlay:Landroid/widget/Button;

    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/car/media/radio/CarRadioManager;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_2

    const v2, 0x7f0e00c2

    goto :goto_1

    :cond_2
    const v2, 0x7f0e00c3

    :goto_1
    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 89
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;

    .line 41
    const v0, 0x7f0900d9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mPlay:Landroid/widget/Button;

    .line 42
    const v1, 0x7f0900f2

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mTvFreq:Landroid/widget/TextView;

    .line 43
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mTvFreq:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    const v1, 0x7f0900db

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    const v1, 0x7f0900da

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    const v0, 0x7f0900d8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    const v0, 0x7f0900d7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    const v0, 0x7f0900dc

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    return-void
.end method

.method private onChanged(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "oldValue"    # Ljava/lang/String;
    .param p3, "newValue"    # Ljava/lang/String;

    .line 67
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 69
    .local v0, "mNewValue":I
    iget v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mType:I

    if-nez v1, :cond_0

    .line 70
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mTvFreq:Landroid/widget/TextView;

    const-string v2, "FM"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 72
    :cond_0
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mTvFreq:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AM"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    :goto_0
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .line 144
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 145
    .local v0, "id":I
    const v1, 0x7f0900f2

    if-ne v0, v1, :cond_1

    .line 146
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/radio/CarRadioManager;->getBand()I

    move-result v1

    .line 147
    .local v1, "band":I
    if-nez v1, :cond_0

    .line 149
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/yftech/car/media/radio/CarRadioManager;->setBand(I)I

    goto :goto_0

    .line 152
    :cond_0
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/yftech/car/media/radio/CarRadioManager;->setBand(I)I

    .line 154
    .end local v1    # "band":I
    :goto_0
    goto :goto_1

    .line 155
    :cond_1
    packed-switch v0, :pswitch_data_0

    goto :goto_1

    .line 177
    :pswitch_0
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/radio/CarRadioManager;->scanSave()V

    .line 178
    goto :goto_1

    .line 158
    :pswitch_1
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/radio/CarRadioManager;->seekUp()I

    .line 159
    goto :goto_1

    .line 161
    :pswitch_2
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/radio/CarRadioManager;->stepDown()I

    .line 162
    goto :goto_1

    .line 164
    :pswitch_3
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/radio/CarRadioManager;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 165
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/radio/CarRadioManager;->pause()V

    goto :goto_1

    .line 167
    :cond_2
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/radio/CarRadioManager;->play()V

    .line 169
    goto :goto_1

    .line 171
    :pswitch_4
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/radio/CarRadioManager;->stepUp()I

    .line 172
    goto :goto_1

    .line 174
    :pswitch_5
    invoke-static {}, Lcom/yftech/car/media/radio/CarRadioManager;->getInstance()Lcom/yftech/car/media/radio/CarRadioManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/media/radio/CarRadioManager;->seekDown()I

    .line 175
    nop

    .line 182
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0900d7
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 36
    invoke-super {p0, p1}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mCarRadioControlCallback:Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;

    invoke-static {v0}, Lcom/yftech/car/media/radio/CarRadioManager;->registerRadioControlCallback(Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;)V

    .line 38
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 29
    const v0, 0x7f0c004b

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 30
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/TunerFragment;->initView(Landroid/view/View;)V

    .line 31
    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .line 93
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onDestroy()V

    .line 94
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TunerFragment;->mCarRadioControlCallback:Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;

    invoke-static {v0}, Lcom/yftech/car/media/radio/CarRadioManager;->unregisterRadioControlCallback(Lcom/yftech/car/media/radio/CarRadioManager$CarRadioControlCallback;)V

    .line 95
    return-void
.end method
