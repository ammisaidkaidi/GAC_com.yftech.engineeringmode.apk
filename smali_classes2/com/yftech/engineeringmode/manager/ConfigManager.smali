.class public Lcom/yftech/engineeringmode/manager/ConfigManager;
.super Ljava/lang/Object;
.source "ConfigManager.java"


# static fields
.field private static final CURRENT_CONFIG_NAME:Ljava/lang/String; = "\u8bfb\u53d6\u503c_0101"

.field private static final CURRENT_CONFIG_NAME_0100:Ljava/lang/String; = "\u8bfb\u53d6\u503c_0100"

.field private static final TAG:Ljava/lang/String;

.field private static mConfigManager:Lcom/yftech/engineeringmode/manager/ConfigManager;


# instance fields
.field private final mConfigs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private final mNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    const-class v0, Lcom/yftech/engineeringmode/manager/ConfigManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mConfigs:Ljava/util/Map;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mNames:Ljava/util/List;

    .line 47
    return-void
.end method

.method private getConfigData()[B
    .locals 5

    .line 163
    const/4 v0, 0x0

    :try_start_0
    const-class v1, Lcom/yftech/vehicle/sdk/CarConfig;

    .line 164
    .local v1, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "getConfigData"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 165
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 166
    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 167
    .end local v1    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    .line 168
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 170
    .end local v1    # "e":Ljava/lang/Exception;
    return-object v0
.end method

.method private getConfigData0100()[B
    .locals 1

    .line 193
    invoke-static {}, Lcom/yftech/vehicle/sdk/HostConfig;->getConfigData()[B

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getInstance()Lcom/yftech/engineeringmode/manager/ConfigManager;
    .locals 2

    const-class v0, Lcom/yftech/engineeringmode/manager/ConfigManager;

    monitor-enter v0

    .line 50
    :try_start_0
    sget-object v1, Lcom/yftech/engineeringmode/manager/ConfigManager;->mConfigManager:Lcom/yftech/engineeringmode/manager/ConfigManager;

    if-nez v1, :cond_0

    .line 51
    new-instance v1, Lcom/yftech/engineeringmode/manager/ConfigManager;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/manager/ConfigManager;-><init>()V

    sput-object v1, Lcom/yftech/engineeringmode/manager/ConfigManager;->mConfigManager:Lcom/yftech/engineeringmode/manager/ConfigManager;

    .line 53
    :cond_0
    sget-object v1, Lcom/yftech/engineeringmode/manager/ConfigManager;->mConfigManager:Lcom/yftech/engineeringmode/manager/ConfigManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 49
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private loadConfigs()V
    .locals 14

    .line 257
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mNames:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 258
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mConfigs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 259
    invoke-direct {p0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getConfigData()[B

    move-result-object v0

    .line 260
    .local v0, "curConfigData":[B
    invoke-direct {p0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getConfigData0100()[B

    move-result-object v1

    .line 261
    .local v1, "curConfigData0100":[B
    sget-object v2, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "loadConfigs: 0100-->"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    array-length v3, v0

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(I)V

    .line 263
    if-eqz v0, :cond_0

    .line 264
    iget-object v2, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mNames:Ljava/util/List;

    const-string v3, "\u8bfb\u53d6\u503c_0101"

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    iget-object v2, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mConfigs:Ljava/util/Map;

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    :cond_0
    if-eqz v1, :cond_1

    .line 268
    iget-object v2, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mNames:Ljava/util/List;

    const-string v3, "\u8bfb\u53d6\u503c_0100"

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    iget-object v2, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mConfigs:Ljava/util/Map;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string v3, "car_config.json"

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 274
    .local v2, "open":Ljava/io/InputStream;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 275
    .local v3, "stringBuilder":Ljava/lang/StringBuilder;
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 276
    .local v4, "inputStreamReader":Ljava/io/InputStreamReader;
    nop

    .line 277
    new-instance v5, Ljava/io/BufferedReader;

    invoke-direct {v5, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 279
    .local v5, "reader":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    move-object v7, v6

    .local v7, "line":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 280
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 282
    :cond_2
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    .line 283
    invoke-virtual {v4}, Ljava/io/InputStreamReader;->close()V

    .line 284
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 285
    new-instance v6, Lorg/json/JSONArray;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 286
    .local v6, "jsonArray":Lorg/json/JSONArray;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v8, v9, :cond_3

    .line 287
    invoke-virtual {v6, v8}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    .line 288
    .local v9, "jsonObject":Lorg/json/JSONObject;
    const-string v10, "name"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 289
    .local v10, "name":Ljava/lang/String;
    const-string v11, "value"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 290
    .local v11, "value":Ljava/lang/String;
    iget-object v12, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mNames:Ljava/util/List;

    invoke-interface {v12, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    iget-object v12, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mConfigs:Ljava/util/Map;

    invoke-static {v11}, Lcom/yftech/engineeringmode/util/Utils;->hexStr2ByteArray(Ljava/lang/String;)[B

    move-result-object v13

    invoke-interface {v12, v10, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    nop

    .end local v9    # "jsonObject":Lorg/json/JSONObject;
    .end local v10    # "name":Ljava/lang/String;
    .end local v11    # "value":Ljava/lang/String;
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 296
    .end local v2    # "open":Ljava/io/InputStream;
    .end local v3    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v4    # "inputStreamReader":Ljava/io/InputStreamReader;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .end local v6    # "jsonArray":Lorg/json/JSONArray;
    .end local v7    # "line":Ljava/lang/String;
    .end local v8    # "i":I
    :cond_3
    goto :goto_2

    .line 294
    :catch_0
    move-exception v2

    .line 295
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 297
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method

.method private setConfigData([B)V
    .locals 6
    .param p1, "data"    # [B

    .line 179
    :try_start_0
    const-class v0, Lcom/yftech/vehicle/sdk/CarConfig;

    .line 180
    .local v0, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "setConfigData"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, [B

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 181
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 182
    const/4 v3, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v5

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    nop

    .end local v0    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 183
    :catch_0
    move-exception v0

    .line 184
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 186
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private setConfigData0100([B)V
    .locals 4
    .param p1, "data"    # [B

    .line 201
    invoke-static {p1}, Lcom/yftech/vehicle/sdk/HostConfig;->setConfigData([B)Z

    move-result v0

    .line 202
    .local v0, "result":Z
    sget-object v1, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setConfigData0100() data-->"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " result:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    return-void
.end method


# virtual methods
.method public getConfigs()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mConfigs:Ljava/util/Map;

    return-object v0
.end method

.method public getNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mNames:Ljava/util/List;

    return-object v0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 60
    iput-object p1, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mContext:Landroid/content/Context;

    .line 61
    invoke-direct {p0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->loadConfigs()V

    .line 62
    return-void
.end method

.method public setBitValue(Ljava/lang/String;III)V
    .locals 7
    .param p1, "did"    # Ljava/lang/String;
    .param p2, "bytePos"    # I
    .param p3, "bitPos"    # I
    .param p4, "bitValue"    # I

    .line 213
    const/4 v0, 0x7

    if-gt p3, v0, :cond_8

    if-gez p3, :cond_0

    goto/16 :goto_5

    .line 217
    :cond_0
    const/4 v0, 0x1

    if-eqz p4, :cond_1

    if-eq p4, v0, :cond_1

    .line 218
    sget-object v0, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    const-string v1, "setBitValue() bitValue is not 0/1"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    return-void

    .line 221
    :cond_1
    const-string v1, "0100"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "setBitValue() \u65b0\u7684data: "

    const-string v3, "setBitValue() \u65e7\u7684data: "

    if-eqz v1, :cond_3

    .line 222
    invoke-direct {p0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getConfigData0100()[B

    move-result-object v1

    .line 223
    .local v1, "bytes":[B
    aget-byte v4, v1, p2

    .line 224
    .local v4, "data":B
    sget-object v5, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/yftech/engineeringmode/util/Utils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    shl-int/2addr v0, p3

    .line 226
    .local v0, "mask":I
    if-nez p4, :cond_2

    .line 227
    not-int v0, v0

    .line 228
    and-int v3, v4, v0

    int-to-byte v3, v3

    .end local v4    # "data":B
    .local v3, "data":B
    goto :goto_0

    .line 230
    .end local v3    # "data":B
    .restart local v4    # "data":B
    :cond_2
    or-int v3, v4, v0

    int-to-byte v3, v3

    .line 232
    .end local v4    # "data":B
    .restart local v3    # "data":B
    :goto_0
    aput-byte v3, v1, p2

    .line 233
    sget-object v4, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/yftech/engineeringmode/util/Utils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfig0100([B)V

    .end local v0    # "mask":I
    .end local v1    # "bytes":[B
    .end local v3    # "data":B
    goto :goto_3

    .line 235
    :cond_3
    const-string v1, "0101"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 236
    invoke-direct {p0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getConfigData()[B

    move-result-object v1

    .line 237
    .restart local v1    # "bytes":[B
    if-eqz v1, :cond_6

    array-length v4, v1

    if-nez v4, :cond_4

    goto :goto_2

    .line 241
    :cond_4
    aget-byte v4, v1, p2

    .line 242
    .restart local v4    # "data":B
    sget-object v5, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/yftech/engineeringmode/util/Utils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    shl-int/2addr v0, p3

    .line 244
    .restart local v0    # "mask":I
    if-nez p4, :cond_5

    .line 245
    not-int v0, v0

    .line 246
    and-int v3, v4, v0

    int-to-byte v3, v3

    .end local v4    # "data":B
    .restart local v3    # "data":B
    goto :goto_1

    .line 248
    .end local v3    # "data":B
    .restart local v4    # "data":B
    :cond_5
    or-int v3, v4, v0

    int-to-byte v3, v3

    .line 250
    .end local v4    # "data":B
    .restart local v3    # "data":B
    :goto_1
    aput-byte v3, v1, p2

    .line 251
    sget-object v4, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/yftech/engineeringmode/util/Utils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfig0101([B)V

    goto :goto_4

    .line 238
    .end local v0    # "mask":I
    .end local v3    # "data":B
    :cond_6
    :goto_2
    sget-object v0, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    const-string v2, "setBitValue() bytes length == 0 or null"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    return-void

    .line 235
    .end local v1    # "bytes":[B
    :cond_7
    :goto_3
    nop

    .line 254
    :goto_4
    return-void

    .line 214
    :cond_8
    :goto_5
    sget-object v0, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    const-string v1, "setBitValue() bitPos is not 0~7"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    return-void
.end method

.method public setConfig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "did"    # Ljava/lang/String;
    .param p2, "indexes"    # Ljava/lang/String;
    .param p3, "values"    # Ljava/lang/String;

    .line 106
    const-string v0, "0101"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {p0, p2, p3}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfig0101(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 108
    :cond_0
    const-string v0, "0100"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 109
    invoke-virtual {p0, p2, p3}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfig0100(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    :cond_1
    :goto_0
    return-void
.end method

.method public setConfig0100(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "indexes"    # Ljava/lang/String;
    .param p2, "values"    # Ljava/lang/String;

    .line 142
    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_1

    .line 146
    :cond_0
    const-string v0, ",|\uff0c"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 147
    .local v1, "index":[Ljava/lang/String;
    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "value":[Ljava/lang/String;
    invoke-direct {p0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getConfigData0100()[B

    move-result-object v2

    .line 149
    .local v2, "data":[B
    sget-object v3, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "index:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " value:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_1

    .line 151
    aget-object v4, v1, v3

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aget-object v5, v0, v3

    const/16 v6, 0x10

    invoke-static {v5, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 150
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 153
    .end local v3    # "i":I
    :cond_1
    invoke-direct {p0, v2}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfigData0100([B)V

    .line 155
    return-void

    .line 143
    .end local v0    # "value":[Ljava/lang/String;
    .end local v1    # "index":[Ljava/lang/String;
    .end local v2    # "data":[B
    :cond_2
    :goto_1
    sget-object v0, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    const-string v1, "index or value is null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    return-void
.end method

.method public setConfig0100([B)V
    .locals 0
    .param p1, "data"    # [B

    .line 78
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfigData0100([B)V

    .line 79
    return-void
.end method

.method public setConfig0101(Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;

    .line 87
    if-nez p1, :cond_0

    .line 88
    return-void

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/manager/ConfigManager;->mConfigs:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 91
    .local v0, "data":[B
    const-string v1, "0100"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 92
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfigData0100([B)V

    goto :goto_0

    .line 94
    :cond_1
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfigData([B)V

    .line 97
    :goto_0
    return-void
.end method

.method public setConfig0101(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "indexes"    # Ljava/lang/String;
    .param p2, "values"    # Ljava/lang/String;

    .line 120
    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_1

    .line 124
    :cond_0
    const-string v0, ",|\uff0c"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 125
    .local v1, "index":[Ljava/lang/String;
    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "value":[Ljava/lang/String;
    invoke-direct {p0}, Lcom/yftech/engineeringmode/manager/ConfigManager;->getConfigData()[B

    move-result-object v2

    .line 127
    .local v2, "data":[B
    sget-object v3, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "index:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " value:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_1

    .line 129
    aget-object v4, v1, v3

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aget-object v5, v0, v3

    const/16 v6, 0x10

    invoke-static {v5, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 128
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 131
    .end local v3    # "i":I
    :cond_1
    invoke-direct {p0, v2}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfigData([B)V

    .line 133
    return-void

    .line 121
    .end local v0    # "value":[Ljava/lang/String;
    .end local v1    # "index":[Ljava/lang/String;
    .end local v2    # "data":[B
    :cond_2
    :goto_1
    sget-object v0, Lcom/yftech/engineeringmode/manager/ConfigManager;->TAG:Ljava/lang/String;

    const-string v1, "index or value is null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    return-void
.end method

.method public setConfig0101([B)V
    .locals 0
    .param p1, "data"    # [B

    .line 70
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/manager/ConfigManager;->setConfigData([B)V

    .line 71
    return-void
.end method
