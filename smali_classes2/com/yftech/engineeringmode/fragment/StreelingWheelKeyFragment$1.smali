.class Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;
.super Lcom/yftech/vehicle/sdk/CarKeyManager$CarKeyListener;
.source "StreelingWheelKeyFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;


# direct methods
.method constructor <init>(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    .line 30
    iput-object p1, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-direct {p0}, Lcom/yftech/vehicle/sdk/CarKeyManager$CarKeyListener;-><init>()V

    return-void
.end method

.method static synthetic lambda$onSteeringWheelKeyEvent$0(Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;)V
    .locals 1
    .param p0, "event"    # Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;

    .line 107
    const/16 v0, 0x270f

    invoke-static {v0}, Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;->valueOf(I)Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;

    move-result-object v0

    if-eq p0, v0, :cond_0

    .line 109
    invoke-virtual {p0}, Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;->toString()Ljava/lang/String;

    .line 111
    :cond_0
    return-void
.end method


# virtual methods
.method public onSteeringWheelKeyEvent(Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;)V
    .locals 5
    .param p1, "event"    # Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;

    .line 34
    invoke-super {p0, p1}, Lcom/yftech/vehicle/sdk/CarKeyManager$CarKeyListener;->onSteeringWheelKeyEvent(Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;)V

    .line 35
    invoke-static {}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "streelingkeychanged:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    invoke-virtual {p1}, Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "KeyCode"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    iput-object p1, v0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->mCarKeyEvent:Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;

    .line 38
    iget v0, p1, Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;->action:I

    const/16 v1, 0xb

    if-nez v0, :cond_1

    .line 39
    iget v0, p1, Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;->keyCode:I

    const/16 v2, 0x56

    const/16 v3, 0xe7

    const/16 v4, 0xf4

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    .line 68
    goto/16 :goto_0

    .line 53
    :pswitch_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$500(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 54
    goto/16 :goto_0

    .line 56
    :pswitch_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$600(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 57
    goto/16 :goto_0

    .line 50
    :pswitch_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$400(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 51
    goto/16 :goto_0

    .line 47
    :pswitch_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$300(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 48
    goto/16 :goto_0

    .line 44
    :pswitch_4
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$200(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 45
    goto/16 :goto_0

    .line 41
    :pswitch_5
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$100(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 42
    goto/16 :goto_0

    .line 62
    :pswitch_6
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$800(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 63
    goto/16 :goto_0

    .line 65
    :pswitch_7
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$900(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 66
    goto/16 :goto_0

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$700(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 60
    goto/16 :goto_0

    .line 71
    :cond_1
    iget v0, p1, Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;->action:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_3

    .line 72
    iget v0, p1, Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;->keyCode:I

    const/16 v2, 0xf8

    const/16 v3, 0xec

    const/16 v4, 0x15

    if-eq v0, v1, :cond_2

    packed-switch v0, :pswitch_data_1

    goto/16 :goto_0

    .line 88
    :pswitch_8
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$500(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 89
    goto/16 :goto_0

    .line 91
    :pswitch_9
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$600(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 92
    goto :goto_0

    .line 85
    :pswitch_a
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$400(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 86
    goto :goto_0

    .line 82
    :pswitch_b
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$300(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 83
    goto :goto_0

    .line 79
    :pswitch_c
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$200(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 80
    goto :goto_0

    .line 74
    :pswitch_d
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "============="

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$100(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 76
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 77
    goto :goto_0

    .line 97
    :pswitch_e
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$800(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 98
    goto :goto_0

    .line 100
    :pswitch_f
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$900(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 101
    goto :goto_0

    .line 94
    :cond_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$700(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 106
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment$1;->this$0:Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;

    invoke-static {v0}, Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;->access$1000(Lcom/yftech/engineeringmode/fragment/StreelingWheelKeyFragment;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/yftech/engineeringmode/fragment/-$$Lambda$StreelingWheelKeyFragment$1$mvlAxBDPaNoqT-vU18xA7uFn45g;

    invoke-direct {v1, p1}, Lcom/yftech/engineeringmode/fragment/-$$Lambda$StreelingWheelKeyFragment$1$mvlAxBDPaNoqT-vU18xA7uFn45g;-><init>(Lcom/yftech/vehicle/internal/adapter/ICarKey$CarKeyEvent;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 112
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method
