.class public Lcom/yftech/engineeringmode/model/Module;
.super Ljava/lang/Object;
.source "Module.java"


# instance fields
.field private name:Ljava/lang/String;

.field private show:Z

.field private tag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/yftech/engineeringmode/model/Module;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .line 10
    iget-object v0, p0, Lcom/yftech/engineeringmode/model/Module;->tag:Ljava/lang/String;

    return-object v0
.end method

.method public isShow()Z
    .locals 1

    .line 26
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/model/Module;->show:Z

    return v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 22
    iput-object p1, p0, Lcom/yftech/engineeringmode/model/Module;->name:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public setShow(Z)V
    .locals 0
    .param p1, "show"    # Z

    .line 30
    iput-boolean p1, p0, Lcom/yftech/engineeringmode/model/Module;->show:Z

    .line 31
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0
    .param p1, "tag"    # Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/yftech/engineeringmode/model/Module;->tag:Ljava/lang/String;

    .line 15
    return-void
.end method
