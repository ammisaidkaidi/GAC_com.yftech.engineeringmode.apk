.class public Lcom/yftech/engineeringmode/model/CheckInfo;
.super Ljava/lang/Object;
.source "CheckInfo.java"


# static fields
.field public static final CHECK_RESULT_NG:I = 0x1

.field public static final CHECK_RESULT_OK:I


# instance fields
.field private key:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private realValue:Ljava/lang/String;

.field private result:I

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRealValue()Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->realValue:Ljava/lang/String;

    return-object v0
.end method

.method public getResult()I
    .locals 1

    .line 47
    iget v0, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->result:I

    return v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;

    .line 27
    iput-object p1, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->key:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 19
    iput-object p1, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->name:Ljava/lang/String;

    .line 20
    return-void
.end method

.method public setRealValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "realValue"    # Ljava/lang/String;

    .line 43
    iput-object p1, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->realValue:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public setResult(I)V
    .locals 0
    .param p1, "result"    # I

    .line 51
    iput p1, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->result:I

    .line 52
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 35
    iput-object p1, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->value:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CheckInfo{name=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", key=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->key:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", value=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->value:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", realValue=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->realValue:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", result="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/yftech/engineeringmode/model/CheckInfo;->result:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
