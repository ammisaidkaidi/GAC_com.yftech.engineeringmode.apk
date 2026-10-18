.class Lcom/yftech/engineeringmode/EngineeringModeActivity$4;
.super Ljava/lang/Object;
.source "EngineeringModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/EngineeringModeActivity;->startCheckInfo(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

.field final synthetic val$checkInfoFilePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/EngineeringModeActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/EngineeringModeActivity;

    .line 355
    iput-object p1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$4;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    iput-object p2, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$4;->val$checkInfoFilePath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 358
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$4;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-static {v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$400(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 359
    const/4 v0, 0x0

    .line 361
    .local v0, "reader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 362
    .local v1, "stringBuilder":Ljava/lang/StringBuilder;
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/FileReader;

    iget-object v4, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$4;->val$checkInfoFilePath:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object v0, v2

    .line 364
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    move-object v3, v2

    .local v3, "line":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 365
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 367
    :cond_0
    invoke-static {}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$200()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "startCheckInfo() "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    new-instance v2, Lorg/json/JSONArray;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 369
    .local v2, "jsonArray":Lorg/json/JSONArray;
    const/4 v4, 0x0

    move v5, v4

    .local v5, "i":I
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v6

    const/4 v7, 0x1

    if-ge v5, v6, :cond_2

    .line 370
    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONObject;

    .line 371
    .local v6, "jsonObject":Lorg/json/JSONObject;
    new-instance v8, Lcom/yftech/engineeringmode/model/CheckInfo;

    invoke-direct {v8}, Lcom/yftech/engineeringmode/model/CheckInfo;-><init>()V

    .line 372
    .local v8, "checkInfo":Lcom/yftech/engineeringmode/model/CheckInfo;
    const-string v9, "name"

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/yftech/engineeringmode/model/CheckInfo;->setName(Ljava/lang/String;)V

    .line 373
    const-string v9, "key"

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/yftech/engineeringmode/model/CheckInfo;->setKey(Ljava/lang/String;)V

    .line 374
    const-string v9, "value"

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/yftech/engineeringmode/model/CheckInfo;->setValue(Ljava/lang/String;)V

    .line 375
    invoke-virtual {v8}, Lcom/yftech/engineeringmode/model/CheckInfo;->getKey()Ljava/lang/String;

    move-result-object v9

    const-string v10, ""

    invoke-static {v9, v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 376
    .local v9, "realValue":Ljava/lang/String;
    invoke-virtual {v8, v9}, Lcom/yftech/engineeringmode/model/CheckInfo;->setRealValue(Ljava/lang/String;)V

    .line 377
    invoke-virtual {v8}, Lcom/yftech/engineeringmode/model/CheckInfo;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    move v7, v4

    :cond_1
    invoke-virtual {v8, v7}, Lcom/yftech/engineeringmode/model/CheckInfo;->setResult(I)V

    .line 378
    invoke-static {}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$200()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8}, Lcom/yftech/engineeringmode/model/CheckInfo;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    iget-object v7, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$4;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-static {v7}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$400(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 369
    nop

    .end local v6    # "jsonObject":Lorg/json/JSONObject;
    .end local v8    # "checkInfo":Lcom/yftech/engineeringmode/model/CheckInfo;
    .end local v9    # "realValue":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 381
    .end local v5    # "i":I
    :cond_2
    iget-object v4, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity$4;->this$0:Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-static {v4}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->access$500(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    nop

    .line 387
    .end local v1    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v2    # "jsonArray":Lorg/json/JSONArray;
    .end local v3    # "line":Ljava/lang/String;
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 390
    :goto_2
    goto :goto_3

    .line 388
    :catch_0
    move-exception v1

    .line 389
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .end local v1    # "e":Ljava/io/IOException;
    goto :goto_2

    .line 385
    :catchall_0
    move-exception v1

    goto :goto_4

    .line 382
    :catch_1
    move-exception v1

    .line 383
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 385
    .end local v1    # "e":Ljava/lang/Exception;
    if-eqz v0, :cond_3

    .line 387
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    .line 393
    :cond_3
    :goto_3
    return-void

    .line 385
    :goto_4
    if-eqz v0, :cond_4

    .line 387
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 390
    goto :goto_5

    .line 388
    :catch_2
    move-exception v2

    .line 389
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 392
    .end local v2    # "e":Ljava/io/IOException;
    :cond_4
    :goto_5
    throw v1
.end method
