.class public Lcom/yftech/engineeringmode/fragment/OtherFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "OtherFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field private final HIDE_CAR:Ljava/lang/String;

.field private hideSwitch:Landroid/widget/Switch;

.field private mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 24
    const-string v0, "com.yftech.engineeringmode.hide_car"

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->HIDE_CAR:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/OtherFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/OtherFragment;

    .line 22
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->showWriteSNDialog()V

    return-void
.end method

.method static synthetic access$102(Lcom/yftech/engineeringmode/fragment/OtherFragment;Lcom/yftech/engineeringmode/dialog/InputDialog;)Lcom/yftech/engineeringmode/dialog/InputDialog;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/OtherFragment;
    .param p1, "x1"    # Lcom/yftech/engineeringmode/dialog/InputDialog;

    .line 22
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;

    return-object p1
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/OtherFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/OtherFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .line 22
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->checkInputSNValue(Ljava/lang/String;)V

    return-void
.end method

.method private checkInputSNValue(Ljava/lang/String;)V
    .locals 7
    .param p1, "sn"    # Ljava/lang/String;

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "checkInputSNValue, text: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TAG"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const v2, 0x7f0e0148

    if-nez v0, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v3, 0x5

    if-eq v0, v3, :cond_0

    goto/16 :goto_0

    .line 111
    :cond_0
    invoke-static {p1}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->isAlphanumeric(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 112
    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->showSNError(Ljava/lang/String;)V

    .line 113
    return-void

    .line 115
    :cond_1
    const/4 v0, 0x0

    const/4 v4, 0x4

    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const/16 v5, 0x10

    invoke-static {v0, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 116
    .local v0, "ecu":I
    const/4 v6, 0x1

    if-ge v0, v6, :cond_2

    .line 117
    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->showSNError(Ljava/lang/String;)V

    .line 118
    return-void

    .line 120
    :cond_2
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    .line 121
    .local v3, "pro":I
    if-ge v3, v6, :cond_3

    .line 122
    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->showSNError(Ljava/lang/String;)V

    .line 123
    return-void

    .line 125
    :cond_3
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v4, "yyMMdd"

    invoke-direct {v2, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 126
    .local v2, "simpleDateFormat":Ljava/text/SimpleDateFormat;
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 127
    .local v4, "format":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "checkInputSNValue: ,ecu:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ",pro:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ",format:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v1

    invoke-virtual {v1, v0, v3, v4}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setFactoryModeEcuAndProductLineSerial(IILjava/lang/String;)Z

    .line 129
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;

    if-eqz v1, :cond_4

    .line 130
    invoke-virtual {v1}, Lcom/yftech/engineeringmode/dialog/InputDialog;->dismiss()V

    .line 132
    :cond_4
    return-void

    .line 108
    .end local v0    # "ecu":I
    .end local v2    # "simpleDateFormat":Ljava/text/SimpleDateFormat;
    .end local v3    # "pro":I
    .end local v4    # "format":Ljava/lang/String;
    :cond_5
    :goto_0
    invoke-virtual {p0, v2}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->showSNError(Ljava/lang/String;)V

    .line 109
    return-void
.end method

.method private hideSNDialog()V
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->dismiss()V

    .line 150
    :cond_0
    return-void
.end method

.method private initData()V
    .locals 4

    .line 61
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->hideSwitch:Landroid/widget/Switch;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x1

    const-string v3, "com.yftech.engineeringmode.hide_car"

    invoke-static {v1, v3, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 62
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;

    .line 37
    const v0, 0x7f09009d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->hideSwitch:Landroid/widget/Switch;

    .line 38
    const v0, 0x7f09004e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/yftech/engineeringmode/fragment/OtherFragment$1;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/OtherFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/OtherFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->hideSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 45
    return-void
.end method

.method public static isAlphanumeric(Ljava/lang/String;)Z
    .locals 4
    .param p0, "input"    # Ljava/lang/String;

    .line 141
    const-string v0, "^[a-fA-F0-9]+$"

    .line 142
    .local v0, "regex":Ljava/lang/String;
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 143
    .local v1, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 144
    .local v2, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    return v3
.end method

.method private setHideCar(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .line 77
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "com.yftech.engineeringmode.hide_car"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 78
    return-void
.end method

.method private showSNError(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 135
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;

    if-eqz v0, :cond_0

    .line 136
    invoke-virtual {v0, p1}, Lcom/yftech/engineeringmode/dialog/InputDialog;->showToast(Ljava/lang/String;)V

    .line 138
    :cond_0
    return-void
.end method

.method private showWriteSNDialog()V
    .locals 2

    .line 84
    new-instance v0, Lcom/yftech/engineeringmode/dialog/InputDialog;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/InputDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;

    .line 85
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/OtherFragment$2;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/OtherFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/OtherFragment;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/InputDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 91
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/OtherFragment$3;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/OtherFragment$3;-><init>(Lcom/yftech/engineeringmode/fragment/OtherFragment;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/InputDialog;->setCallback(Lcom/yftech/engineeringmode/dialog/InputDialog$Callback;)V

    .line 101
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/InputDialog;->show()V

    .line 102
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/OtherFragment;->mWriteSNDialog:Lcom/yftech/engineeringmode/dialog/InputDialog;

    const v1, 0x7f0e0149

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/InputDialog;->setHint(Ljava/lang/String;)V

    .line 103
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 66
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 67
    return-void

    .line 69
    :cond_0
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v0

    const v1, 0x7f09009d

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 71
    :cond_1
    invoke-direct {p0, p2}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->setHideCar(Z)V

    .line 74
    :goto_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 31
    const v0, 0x7f0c0046

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 32
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->initView(Landroid/view/View;)V

    .line 33
    return-object v0
.end method

.method public onResume()V
    .locals 0

    .line 49
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 50
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->initData()V

    .line 51
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 55
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onStop()V

    .line 57
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/OtherFragment;->hideSNDialog()V

    .line 58
    return-void
.end method
