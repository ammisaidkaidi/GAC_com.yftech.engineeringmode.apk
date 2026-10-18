.class public Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "FaultCodeAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/adapter/FaultCodeAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field public faultCode:Landroid/widget/TextView;

.field public faultDetail:Landroid/widget/Button;

.field public faultName:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
