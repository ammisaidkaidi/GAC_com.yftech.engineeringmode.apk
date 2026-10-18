.class public Lcom/yftech/engineeringmode/util/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    const-class v0, Lcom/yftech/engineeringmode/util/Utils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/util/Utils;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bytesToHexString([B)Ljava/lang/String;
    .locals 6
    .param p0, "src"    # [B

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    if-eqz p0, :cond_4

    array-length v1, p0

    if-gtz v1, :cond_0

    goto :goto_1

    .line 47
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_3

    .line 48
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    .line 49
    .local v2, "v":I
    const-string v3, "0x"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    .line 52
    .local v3, "hv":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    if-ge v4, v5, :cond_1

    .line 53
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    array-length v4, p0

    add-int/lit8 v4, v4, -0x1

    if-eq v1, v4, :cond_2

    .line 57
    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .end local v2    # "v":I
    .end local v3    # "hv":Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 61
    .end local v1    # "i":I
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 45
    :cond_4
    :goto_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public static formatHHMMSS(J)Ljava/lang/String;
    .locals 3
    .param p0, "time"    # J

    .line 65
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "HH\u65f6mm\u5206ss\u79d2"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 66
    .local v0, "formatter":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 67
    .local v1, "date":Ljava/util/Date;
    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getNodeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "path"    # Ljava/lang/String;

    .line 143
    const-string v0, "getNodeString() close fail"

    const-string v1, ""

    .line 144
    .local v1, "value":Ljava/lang/String;
    const/4 v2, 0x0

    .line 146
    .local v2, "reader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, p0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object v2, v3

    .line 147
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v1, v3

    .line 152
    nop

    .line 154
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 158
    :goto_0
    goto :goto_1

    .line 155
    :catch_0
    move-exception v3

    .line 156
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 157
    sget-object v4, Lcom/yftech/engineeringmode/util/Utils;->TAG:Ljava/lang/String;

    invoke-static {v4, v0}, Lcom/yftech/tbox/sdk/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .end local v3    # "e":Ljava/io/IOException;
    goto :goto_0

    .line 152
    :catchall_0
    move-exception v3

    goto :goto_2

    .line 148
    :catch_1
    move-exception v3

    .line 149
    .restart local v3    # "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 150
    sget-object v4, Lcom/yftech/engineeringmode/util/Utils;->TAG:Ljava/lang/String;

    const-string v5, "getNodeString() read fail"

    invoke-static {v4, v5}, Lcom/yftech/tbox/sdk/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    .end local v3    # "e":Ljava/io/IOException;
    if-eqz v2, :cond_0

    .line 154
    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 161
    :cond_0
    :goto_1
    sget-object v0, Lcom/yftech/engineeringmode/util/Utils;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getNodeString() path="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " value="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/yftech/tbox/sdk/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    return-object v1

    .line 152
    :goto_2
    if-eqz v2, :cond_1

    .line 154
    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 158
    goto :goto_3

    .line 155
    :catch_2
    move-exception v4

    .line 156
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 157
    sget-object v5, Lcom/yftech/engineeringmode/util/Utils;->TAG:Ljava/lang/String;

    invoke-static {v5, v0}, Lcom/yftech/tbox/sdk/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .end local v4    # "e":Ljava/io/IOException;
    :cond_1
    :goto_3
    throw v3
.end method

.method public static getScreenTpAutoBrightnessEnable()Z
    .locals 2

    .line 113
    const-string v0, "yf.engineeringmode.screen.tp.auto.brightness"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getTime(J)Ljava/lang/String;
    .locals 10
    .param p0, "time"    # J

    .line 73
    const-wide/16 v0, 0x3e8

    div-long v2, p0, v0

    const-wide/16 v4, 0x3c

    div-long/2addr v2, v4

    div-long/2addr v2, v4

    .line 74
    .local v2, "hour":J
    div-long v6, p0, v0

    div-long/2addr v6, v4

    mul-long v8, v2, v4

    sub-long/2addr v6, v8

    .line 75
    .local v6, "min":J
    div-long v0, p0, v0

    mul-long v8, v6, v4

    sub-long/2addr v0, v8

    mul-long v8, v2, v4

    mul-long/2addr v8, v4

    sub-long/2addr v0, v8

    .line 77
    .local v0, "second":J
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v5, v9

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x1

    aput-object v8, v5, v9

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x2

    aput-object v8, v5, v9

    const-string v8, "%02d:%02d:%02d"

    invoke-static {v4, v8, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static hexStr2ByteArray(Ljava/lang/String;)[B
    .locals 6
    .param p0, "hexString"    # Ljava/lang/String;

    .line 27
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 28
    const/4 v0, 0x0

    return-object v0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0x|,| "

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    .line 32
    .local v0, "byteArray":[B
    const/4 v1, 0x0

    .line 33
    .local v1, "k":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 34
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    .line 35
    .local v3, "high":B
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5, v4}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    .line 36
    .local v4, "low":B
    shl-int/lit8 v5, v3, 0x4

    or-int/2addr v5, v4

    int-to-byte v5, v5

    aput-byte v5, v0, v2

    .line 37
    nop

    .end local v3    # "high":B
    .end local v4    # "low":B
    add-int/lit8 v1, v1, 0x2

    .line 33
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 39
    .end local v2    # "i":I
    :cond_1
    return-object v0
.end method

.method public static isSupportConfigSetting()Z
    .locals 6

    .line 86
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCBIHU12Project()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCBIHU23Project()Z

    move-result v0

    if-nez v0, :cond_1

    .line 87
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCBIHU12C1Project()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 108
    :cond_0
    return v1

    .line 89
    :cond_1
    :goto_0
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCBIHU12C1Project()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    .line 90
    const-string v0, "ro.product.brand_ext"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "productBrand_ext":Ljava/lang/String;
    sget-object v3, Lcom/yftech/engineeringmode/util/Utils;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "isSupportConfigSetting() productBrand_ext:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    const-string v3, "C5"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 93
    return v1

    .line 94
    :cond_2
    const-string v3, "C2"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 95
    return v1

    .line 102
    :cond_3
    return v2

    .line 105
    .end local v0    # "productBrand_ext":Ljava/lang/String;
    :cond_4
    return v2
.end method

.method public static killProcess()V
    .locals 1

    .line 81
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 82
    return-void
.end method

.method public static setNodeString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .line 122
    const-string v0, "setNodeString() close fail"

    sget-object v1, Lcom/yftech/engineeringmode/util/Utils;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setNodeString() path="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " value="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/yftech/tbox/sdk/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    const/4 v1, 0x0

    .line 125
    .local v1, "fileWriter":Ljava/io/FileWriter;
    :try_start_0
    new-instance v2, Ljava/io/FileWriter;

    invoke-direct {v2, p0}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    .line 126
    invoke-virtual {v1, p1}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    nop

    .line 133
    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 137
    :goto_0
    goto :goto_1

    .line 134
    :catch_0
    move-exception v2

    .line 135
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 136
    sget-object v3, Lcom/yftech/engineeringmode/util/Utils;->TAG:Ljava/lang/String;

    invoke-static {v3, v0}, Lcom/yftech/tbox/sdk/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .end local v2    # "e":Ljava/io/IOException;
    goto :goto_0

    .line 131
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 127
    :catch_1
    move-exception v2

    .line 128
    .local v2, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 129
    sget-object v3, Lcom/yftech/engineeringmode/util/Utils;->TAG:Ljava/lang/String;

    const-string v4, "setNodeString() write fail"

    invoke-static {v3, v4}, Lcom/yftech/tbox/sdk/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 131
    .end local v2    # "e":Ljava/lang/Exception;
    if-eqz v1, :cond_0

    .line 133
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 140
    :cond_0
    :goto_1
    return-void

    .line 131
    :goto_2
    if-eqz v1, :cond_1

    .line 133
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 137
    goto :goto_3

    .line 134
    :catch_2
    move-exception v3

    .line 135
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 136
    sget-object v4, Lcom/yftech/engineeringmode/util/Utils;->TAG:Ljava/lang/String;

    invoke-static {v4, v0}, Lcom/yftech/tbox/sdk/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .end local v3    # "e":Ljava/io/IOException;
    :cond_1
    :goto_3
    throw v2
.end method

.method public static setScreenTpAutoBrightnessEnable(Z)V
    .locals 2
    .param p0, "enable"    # Z

    .line 117
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "yf.engineeringmode.screen.tp.auto.brightness"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    return-void
.end method
