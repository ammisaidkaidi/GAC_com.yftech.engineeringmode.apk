.class Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;
.super Ljava/lang/Object;
.source "FaultCodeAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FaultMapping"
.end annotation


# instance fields
.field public codeAndFaultMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private codes:[Ljava/lang/String;

.field private faults:[Ljava/lang/String;

.field public indexAndCodeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private indexes:[Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 36

    .line 117
    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const/16 v1, 0x20

    new-array v1, v1, [Ljava/lang/Integer;

    .line 94
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 95
    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0xb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0xc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0xe

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0xf

    aput-object v2, v1, v3

    const/16 v2, 0x10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x10

    aput-object v2, v1, v3

    const/16 v2, 0x11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x11

    aput-object v2, v1, v3

    const/16 v2, 0x12

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x12

    aput-object v2, v1, v3

    const/16 v2, 0x13

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x13

    aput-object v2, v1, v3

    .line 96
    const/16 v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x14

    aput-object v2, v1, v3

    const/16 v2, 0x15

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x15

    aput-object v2, v1, v3

    const/16 v2, 0x16

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x16

    aput-object v2, v1, v3

    const/16 v2, 0x17

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x17

    aput-object v2, v1, v3

    const/16 v2, 0x18

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x18

    aput-object v2, v1, v3

    const/16 v2, 0x19

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x19

    aput-object v2, v1, v3

    const/16 v2, 0x1a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x1a

    aput-object v2, v1, v3

    const/16 v2, 0x1b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x1b

    aput-object v2, v1, v3

    const/16 v2, 0x1c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x1c

    aput-object v2, v1, v3

    const/16 v2, 0x1d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x1d

    aput-object v2, v1, v3

    .line 97
    const/16 v2, 0x1e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x1e

    aput-object v2, v1, v3

    const/16 v2, 0x1f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x1f

    aput-object v2, v1, v3

    iput-object v1, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->indexes:[Ljava/lang/Integer;

    .line 99
    const-string v4, "B27011C"

    const-string v5, "B27101C"

    const-string v6, "B27111C"

    const-string v7, "B27121C"

    const-string v8, "B27131C"

    const-string v9, "U007388"

    const-string v10, "U012987"

    const-string v11, "U048186"

    const-string v12, "U014087"

    const-string v13, "U042286"

    const-string v14, "U012687"

    const-string v15, "U042886"

    const-string v16, "B278187"

    const-string v17, "U015987"

    const-string v18, "U045A81"

    const-string v19, "U015187"

    const-string v20, "U045281"

    const-string v21, "B276400"

    const-string v22, "B271002"

    const-string v23, "B271102"

    const-string v24, "B271202"

    const-string v25, "B271302"

    const-string v26, "U007480"

    const-string v27, "U016487"

    const-string v28, "U015587"

    const-string v29, "U014687"

    const-string v30, "U044781"

    const-string v31, "U042481"

    const-string v32, "B1B0016"

    const-string v33, "B1B0017"

    const-string v34, "B1B4313"

    const-string v35, "B1B4011"

    filled-new-array/range {v4 .. v35}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->codes:[Ljava/lang/String;

    .line 105
    const-string v2, "\u6444\u50cf\u5934\u4f9b\u7535\u7535\u538b\u5f02\u5e38\uff08\u5c4f\u853d\u6444\u50cf\u5934\u6545\u969c\uff09"

    const-string v3, "\u524d\u6444\u50cf\u5934\u7535\u538b\u5f02\u5e38"

    const-string v4, "\u540e\u6444\u50cf\u5934\u7535\u538b\u5f02\u5e38"

    const-string v5, "\u5de6\u6444\u50cf\u5934\u7535\u538b\u5f02\u5e38"

    const-string v6, "\u53f3\u6444\u50cf\u5934\u7535\u538b\u5f02\u5e38"

    const-string v7, "CAN\u8282\u70b9\u79bb\u7ebf"

    const-string v8, "BCS \u4fe1\u53f7\u62a5\u6587\u4e22\u5931"

    const-string v9, "BCS \u4fe1\u53f7\u62a5\u6587\u6570\u636e\u5f02\u5e38"

    const-string v10, "BCM \u4fe1\u53f7\u62a5\u6587\u4e22\u5931"

    const-string v11, "BCM \u4fe1\u53f7\u62a5\u6587\u6570\u636e\u5f02\u5e38"

    const-string v12, "SAS \u4fe1\u53f7\u62a5\u6587\u4e22\u5931"

    const-string v13, "SAS \u4fe1\u53f7\u62a5\u6587\u6570\u636e\u5f02\u5e38"

    const-string v14, "MCU-EMRALD\u901a\u8baf\u6545\u969c"

    const-string v15, "PAS_1 \u4fe1\u53f7\u62a5\u6587\u4e22\u5931"

    const-string v16, "PAS_1 \u4fe1\u53f7\u62a5\u6587\u6570\u636e\u5f02\u5e38"

    const-string v17, "SRS \u4fe1\u53f7\u62a5\u6587\u4e22\u5931"

    const-string v18, "SRS \u4fe1\u53f7\u62a5\u6587\u6570\u636e\u5f02\u5e38"

    const-string v19, "LVDS\u8f93\u51fa\u6545\u969c"

    const-string v20, "\u524d\u6444\u50cf\u5934\u6ca1\u6709\u4fe1\u53f7"

    const-string v21, "\u540e\u6444\u50cf\u5934\u6ca1\u6709\u4fe1\u53f7"

    const-string v22, "\u5de6\u6444\u50cf\u5934\u6ca1\u6709\u4fe1\u53f7"

    const-string v23, "\u53f3\u6444\u50cf\u5934\u6ca1\u6709\u4fe1\u53f7"

    const-string v24, "\u8fdb\u5165\u8ddb\u884c\u72b6\u6001\u65f6\u95f4\u8fc7\u957f"

    const-string v25, "\u4e0eHVAC\u4e22\u5931\u901a\u4fe1"

    const-string v26, "\u4e0eICM\u4e22\u5931\u901a\u4fe1"

    const-string v27, "\u4e0eGWM\u4e22\u5931\u901a\u4fe1"

    const-string v28, "\u63a5\u6536\u5230\u7684GWM\u8282\u70b9\u4fe1\u53f7\u65e0\u6548"

    const-string v29, "\u63a5\u6536\u5230\u7684HVAC\u8282\u70b9\u4fe1\u53f7\u65e0\u6548"

    const-string v30, "\u7535\u6c60\u7535\u538b\u8fc7\u4f4e"

    const-string v31, "\u7535\u6c60\u7535\u538b\u8fc7\u9ad8"

    const-string v32, "\u6536\u97f3\u5929\u7ebf\u5f00\u8def"

    const-string v33, "\u6536\u97f3\u5929\u7ebf\u77ed\u8def\u5230\u5730"

    filled-new-array/range {v2 .. v33}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->faults:[Ljava/lang/String;

    .line 114
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->indexAndCodeMap:Ljava/util/Map;

    .line 115
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->codeAndFaultMap:Ljava/util/Map;

    .line 118
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->indexes:[Ljava/lang/Integer;

    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 119
    iget-object v3, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->indexAndCodeMap:Ljava/util/Map;

    aget-object v2, v2, v1

    iget-object v4, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->codes:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    iget-object v2, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->codeAndFaultMap:Ljava/util/Map;

    iget-object v3, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->codes:[Ljava/lang/String;

    aget-object v3, v3, v1

    iget-object v4, v0, Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$FaultMapping;->faults:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 122
    .end local v1    # "i":I
    :cond_0
    return-void
.end method
