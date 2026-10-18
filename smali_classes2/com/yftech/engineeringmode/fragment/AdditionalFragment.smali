.class public Lcom/yftech/engineeringmode/fragment/AdditionalFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "AdditionalFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# static fields
.field private static final ENGINEERING_MODE_CAMERA_TYPE:Ljava/lang/String; = "engineering_mode_camera_type"

.field private static final ENGINEERING_MODE_CAMERA_TYPE_AVM:I = 0x1

.field private static final ENGINEERING_MODE_CAMERA_TYPE_NONE:I = 0x0

.field private static final ENGINEERING_MODE_CAMERA_TYPE_RVC:I = 0x2

.field private static final SYSTEMPROPERTIES_YF_TEMP_PROTECT:Ljava/lang/String; = "yf.temp.protect"

.field private static final SYSTEMPROPERTIES_YF_TEMP_PROTECT_VALUE_CLOSE:I = 0x0

.field private static final SYSTEMPROPERTIES_YF_TEMP_PROTECT_VALUE_OPNE:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final angleHandler:Landroid/os/Handler;

.field private mCarInfoListener:Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;

.field private mCarMiscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

.field private mCarSwcListener:Lcom/yftech/vehicle/sdk/CarSwcManager$CarSwcListener;

.field private mMainHandler:Landroid/os/Handler;

.field private mScreenUpgradeCA1105Dialog:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

.field private mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

.field private final speedHandler:Landroid/os/Handler;

.field private tvSteeringWheelAngle:Landroid/widget/TextView;

.field private tvVehicleSpeed:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    const-class v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 35
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 42
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mMainHandler:Landroid/os/Handler;

    .line 56
    new-instance v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->speedHandler:Landroid/os/Handler;

    .line 65
    new-instance v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$2;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->angleHandler:Landroid/os/Handler;

    .line 73
    new-instance v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$3;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$3;-><init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mCarInfoListener:Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;

    .line 83
    new-instance v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$4;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$4;-><init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mCarSwcListener:Lcom/yftech/vehicle/sdk/CarSwcManager$CarSwcListener;

    .line 93
    new-instance v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$5;-><init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mCarMiscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    .line 35
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->tvVehicleSpeed:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    .line 35
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->tvSteeringWheelAngle:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    .line 35
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->speedHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    .line 35
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->angleHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .line 35
    sget-object v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    .line 35
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mMainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)Lcom/yftech/engineeringmode/widget/SeekBarNumber;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    .line 35
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    return-object v0
.end method

.method static synthetic access$702(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;)Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AdditionalFragment;
    .param p1, "x1"    # Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 35
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mScreenUpgradeCA1105Dialog:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    return-object p1
.end method

.method static synthetic access$800()V
    .locals 0

    .line 35
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->reboot()V

    return-void
.end method

.method private getCameraType()I
    .locals 4

    .line 281
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "engineering_mode_camera_type"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 282
    .local v0, "type":I
    sget-object v1, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCameraType type:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    return v0
.end method

.method private getMcuBootloaderVersion()Ljava/lang/String;
    .locals 4

    .line 318
    const-string v0, "persist.version.mcuboot"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 319
    .local v0, "version":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getMcuBootloaderVersion() version:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    return-object v0
.end method

.method private getScreenTemperatureProtectionState()I
    .locals 4

    .line 293
    const-string v0, "yf.temp.protect"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 294
    .local v0, "state":I
    sget-object v1, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getScreenTemperatureProtectionState state:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    return v0
.end method

.method private getSteeringWheelAngle()Ljava/lang/String;
    .locals 3

    .line 313
    sget-object v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getSteeringWheelAngle() angle:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/yftech/vehicle/sdk/CarSwcManager;->get()Lcom/yftech/vehicle/sdk/CarSwcManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/vehicle/sdk/CarSwcManager;->getSwcAngle()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarSwcManager;->get()Lcom/yftech/vehicle/sdk/CarSwcManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/vehicle/sdk/CarSwcManager;->getSwcAngle()F

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSystemVersion()Ljava/lang/String;
    .locals 4

    .line 324
    const-string v0, "ro.build.realversion.date"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 325
    .local v0, "version":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getSystemVersion() version:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    return-object v0
.end method

.method private getVehicleSpeed()Ljava/lang/String;
    .locals 4

    .line 305
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarInfoManager;->get()Lcom/yftech/vehicle/sdk/CarInfoManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/vehicle/sdk/CarInfoManager;->getVehicleSpeed()I

    move-result v0

    .line 306
    .local v0, "speed":I
    sget-object v1, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getVehicleSpeed() VehicleSpeed:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " km/h"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private initView(Landroid/view/View;)V
    .locals 10
    .param p1, "root"    # Landroid/view/View;

    .line 114
    const v0, 0x7f090023

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->tvVehicleSpeed:Landroid/widget/TextView;

    .line 115
    const v0, 0x7f090020

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->tvSteeringWheelAngle:Landroid/widget/TextView;

    .line 116
    const v0, 0x7f090116

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    .line 117
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setMax(I)V

    .line 118
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0, p0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 119
    const v0, 0x7f09004b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    const v0, 0x7f090042

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    const v0, 0x7f090021

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->tvVehicleSpeed:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getVehicleSpeed()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->tvSteeringWheelAngle:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getSteeringWheelAngle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    const v0, 0x7f09001d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getMcuBootloaderVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    const v0, 0x7f090022

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getSystemVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    const v0, 0x7f09001e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/vehicle/sdk/CarMiscManager;->getFactoryModeDevelopModeEnabled()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 127
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 129
    const v0, 0x7f090122

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    .line 130
    .local v0, "spCameraType":Landroid/widget/Spinner;
    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 131
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f030002

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f0c0064

    invoke-direct {v1, v2, v4, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 132
    .local v1, "saveOptionAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v2, 0x7f0c0065

    invoke-virtual {v1, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 133
    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 134
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getCameraType()I

    move-result v3

    const/4 v5, 0x1

    invoke-virtual {v0, v3, v5}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 135
    invoke-virtual {v0, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 138
    const v3, 0x7f090128

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    .line 139
    .local v3, "spScreenTemperatureProtection":Landroid/widget/Spinner;
    new-instance v6, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getContext()Landroid/content/Context;

    move-result-object v7

    .line 140
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f030004

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v4, v8}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    move-object v4, v6

    .line 141
    .local v4, "openCloseAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v4, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 142
    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 143
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getScreenTemperatureProtectionState()I

    move-result v2

    invoke-virtual {v3, v2, v5}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 144
    invoke-virtual {v3, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 146
    const v2, 0x7f09001f

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    return-void
.end method

.method private openRebootDialog()V
    .locals 2

    .line 264
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;-><init>(Landroid/content/Context;)V

    .line 265
    .local v0, "confirmDialog":Lcom/yftech/engineeringmode/dialog/ConfirmDialog;
    const-string v1, "\u662f\u5426\u786e\u5b9a\u91cd\u542f\u7cfb\u7edf"

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->setTipMessage(Ljava/lang/String;)V

    .line 266
    new-instance v1, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$7;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$7;-><init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->setOnButtonClickListener(Lcom/yftech/engineeringmode/dialog/ConfirmDialog$OnDialogButtonClickListener;)V

    .line 277
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/ConfirmDialog;->show()V

    .line 278
    return-void
.end method

.method private static reboot()V
    .locals 2

    .line 331
    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 332
    sget-object v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    const-string v1, "monkey not reboot"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    return-void

    .line 336
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    const-string v1, "reboot"

    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    .line 337
    .local v0, "process":Ljava/lang/Process;
    invoke-virtual {v0}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 340
    nop

    .end local v0    # "process":Ljava/lang/Process;
    goto :goto_1

    .line 338
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 339
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 341
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private setCameraType(I)V
    .locals 4
    .param p1, "index"    # I

    .line 288
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "engineering_mode_camera_type"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    move-result v0

    .line 289
    .local v0, "ret":Z
    sget-object v1, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setCameraType index:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " ret:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    return-void
.end method

.method private setScreenTemperatureProtectionState(I)V
    .locals 3
    .param p1, "state"    # I

    .line 300
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "yf.temp.protect"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    sget-object v0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setScreenTemperatureProtectionState state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5
    .param p1, "compoundButton"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 172
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 173
    return-void

    .line 175
    :cond_0
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v0

    const v1, 0x7f09001e

    if-ne v0, v1, :cond_2

    .line 178
    const/4 v0, 0x0

    if-eqz p2, :cond_1

    .line 179
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setFactoryModeDevelopModeEnabled(ZZ)Z

    move-result v0

    .local v0, "result":Z
    goto :goto_0

    .line 181
    .end local v0    # "result":Z
    :cond_1
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v1

    invoke-virtual {v1, v0, v0}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setFactoryModeDevelopModeEnabled(ZZ)Z

    move-result v0

    .line 183
    .restart local v0    # "result":Z
    :goto_0
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/vehicle/sdk/CarMiscManager;->getFactoryModeDevelopModeEnabled()Z

    move-result v1

    .line 184
    .local v1, "openStatus":Z
    sget-object v2, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "set result:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " openStatus:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    .end local v0    # "result":Z
    .end local v1    # "openStatus":Z
    :cond_2
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 191
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 193
    :sswitch_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getProgress()I

    move-result v0

    .line 194
    .local v0, "progress":I
    if-gtz v0, :cond_0

    .line 195
    return-void

    .line 197
    :cond_0
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v1

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setKeyboardBacklight(I)Z

    .line 198
    goto :goto_0

    .line 200
    .end local v0    # "progress":I
    :sswitch_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getProgress()I

    move-result v0

    .line 201
    .restart local v0    # "progress":I
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getMax()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 202
    return-void

    .line 204
    :cond_1
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setKeyboardBacklight(I)Z

    .line 205
    goto :goto_0

    .line 207
    .end local v0    # "progress":I
    :sswitch_2
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->openRebootDialog()V

    .line 208
    goto :goto_0

    .line 210
    :sswitch_3
    new-instance v0, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;-><init>(Landroid/content/Context;Z)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mScreenUpgradeCA1105Dialog:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    .line 211
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mScreenUpgradeCA1105Dialog:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$6;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment$6;-><init>(Lcom/yftech/engineeringmode/fragment/AdditionalFragment;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 217
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mScreenUpgradeCA1105Dialog:Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/ScreenUpgradeCA1105Dialog;->show()V

    .line 218
    nop

    .line 222
    :goto_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f09001f -> :sswitch_3
        0x7f090021 -> :sswitch_2
        0x7f090042 -> :sswitch_1
        0x7f09004b -> :sswitch_0
    .end sparse-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 108
    const v0, 0x7f0c0039

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 109
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->initView(Landroid/view/View;)V

    .line 110
    return-object v0
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 250
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getId()I

    move-result v0

    const v1, 0x7f090122

    if-ne v0, v1, :cond_0

    .line 251
    invoke-direct {p0, p3}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->setCameraType(I)V

    goto :goto_0

    .line 252
    :cond_0
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getId()I

    move-result v0

    const v1, 0x7f090128

    if-ne v0, v1, :cond_1

    .line 253
    invoke-direct {p0, p3}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->setScreenTemperatureProtectionState(I)V

    .line 255
    :cond_1
    :goto_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 260
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 162
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onPause()V

    .line 163
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->speedHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 164
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->angleHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 165
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mCarMiscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarMiscManager;->unregisterReceiver(Ljava/lang/Object;)V

    .line 166
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarInfoManager;->get()Lcom/yftech/vehicle/sdk/CarInfoManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mCarInfoListener:Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarInfoManager;->unregisterListener(Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;)V

    .line 167
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarSwcManager;->get()Lcom/yftech/vehicle/sdk/CarSwcManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mCarSwcListener:Lcom/yftech/vehicle/sdk/CarSwcManager$CarSwcListener;

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarSwcManager;->unregisterListener(Lcom/yftech/vehicle/sdk/CarSwcManager$CarSwcListener;)V

    .line 168
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .line 226
    if-nez p3, :cond_0

    .line 227
    return-void

    .line 229
    :cond_0
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getId()I

    move-result v0

    const v1, 0x7f090116

    if-ne v0, v1, :cond_2

    .line 230
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->isMoveOutside()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 231
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->getMoveOutsideProgress()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    goto :goto_0

    .line 233
    :cond_1
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setKeyboardBacklight(I)Z

    .line 236
    :cond_2
    :goto_0
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 151
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 152
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/vehicle/sdk/CarMiscManager;->getKeyboardBacklight()I

    move-result v0

    .line 153
    .local v0, "level":I
    sget-object v1, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResume level:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mSeekBarNumber:Lcom/yftech/engineeringmode/widget/SeekBarNumber;

    invoke-virtual {v1, v0}, Lcom/yftech/engineeringmode/widget/SeekBarNumber;->setProgress(I)V

    .line 155
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v1

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mCarMiscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

    invoke-virtual {v1, v2}, Lcom/yftech/vehicle/sdk/CarMiscManager;->registerReceiver(Ljava/lang/Object;)V

    .line 156
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarInfoManager;->get()Lcom/yftech/vehicle/sdk/CarInfoManager;

    move-result-object v1

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mCarInfoListener:Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;

    invoke-virtual {v1, v2}, Lcom/yftech/vehicle/sdk/CarInfoManager;->registerListener(Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;)V

    .line 157
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarSwcManager;->get()Lcom/yftech/vehicle/sdk/CarSwcManager;

    move-result-object v1

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;->mCarSwcListener:Lcom/yftech/vehicle/sdk/CarSwcManager$CarSwcListener;

    invoke-virtual {v1, v2}, Lcom/yftech/vehicle/sdk/CarSwcManager;->registerListener(Lcom/yftech/vehicle/sdk/CarSwcManager$CarSwcListener;)V

    .line 158
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .line 241
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .line 246
    return-void
.end method
