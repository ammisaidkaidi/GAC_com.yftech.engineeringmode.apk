.class public final synthetic Lcom/yftech/engineeringmode/adapter/-$$Lambda$ModuleAdapter$aMpvB38uQR_K_Yp24KW8-1zmOp0;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final synthetic f$0:Lcom/yftech/engineeringmode/adapter/ModuleAdapter;

.field private final synthetic f$1:Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;


# direct methods
.method public synthetic constructor <init>(Lcom/yftech/engineeringmode/adapter/ModuleAdapter;Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ModuleAdapter$aMpvB38uQR_K_Yp24KW8-1zmOp0;->f$0:Lcom/yftech/engineeringmode/adapter/ModuleAdapter;

    iput-object p2, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ModuleAdapter$aMpvB38uQR_K_Yp24KW8-1zmOp0;->f$1:Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ModuleAdapter$aMpvB38uQR_K_Yp24KW8-1zmOp0;->f$0:Lcom/yftech/engineeringmode/adapter/ModuleAdapter;

    iget-object v1, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ModuleAdapter$aMpvB38uQR_K_Yp24KW8-1zmOp0;->f$1:Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;

    invoke-virtual {v0, v1, p1}, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->lambda$onBindViewHolder$0$ModuleAdapter(Lcom/yftech/engineeringmode/adapter/ModuleAdapter$ViewHolder;Landroid/view/View;)V

    return-void
.end method
