.class public Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "TemperatureInfoFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;
    }
.end annotation


# static fields
.field private static final CPU_UTILIZATION_PATH:Ljava/lang/String; = "/proc/stat"

.field private static final SOC_TEMPERATURE_PATH:Ljava/lang/String; = "/sys/class/thermal/thermal_zone0/temp"

.field private static final TAG:Ljava/lang/String; = "TemperatureInfo"

.field private static final TFT_TEMPERATURE_PATH:Ljava/lang/String; = "/sys/bus/iio/devices/iio:device0/in_voltage0_input"

.field private static final VOLTAGE_TAG:D = 1.11385


# instance fields
.field private volatile exitThread:Z

.field private reader:Ljava/io/BufferedReader;

.field private final updateTemperatureHandler:Landroid/os/Handler;

.field private viewRoot:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->exitThread:Z

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->reader:Ljava/io/BufferedReader;

    .line 202
    new-instance v0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->updateTemperatureHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    .line 21
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->exitThread:Z

    return v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    .line 21
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->readSocTemperature()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    .line 21
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->readCpuUtilization()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    .line 21
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->readTFTTemperature()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    .line 21
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->updateTemperatureHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    .line 21
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->viewRoot:Landroid/view/View;

    return-object v0
.end method

.method private getAmplifierTemperature()Ljava/lang/String;
    .locals 1

    .line 71
    const-string v0, ""

    return-object v0
.end method

.method private getCPUUtilization()Ljava/lang/String;
    .locals 1

    .line 67
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->readCpuUtilization()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSOCTemperature()Ljava/lang/String;
    .locals 1

    .line 63
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->readSocTemperature()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getTFTTemperature()Ljava/lang/String;
    .locals 1

    .line 75
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->readTFTTemperature()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initView(Landroid/view/View;)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;

    .line 56
    const v0, 0x7f090184

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->getSOCTemperature()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    const v0, 0x7f090167

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->getCPUUtilization()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    const v0, 0x7f090189

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->getTFTTemperature()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    return-void
.end method

.method private readCpuUtilization()Ljava/lang/String;
    .locals 10

    .line 109
    const-wide/16 v0, 0x0

    .line 110
    .local v0, "totalTime":D
    const-wide/16 v2, 0x0

    .line 112
    .local v2, "cpuUtilization":D
    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/FileReader;

    const-string v6, "/proc/stat"

    invoke-direct {v5, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v4, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->reader:Ljava/io/BufferedReader;

    .line 114
    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 115
    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 117
    const-string v5, "\\s+"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 119
    .local v5, "cpuParamValues":[Ljava/lang/String;
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_0
    array-length v7, v5

    if-ge v6, v7, :cond_0

    .line 120
    aget-object v7, v5, v6

    invoke-static {v7}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v7

    add-double/2addr v0, v7

    .line 119
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 123
    .end local v6    # "i":I
    :cond_0
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    const/4 v8, 0x4

    aget-object v8, v5, v8

    invoke-static {v8}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v8

    div-double/2addr v8, v0

    sub-double/2addr v6, v8

    const-wide/high16 v8, 0x4059000000000000L    # 100.0

    mul-double v2, v6, v8

    .line 124
    .end local v5    # "cpuParamValues":[Ljava/lang/String;
    goto :goto_1

    .line 125
    :cond_1
    const-string v5, "TemperatureInfo"

    const-string v6, "Unable to read the data from path:/proc/stat"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    .end local v4    # "line":Ljava/lang/String;
    :goto_1
    goto :goto_2

    .line 127
    :catch_0
    move-exception v4

    .line 128
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 131
    .end local v4    # "e":Ljava/io/IOException;
    :goto_2
    new-instance v4, Ljava/text/DecimalFormat;

    const-string v5, ".00"

    invoke-direct {v4, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 132
    .local v4, "decimalFormat":Ljava/text/DecimalFormat;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "%"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private readSocTemperature()Ljava/lang/String;
    .locals 10

    .line 83
    const/4 v0, 0x0

    .line 85
    .local v0, "socTemperature":Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    const-string v3, "/sys/class/thermal/thermal_zone0/temp"

    invoke-direct {v2, v3}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->reader:Ljava/io/BufferedReader;

    .line 86
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .local v1, "line":Ljava/lang/String;
    const-string v2, "TemperatureInfo"

    if-eqz v1, :cond_1

    .line 88
    :try_start_1
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 89
    .local v3, "temperature":J
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-gez v5, :cond_0

    .line 90
    const-string v5, "SocTemperature don`t know"

    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 92
    :cond_0
    new-instance v2, Ljava/text/DecimalFormat;

    const-string v5, ".0"

    invoke-direct {v2, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 93
    .local v2, "decimalFormat":Ljava/text/DecimalFormat;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    long-to-double v6, v3

    const-wide v8, 0x408f400000000000L    # 1000.0

    div-double/2addr v6, v8

    invoke-virtual {v2, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\u00b0C"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v0, v5

    .line 95
    .end local v2    # "decimalFormat":Ljava/text/DecimalFormat;
    .end local v3    # "temperature":J
    :goto_0
    goto :goto_1

    .line 96
    :cond_1
    const-string v3, "Unable to read the data from path:/sys/class/thermal/thermal_zone0/temp"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 100
    .end local v1    # "line":Ljava/lang/String;
    :goto_1
    goto :goto_2

    .line 98
    :catch_0
    move-exception v1

    .line 99
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 101
    .end local v1    # "e":Ljava/io/IOException;
    :goto_2
    return-object v0
.end method

.method private readTFTTemperature()Ljava/lang/String;
    .locals 15

    .line 141
    const/4 v0, 0x0

    .line 144
    .local v0, "tftTemperature":Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    const-string v3, "/sys/bus/iio/devices/iio:device0/in_voltage0_input"

    invoke-direct {v2, v3}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->reader:Ljava/io/BufferedReader;

    .line 145
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .local v1, "line":Ljava/lang/String;
    const-string v2, "TemperatureInfo"

    if-eqz v1, :cond_3

    .line 148
    :try_start_1
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    .line 149
    .local v3, "voltage":D
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "the data of the path(/sys/bus/iio/devices/iio:device0/in_voltage0_input) is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const-wide/16 v5, 0x0

    cmpg-double v5, v3, v5

    if-gez v5, :cond_0

    .line 151
    const-string v5, "TFTTemperature don`t know"

    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 153
    :cond_0
    new-instance v2, Ljava/text/DecimalFormat;

    const-string v5, ".0"

    invoke-direct {v2, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 154
    .local v2, "decimalFormat":Ljava/text/DecimalFormat;
    const-wide/high16 v5, 0x40b0000000000000L    # 4096.0

    div-double v5, v3, v5

    const-wide v7, 0x409c200000000000L    # 1800.0

    mul-double/2addr v5, v7

    double-to-float v5, v5

    float-to-double v5, v5

    .line 156
    .local v5, "mV":D
    const-wide v7, 0x408f400000000000L    # 1000.0

    div-double v7, v5, v7

    .line 158
    .local v7, "adVoltage":D
    const-wide v9, 0x3ff1d25460aa64c3L    # 1.11385

    cmpl-double v11, v7, v9

    const-string v12, "\u00b0C"

    if-lez v11, :cond_1

    .line 160
    const-wide v9, -0x3fa4647ae147ae14L    # -110.43

    mul-double/2addr v9, v7

    const-wide v13, 0x4068228f5c28f5c3L    # 193.08

    add-double/2addr v9, v13

    .line 161
    .local v9, "temperature":D
    :try_start_2
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9, v10}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    move-object v0, v11

    goto :goto_0

    .line 162
    .end local v9    # "temperature":D
    :cond_1
    cmpg-double v9, v7, v9

    if-gtz v9, :cond_2

    .line 164
    const-wide v9, -0x3fac671a9fbe76c9L    # -78.389

    mul-double/2addr v9, v7

    const-wide v13, 0x406349eb851eb852L    # 154.31

    add-double/2addr v9, v13

    .line 165
    .restart local v9    # "temperature":D
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9, v10}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    move-object v0, v11

    .line 168
    .end local v2    # "decimalFormat":Ljava/text/DecimalFormat;
    .end local v3    # "voltage":D
    .end local v5    # "mV":D
    .end local v7    # "adVoltage":D
    .end local v9    # "temperature":D
    :cond_2
    :goto_0
    goto :goto_1

    .line 169
    :cond_3
    const-string v3, "Unable to read the data from path:/sys/bus/iio/devices/iio:device0/in_voltage0_input"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 173
    .end local v1    # "line":Ljava/lang/String;
    :goto_1
    goto :goto_2

    .line 171
    :catch_0
    move-exception v1

    .line 172
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 174
    .end local v1    # "e":Ljava/io/IOException;
    :goto_2
    return-object v0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 41
    const v0, 0x7f0c004a

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 42
    .local v0, "root":Landroid/view/View;
    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->viewRoot:Landroid/view/View;

    .line 43
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->initView(Landroid/view/View;)V

    .line 44
    return-object v0
.end method

.method public onPause()V
    .locals 1

    .line 216
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onPause()V

    .line 217
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;->exitThread:Z

    .line 218
    return-void
.end method

.method public onStart()V
    .locals 3

    .line 49
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onStart()V

    .line 50
    new-instance v0, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;-><init>(Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;)V

    .line 51
    .local v0, "readTemperatureThread":Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment$ReadTemperatureThread;->start()V

    .line 52
    const-string v1, "TemperatureInfo"

    const-string v2, "Read temperature thread start"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    return-void
.end method
