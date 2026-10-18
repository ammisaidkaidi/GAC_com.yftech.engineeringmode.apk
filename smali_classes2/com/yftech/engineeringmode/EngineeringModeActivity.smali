.class public Lcom/yftech/engineeringmode/EngineeringModeActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "EngineeringModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final MSG_SHOW_CHECK_INFO_RESULT:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private fl_container:Landroid/widget/FrameLayout;

.field private mCarMiscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

.field private mCheckInfoDialog:Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;

.field private final mCheckInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/model/CheckInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mClickCount:I

.field private mCurrentFragment:Lcom/yftech/engineeringmode/fragment/BaseFragment;

.field private mFragments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/yftech/engineeringmode/fragment/BaseFragment;",
            ">;"
        }
    .end annotation
.end field

.field private mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private final mHandlerCheckInfo:Landroid/os/Handler;

.field private mLastTag:Ljava/lang/String;

.field private mTvAuthentication:Landroid/widget/TextView;

.field private recyclerView:Landroid/support/v7/widget/RecyclerView;

.field private tv_cur_view:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 70
    const-class v0, Lcom/yftech/engineeringmode/EngineeringModeActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 68
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 78
    const-string v0, ""

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mLastTag:Ljava/lang/String;

    .line 81
    const/4 v0, 0x0

    iput v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mClickCount:I

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    .line 85
    new-instance v0, Lcom/yftech/engineeringmode/EngineeringModeActivity$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity$1;-><init>(Lcom/yftech/engineeringmode/EngineeringModeActivity;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 303
    new-instance v0, Lcom/yftech/engineeringmode/EngineeringModeActivity$2;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity$2;-><init>(Lcom/yftech/engineeringmode/EngineeringModeActivity;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCarMiscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

    .line 317
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCheckInfos:Ljava/util/List;

    .line 319
    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/yftech/engineeringmode/EngineeringModeActivity$3;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity$3;-><init>(Lcom/yftech/engineeringmode/EngineeringModeActivity;)V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mHandlerCheckInfo:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/EngineeringModeActivity;

    .line 68
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Landroid/support/v7/widget/RecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/EngineeringModeActivity;

    .line 68
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 68
    sget-object v0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/EngineeringModeActivity;

    .line 68
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCheckInfoDialog:Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;

    return-object v0
.end method

.method static synthetic access$302(Lcom/yftech/engineeringmode/EngineeringModeActivity;Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;)Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/EngineeringModeActivity;
    .param p1, "x1"    # Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;

    .line 68
    iput-object p1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCheckInfoDialog:Lcom/yftech/engineeringmode/dialog/CheckInfoDialog;

    return-object p1
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/EngineeringModeActivity;

    .line 68
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCheckInfos:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/EngineeringModeActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/EngineeringModeActivity;

    .line 68
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mHandlerCheckInfo:Landroid/os/Handler;

    return-object v0
.end method

.method private back()V
    .locals 2

    .line 189
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCurrentFragment:Lcom/yftech/engineeringmode/fragment/BaseFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCurrentFragment:Lcom/yftech/engineeringmode/fragment/BaseFragment;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 191
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->fl_container:Landroid/widget/FrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 192
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->tv_cur_view:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 193
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->tv_cur_view:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCurrentFragment:Lcom/yftech/engineeringmode/fragment/BaseFragment;

    .line 195
    iput-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mLastTag:Ljava/lang/String;

    .line 197
    :cond_0
    return-void
.end method

.method private checkInfo()V
    .locals 7

    .line 332
    invoke-static {}, Lcom/yftech/car/media/data/CarMediaDataManager;->getInstance()Lcom/yftech/car/media/data/CarMediaDataManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/media/data/CarMediaDataManager;->getExistUdiskList()Ljava/util/List;

    move-result-object v0

    .line 333
    .local v0, "udiskPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 334
    sget-object v1, Lcom/yftech/engineeringmode/EngineeringModeActivity;->TAG:Ljava/lang/String;

    const-string v2, "checkInfo() udiskPaths is null."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    return-void

    .line 337
    :cond_0
    const-string v1, ""

    .line 338
    .local v1, "checkInfoFilePath":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 339
    .local v3, "udiskPath":Ljava/lang/String;
    sget-object v4, Lcom/yftech/engineeringmode/EngineeringModeActivity;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "checkInfo() udiskPath="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/check_info.json"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 341
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 342
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 343
    goto :goto_1

    .line 345
    .end local v3    # "udiskPath":Ljava/lang/String;
    .end local v4    # "file":Ljava/io/File;
    :cond_1
    goto :goto_0

    .line 346
    :cond_2
    :goto_1
    sget-object v2, Lcom/yftech/engineeringmode/EngineeringModeActivity;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "checkInfo() checkInfoFilePath="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 348
    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->startCheckInfo(Ljava/lang/String;)V

    goto :goto_2

    .line 350
    :cond_3
    sget-object v2, Lcom/yftech/engineeringmode/EngineeringModeActivity;->TAG:Ljava/lang/String;

    const-string v3, "checkInfo() no checkInfoFile"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    :goto_2
    return-void
.end method

.method private loadFragments()V
    .locals 4

    .line 249
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/ProductInfoFragment;-><init>()V

    const-string v2, "product_info"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/LogFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/LogFragment;-><init>()V

    const-string v2, "log"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/TemperatureInfoFragment;-><init>()V

    const-string v2, "temperature_info"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/UsbUpgradeFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/UsbUpgradeFragment;-><init>()V

    const-string v2, "usb_upgrade"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/CameraFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/CameraFragment;-><init>()V

    const-string v2, "camera"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/ConfigFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/ConfigFragment;-><init>()V

    const-string v2, "config"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    const/4 v1, 0x0

    const-string v2, "tbox_info"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/AppInfoFragment;

    invoke-direct {v2}, Lcom/yftech/engineeringmode/fragment/AppInfoFragment;-><init>()V

    const-string v3, "app_info"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    const-string v2, "internet"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/TunerFragment;

    invoke-direct {v2}, Lcom/yftech/engineeringmode/fragment/TunerFragment;-><init>()V

    const-string v3, "tuner"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/WifiFragment;

    invoke-direct {v2}, Lcom/yftech/engineeringmode/fragment/WifiFragment;-><init>()V

    const-string v3, "wifi"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    invoke-direct {v2}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;-><init>()V

    const-string v3, "bluetooth"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/ScreenFragment;

    invoke-direct {v2}, Lcom/yftech/engineeringmode/fragment/ScreenFragment;-><init>()V

    const-string v3, "screen"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    const-string v2, "gps"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    const-string v2, "source"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    const-string v2, "link"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/MicTestFragment;

    invoke-direct {v2}, Lcom/yftech/engineeringmode/fragment/MicTestFragment;-><init>()V

    const-string v3, "mic"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    const-string v2, "digital_amplifier"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;

    invoke-direct {v2}, Lcom/yftech/engineeringmode/fragment/LoudSpeakerFragment;-><init>()V

    const-string v3, "loudspeaker"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-direct {v2}, Lcom/yftech/engineeringmode/fragment/USBTestFragment;-><init>()V

    const-string v3, "usb"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    const-string v2, "key"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-direct {v2}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;-><init>()V

    const-string v3, "steering_wheel_key"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;

    invoke-direct {v2}, Lcom/yftech/engineeringmode/fragment/FaultCodeFragment;-><init>()V

    const-string v3, "fault_code_clean"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    const-string v2, "can"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/BackupRecoveryFragment;-><init>()V

    const-string v2, "backup_recovery"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/AdditionalFragment;-><init>()V

    const-string v2, "additional"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;-><init>()V

    const-string v2, "authentication"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;-><init>()V

    const-string v2, "atcmetazone"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/EQFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/EQFragment;-><init>()V

    const-string v2, "eq"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/AAHeadUnitInfoFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/AAHeadUnitInfoFragment;-><init>()V

    const-string v2, "aa_info"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/OtherFragment;

    invoke-direct {v1}, Lcom/yftech/engineeringmode/fragment/OtherFragment;-><init>()V

    const-string v2, "other"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    return-void
.end method

.method private loadModule()Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yftech/engineeringmode/model/Module;",
            ">;"
        }
    .end annotation

    .line 200
    move-object/from16 v1, p0

    const-string v0, "tag"

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 202
    .local v2, "modules":Ljava/util/List;, "Ljava/util/List<Lcom/yftech/engineeringmode/model/Module;>;"
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    .line 203
    .local v3, "assets":Landroid/content/res/AssetManager;
    const-string v4, "module_config.json"

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 204
    .local v4, "open":Ljava/io/InputStream;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 205
    .local v5, "stringBuilder":Ljava/lang/StringBuilder;
    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 206
    .local v6, "inputStreamReader":Ljava/io/InputStreamReader;
    nop

    .line 207
    new-instance v7, Ljava/io/BufferedReader;

    invoke-direct {v7, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 209
    .local v7, "reader":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    move-object v9, v8

    .local v9, "line":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 210
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 212
    :cond_0
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V

    .line 213
    invoke-virtual {v6}, Ljava/io/InputStreamReader;->close()V

    .line 214
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 216
    new-instance v8, Lorg/json/JSONArray;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 217
    .local v8, "jsonArray":Lorg/json/JSONArray;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v10, v11, :cond_4

    .line 218
    invoke-virtual {v8, v10}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/json/JSONObject;

    .line 219
    .local v11, "jsonObject":Lorg/json/JSONObject;
    const-string v12, "additional"

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v13, "string"

    const-string v14, "module_"

    const-string v15, "show"

    if-eqz v12, :cond_2

    .line 220
    :try_start_1
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isCA1105Project()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 222
    new-instance v12, Lcom/yftech/engineeringmode/model/Module;

    invoke-direct {v12}, Lcom/yftech/engineeringmode/model/Module;-><init>()V

    .line 223
    .local v12, "module":Lcom/yftech/engineeringmode/model/Module;
    move-object/from16 v16, v3

    .end local v3    # "assets":Landroid/content/res/AssetManager;
    .local v16, "assets":Landroid/content/res/AssetManager;
    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v3}, Lcom/yftech/engineeringmode/model/Module;->setTag(Ljava/lang/String;)V

    .line 225
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move-object/from16 v17, v4

    .end local v4    # "open":Ljava/io/InputStream;
    .local v17, "open":Ljava/io/InputStream;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v4, v13, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 226
    .local v3, "resId":I
    invoke-virtual {v1, v3}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v4}, Lcom/yftech/engineeringmode/model/Module;->setName(Ljava/lang/String;)V

    .line 227
    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    invoke-virtual {v12, v4}, Lcom/yftech/engineeringmode/model/Module;->setShow(Z)V

    .line 228
    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    nop

    .end local v3    # "resId":I
    .end local v12    # "module":Lcom/yftech/engineeringmode/model/Module;
    goto :goto_3

    .line 220
    .end local v16    # "assets":Landroid/content/res/AssetManager;
    .end local v17    # "open":Ljava/io/InputStream;
    .local v3, "assets":Landroid/content/res/AssetManager;
    .restart local v4    # "open":Ljava/io/InputStream;
    :cond_1
    move-object/from16 v16, v3

    move-object/from16 v17, v4

    .end local v3    # "assets":Landroid/content/res/AssetManager;
    .end local v4    # "open":Ljava/io/InputStream;
    .restart local v16    # "assets":Landroid/content/res/AssetManager;
    .restart local v17    # "open":Ljava/io/InputStream;
    goto :goto_2

    .line 219
    .end local v16    # "assets":Landroid/content/res/AssetManager;
    .end local v17    # "open":Ljava/io/InputStream;
    .restart local v3    # "assets":Landroid/content/res/AssetManager;
    .restart local v4    # "open":Ljava/io/InputStream;
    :cond_2
    move-object/from16 v16, v3

    move-object/from16 v17, v4

    .line 230
    .end local v3    # "assets":Landroid/content/res/AssetManager;
    .end local v4    # "open":Ljava/io/InputStream;
    .restart local v16    # "assets":Landroid/content/res/AssetManager;
    .restart local v17    # "open":Ljava/io/InputStream;
    :goto_2
    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 231
    new-instance v3, Lcom/yftech/engineeringmode/model/Module;

    invoke-direct {v3}, Lcom/yftech/engineeringmode/model/Module;-><init>()V

    .line 232
    .local v3, "module":Lcom/yftech/engineeringmode/model/Module;
    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/yftech/engineeringmode/model/Module;->setTag(Ljava/lang/String;)V

    .line 234
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p0 .. p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v12, v13, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 235
    .local v4, "resId":I
    invoke-virtual {v1, v4}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v12}, Lcom/yftech/engineeringmode/model/Module;->setName(Ljava/lang/String;)V

    .line 236
    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {v3, v12}, Lcom/yftech/engineeringmode/model/Module;->setShow(Z)V

    .line 237
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 217
    .end local v3    # "module":Lcom/yftech/engineeringmode/model/Module;
    .end local v4    # "resId":I
    .end local v11    # "jsonObject":Lorg/json/JSONObject;
    :cond_3
    :goto_3
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v3, v16

    move-object/from16 v4, v17

    goto/16 :goto_1

    .end local v16    # "assets":Landroid/content/res/AssetManager;
    .end local v17    # "open":Ljava/io/InputStream;
    .local v3, "assets":Landroid/content/res/AssetManager;
    .local v4, "open":Ljava/io/InputStream;
    :cond_4
    move-object/from16 v16, v3

    move-object/from16 v17, v4

    .line 244
    .end local v3    # "assets":Landroid/content/res/AssetManager;
    .end local v4    # "open":Ljava/io/InputStream;
    .end local v5    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v6    # "inputStreamReader":Ljava/io/InputStreamReader;
    .end local v7    # "reader":Ljava/io/BufferedReader;
    .end local v8    # "jsonArray":Lorg/json/JSONArray;
    .end local v9    # "line":Ljava/lang/String;
    .end local v10    # "i":I
    goto :goto_4

    .line 242
    :catch_0
    move-exception v0

    .line 243
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 245
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_4
    return-object v2
.end method

.method private screenshot()V
    .locals 0

    .line 186
    return-void
.end method

.method private setADBEnable(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .line 166
    invoke-static {}, Lcom/yftech/car/utils/PlatformProjectDescribe;->isATC8015Platform()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 168
    if-eqz p1, :cond_0

    const-string v0, "device"

    goto :goto_0

    :cond_0
    const-string v0, "host"

    :goto_0
    const-string v1, "/sys/class/dual_role_usb/dual-role-usb20/data_role"

    invoke-static {v1, v0}, Lcom/yftech/engineeringmode/util/Utils;->setNodeString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 172
    :cond_1
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    if-eqz p1, :cond_2

    const-string v1, "yftools.sh device"

    goto :goto_1

    :cond_2
    const-string v1, "yftools.sh host"

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    .line 173
    const-string v0, "persist.adb.tls_server.enable"

    if-eqz p1, :cond_3

    const-string v1, "1"

    goto :goto_2

    :cond_3
    const-string v1, "0"

    :goto_2
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    goto :goto_3

    .line 177
    :catch_0
    move-exception v0

    .line 178
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 181
    .end local v0    # "e":Ljava/io/IOException;
    :goto_3
    if-eqz p1, :cond_4

    const-string v0, "adb opened !!!"

    goto :goto_4

    :cond_4
    const-string v0, "adb closed !!!"

    :goto_4
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 183
    return-void
.end method

.method private showFragment(Lcom/yftech/engineeringmode/model/Module;)V
    .locals 4
    .param p1, "module"    # Lcom/yftech/engineeringmode/model/Module;

    .line 156
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mFragments:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/yftech/engineeringmode/model/Module;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yftech/engineeringmode/fragment/BaseFragment;

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCurrentFragment:Lcom/yftech/engineeringmode/fragment/BaseFragment;

    .line 157
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCurrentFragment:Lcom/yftech/engineeringmode/fragment/BaseFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 158
    sget-object v0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showFragment() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/yftech/engineeringmode/model/Module;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->tv_cur_view:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/yftech/engineeringmode/model/Module;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->tv_cur_view:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 161
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const v2, 0x7f090098

    iget-object v3, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCurrentFragment:Lcom/yftech/engineeringmode/fragment/BaseFragment;

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 162
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->fl_container:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 164
    :cond_0
    return-void
.end method

.method private startCheckInfo(Ljava/lang/String;)V
    .locals 3
    .param p1, "checkInfoFilePath"    # Ljava/lang/String;

    .line 355
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/yftech/engineeringmode/EngineeringModeActivity$4;

    invoke-direct {v1, p0, p1}, Lcom/yftech/engineeringmode/EngineeringModeActivity$4;-><init>(Lcom/yftech/engineeringmode/EngineeringModeActivity;Ljava/lang/String;)V

    const-string v2, "EngineeringmodeCheckInfoThread"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 394
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 395
    return-void
.end method


# virtual methods
.method public synthetic lambda$onCreate$0$EngineeringModeActivity(Landroid/view/View;ILcom/yftech/engineeringmode/model/Module;)V
    .locals 2
    .param p1, "itemView"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "module"    # Lcom/yftech/engineeringmode/model/Module;

    .line 104
    if-eqz p3, :cond_1

    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mLastTag:Ljava/lang/String;

    invoke-virtual {p3}, Lcom/yftech/engineeringmode/model/Module;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 107
    :cond_0
    invoke-virtual {p3}, Lcom/yftech/engineeringmode/model/Module;->getTag()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mLastTag:Ljava/lang/String;

    .line 108
    invoke-direct {p0, p3}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->showFragment(Lcom/yftech/engineeringmode/model/Module;)V

    .line 109
    return-void

    .line 105
    :cond_1
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 125
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 143
    :sswitch_0
    iget v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mClickCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mClickCount:I

    .line 144
    iget v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mClickCount:I

    const/16 v1, 0xa

    if-lt v0, v1, :cond_1

    .line 145
    const/4 v0, 0x0

    iput v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mClickCount:I

    .line 146
    iget-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mTvAuthentication:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    const/16 v0, 0x8

    :cond_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 127
    :sswitch_1
    invoke-direct {p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->screenshot()V

    .line 128
    goto :goto_0

    .line 133
    :sswitch_2
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->finish()V

    .line 134
    goto :goto_0

    .line 130
    :sswitch_3
    invoke-direct {p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->back()V

    .line 131
    goto :goto_0

    .line 136
    :sswitch_4
    new-instance v0, Lcom/yftech/engineeringmode/model/Module;

    invoke-direct {v0}, Lcom/yftech/engineeringmode/model/Module;-><init>()V

    .line 137
    .local v0, "module":Lcom/yftech/engineeringmode/model/Module;
    const-string v2, "authentication"

    invoke-virtual {v0, v2}, Lcom/yftech/engineeringmode/model/Module;->setTag(Ljava/lang/String;)V

    .line 138
    const-string v2, "\u8ba4\u8bc1\u8bbe\u7f6e\u9879"

    invoke-virtual {v0, v2}, Lcom/yftech/engineeringmode/model/Module;->setName(Ljava/lang/String;)V

    .line 139
    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/model/Module;->setShow(Z)V

    .line 140
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->showFragment(Lcom/yftech/engineeringmode/model/Module;)V

    .line 141
    goto :goto_0

    .line 150
    .end local v0    # "module":Lcom/yftech/engineeringmode/model/Module;
    :sswitch_5
    invoke-direct {p0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->setADBEnable(Z)V

    .line 153
    :cond_1
    :goto_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f090156 -> :sswitch_5
        0x7f090159 -> :sswitch_4
        0x7f09015b -> :sswitch_3
        0x7f090165 -> :sswitch_2
        0x7f090181 -> :sswitch_1
        0x7f09018c -> :sswitch_0
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 97
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 98
    const v0, 0x7f0c001c

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->setContentView(I)V

    .line 99
    const v0, 0x7f090098

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->fl_container:Landroid/widget/FrameLayout;

    .line 100
    const v0, 0x7f0900f5

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 101
    iget-object v0, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 102
    new-instance v0, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->loadModule()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;-><init>(Ljava/util/List;)V

    .line 103
    .local v0, "adapter":Lcom/yftech/engineeringmode/adapter/ModuleAdapter;
    new-instance v1, Lcom/yftech/engineeringmode/-$$Lambda$EngineeringModeActivity$mUaX3y19x9gx2on7WJBQe5-Ipj8;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/-$$Lambda$EngineeringModeActivity$mUaX3y19x9gx2on7WJBQe5-Ipj8;-><init>(Lcom/yftech/engineeringmode/EngineeringModeActivity;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/adapter/ModuleAdapter;->setOnItemClickListener(Lcom/yftech/engineeringmode/adapter/ModuleAdapter$OnItemClickListener;)V

    .line 110
    iget-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 111
    const v1, 0x7f090169

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->tv_cur_view:Landroid/widget/TextView;

    .line 112
    const v1, 0x7f090181

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    const v1, 0x7f09015b

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    const v1, 0x7f090165

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    const v1, 0x7f09018c

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    const v1, 0x7f090156

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    const v1, 0x7f090159

    invoke-virtual {p0, v1}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mTvAuthentication:Landroid/widget/TextView;

    .line 118
    iget-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mTvAuthentication:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 119
    iget-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mTvAuthentication:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 120
    invoke-direct {p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->loadFragments()V

    .line 121
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 298
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 299
    sget-object v0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->TAG:Ljava/lang/String;

    const-string v1, "onPause()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCarMiscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarMiscManager;->unregisterReceiver(Ljava/lang/Object;)V

    .line 301
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 291
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 292
    sget-object v0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->TAG:Ljava/lang/String;

    const-string v1, "onResume()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->mCarMiscListener:Lcom/yftech/vehicle/sdk/CarMiscManager$CarMiscListener;

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarMiscManager;->registerReceiver(Ljava/lang/Object;)V

    .line 294
    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 284
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onStart()V

    .line 285
    sget-object v0, Lcom/yftech/engineeringmode/EngineeringModeActivity;->TAG:Ljava/lang/String;

    const-string v1, "onStart()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    invoke-direct {p0}, Lcom/yftech/engineeringmode/EngineeringModeActivity;->checkInfo()V

    .line 287
    return-void
.end method
