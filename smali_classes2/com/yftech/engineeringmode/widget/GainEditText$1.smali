.class Lcom/yftech/engineeringmode/widget/GainEditText$1;
.super Ljava/lang/Object;
.source "GainEditText.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/engineeringmode/widget/GainEditText;->setTextWatcher()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/widget/GainEditText;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/widget/GainEditText;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/widget/GainEditText;

    .line 36
    iput-object p1, p0, Lcom/yftech/engineeringmode/widget/GainEditText$1;->this$0:Lcom/yftech/engineeringmode/widget/GainEditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .line 49
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .line 40
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .line 44
    return-void
.end method
