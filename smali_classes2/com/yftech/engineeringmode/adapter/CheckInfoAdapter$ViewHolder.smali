.class Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "CheckInfoAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field private final layout_value:Landroid/widget/LinearLayout;

.field final synthetic this$0:Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;

.field private final tv_device_value:Landroid/widget/TextView;

.field private final tv_file_value:Landroid/widget/TextView;

.field private final tv_name:Landroid/widget/TextView;

.field private final tv_result:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;Landroid/view/View;)V
    .locals 1
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;
    .param p2, "itemView"    # Landroid/view/View;

    .line 58
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->this$0:Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter;

    .line 59
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 60
    const v0, 0x7f0900bd

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->layout_value:Landroid/widget/LinearLayout;

    .line 61
    const v0, 0x7f090174

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->tv_name:Landroid/widget/TextView;

    .line 62
    const v0, 0x7f09016c

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->tv_file_value:Landroid/widget/TextView;

    .line 63
    const v0, 0x7f09016a

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->tv_device_value:Landroid/widget/TextView;

    .line 64
    const v0, 0x7f09017e

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->tv_result:Landroid/widget/TextView;

    .line 65
    return-void
.end method


# virtual methods
.method public setDeviceValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 80
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->tv_device_value:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    return-void
.end method

.method public setFileValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 76
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->tv_file_value:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 72
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->tv_name:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    return-void
.end method

.method public setResult(Ljava/lang/String;I)V
    .locals 1
    .param p1, "result"    # Ljava/lang/String;
    .param p2, "textColor"    # I

    .line 84
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->tv_result:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->tv_result:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 86
    return-void
.end method

.method public setValueVisibility(I)V
    .locals 1
    .param p1, "visibility"    # I

    .line 68
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/CheckInfoAdapter$ViewHolder;->layout_value:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 69
    return-void
.end method
