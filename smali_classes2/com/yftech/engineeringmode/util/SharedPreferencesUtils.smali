.class public Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;
.super Ljava/lang/Object;
.source "SharedPreferencesUtils.java"


# static fields
.field private static editor:Landroid/content/SharedPreferences$Editor;

.field private static sp:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 293
    invoke-static {p0, p1}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->getString(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 295
    .local v0, "wordBase64":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 296
    const/4 v1, 0x0

    return-object v1

    .line 298
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v1

    .line 299
    .local v1, "objBytes":[B
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 300
    .local v2, "bais":Ljava/io/ByteArrayInputStream;
    new-instance v3, Ljava/io/ObjectInputStream;

    invoke-direct {v3, v2}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 302
    .local v3, "ois":Ljava/io/ObjectInputStream;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    .line 303
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V

    .line 304
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->close()V

    .line 305
    return-object v4
.end method

.method public static getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # Z

    .line 102
    invoke-static {p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 103
    .local v0, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method private static getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 31
    sget-object v0, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->sp:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    .line 32
    const/4 v0, 0x0

    const-string v1, "com.yftech.engineeringmode.sp"

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->sp:Landroid/content/SharedPreferences;

    .line 33
    sget-object v0, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->sp:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->editor:Landroid/content/SharedPreferences$Editor;

    .line 35
    :cond_0
    sget-object v0, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->sp:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method public static getInt(Landroid/content/Context;Ljava/lang/String;I)I
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # I

    .line 156
    invoke-static {p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 157
    .local v0, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public static getLong(Landroid/content/Context;Ljava/lang/String;J)J
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # J

    .line 129
    invoke-static {p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 130
    .local v0, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    return-wide v1
.end method

.method public static getObject(Landroid/content/Context;Ljava/lang/String;)Ljava/io/Serializable;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Serializable;",
            ">(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 186
    :try_start_0
    invoke-static {p0, p1}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 187
    :catch_0
    move-exception v0

    .line 188
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 190
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getString(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;

    .line 62
    invoke-static {p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 63
    .local v0, "preferences":Landroid/content/SharedPreferences;
    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 75
    invoke-static {p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 76
    .local v0, "preferences":Landroid/content/SharedPreferences;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static put(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 272
    if-nez p2, :cond_0

    .line 273
    return-void

    .line 275
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 276
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 277
    .local v1, "oos":Ljava/io/ObjectOutputStream;
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v1, v2

    .line 278
    invoke-virtual {v1, p2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 281
    new-instance v2, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    .line 282
    .local v2, "objectStr":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 283
    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->close()V

    .line 285
    invoke-static {p0, p1, v2}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->putString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    return-void
.end method

.method public static putBoolean(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .line 87
    invoke-static {p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 88
    .local v0, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 89
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 90
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 91
    return-void
.end method

.method public static putInt(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I

    .line 141
    invoke-static {p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 142
    .local v0, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 143
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 144
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 145
    return-void
.end method

.method public static putLong(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # J

    .line 114
    invoke-static {p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 115
    .local v0, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 116
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v1, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 117
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 118
    return-void
.end method

.method public static putObject(Landroid/content/Context;Ljava/lang/String;Ljava/io/Serializable;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Serializable;",
            ">(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 170
    .local p2, "obj":Ljava/io/Serializable;, "TT;"
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->put(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    goto :goto_0

    .line 171
    :catch_0
    move-exception v0

    .line 172
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 174
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static putString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 47
    invoke-static {p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 49
    .local v0, "preferences":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 50
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 51
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 52
    return-void
.end method


# virtual methods
.method public getDataList(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 219
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 220
    .local v0, "datalist":Ljava/util/List;, "Ljava/util/List<TT;>;"
    sget-object v1, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->sp:Landroid/content/SharedPreferences;

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 221
    .local v1, "strJson":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 222
    return-object v0

    .line 224
    :cond_0
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 225
    .local v2, "gson":Lcom/google/gson/Gson;
    new-instance v3, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils$1;

    invoke-direct {v3, p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils$1;-><init>(Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;)V

    .line 226
    invoke-virtual {v3}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 225
    invoke-virtual {v2, v1, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Ljava/util/List;

    .line 227
    return-object v0
.end method

.method public getMap(Ljava/lang/String;)Ljava/util/Map;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "TK;TT;>;"
        }
    .end annotation

    .line 256
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 257
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<TK;TT;>;"
    sget-object v1, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->sp:Landroid/content/SharedPreferences;

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 258
    .local v1, "strJson":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 259
    return-object v0

    .line 261
    :cond_0
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 262
    .local v2, "gson":Lcom/google/gson/Gson;
    new-instance v3, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils$2;

    invoke-direct {v3, p0}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils$2;-><init>(Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;)V

    .line 263
    invoke-virtual {v3}, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils$2;->getType()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 262
    invoke-virtual {v2, v1, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Ljava/util/Map;

    .line 264
    return-object v0
.end method

.method public setDataList(Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 200
    .local p2, "datalist":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-eqz p2, :cond_1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 203
    :cond_0
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 205
    .local v0, "gson":Lcom/google/gson/Gson;
    invoke-virtual {v0, p2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 206
    .local v1, "strJson":Ljava/lang/String;
    sget-object v2, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 207
    sget-object v2, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2, p1, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 208
    sget-object v2, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 210
    return-void

    .line 201
    .end local v0    # "gson":Lcom/google/gson/Gson;
    .end local v1    # "strJson":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void
.end method

.method public setMap(Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "TK;TT;>;)V"
        }
    .end annotation

    .line 241
    .local p2, "map":Ljava/util/Map;, "Ljava/util/Map<TK;TT;>;"
    if-eqz p2, :cond_1

    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    goto :goto_0

    .line 245
    :cond_0
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 246
    .local v0, "gson":Lcom/google/gson/Gson;
    invoke-virtual {v0, p2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 247
    .local v1, "strJson":Ljava/lang/String;
    sget-object v2, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 248
    sget-object v2, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2, p1, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 249
    sget-object v2, Lcom/yftech/engineeringmode/util/SharedPreferencesUtils;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 250
    return-void

    .line 242
    .end local v0    # "gson":Lcom/google/gson/Gson;
    .end local v1    # "strJson":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void
.end method
