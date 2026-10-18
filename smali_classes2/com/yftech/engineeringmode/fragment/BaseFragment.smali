.class public Lcom/yftech/engineeringmode/fragment/BaseFragment;
.super Landroid/support/v4/app/Fragment;
.source "BaseFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 14
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .line 29
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 30
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 19
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 20
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 24
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 25
    return-void
.end method
