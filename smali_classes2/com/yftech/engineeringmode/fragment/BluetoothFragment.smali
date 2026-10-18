.class public Lcom/yftech/engineeringmode/fragment/BluetoothFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "BluetoothFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/fragment/BluetoothFragment$ReadRssiThread;
    }
.end annotation


# static fields
.field private static final CONNECTED:I = 0x2

.field private static final DISCONNECTED:I = 0x0

.field private static final TAG:Ljava/lang/String; = "BluetoothInfo"


# instance fields
.field private final bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private bluetoothDeviceConnected:Landroid/bluetooth/BluetoothDevice;

.field private bluetoothGatt:Landroid/bluetooth/BluetoothGatt;

.field private final bluetoothGattCallback:Landroid/bluetooth/BluetoothGattCallback;

.field private bluetoothIsConnected:Z

.field private final bluetoothSettingsCallback:Lcom/yftech/car/bluetooth/callback/CarBluetoothSettingsCallback;

.field private btList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation
.end field

.field private volatile isRunning:Z

.field private final reloadHandler:Landroid/os/Handler;

.field private final updateRSSIUIHandler:Landroid/os/Handler;

.field private viewRoot:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 123
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 32
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 51
    new-instance v0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$1;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothGattCallback:Landroid/bluetooth/BluetoothGattCallback;

    .line 72
    new-instance v0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$2;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->updateRSSIUIHandler:Landroid/os/Handler;

    .line 85
    new-instance v0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$3;-><init>(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->reloadHandler:Landroid/os/Handler;

    .line 107
    new-instance v0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$4;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$4;-><init>(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothSettingsCallback:Lcom/yftech/car/bluetooth/callback/CarBluetoothSettingsCallback;

    .line 124
    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    .line 28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->updateRSSIUIHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    .line 28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->viewRoot:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    .line 28
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->isRunning:Z

    return v0
.end method

.method static synthetic access$202(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;
    .param p1, "x1"    # Z

    .line 28
    iput-boolean p1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->isRunning:Z

    return p1
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/bluetooth/BluetoothDevice;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    .line 28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothDeviceConnected:Landroid/bluetooth/BluetoothDevice;

    return-object v0
.end method

.method static synthetic access$302(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;Landroid/bluetooth/BluetoothDevice;)Landroid/bluetooth/BluetoothDevice;
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;
    .param p1, "x1"    # Landroid/bluetooth/BluetoothDevice;

    .line 28
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothDeviceConnected:Landroid/bluetooth/BluetoothDevice;

    return-object p1
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    .line 28
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getBluetoothRssi()V

    return-void
.end method

.method static synthetic access$500(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    .line 28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->reloadHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)Landroid/bluetooth/BluetoothGatt;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/BluetoothFragment;

    .line 28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    return-object v0
.end method

.method private getBluetoothConnectStatus()Ljava/lang/String;
    .locals 1

    .line 197
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothIsConnected:Z

    if-eqz v0, :cond_0

    .line 198
    const v0, 0x7f0e005c

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 200
    :cond_0
    const v0, 0x7f0e005e

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getBluetoothLocalAddress()Ljava/lang/String;
    .locals 1

    .line 171
    invoke-static {}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getInstance()Lcom/yftech/car/bluetooth/CarBluetoothManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getBluetoothMacAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getBluetoothLocalName()Ljava/lang/String;
    .locals 1

    .line 166
    invoke-static {}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getInstance()Lcom/yftech/car/bluetooth/CarBluetoothManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getBluetoothName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getBluetoothLocalVersion()Ljava/lang/String;
    .locals 1

    .line 176
    invoke-static {}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getInstance()Lcom/yftech/car/bluetooth/CarBluetoothManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getSDKVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getBluetoothRemoteAddress()Ljava/lang/String;
    .locals 1

    .line 189
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothIsConnected:Z

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothDeviceConnected:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 192
    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method private getBluetoothRemoteName()Ljava/lang/String;
    .locals 1

    .line 181
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothIsConnected:Z

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothDeviceConnected:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 184
    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method private getBluetoothRssi()V
    .locals 5

    .line 206
    new-instance v0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$ReadRssiThread;

    invoke-direct {v0, p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$ReadRssiThread;-><init>(Lcom/yftech/engineeringmode/fragment/BluetoothFragment;)V

    .line 207
    .local v0, "readRssiThread":Lcom/yftech/engineeringmode/fragment/BluetoothFragment$ReadRssiThread;
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothDeviceConnected:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothGattCallback:Landroid/bluetooth/BluetoothGattCallback;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Landroid/bluetooth/BluetoothDevice;->connectGatt(Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v1

    iput-object v1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    .line 209
    invoke-virtual {v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment$ReadRssiThread;->start()V

    .line 210
    const-string v1, "BluetoothInfo"

    const-string v2, "readRssiThread is start."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    return-void
.end method

.method private initData()V
    .locals 3

    .line 147
    invoke-static {}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getInstance()Lcom/yftech/car/bluetooth/CarBluetoothManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getRemoteDevices()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->btList:Ljava/util/List;

    .line 148
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->btList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 149
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothDeviceConnected:Landroid/bluetooth/BluetoothDevice;

    goto :goto_0

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->btList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothDeviceConnected:Landroid/bluetooth/BluetoothDevice;

    .line 153
    :goto_0
    iput-boolean v1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->isRunning:Z

    .line 154
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothDeviceConnected:Landroid/bluetooth/BluetoothDevice;

    const-string v2, "BluetoothInfo"

    if-eqz v0, :cond_1

    .line 155
    const-string v0, "Get the connected bluetooth device"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothIsConnected:Z

    .line 157
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getBluetoothRssi()V

    goto :goto_1

    .line 159
    :cond_1
    iput-boolean v1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothIsConnected:Z

    .line 160
    const-string v0, "The connected bluetooth device is null"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    :goto_1
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;

    .line 137
    const v0, 0x7f09015f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getBluetoothLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    const v0, 0x7f09015e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getBluetoothLocalAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    const v0, 0x7f090160

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getBluetoothLocalVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    const v0, 0x7f090162

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getBluetoothRemoteName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    const v0, 0x7f090161

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getBluetoothRemoteAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    const v0, 0x7f09015d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->getBluetoothConnectStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    const v0, 0x7f09015c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "--"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 128
    const v0, 0x7f0c003e

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 129
    .local v0, "root":Landroid/view/View;
    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->viewRoot:Landroid/view/View;

    .line 131
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->initData()V

    .line 132
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->initView(Landroid/view/View;)V

    .line 133
    return-object v0
.end method

.method public onPause()V
    .locals 2

    .line 233
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onPause()V

    .line 235
    invoke-static {}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getInstance()Lcom/yftech/car/bluetooth/CarBluetoothManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothSettingsCallback:Lcom/yftech/car/bluetooth/callback/CarBluetoothSettingsCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->unregisterBluetoothSettingsCallback(Lcom/yftech/car/bluetooth/callback/CarBluetoothSettingsCallback;)V

    .line 236
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->isRunning:Z

    .line 237
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    if-eqz v0, :cond_0

    .line 238
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 240
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 119
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 120
    invoke-static {}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->getInstance()Lcom/yftech/car/bluetooth/CarBluetoothManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/BluetoothFragment;->bluetoothSettingsCallback:Lcom/yftech/car/bluetooth/callback/CarBluetoothSettingsCallback;

    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/yftech/car/bluetooth/CarBluetoothManager;->registerBluetoothSettingsCallback(Lcom/yftech/car/bluetooth/callback/CarBluetoothSettingsCallback;Landroid/os/Handler;)V

    .line 121
    return-void
.end method
