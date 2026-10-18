.class Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AppInfoAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field private mIvIcon:Landroid/widget/ImageView;

.field private mTvAppName:Landroid/widget/TextView;

.field private mTvAppPackage:Landroid/widget/TextView;

.field private mTvVersionCode:Landroid/widget/TextView;

.field private mTvVersionName:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;


# direct methods
.method public constructor <init>(Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;Landroid/view/View;)V
    .locals 1
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;
    .param p2, "itemView"    # Landroid/view/View;

    .line 63
    iput-object p1, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->this$0:Lcom/yftech/engineeringmode/adapter/AppInfoAdapter;

    .line 64
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 65
    const v0, 0x7f0900a9

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->mIvIcon:Landroid/widget/ImageView;

    .line 66
    const v0, 0x7f090157

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->mTvAppName:Landroid/widget/TextView;

    .line 67
    const v0, 0x7f090158

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->mTvAppPackage:Landroid/widget/TextView;

    .line 68
    const v0, 0x7f090194

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->mTvVersionCode:Landroid/widget/TextView;

    .line 69
    const v0, 0x7f090195

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->mTvVersionName:Landroid/widget/TextView;

    .line 70
    return-void
.end method


# virtual methods
.method public setAppIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 73
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->mIvIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 74
    return-void
.end method

.method public setAppName(Ljava/lang/String;)V
    .locals 1
    .param p1, "appName"    # Ljava/lang/String;

    .line 77
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->mTvAppName:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    return-void
.end method

.method public setAppPackage(Ljava/lang/String;)V
    .locals 1
    .param p1, "appPackage"    # Ljava/lang/String;

    .line 81
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->mTvAppPackage:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    return-void
.end method

.method public setVersionCode(Ljava/lang/String;)V
    .locals 1
    .param p1, "versionCode"    # Ljava/lang/String;

    .line 85
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->mTvVersionCode:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    return-void
.end method

.method public setVersionName(Ljava/lang/String;)V
    .locals 1
    .param p1, "versionName"    # Ljava/lang/String;

    .line 89
    iget-object v0, p0, Lcom/yftech/engineeringmode/adapter/AppInfoAdapter$ViewHolder;->mTvVersionName:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    return-void
.end method
