.class public Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "AtcMetazoneFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private binaryIndex:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private dialog:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;

.field private dwordIndex:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private option:I

.field private read:Landroid/widget/Button;

.field private spOption:Landroid/widget/Spinner;

.field private tvIndex:Landroid/widget/TextView;

.field private tvValue:Landroid/widget/TextView;

.field private write:Landroid/widget/Button;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    const-class v0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 35
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    .line 28
    iget v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->option:I

    return v0
.end method

.method static synthetic access$100(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .line 28
    invoke-direct {p0, p1, p2, p3}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->writeMetazone(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;ILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->readMetazone(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    .line 28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->tvIndex:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;

    .line 28
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->tvValue:Landroid/widget/TextView;

    return-object v0
.end method

.method private getIndex(I)Ljava/util/List;
    .locals 2
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 180
    if-nez p1, :cond_0

    .line 181
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->dwordIndex:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0

    .line 182
    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 183
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->binaryIndex:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0

    .line 185
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private initData()V
    .locals 1

    .line 71
    invoke-static {}, Lcom/yftech/engineeringmode/model/Metazone;->getBinaryIndex()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->binaryIndex:Ljava/util/Map;

    .line 72
    invoke-static {}, Lcom/yftech/engineeringmode/model/Metazone;->getDwordIndex()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->dwordIndex:Ljava/util/Map;

    .line 73
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 4
    .param p1, "root"    # Landroid/view/View;

    .line 53
    const v0, 0x7f090126

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->spOption:Landroid/widget/Spinner;

    .line 54
    const v0, 0x7f090029

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->read:Landroid/widget/Button;

    .line 55
    const v0, 0x7f09002a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->write:Landroid/widget/Button;

    .line 56
    const v0, 0x7f09016f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->tvIndex:Landroid/widget/TextView;

    .line 57
    const v0, 0x7f090193

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->tvValue:Landroid/widget/TextView;

    .line 59
    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 60
    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f030001

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0c0064

    invoke-direct {v0, v1, v3, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 61
    .local v0, "saveOptionAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v1, 0x7f0c0065

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 62
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->spOption:Landroid/widget/Spinner;

    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 63
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->spOption:Landroid/widget/Spinner;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 64
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->spOption:Landroid/widget/Spinner;

    invoke-virtual {v1, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 66
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->read:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->write:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    return-void
.end method

.method private readMetazone(ILjava/lang/String;)V
    .locals 10
    .param p1, "option"    # I
    .param p2, "index"    # Ljava/lang/String;

    .line 118
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 119
    sget-object v0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->TAG:Ljava/lang/String;

    const-string v1, "readMetazone index is null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    return-void

    .line 125
    :cond_0
    const/4 v0, 0x1

    new-array v7, v0, [I

    .line 126
    .local v7, "intValue":[I
    const/16 v1, 0x10

    new-array v8, v1, [B

    .line 127
    .local v8, "byteValue":[B
    const-string v1, " value:"

    const-string v2, " index:"

    if-eqz p1, :cond_2

    if-eq p1, v0, :cond_1

    goto :goto_0

    .line 134
    :cond_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->binaryIndex:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 135
    .local v0, "i":I
    const/16 v3, 0xa

    invoke-static {v0, v8, v3}, Lcom/autochips/metazone/AtcMetazone;->readbinary(I[BI)I

    move-result v3

    .line 136
    .local v3, "result":I
    sget-object v4, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "readMetazone by Binary --> result:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 129
    .end local v0    # "i":I
    .end local v3    # "result":I
    :cond_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->dwordIndex:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 130
    .restart local v0    # "i":I
    invoke-static {v0, v7}, Lcom/autochips/metazone/AtcMetazone;->readval(I[I)I

    move-result v3

    .line 131
    .restart local v3    # "result":I
    sget-object v4, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "readMetazone by int --> result:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    nop

    .line 139
    .end local v0    # "i":I
    .end local v3    # "result":I
    :goto_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->mHandler:Landroid/os/Handler;

    new-instance v9, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;

    move-object v1, v9

    move-object v2, p0

    move-object v3, p2

    move v4, p1

    move-object v5, v7

    move-object v6, v8

    invoke-direct/range {v1 .. v6}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$2;-><init>(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;Ljava/lang/String;I[I[B)V

    invoke-virtual {v0, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 153
    return-void
.end method

.method private writeMetazone(ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "option"    # I
    .param p2, "index"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .line 156
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 163
    :cond_0
    if-eqz p1, :cond_2

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    goto :goto_0

    .line 171
    :cond_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->binaryIndex:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 172
    .local v0, "i":I
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 173
    .local v1, "byteV":[B
    const/16 v2, 0xa

    invoke-static {v0, v1, v2}, Lcom/autochips/metazone/AtcMetazone;->writebinary(I[BI)I

    move-result v2

    .line 174
    .local v2, "result":I
    sget-object v3, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "writeMetazone by Binary --> result:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " index:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " value:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 165
    .end local v0    # "i":I
    .end local v1    # "byteV":[B
    .end local v2    # "result":I
    :cond_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->dwordIndex:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 166
    .restart local v0    # "i":I
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 167
    .local v1, "v":I
    invoke-static {v0, v1}, Lcom/autochips/metazone/AtcMetazone;->writeval(II)I

    move-result v2

    .line 168
    .restart local v2    # "result":I
    sget-object v3, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "writeMetazone by int --> result:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    nop

    .line 177
    .end local v0    # "i":I
    .end local v1    # "v":I
    .end local v2    # "result":I
    :goto_0
    return-void

    .line 157
    :cond_3
    :goto_1
    sget-object v0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->TAG:Ljava/lang/String;

    const-string v1, "writeMetazone: index or value is null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    return-void
.end method


# virtual methods
.method public bytesToInt([B)I
    .locals 2
    .param p1, "bytes"    # [B

    .line 189
    const/4 v0, 0x0

    aget-byte v0, p1, v0

    shl-int/lit8 v0, v0, 0x18

    const/4 v1, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    const/4 v1, 0x2

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    const/4 v1, 0x3

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public bytesToInts([B)[I
    .locals 8
    .param p1, "bytes"    # [B

    .line 193
    array-length v0, p1

    .line 194
    .local v0, "bytesLength":I
    rem-int/lit8 v1, v0, 0x4

    if-nez v1, :cond_0

    div-int/lit8 v1, v0, 0x4

    goto :goto_0

    :cond_0
    div-int/lit8 v1, v0, 0x4

    add-int/lit8 v1, v1, 0x1

    :goto_0
    new-array v1, v1, [I

    .line 195
    .local v1, "ints":[I
    const/4 v2, 0x4

    .line 196
    .local v2, "lengthFlag":I
    :goto_1
    if-gt v2, v0, :cond_1

    .line 197
    div-int/lit8 v3, v2, 0x4

    add-int/lit8 v3, v3, -0x1

    add-int/lit8 v4, v2, -0x4

    aget-byte v4, p1, v4

    shl-int/lit8 v4, v4, 0x18

    add-int/lit8 v5, v2, -0x3

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x10

    or-int/2addr v4, v5

    add-int/lit8 v5, v2, -0x2

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr v4, v5

    add-int/lit8 v5, v2, -0x1

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    or-int/2addr v4, v5

    aput v4, v1, v3

    .line 199
    add-int/lit8 v2, v2, 0x4

    goto :goto_1

    .line 201
    :cond_1
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    add-int/lit8 v4, v0, 0x4

    sub-int/2addr v4, v2

    if-ge v3, v4, :cond_3

    .line 202
    if-nez v3, :cond_2

    .line 203
    div-int/lit8 v4, v2, 0x4

    add-int/lit8 v4, v4, -0x1

    aget v5, v1, v4

    add-int/lit8 v6, v2, -0x4

    add-int/2addr v6, v3

    aget-byte v6, p1, v6

    add-int/lit8 v7, v0, 0x4

    sub-int/2addr v7, v2

    sub-int/2addr v7, v3

    add-int/lit8 v7, v7, -0x1

    mul-int/lit8 v7, v7, 0x8

    shl-int/2addr v6, v7

    or-int/2addr v5, v6

    aput v5, v1, v4

    goto :goto_3

    .line 205
    :cond_2
    div-int/lit8 v4, v2, 0x4

    add-int/lit8 v4, v4, -0x1

    aget v5, v1, v4

    add-int/lit8 v6, v2, -0x4

    add-int/2addr v6, v3

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    add-int/lit8 v7, v0, 0x4

    sub-int/2addr v7, v2

    sub-int/2addr v7, v3

    add-int/lit8 v7, v7, -0x1

    mul-int/lit8 v7, v7, 0x8

    shl-int/2addr v6, v7

    or-int/2addr v5, v6

    aput v5, v1, v4

    .line 201
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 207
    .end local v3    # "i":I
    :cond_3
    return-object v1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 91
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 97
    :pswitch_0
    new-instance v0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    iget v3, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->option:I

    invoke-direct {p0, v3}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->getIndex(I)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;-><init>(Landroid/content/Context;ZLjava/util/List;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->dialog:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;

    .line 98
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->dialog:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->show()V

    .line 99
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->dialog:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->tvIndex:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->setEditIndex(Ljava/lang/String;)V

    goto :goto_0

    .line 93
    :pswitch_1
    new-instance v0, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    iget v3, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->option:I

    invoke-direct {p0, v3}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->getIndex(I)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;-><init>(Landroid/content/Context;ZLjava/util/List;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->dialog:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;

    .line 94
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->dialog:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;

    invoke-virtual {v0}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->show()V

    .line 95
    nop

    .line 102
    :goto_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->dialog:Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;

    new-instance v1, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$1;

    invoke-direct {v1, p0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment$1;-><init>(Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;)V

    invoke-virtual {v0, v1}, Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog;->setOnButtonClickListener(Lcom/yftech/engineeringmode/dialog/AtcMetazoneInpuDialog$OnDialogButtonClickListener;)V

    .line 115
    return-void

    :pswitch_data_0
    .packed-switch 0x7f090029
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 46
    const v0, 0x7f0c003b

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 47
    .local v0, "view":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->initView(Landroid/view/View;)V

    .line 48
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->initData()V

    .line 49
    return-object v0
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 77
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getId()I

    move-result v0

    const v1, 0x7f090126

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 79
    :cond_0
    iput p3, p0, Lcom/yftech/engineeringmode/fragment/AtcMetazoneFragment;->option:I

    .line 82
    :goto_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 87
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
