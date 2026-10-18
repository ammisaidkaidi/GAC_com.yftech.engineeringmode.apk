.class public Lcom/yftech/engineeringmode/widget/GainEditText;
.super Landroid/widget/EditText;
.source "GainEditText.java"


# instance fields
.field private context:Landroid/content/Context;

.field private max:I

.field private min:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 21
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 22
    iput-object p1, p0, Lcom/yftech/engineeringmode/widget/GainEditText;->context:Landroid/content/Context;

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    iput-object p1, p0, Lcom/yftech/engineeringmode/widget/GainEditText;->context:Landroid/content/Context;

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    iput-object p1, p0, Lcom/yftech/engineeringmode/widget/GainEditText;->context:Landroid/content/Context;

    .line 33
    return-void
.end method


# virtual methods
.method public setTextWatcher()V
    .locals 1

    .line 36
    new-instance v0, Lcom/yftech/engineeringmode/widget/GainEditText$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/widget/GainEditText$1;-><init>(Lcom/yftech/engineeringmode/widget/GainEditText;)V

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/widget/GainEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 51
    return-void
.end method
