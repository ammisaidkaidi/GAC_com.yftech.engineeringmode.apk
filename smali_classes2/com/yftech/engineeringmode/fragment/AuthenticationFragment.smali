.class public Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "AuthenticationFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final CERTIFICATE_FILE_PATH:Ljava/lang/String;

.field private final CERTIFICATE_FILE_PATH_CACHE:Ljava/lang/String;

.field private final HICAR_CERTIFICATE_FILE_PATH:Ljava/lang/String;

.field private final HICAR_CERTIFICATE_FILE_PATH_CACHE:Ljava/lang/String;

.field private carType:[Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

.field private spAteCarType:Landroid/widget/Spinner;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const-class v0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 25
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/certificate"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->CERTIFICATE_FILE_PATH:Ljava/lang/String;

    .line 30
    const-string v0, "/cache/recovery/last_certificate"

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->CERTIFICATE_FILE_PATH_CACHE:Ljava/lang/String;

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/certificate_hicar"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->HICAR_CERTIFICATE_FILE_PATH:Ljava/lang/String;

    .line 32
    const-string v0, "/cache/recovery/last_certificate_hicar"

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->HICAR_CERTIFICATE_FILE_PATH_CACHE:Ljava/lang/String;

    .line 36
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    sget-object v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;->IHU12_A88_A1:Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;->IHU12_A58_B1:Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;->IHU12_A79_C1:Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;->IHU12_A79_C2:Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->carType:[Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    return-void
.end method

.method private createCertificateFile()V
    .locals 6

    .line 130
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->CERTIFICATE_FILE_PATH:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 131
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 133
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    move-result v1

    .line 134
    .local v1, "result":Z
    sget-object v2, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "createCertificateFile() result:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    nop

    .end local v1    # "result":Z
    goto :goto_0

    .line 135
    :catch_0
    move-exception v1

    .line 136
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 139
    .end local v1    # "e":Ljava/io/IOException;
    :cond_0
    :goto_0
    new-instance v1, Ljava/io/File;

    const-string v2, "/cache/recovery/last_certificate"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 140
    .local v1, "fileCache":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 142
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    move-result v2

    .line 143
    .local v2, "resultCache":Z
    sget-object v3, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "createCertificateFile() resultCache:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 146
    nop

    .end local v2    # "resultCache":Z
    goto :goto_1

    .line 144
    :catch_1
    move-exception v2

    .line 145
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 148
    .end local v2    # "e":Ljava/io/IOException;
    :cond_1
    :goto_1
    return-void
.end method

.method private createHiCarCertificateFile()V
    .locals 6

    .line 157
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->HICAR_CERTIFICATE_FILE_PATH:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 158
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 160
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    move-result v1

    .line 161
    .local v1, "result":Z
    sget-object v2, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "createHiCarCertificateFile() result:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    nop

    .end local v1    # "result":Z
    goto :goto_0

    .line 162
    :catch_0
    move-exception v1

    .line 163
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 166
    .end local v1    # "e":Ljava/io/IOException;
    :cond_0
    :goto_0
    new-instance v1, Ljava/io/File;

    const-string v2, "/cache/recovery/last_certificate_hicar"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 167
    .local v1, "fileCache":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 169
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    move-result v2

    .line 170
    .local v2, "resultCache":Z
    sget-object v3, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "createHiCarCertificateFile() resultCache:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 173
    nop

    .end local v2    # "resultCache":Z
    goto :goto_1

    .line 171
    :catch_1
    move-exception v2

    .line 172
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 175
    .end local v2    # "e":Ljava/io/IOException;
    :cond_1
    :goto_1
    return-void
.end method

.method private getCarType()I
    .locals 4

    .line 119
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/vehicle/sdk/CarMiscManager;->getAteCarType()Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    move-result-object v0

    .line 120
    .local v0, "type":Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;
    sget-object v1, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCarType type:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->carType:[Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 122
    aget-object v2, v2, v1

    if-ne v2, v0, :cond_0

    .line 123
    return v1

    .line 121
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 126
    .end local v1    # "index":I
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method private initView(Landroid/view/View;)V
    .locals 7
    .param p1, "root"    # Landroid/view/View;

    .line 47
    const v0, 0x7f09002b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    const/4 v2, 0x0

    const-string v3, "persist.sys.carplay.certificate"

    invoke-static {v3, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    move v3, v4

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    invoke-virtual {v1, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 48
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 51
    const v0, 0x7f09002e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    const-string v3, "persist.vendor.ul.dl.same.rate"

    invoke-static {v3, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v4, :cond_1

    move v3, v4

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    invoke-virtual {v1, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 52
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 54
    const v0, 0x7f09002d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 56
    const v0, 0x7f090127

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->spAteCarType:Landroid/widget/Spinner;

    .line 57
    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f0c0064

    invoke-virtual {p0}, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/high16 v6, 0x7f030000

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v1, v3, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 58
    .local v0, "internalProjectCodeAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v1, 0x7f0c0065

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 59
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->spAteCarType:Landroid/widget/Spinner;

    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 60
    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->spAteCarType:Landroid/widget/Spinner;

    invoke-virtual {v1, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 63
    const v1, 0x7f09002c

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Switch;

    const-string v5, "persist.sys.hicar.certificate"

    invoke-static {v5, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v5

    if-ne v5, v4, :cond_2

    move v2, v4

    :cond_2
    invoke-virtual {v3, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 64
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    invoke-virtual {v1, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 66
    return-void
.end method

.method private removeCertificateFile()V
    .locals 5

    .line 151
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->CERTIFICATE_FILE_PATH:Ljava/lang/String;

    invoke-static {v0}, Lcom/yftech/engineeringmode/util/DeleteUtil;->delete(Ljava/lang/String;)Z

    move-result v0

    .line 152
    .local v0, "result":Z
    const-string v1, "/cache/recovery/last_certificate"

    invoke-static {v1}, Lcom/yftech/engineeringmode/util/DeleteUtil;->delete(Ljava/lang/String;)Z

    move-result v1

    .line 153
    .local v1, "resultCache":Z
    sget-object v2, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "removeCertificateFile() result:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " resultCache:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    return-void
.end method

.method private removeHiCarCertificateFile()V
    .locals 5

    .line 178
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->HICAR_CERTIFICATE_FILE_PATH:Ljava/lang/String;

    invoke-static {v0}, Lcom/yftech/engineeringmode/util/DeleteUtil;->delete(Ljava/lang/String;)Z

    move-result v0

    .line 179
    .local v0, "result":Z
    const-string v1, "/cache/recovery/last_certificate_hicar"

    invoke-static {v1}, Lcom/yftech/engineeringmode/util/DeleteUtil;->delete(Ljava/lang/String;)Z

    move-result v1

    .line 180
    .local v1, "resultCache":Z
    sget-object v2, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "removeHiCarCertificateFile() result:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " resultCache:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5
    .param p1, "compoundButton"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 76
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 77
    return-void

    .line 79
    :cond_0
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v0

    const v1, 0x7f09002e

    const-string v2, "persist.vendor.ul.dl.same.rate"

    const-string v3, "1"

    const-string v4, "0"

    if-ne v0, v1, :cond_2

    .line 80
    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    move-object v3, v4

    :goto_0
    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    .line 81
    :cond_2
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v0

    const v1, 0x7f09002b

    if-ne v0, v1, :cond_7

    .line 83
    if-eqz p2, :cond_3

    move-object v0, v3

    goto :goto_1

    :cond_3
    move-object v0, v4

    :goto_1
    const-string v1, "persist.sys.carplay.certificate"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    if-eqz p2, :cond_4

    goto :goto_2

    :cond_4
    move-object v3, v4

    :goto_2
    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    if-eqz p2, :cond_5

    const-string v0, "true"

    goto :goto_3

    :cond_5
    const-string v0, "false"

    :goto_3
    const-string v1, "persist.carplay.alsa.enable"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    if-eqz p2, :cond_6

    .line 87
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->createCertificateFile()V

    goto :goto_6

    .line 89
    :cond_6
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->removeCertificateFile()V

    goto :goto_6

    .line 91
    :cond_7
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v0

    const v1, 0x7f09002c

    if-ne v0, v1, :cond_b

    .line 92
    if-eqz p2, :cond_8

    goto :goto_4

    :cond_8
    move-object v3, v4

    :goto_4
    const-string v0, "persist.sys.hicar.certificate"

    invoke-static {v0, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    if-eqz p2, :cond_9

    const-string v0, "disable"

    goto :goto_5

    :cond_9
    const-string v0, "enable"

    :goto_5
    const-string v1, "persist.bluetooth.atc.incallnoscan"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    if-eqz p2, :cond_a

    .line 96
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->createHiCarCertificateFile()V

    goto :goto_6

    .line 98
    :cond_a
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->removeHiCarCertificateFile()V

    .line 101
    :cond_b
    :goto_6
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 40
    const v0, 0x7f0c003c

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 41
    .local v0, "root":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->initView(Landroid/view/View;)V

    .line 42
    return-object v0
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
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

    .line 105
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getId()I

    move-result v0

    const v1, 0x7f090127

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 107
    :cond_0
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarMiscManager;->get()Lcom/yftech/vehicle/sdk/CarMiscManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->carType:[Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    aget-object v1, v1, p3

    invoke-virtual {v0, v1}, Lcom/yftech/vehicle/sdk/CarMiscManager;->setAteCarType(Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;)Z

    move-result v0

    .line 108
    .local v0, "result":Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAteCarType type:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->carType:[Lcom/yftech/vehicle/internal/adapter/ICarMisc$AteCarType;

    aget-object v2, v2, p3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "AuthenticationFragment"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .end local v0    # "result":Z
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

    .line 116
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 70
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 71
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->spAteCarType:Landroid/widget/Spinner;

    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/AuthenticationFragment;->getCarType()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 72
    return-void
.end method
