.class public Lcom/yftech/engineeringmode/fragment/USBTestFragment$UsbInfomationReceiveer;
.super Landroid/content/BroadcastReceiver;
.source "USBTestFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/USBTestFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "UsbInfomationReceiveer"
.end annotation


# static fields
.field public static final ACTION_USB_STATUS_CHANGE_IN_PHOTO_AND_VIDEO:Ljava/lang/String; = "ACTION_USB_STATUS_CHANGE_IN_PHOTO_AND_VIDEO"


# instance fields
.field public final TAG:Ljava/lang/String;

.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;


# direct methods
.method public constructor <init>(Lcom/yftech/engineeringmode/fragment/USBTestFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    .line 64
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$UsbInfomationReceiveer;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 65
    const-class v0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$UsbInfomationReceiveer;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$UsbInfomationReceiveer;->TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 71
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "action":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, -0x1

    const v4, -0x4e56a26e

    if-eq v1, v4, :cond_1

    :cond_0
    goto :goto_0

    :cond_1
    const-string v1, "ACTION_USB_STATUS_CHANGE_IN_PHOTO_AND_VIDEO"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_1

    :goto_0
    move v1, v3

    :goto_1
    if-eqz v1, :cond_2

    goto :goto_2

    .line 75
    :cond_2
    const-string v1, "usbIndex"

    invoke-virtual {p2, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 76
    .local v1, "usbIndex":I
    const-string v3, "isUsbExists"

    invoke-virtual {p2, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .line 78
    .local v2, "isUsbExists":Z
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v3

    new-instance v4, Lcom/yftech/engineeringmode/fragment/USBTestFragment$USBStateForPhotoAndVideoEvent;

    iget-object v5, p0, Lcom/yftech/engineeringmode/fragment/USBTestFragment$UsbInfomationReceiveer;->this$0:Lcom/yftech/engineeringmode/fragment/USBTestFragment;

    invoke-direct {v4, v5, v1, v2}, Lcom/yftech/engineeringmode/fragment/USBTestFragment$USBStateForPhotoAndVideoEvent;-><init>(Lcom/yftech/engineeringmode/fragment/USBTestFragment;IZ)V

    invoke-virtual {v3, v4}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 79
    nop

    .line 83
    .end local v1    # "usbIndex":I
    .end local v2    # "isUsbExists":Z
    :goto_2
    return-void
.end method
