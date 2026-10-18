.class public final synthetic Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$y9ivDAcg7FtOzkOgNqDltjQhW7w;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/yftech/engineeringmode/dialog/ConfigModifyDialog$OnConfigModifyDialogListener;


# instance fields
.field private final synthetic f$0:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;


# direct methods
.method public synthetic constructor <init>(Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$y9ivDAcg7FtOzkOgNqDltjQhW7w;->f$0:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    return-void
.end method


# virtual methods
.method public final onValue(IB)V
    .locals 1

    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/-$$Lambda$ConfigReadAdapter$y9ivDAcg7FtOzkOgNqDltjQhW7w;->f$0:Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/yftech/engineeringmode/adapter/ConfigReadAdapter;->lambda$showConfigModifyDialog$2$ConfigReadAdapter(IB)V

    return-void
.end method
