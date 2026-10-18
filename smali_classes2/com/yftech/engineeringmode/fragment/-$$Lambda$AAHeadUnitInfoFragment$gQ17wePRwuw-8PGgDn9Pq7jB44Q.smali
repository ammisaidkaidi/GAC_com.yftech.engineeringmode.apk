.class public final synthetic Lcom/yftech/engineeringmode/fragment/-$$Lambda$AAHeadUnitInfoFragment$gQ17wePRwuw-8PGgDn9Pq7jB44Q;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/io/FilenameFilter;


# static fields
.field public static final synthetic INSTANCE:Lcom/yftech/engineeringmode/fragment/-$$Lambda$AAHeadUnitInfoFragment$gQ17wePRwuw-8PGgDn9Pq7jB44Q;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/yftech/engineeringmode/fragment/-$$Lambda$AAHeadUnitInfoFragment$gQ17wePRwuw-8PGgDn9Pq7jB44Q;

    invoke-direct {v0}, Lcom/yftech/engineeringmode/fragment/-$$Lambda$AAHeadUnitInfoFragment$gQ17wePRwuw-8PGgDn9Pq7jB44Q;-><init>()V

    sput-object v0, Lcom/yftech/engineeringmode/fragment/-$$Lambda$AAHeadUnitInfoFragment$gQ17wePRwuw-8PGgDn9Pq7jB44Q;->INSTANCE:Lcom/yftech/engineeringmode/fragment/-$$Lambda$AAHeadUnitInfoFragment$gQ17wePRwuw-8PGgDn9Pq7jB44Q;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 0

    invoke-static {p1, p2}, Lcom/yftech/engineeringmode/fragment/AAHeadUnitInfoFragment;->lambda$parseHeadUnitInfoXml$0(Ljava/io/File;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
