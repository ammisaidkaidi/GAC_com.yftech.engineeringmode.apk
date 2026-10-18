.class public Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "ProductInfoFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$ProductInfoReceiver;
    }
.end annotation


# static fields
.field private static final ACTION:Ljava/lang/String; = "com.yftech.engineeringmode.ProductInfo"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mReceiver:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$ProductInfoReceiver;

.field private mVehiclePlatform:Lcom/yftech/vehicle/internal/adapter/ICarConfig$VehiclePlatform;

.field private root:Landroid/view/View;

.field private updateRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    const-class v0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 42
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->mHandler:Landroid/os/Handler;

    .line 224
    new-instance v0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$2;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->updateRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    .line 34
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->requestBspInfo()V

    return-void
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    .line 34
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->updateRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    .line 34
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .line 34
    sget-object v0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    .line 34
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->root:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$600(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;
    .param p1, "x1"    # Landroid/view/View;

    .line 34
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->initView(Landroid/view/View;)V

    return-void
.end method

.method private getBluetoothVersion()Ljava/lang/String;
    .locals 1

    .line 145
    invoke-static {}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getInstance()Lcom/yftech/car/bluetooth/CarBluetoothManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getSDKVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getDisplayCreateDate()Ljava/lang/String;
    .locals 5

    .line 170
    const-string v0, "persist.bsp.display.create.date"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 171
    .local v0, "sDate":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDisplayCreateDate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 173
    return-object v2

    .line 175
    :cond_0
    invoke-static {v0}, Lcom/yftech/vehicle/internal/utils/StringUtils;->isNumeric(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 176
    sget-object v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->TAG:Ljava/lang/String;

    const-string v3, "getDisplayCreateDate: data is not number"

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    return-object v2

    .line 179
    :cond_1
    const/4 v1, 0x0

    .line 181
    .local v1, "date":Ljava/util/Date;
    :try_start_0
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "ddMMyy"

    invoke-direct {v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    move-object v1, v3

    .line 182
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyy\u5e74M\u6708d\u65e5"

    invoke-direct {v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 183
    .local v3, "simpleDateFormat":Ljava/text/SimpleDateFormat;
    invoke-virtual {v3, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 184
    .end local v3    # "simpleDateFormat":Ljava/text/SimpleDateFormat;
    :catch_0
    move-exception v3

    .line 185
    .local v3, "e":Ljava/text/ParseException;
    invoke-virtual {v3}, Ljava/text/ParseException;->printStackTrace()V

    .line 187
    .end local v3    # "e":Ljava/text/ParseException;
    return-object v2
.end method

.method private getDisplayHardwareVersion()Ljava/lang/String;
    .locals 4

    .line 198
    const-string v0, "persist.bsp.display.ver.hardware"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 199
    .local v0, "hardwareVersion":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDisplayHardwareVersion: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    return-object v0
.end method

.method private getDisplayPn()Ljava/lang/String;
    .locals 4

    .line 163
    const-string v0, "persist.bsp.display.pn"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "displayPn":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDisplayPn: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    return-object v0
.end method

.method private getDisplaySn()Ljava/lang/String;
    .locals 4

    .line 157
    const-string v0, "persist.bsp.display.sn"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, "displaySn":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDisplaySn: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    return-object v0
.end method

.method private getDisplaySoftwareVersion()Ljava/lang/String;
    .locals 4

    .line 192
    const-string v0, "persist.bsp.display.ver.software"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, "softwareVersion":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDisplaySoftwareVersion: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    return-object v0
.end method

.method private getDisplaySupplierHardwareVersion()Ljava/lang/String;
    .locals 4

    .line 210
    const-string v0, "persist.bsp.display.ver.supplier.hardware"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 211
    .local v0, "sHardwareVersion":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDisplaySupplierHardwareVersion: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    return-object v0
.end method

.method private getDisplaySupplierSoftwareVersion()Ljava/lang/String;
    .locals 4

    .line 204
    const-string v0, "persist.bsp.display.ver.supplier.software"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 205
    .local v0, "sSoftwareVersion":Ljava/lang/String;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDisplaySupplierSoftwareVersion: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    return-object v0
.end method

.method private getGPSVersion()Ljava/lang/String;
    .locals 1

    .line 141
    const-string v0, ""

    return-object v0
.end method

.method private getMcuBootVersion()Ljava/lang/String;
    .locals 2

    .line 133
    const-string v0, "persist.version.mcuboot"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getMcuVersion()Ljava/lang/String;
    .locals 2

    .line 129
    const-string v0, "persist.version.mcu"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getPartNumber()Ljava/lang/String;
    .locals 2

    .line 110
    const-string v0, "persist.vehicle.pn"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSN()Ljava/lang/String;
    .locals 2

    .line 115
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCBIHU12Project()Z

    move-result v0

    if-nez v0, :cond_1

    .line 116
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCBIHU12C1Project()Z

    move-result v0

    if-nez v0, :cond_1

    .line 117
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCBIHU12C7Project()Z

    move-result v0

    if-nez v0, :cond_1

    .line 118
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCBIHU23Project()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCBIHU23C1Project()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 121
    :cond_0
    const-string v0, "persist.vehicle.sn"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 119
    :cond_1
    :goto_0
    const-string v0, "persist.ecu.product.line.serial"

    const-string v1, "\u65e0"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSupplier()Ljava/lang/String;
    .locals 2

    .line 106
    const-string v0, "persist.vehicle.suppliercode"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSystemVersion()Ljava/lang/String;
    .locals 2

    .line 137
    const-string v0, "ro.build.display.id"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getVIN()Ljava/lang/String;
    .locals 2

    .line 125
    const-string v0, "persist.vehicle.vin"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getVoiceVersion()Ljava/lang/String;
    .locals 1

    .line 153
    const-string v0, ""

    return-object v0
.end method

.method private getWifiVersion()Ljava/lang/String;
    .locals 1

    .line 149
    const-string v0, ""

    return-object v0
.end method

.method private initView(Landroid/view/View;)V
    .locals 3
    .param p1, "root"    # Landroid/view/View;

    .line 69
    const v0, 0x7f090186

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getSupplier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    const v0, 0x7f090175

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getPartNumber()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    const v0, 0x7f090183

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getSN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    const v0, 0x7f090196

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getVIN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    const v0, 0x7f090173

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getMcuVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    const v0, 0x7f090172

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getMcuBootVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getSystemVersion()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "systemVersion":Ljava/lang/String;
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->mVehiclePlatform:Lcom/yftech/vehicle/internal/adapter/ICarConfig$VehiclePlatform;

    sget-object v2, Lcom/yftech/vehicle/internal/adapter/ICarConfig$VehiclePlatform;->A58:Lcom/yftech/vehicle/internal/adapter/ICarConfig$VehiclePlatform;

    if-ne v1, v2, :cond_0

    .line 79
    const-string v1, "A88"

    const-string v2, "A58"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 81
    :cond_0
    const v1, 0x7f090187

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    const v1, 0x7f09016e

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getGPSVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    const v1, 0x7f090163

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getBluetoothVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    const v1, 0x7f090198

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getWifiVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    const v1, 0x7f090197

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getVoiceVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    const v1, 0x7f09017a

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getDisplaySn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    const v1, 0x7f090179

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getDisplayPn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    const v1, 0x7f090177

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getDisplayCreateDate()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    const v1, 0x7f09017b

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getDisplaySoftwareVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    const v1, 0x7f090178

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getDisplayHardwareVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    const v1, 0x7f09017d

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getDisplaySupplierSoftwareVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    const v1, 0x7f09017c

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getDisplaySupplierHardwareVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    const v1, 0x7f090024

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$1;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    return-void
.end method

.method private requestBspInfo()V
    .locals 4

    .line 235
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 236
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 237
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 238
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 239
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 240
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 241
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 242
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 243
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 244
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarBspManager;->get()Lcom/yftech/vehicle/sdk/CarBspManager;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarBspManager;->queryBspInfoCmd(B)Z

    .line 247
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$3;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$3;-><init>(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;)V

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 256
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 47
    const v0, 0x7f0c0047

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 48
    .local v0, "root":Landroid/view/View;
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarConfig;->getVehiclePlatform()Lcom/yftech/vehicle/internal/adapter/ICarConfig$VehiclePlatform;

    move-result-object v1

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->mVehiclePlatform:Lcom/yftech/vehicle/internal/adapter/ICarConfig$VehiclePlatform;

    .line 49
    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->root:Landroid/view/View;

    .line 50
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->initView(Landroid/view/View;)V

    .line 51
    return-object v0
.end method

.method public onPause()V
    .locals 2

    .line 64
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onPause()V

    .line 65
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->mReceiver:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$ProductInfoReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 66
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 56
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 57
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.yftech.engineeringmode.ProductInfo"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 58
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    new-instance v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$ProductInfoReceiver;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$ProductInfoReceiver;-><init>(Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$1;)V

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->mReceiver:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$ProductInfoReceiver;

    .line 59
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;->mReceiver:Lcom/yftech/engineeringmode/fragment/ProductInfoFragment$ProductInfoReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 60
    return-void
.end method
