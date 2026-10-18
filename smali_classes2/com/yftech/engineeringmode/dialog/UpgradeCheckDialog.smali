.class public Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;
.super Landroid/app/Dialog;
.source "UpgradeCheckDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;
    }
.end annotation


# instance fields
.field private btn_cancel:Landroid/widget/Button;

.field private btn_sure:Landroid/widget/Button;

.field private ck_mcu:Landroid/widget/CheckBox;

.field private ck_os:Landroid/widget/CheckBox;

.field private ck_screen:Landroid/widget/CheckBox;

.field private ck_screen_mcu:Landroid/widget/CheckBox;

.field private layout_checkbox:Landroid/widget/RelativeLayout;

.field private mHasMCUUpgradeFile:Z

.field private mHasOSUpgradeFile:Z

.field private mHasScreenMcuUpgradeFile:Z

.field private mHasScreenUpgradeFile:Z

.field private mOnUpgradeCheckDialogListener:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;

.field private tv_content:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 43
    const v0, 0x7f0f01f3

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 44
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 18
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_mcu:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 18
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_os:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 18
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 18
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen_mcu:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 18
    iget-object v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mOnUpgradeCheckDialogListener:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;

    .line 18
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->updateButton()V

    return-void
.end method

.method private updateButton()V
    .locals 5

    .line 177
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasMCUUpgradeFile:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasOSUpgradeFile:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasScreenUpgradeFile:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasScreenMcuUpgradeFile:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v1

    .line 178
    .local v0, "hasUpgradeFile":Z
    :goto_1
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->btn_cancel:Landroid/widget/Button;

    if-eqz v0, :cond_2

    const v4, 0x7f0e0126

    goto :goto_2

    :cond_2
    const v4, 0x7f0e0128

    :goto_2
    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(I)V

    .line 179
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->btn_cancel:Landroid/widget/Button;

    if-eqz v0, :cond_3

    const v4, 0x7f08008c

    goto :goto_3

    :cond_3
    const v4, 0x7f08008b

    :goto_3
    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 180
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->btn_sure:Landroid/widget/Button;

    if-eqz v0, :cond_4

    move v4, v2

    goto :goto_4

    :cond_4
    const/16 v4, 0x8

    :goto_4
    invoke-virtual {v3, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 181
    iget-object v3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->btn_sure:Landroid/widget/Button;

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_mcu:Landroid/widget/CheckBox;

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    if-nez v4, :cond_6

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_os:Landroid/widget/CheckBox;

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    if-nez v4, :cond_6

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen:Landroid/widget/CheckBox;

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    if-nez v4, :cond_6

    iget-object v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen_mcu:Landroid/widget/CheckBox;

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_5

    :cond_5
    move v1, v2

    :cond_6
    :goto_5
    invoke-virtual {v3, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 182
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 60
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 61
    const v0, 0x7f0c0036

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->setContentView(I)V

    .line 62
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 63
    .local v0, "window":Landroid/view/Window;
    if-eqz v0, :cond_0

    .line 64
    const/16 v1, 0x807

    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 65
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 66
    .local v1, "params":Landroid/view/WindowManager$LayoutParams;
    const/16 v2, 0x8

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 67
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 69
    .end local v1    # "params":Landroid/view/WindowManager$LayoutParams;
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->setCanceledOnTouchOutside(Z)V

    .line 70
    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->setCancelable(Z)V

    .line 72
    const v1, 0x7f09004c

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->btn_sure:Landroid/widget/Button;

    .line 73
    const v1, 0x7f09003d

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->btn_cancel:Landroid/widget/Button;

    .line 74
    const v1, 0x7f090166

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->tv_content:Landroid/widget/TextView;

    .line 75
    const v1, 0x7f0900b1

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->layout_checkbox:Landroid/widget/RelativeLayout;

    .line 76
    const v1, 0x7f090059

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_mcu:Landroid/widget/CheckBox;

    .line 77
    const v1, 0x7f09005a

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_os:Landroid/widget/CheckBox;

    .line 78
    const v1, 0x7f09005b

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen:Landroid/widget/CheckBox;

    .line 79
    const v1, 0x7f09005c

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen_mcu:Landroid/widget/CheckBox;

    .line 81
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->btn_sure:Landroid/widget/Button;

    new-instance v2, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$1;-><init>(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->btn_cancel:Landroid/widget/Button;

    new-instance v2, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$2;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$2;-><init>(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_mcu:Landroid/widget/CheckBox;

    new-instance v2, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$3;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$3;-><init>(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 114
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_os:Landroid/widget/CheckBox;

    new-instance v2, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$4;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$4;-><init>(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 124
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen:Landroid/widget/CheckBox;

    new-instance v2, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$5;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$5;-><init>(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 140
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen_mcu:Landroid/widget/CheckBox;

    new-instance v2, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$6;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$6;-><init>(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 155
    return-void
.end method

.method protected onStart()V
    .locals 5

    .line 159
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 160
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasMCUUpgradeFile:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasOSUpgradeFile:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasScreenUpgradeFile:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasScreenMcuUpgradeFile:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 161
    .local v0, "hasUpgradeFile":Z
    :goto_1
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->tv_content:Landroid/widget/TextView;

    const/16 v3, 0x8

    if-nez v0, :cond_2

    move v4, v1

    goto :goto_2

    :cond_2
    move v4, v3

    :goto_2
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 162
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->layout_checkbox:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_3

    move v4, v1

    goto :goto_3

    :cond_3
    move v4, v3

    :goto_3
    invoke-virtual {v2, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 163
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_mcu:Landroid/widget/CheckBox;

    iget-boolean v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasMCUUpgradeFile:Z

    if-eqz v4, :cond_4

    move v4, v1

    goto :goto_4

    :cond_4
    move v4, v3

    :goto_4
    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 164
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_os:Landroid/widget/CheckBox;

    iget-boolean v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasOSUpgradeFile:Z

    if-eqz v4, :cond_5

    move v4, v1

    goto :goto_5

    :cond_5
    move v4, v3

    :goto_5
    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 165
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen:Landroid/widget/CheckBox;

    iget-boolean v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasScreenUpgradeFile:Z

    if-eqz v4, :cond_6

    move v4, v1

    goto :goto_6

    :cond_6
    move v4, v3

    :goto_6
    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 166
    iget-object v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen_mcu:Landroid/widget/CheckBox;

    iget-boolean v4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasScreenMcuUpgradeFile:Z

    if-eqz v4, :cond_7

    goto :goto_7

    :cond_7
    move v1, v3

    :goto_7
    invoke-virtual {v2, v1}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 167
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_mcu:Landroid/widget/CheckBox;

    iget-boolean v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasMCUUpgradeFile:Z

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 168
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_os:Landroid/widget/CheckBox;

    iget-boolean v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasOSUpgradeFile:Z

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 169
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen:Landroid/widget/CheckBox;

    iget-boolean v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasScreenUpgradeFile:Z

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 170
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-nez v1, :cond_8

    .line 171
    iget-object v1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->ck_screen_mcu:Landroid/widget/CheckBox;

    iget-boolean v2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasScreenMcuUpgradeFile:Z

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 173
    :cond_8
    invoke-direct {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->updateButton()V

    .line 174
    return-void
.end method

.method public setOnUpgradeCheckDialogListener(Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;

    .line 55
    iput-object p1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mOnUpgradeCheckDialogListener:Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog$OnUpgradeCheckDialogListener;

    .line 56
    return-void
.end method

.method public show(ZZZZ)V
    .locals 0
    .param p1, "hasMCUUpgradeFile"    # Z
    .param p2, "hasOSUpgradeFile"    # Z
    .param p3, "hasScreenUpgradeFile"    # Z
    .param p4, "hasScreenMcuUpgradeFile"    # Z

    .line 47
    iput-boolean p1, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasMCUUpgradeFile:Z

    .line 48
    iput-boolean p2, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasOSUpgradeFile:Z

    .line 49
    iput-boolean p3, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasScreenUpgradeFile:Z

    .line 50
    iput-boolean p4, p0, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->mHasScreenMcuUpgradeFile:Z

    .line 51
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/dialog/UpgradeCheckDialog;->show()V

    .line 52
    return-void
.end method
