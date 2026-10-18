.class public Lcom/yftech/engineeringmode/fragment/MicTestFragment;
.super Lcom/yftech/engineeringmode/fragment/BaseFragment;
.source "MicTestFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private audioFile:Ljava/io/File;

.field private isRecorder:Z

.field private mMediaRecorder:Landroid/media/MediaRecorder;

.field private mediaPlayer:Landroid/media/MediaPlayer;

.field private msg:Ljava/lang/String;

.field private viewRoot:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->isRecorder:Z

    .line 31
    return-void
.end method

.method private initData()V
    .locals 1

    .line 57
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 58
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 1
    .param p1, "root"    # Landroid/view/View;

    .line 43
    const v0, 0x7f0900f4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    const v0, 0x7f090131

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    const v0, 0x7f0900ec

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    const v0, 0x7f090132

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    const v0, 0x7f09005d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    return-void
.end method

.method private setTitle()V
    .locals 0

    .line 161
    return-void
.end method


# virtual methods
.method public synthetic lambda$onClick$0$MicTestFragment(Landroid/media/MediaPlayer;)V
    .locals 0
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .line 122
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->setTitle()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f09013c

    const/4 v2, 0x0

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_6

    .line 129
    :sswitch_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 130
    return-void

    .line 132
    :cond_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 133
    const v0, 0x7f0e00c4

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->msg:Ljava/lang/String;

    .line 134
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->viewRoot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    goto/16 :goto_6

    .line 92
    :sswitch_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_1

    .line 93
    invoke-virtual {v0}, Landroid/media/MediaRecorder;->stop()V

    .line 94
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->reset()V

    .line 95
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 96
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    .line 97
    iput-boolean v2, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->isRecorder:Z

    .line 99
    :cond_1
    const v0, 0x7f0e00e3

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->msg:Ljava/lang/String;

    .line 100
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->viewRoot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    goto/16 :goto_6

    .line 65
    :sswitch_2
    new-instance v0, Landroid/media/MediaRecorder;

    invoke-direct {v0}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    .line 67
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 69
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0, v2}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 71
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0, v2}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 74
    :try_start_0
    const-string v0, "record_"

    const-string v2, ".mp3"

    invoke-static {v0, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->audioFile:Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    goto :goto_0

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 78
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->audioFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 80
    :try_start_1
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->prepare()V

    .line 81
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->start()V

    .line 82
    iput-boolean v3, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->isRecorder:Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 85
    goto :goto_1

    .line 83
    :catch_1
    move-exception v0

    .line 84
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 87
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1
    const v0, 0x7f0e00e2

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->msg:Ljava/lang/String;

    .line 88
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->viewRoot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    goto/16 :goto_6

    .line 104
    :sswitch_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->audioFile:Ljava/io/File;

    if-eqz v0, :cond_8

    .line 105
    iget-boolean v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->isRecorder:Z

    if-eqz v0, :cond_2

    .line 106
    return-void

    .line 108
    :cond_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 109
    return-void

    .line 112
    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v2, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->audioFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 115
    goto :goto_2

    .line 113
    :catch_2
    move-exception v0

    .line 114
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 117
    .end local v0    # "e":Ljava/io/IOException;
    :goto_2
    :try_start_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 120
    goto :goto_3

    .line 118
    :catch_3
    move-exception v0

    .line 119
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 121
    .end local v0    # "e":Ljava/io/IOException;
    :goto_3
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 122
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->mediaPlayer:Landroid/media/MediaPlayer;

    new-instance v2, Lcom/yftech/engineeringmode/fragment/-$$Lambda$MicTestFragment$jrKQkuPdgNeHnkWRwwCYP8nfaLw;

    invoke-direct {v2, p0}, Lcom/yftech/engineeringmode/fragment/-$$Lambda$MicTestFragment$jrKQkuPdgNeHnkWRwwCYP8nfaLw;-><init>(Lcom/yftech/engineeringmode/fragment/MicTestFragment;)V

    invoke-virtual {v0, v2}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 123
    const v0, 0x7f0e00c5

    invoke-virtual {p0, v0}, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->msg:Ljava/lang/String;

    .line 124
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->viewRoot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_6

    .line 138
    :sswitch_4
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->audioFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->audioFile:Ljava/io/File;

    .line 139
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->audioFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->audioFile:Ljava/io/File;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_5

    .line 142
    :cond_4
    iget-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->audioFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    array-length v1, v0

    :goto_4
    if-ge v2, v1, :cond_6

    aget-object v3, v0, v2

    .line 143
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    const-string v5, "test"

    if-eqz v4, :cond_5

    .line 144
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 145
    const-string v4, "1111"

    .line 146
    .local v4, "test":Ljava/lang/String;
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .end local v4    # "test":Ljava/lang/String;
    :cond_5
    iget-object v4, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->audioFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 150
    const-string v4, "2222098765432"

    .line 151
    .restart local v4    # "test":Ljava/lang/String;
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "test":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 153
    :cond_6
    goto :goto_6

    .line 140
    :cond_7
    :goto_5
    return-void

    .line 157
    :cond_8
    :goto_6
    return-void

    :sswitch_data_0
    .sparse-switch
        0x7f09005d -> :sswitch_4
        0x7f0900ec -> :sswitch_3
        0x7f0900f4 -> :sswitch_2
        0x7f090131 -> :sswitch_1
        0x7f090132 -> :sswitch_0
    .end sparse-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 36
    const v0, 0x7f0c0045

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 37
    .local v0, "root":Landroid/view/View;
    iput-object v0, p0, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->viewRoot:Landroid/view/View;

    .line 38
    invoke-direct {p0, v0}, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->initView(Landroid/view/View;)V

    .line 39
    return-object v0
.end method

.method public onResume()V
    .locals 0

    .line 52
    invoke-super {p0}, Lcom/yftech/engineeringmode/fragment/BaseFragment;->onResume()V

    .line 53
    invoke-direct {p0}, Lcom/yftech/engineeringmode/fragment/MicTestFragment;->initData()V

    .line 54
    return-void
.end method
