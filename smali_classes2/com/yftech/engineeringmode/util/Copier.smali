.class public Lcom/yftech/engineeringmode/util/Copier;
.super Ljava/lang/Object;
.source "Copier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;
    }
.end annotation


# instance fields
.field private final mCallback:Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;

.field private mCurSize:J

.field private mIsCopyFile:Z

.field private mTotalSize:J


# direct methods
.method private constructor <init>(Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/yftech/engineeringmode/util/Copier;->mCallback:Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;

    .line 22
    return-void
.end method

.method private copy(Ljava/io/File;Ljava/io/File;)Z
    .locals 6
    .param p1, "src"    # Ljava/io/File;
    .param p2, "dst"    # Ljava/io/File;

    .line 169
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    if-nez p2, :cond_0

    goto :goto_0

    .line 173
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_2

    .line 174
    iput-boolean v0, p0, Lcom/yftech/engineeringmode/util/Copier;->mIsCopyFile:Z

    .line 175
    invoke-direct {p0, p1}, Lcom/yftech/engineeringmode/util/Copier;->getDirectoryFileCount(Ljava/io/File;)I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/yftech/engineeringmode/util/Copier;->mTotalSize:J

    .line 176
    iput-wide v2, p0, Lcom/yftech/engineeringmode/util/Copier;->mCurSize:J

    .line 177
    invoke-direct {p0, p1, p2}, Lcom/yftech/engineeringmode/util/Copier;->copyDirectory(Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    .line 178
    .local v0, "ret":Z
    if-eqz v0, :cond_1

    iget-wide v4, p0, Lcom/yftech/engineeringmode/util/Copier;->mTotalSize:J

    cmp-long v1, v4, v2

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/yftech/engineeringmode/util/Copier;->mCallback:Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;

    if-eqz v1, :cond_1

    .line 179
    const/16 v2, 0x64

    invoke-interface {v1, v2}, Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;->onProgress(I)V

    .line 181
    :cond_1
    return v0

    .line 184
    .end local v0    # "ret":Z
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/util/Copier;->mIsCopyFile:Z

    .line 185
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yftech/engineeringmode/util/Copier;->mTotalSize:J

    .line 186
    iput-wide v2, p0, Lcom/yftech/engineeringmode/util/Copier;->mCurSize:J

    .line 187
    invoke-direct {p0, p1, p2}, Lcom/yftech/engineeringmode/util/Copier;->copyFile(Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    return v0

    .line 170
    :cond_3
    :goto_0
    return v0
.end method

.method public static copy(Ljava/io/File;Ljava/io/File;Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;)Z
    .locals 2
    .param p0, "src"    # Ljava/io/File;
    .param p1, "dst"    # Ljava/io/File;
    .param p2, "callback"    # Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;

    .line 235
    new-instance v0, Lcom/yftech/engineeringmode/util/Copier;

    invoke-direct {v0, p2}, Lcom/yftech/engineeringmode/util/Copier;-><init>(Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;)V

    .line 236
    .local v0, "copier":Lcom/yftech/engineeringmode/util/Copier;
    invoke-direct {v0, p0, p1}, Lcom/yftech/engineeringmode/util/Copier;->copy(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    return v1
.end method

.method private copy([Ljava/io/File;Ljava/io/File;)Z
    .locals 9
    .param p1, "srcList"    # [Ljava/io/File;
    .param p2, "dst"    # Ljava/io/File;

    .line 192
    const/4 v0, 0x0

    if-eqz p1, :cond_a

    if-eqz p2, :cond_a

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_4

    .line 196
    :cond_0
    array-length v1, p1

    const/4 v2, 0x1

    if-nez v1, :cond_1

    .line 197
    return v2

    .line 200
    :cond_1
    array-length v1, p1

    move v3, v0

    :goto_0
    if-ge v3, v1, :cond_5

    aget-object v4, p1, v3

    .line 201
    .local v4, "f":Ljava/io/File;
    if-nez v4, :cond_2

    .line 202
    goto :goto_1

    .line 204
    :cond_2
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_3

    .line 205
    return v0

    .line 207
    :cond_3
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 208
    return v0

    .line 210
    :cond_4
    iget-wide v5, p0, Lcom/yftech/engineeringmode/util/Copier;->mTotalSize:J

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v7

    add-long/2addr v5, v7

    iput-wide v5, p0, Lcom/yftech/engineeringmode/util/Copier;->mTotalSize:J

    .line 200
    .end local v4    # "f":Ljava/io/File;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 213
    :cond_5
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_6

    .line 214
    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_6

    .line 215
    return v0

    .line 219
    :cond_6
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/yftech/engineeringmode/util/Copier;->mCurSize:J

    .line 220
    iput-boolean v2, p0, Lcom/yftech/engineeringmode/util/Copier;->mIsCopyFile:Z

    .line 222
    array-length v1, p1

    move v3, v0

    :goto_2
    if-ge v3, v1, :cond_9

    aget-object v4, p1, v3

    .line 223
    .restart local v4    # "f":Ljava/io/File;
    if-nez v4, :cond_7

    .line 224
    goto :goto_3

    .line 226
    :cond_7
    invoke-direct {p0, v4, p2}, Lcom/yftech/engineeringmode/util/Copier;->copyFile(Ljava/io/File;Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_8

    .line 227
    return v0

    .line 222
    .end local v4    # "f":Ljava/io/File;
    :cond_8
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 231
    :cond_9
    return v2

    .line 193
    :cond_a
    :goto_4
    return v0
.end method

.method public static copy([Ljava/io/File;Ljava/io/File;Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;)Z
    .locals 2
    .param p0, "srcList"    # [Ljava/io/File;
    .param p1, "dst"    # Ljava/io/File;
    .param p2, "callback"    # Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;

    .line 240
    new-instance v0, Lcom/yftech/engineeringmode/util/Copier;

    invoke-direct {v0, p2}, Lcom/yftech/engineeringmode/util/Copier;-><init>(Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;)V

    .line 241
    .local v0, "copier":Lcom/yftech/engineeringmode/util/Copier;
    invoke-direct {v0, p0, p1}, Lcom/yftech/engineeringmode/util/Copier;->copy([Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    return v1
.end method

.method private copyDirectory(Ljava/io/File;Ljava/io/File;)Z
    .locals 16
    .param p1, "src"    # Ljava/io/File;
    .param p2, "dst"    # Ljava/io/File;

    .line 113
    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_a

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 117
    :cond_0
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 118
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_1

    .line 119
    return v2

    .line 122
    :cond_1
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 123
    .local v1, "dirName":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    .local v3, "dstDir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 125
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v4

    if-nez v4, :cond_2

    .line 126
    return v2

    .line 129
    :cond_2
    invoke-virtual {v3}, Ljava/io/File;->mkdir()Z

    move-result v4

    if-nez v4, :cond_3

    .line 130
    return v2

    .line 132
    :cond_3
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->canRead()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/io/File;->setReadable(Z)Z

    .line 133
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->canWrite()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/io/File;->setWritable(Z)Z

    .line 134
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->canExecute()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/io/File;->setExecutable(Z)Z

    .line 136
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 137
    .local v4, "files":[Ljava/io/File;
    const/4 v5, 0x1

    if-nez v4, :cond_4

    .line 138
    return v5

    .line 141
    :cond_4
    array-length v6, v4

    move v7, v2

    :goto_0
    if-ge v7, v6, :cond_9

    aget-object v8, v4, v7

    .line 142
    .local v8, "f":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 143
    invoke-direct {v0, v8, v3}, Lcom/yftech/engineeringmode/util/Copier;->copyDirectory(Ljava/io/File;Ljava/io/File;)Z

    move-result v9

    if-nez v9, :cond_8

    .line 144
    return v2

    .line 148
    :cond_5
    invoke-direct {v0, v8, v3}, Lcom/yftech/engineeringmode/util/Copier;->copyFile(Ljava/io/File;Ljava/io/File;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 149
    return v2

    .line 151
    :cond_6
    iget-boolean v9, v0, Lcom/yftech/engineeringmode/util/Copier;->mIsCopyFile:Z

    if-nez v9, :cond_8

    .line 152
    iget-wide v9, v0, Lcom/yftech/engineeringmode/util/Copier;->mCurSize:J

    const-wide/16 v11, 0x1

    add-long/2addr v9, v11

    iput-wide v9, v0, Lcom/yftech/engineeringmode/util/Copier;->mCurSize:J

    .line 153
    iget-object v9, v0, Lcom/yftech/engineeringmode/util/Copier;->mCallback:Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;

    if-eqz v9, :cond_8

    .line 154
    iget-wide v10, v0, Lcom/yftech/engineeringmode/util/Copier;->mCurSize:J

    iget-wide v12, v0, Lcom/yftech/engineeringmode/util/Copier;->mTotalSize:J

    cmp-long v14, v10, v12

    if-ltz v14, :cond_7

    .line 155
    const/16 v10, 0x64

    invoke-interface {v9, v10}, Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;->onProgress(I)V

    goto :goto_1

    .line 158
    :cond_7
    const-wide/16 v14, 0x64

    mul-long/2addr v10, v14

    div-long/2addr v10, v12

    long-to-int v10, v10

    invoke-interface {v9, v10}, Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;->onProgress(I)V

    .line 141
    .end local v8    # "f":Ljava/io/File;
    :cond_8
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 165
    :cond_9
    return v5

    .line 114
    .end local v1    # "dirName":Ljava/lang/String;
    .end local v3    # "dstDir":Ljava/io/File;
    .end local v4    # "files":[Ljava/io/File;
    :cond_a
    :goto_2
    return v2
.end method

.method private copyFile(Ljava/io/File;Ljava/io/File;)Z
    .locals 13
    .param p1, "src"    # Ljava/io/File;
    .param p2, "dst"    # Ljava/io/File;

    .line 44
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_9

    .line 48
    :cond_0
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 49
    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_1

    .line 50
    return v1

    .line 53
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "fileName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .local v2, "dstFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 56
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 59
    :cond_2
    const/4 v3, 0x1

    .line 60
    .local v3, "ret":Z
    const/high16 v4, 0x100000

    new-array v4, v4, [B

    .line 61
    .local v4, "buf":[B
    const/4 v5, 0x0

    .line 62
    .local v5, "in":Ljava/io/FileInputStream;
    const/4 v6, 0x0

    .line 64
    .local v6, "out":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v5, v7

    .line 65
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v6, v7

    .line 66
    move v7, v1

    .line 67
    .local v7, "count":I
    :cond_3
    :goto_0
    invoke-virtual {v5, v4}, Ljava/io/FileInputStream;->read([B)I

    move-result v8

    move v7, v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_5

    .line 68
    invoke-virtual {v6, v4, v1, v7}, Ljava/io/FileOutputStream;->write([BII)V

    .line 69
    iget-boolean v8, p0, Lcom/yftech/engineeringmode/util/Copier;->mIsCopyFile:Z

    if-eqz v8, :cond_3

    .line 70
    iget-wide v8, p0, Lcom/yftech/engineeringmode/util/Copier;->mCurSize:J

    int-to-long v10, v7

    add-long/2addr v8, v10

    iput-wide v8, p0, Lcom/yftech/engineeringmode/util/Copier;->mCurSize:J

    .line 71
    iget-object v8, p0, Lcom/yftech/engineeringmode/util/Copier;->mCallback:Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;

    if-eqz v8, :cond_3

    .line 72
    iget-wide v8, p0, Lcom/yftech/engineeringmode/util/Copier;->mCurSize:J

    iget-wide v10, p0, Lcom/yftech/engineeringmode/util/Copier;->mTotalSize:J

    cmp-long v8, v8, v10

    if-ltz v8, :cond_4

    .line 73
    iget-object v8, p0, Lcom/yftech/engineeringmode/util/Copier;->mCallback:Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;

    const/16 v9, 0x64

    invoke-interface {v8, v9}, Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;->onProgress(I)V

    goto :goto_0

    .line 76
    :cond_4
    iget-object v8, p0, Lcom/yftech/engineeringmode/util/Copier;->mCallback:Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;

    iget-wide v9, p0, Lcom/yftech/engineeringmode/util/Copier;->mCurSize:J

    const-wide/16 v11, 0x64

    mul-long/2addr v9, v11

    iget-wide v11, p0, Lcom/yftech/engineeringmode/util/Copier;->mTotalSize:J

    div-long/2addr v9, v11

    long-to-int v9, v9

    invoke-interface {v8, v9}, Lcom/yftech/engineeringmode/util/Copier$CopyProgressCallback;->onProgress(I)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 88
    .end local v7    # "count":I
    :cond_5
    nop

    .line 90
    :try_start_1
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 93
    goto :goto_1

    .line 91
    :catch_0
    move-exception v1

    .line 92
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 95
    .end local v1    # "e":Ljava/io/IOException;
    :goto_1
    nop

    .line 97
    :try_start_2
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 100
    :goto_2
    goto :goto_5

    .line 98
    :catch_1
    move-exception v1

    .line 99
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .end local v1    # "e":Ljava/io/IOException;
    goto :goto_2

    .line 88
    :catchall_0
    move-exception v1

    goto :goto_6

    .line 84
    :catch_2
    move-exception v1

    .line 85
    .restart local v1    # "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 86
    const/4 v3, 0x0

    .line 88
    .end local v1    # "e":Ljava/io/IOException;
    if-eqz v5, :cond_6

    .line 90
    :try_start_4
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 93
    goto :goto_3

    .line 91
    :catch_3
    move-exception v1

    .line 92
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 95
    .end local v1    # "e":Ljava/io/IOException;
    :cond_6
    :goto_3
    if-eqz v6, :cond_8

    .line 97
    :try_start_5
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 81
    :catch_4
    move-exception v1

    .line 82
    .local v1, "e":Ljava/io/FileNotFoundException;
    :try_start_6
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 83
    const/4 v3, 0x0

    .line 88
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    if-eqz v5, :cond_7

    .line 90
    :try_start_7
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 93
    goto :goto_4

    .line 91
    :catch_5
    move-exception v1

    .line 92
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 95
    .end local v1    # "e":Ljava/io/IOException;
    :cond_7
    :goto_4
    if-eqz v6, :cond_8

    .line 97
    :try_start_8
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1

    goto :goto_2

    .line 104
    :cond_8
    :goto_5
    if-eqz v3, :cond_9

    .line 105
    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result v1

    invoke-virtual {v2, v1}, Ljava/io/File;->setReadable(Z)Z

    .line 106
    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    move-result v1

    invoke-virtual {v2, v1}, Ljava/io/File;->setWritable(Z)Z

    .line 107
    invoke-virtual {p2}, Ljava/io/File;->canExecute()Z

    move-result v1

    invoke-virtual {v2, v1}, Ljava/io/File;->setExecutable(Z)Z

    .line 109
    :cond_9
    return v3

    .line 88
    :goto_6
    if-eqz v5, :cond_a

    .line 90
    :try_start_9
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    .line 93
    goto :goto_7

    .line 91
    :catch_6
    move-exception v7

    .line 92
    .local v7, "e":Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    .line 95
    .end local v7    # "e":Ljava/io/IOException;
    :cond_a
    :goto_7
    if-eqz v6, :cond_b

    .line 97
    :try_start_a
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_7

    .line 100
    goto :goto_8

    .line 98
    :catch_7
    move-exception v7

    .line 99
    .restart local v7    # "e":Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    .line 102
    .end local v7    # "e":Ljava/io/IOException;
    :cond_b
    :goto_8
    throw v1

    .line 45
    .end local v0    # "fileName":Ljava/lang/String;
    .end local v2    # "dstFile":Ljava/io/File;
    .end local v3    # "ret":Z
    .end local v4    # "buf":[B
    .end local v5    # "in":Ljava/io/FileInputStream;
    .end local v6    # "out":Ljava/io/FileOutputStream;
    :cond_c
    :goto_9
    return v1
.end method

.method private getDirectoryFileCount(Ljava/io/File;)I
    .locals 6
    .param p1, "dir"    # Ljava/io/File;

    .line 25
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 26
    return v1

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    .local v0, "fileCount":I
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 31
    .local v2, "files":[Ljava/io/File;
    array-length v3, v2

    :goto_0
    if-ge v1, v3, :cond_2

    aget-object v4, v2, v1

    .line 32
    .local v4, "f":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 33
    invoke-direct {p0, v4}, Lcom/yftech/engineeringmode/util/Copier;->getDirectoryFileCount(Ljava/io/File;)I

    move-result v5

    add-int/2addr v0, v5

    goto :goto_1

    .line 36
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 31
    .end local v4    # "f":Ljava/io/File;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 40
    :cond_2
    return v0
.end method
