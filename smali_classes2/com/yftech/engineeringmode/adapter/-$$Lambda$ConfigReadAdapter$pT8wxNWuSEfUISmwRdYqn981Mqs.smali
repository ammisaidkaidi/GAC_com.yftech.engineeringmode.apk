.class public final synthetic Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$pT8wxNWuSEfUISmwRdYqn981Mqs;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final synthetic f$0:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

.field private final synthetic f$1:I

.field private final synthetic f$2:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;


# direct methods
.method public synthetic constructor <init>(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;ILcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$pT8wxNWuSEfUISmwRdYqn981Mqs;->f$0:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    iput p2, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$pT8wxNWuSEfUISmwRdYqn981Mqs;->f$1:I

    iput-object p3, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$pT8wxNWuSEfUISmwRdYqn981Mqs;->f$2:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$pT8wxNWuSEfUISmwRdYqn981Mqs;->f$0:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    iget v1, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$pT8wxNWuSEfUISmwRdYqn981Mqs;->f$1:I

    iget-object v2, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$pT8wxNWuSEfUISmwRdYqn981Mqs;->f$2:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;

    invoke-virtual {v0, v1, v2, p1}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->lambda$onBindViewHolder$0$ConfigReadAdapter(ILcom/yftech/engineeringmode/adapter/ConfigReadAdapter$ViewHolder;Landroid/view/View;)V

    return-void
.end method
