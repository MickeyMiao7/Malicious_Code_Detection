.class public Lcom/phonegap/Capture;
.super Lcom/phonegap/api/Plugin;
.source "Capture.java"


# static fields
.field private static final AUDIO_3GPP:Ljava/lang/String; = "audio/3gpp"

.field private static final CAPTURE_APPLICATION_BUSY:I = 0x1

.field private static final CAPTURE_AUDIO:I = 0x0

.field private static final CAPTURE_IMAGE:I = 0x1

.field private static final CAPTURE_INTERNAL_ERR:I = 0x0

.field private static final CAPTURE_INVALID_ARGUMENT:I = 0x2

.field private static final CAPTURE_NOT_SUPPORTED:I = 0x14

.field private static final CAPTURE_NO_MEDIA_FILES:I = 0x3

.field private static final CAPTURE_VIDEO:I = 0x2

.field private static final IMAGE_JPEG:Ljava/lang/String; = "image/jpeg"

.field private static final LOG_TAG:Ljava/lang/String; = "Capture"

.field private static final VIDEO_3GPP:Ljava/lang/String; = "video/3gpp"


# instance fields
.field private callbackId:Ljava/lang/String;

.field private duration:D

.field private imageUri:Landroid/net/Uri;

.field private limit:J

.field private results:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/phonegap/api/Plugin;-><init>()V

    return-void
.end method

.method private captureAudio()V
    .locals 3

    .prologue
    .line 186
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.MediaStore.RECORD_SOUND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 188
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, p0, v0, v2}, Lcom/phonegap/api/PhonegapActivity;->startActivityForResult(Lcom/phonegap/api/IPlugin;Landroid/content/Intent;I)V

    .line 189
    return-void
.end method

.method private captureImage()V
    .locals 4

    .prologue
    .line 195
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 198
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-static {v2}, Lcom/phonegap/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Capture.jpg"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .local v1, "photo":Ljava/io/File;
    const-string v2, "output"

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 200
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    iput-object v2, p0, Lcom/phonegap/Capture;->imageUri:Landroid/net/Uri;

    .line 202
    iget-object v2, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    const/4 v3, 0x1

    invoke-virtual {v2, p0, v0, v3}, Lcom/phonegap/api/PhonegapActivity;->startActivityForResult(Lcom/phonegap/api/IPlugin;Landroid/content/Intent;I)V

    .line 203
    return-void
.end method

.method private captureVideo(D)V
    .locals 3
    .param p1, "duration"    # D

    .prologue
    .line 209
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.action.VIDEO_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 213
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    const/4 v2, 0x2

    invoke-virtual {v1, p0, v0, v2}, Lcom/phonegap/api/PhonegapActivity;->startActivityForResult(Lcom/phonegap/api/IPlugin;Landroid/content/Intent;I)V

    .line 214
    return-void
.end method

.method private createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 381
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 383
    .local v0, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "code"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 384
    const-string v1, "message"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 388
    :goto_0
    return-object v0

    .line 385
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "data"    # Landroid/net/Uri;

    .prologue
    .line 349
    new-instance v1, Ljava/io/File;

    iget-object v3, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-static {p1, v3}, Lcom/phonegap/FileUtils;->getRealPathFromURI(Landroid/net/Uri;Lcom/phonegap/api/PhonegapActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 350
    .local v1, "fp":Ljava/io/File;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 354
    .local v2, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "name"

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 355
    const-string v3, "fullPath"

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 360
    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".3gp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".3gpp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 361
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/audio/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 362
    const-string v3, "type"

    const-string v4, "audio/3gpp"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 370
    :goto_0
    const-string v3, "lastModifiedDate"

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 371
    const-string v3, "size"

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 377
    :goto_1
    return-object v2

    .line 364
    :cond_1
    const-string v3, "type"

    const-string v4, "video/3gpp"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 372
    :catch_0
    move-exception v0

    .line 374
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 367
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_1
    const-string v3, "type"

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/phonegap/FileUtils;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private getAudioVideoData(Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .locals 4
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "obj"    # Lorg/json/JSONObject;
    .param p3, "video"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 166
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    .line 168
    .local v1, "player":Landroid/media/MediaPlayer;
    :try_start_0
    invoke-virtual {v1, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 169
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 170
    const-string v2, "duration"

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 171
    if-eqz p3, :cond_0

    .line 172
    const-string v2, "height"

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 173
    const-string v2, "width"

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    :cond_0
    :goto_0
    return-object p2

    .line 176
    :catch_0
    move-exception v0

    .line 177
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "Capture"

    const-string v3, "Error: loading video file"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getFormatData(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 109
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 112
    .local v1, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "height"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 113
    const-string v2, "width"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 114
    const-string v2, "bitrate"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 115
    const-string v2, "duration"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 116
    const-string v2, "codecs"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 120
    if-eqz p2, :cond_0

    const-string v2, ""

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 121
    :cond_0
    invoke-static {p1}, Lcom/phonegap/FileUtils;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 123
    :cond_1
    const-string v2, "Capture"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Mime type = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    const-string v2, "image/jpeg"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, ".jpg"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 126
    :cond_2
    invoke-direct {p0, p1, v1}, Lcom/phonegap/Capture;->getImageData(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    .line 138
    :cond_3
    :goto_0
    return-object v1

    .line 128
    :cond_4
    const-string v2, "audio/3gpp"

    invoke-virtual {p2, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 129
    const/4 v2, 0x0

    invoke-direct {p0, p1, v1, v2}, Lcom/phonegap/Capture;->getAudioVideoData(Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_0

    .line 131
    :cond_5
    const-string v2, "video/3gpp"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 132
    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v2}, Lcom/phonegap/Capture;->getAudioVideoData(Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 135
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "Capture"

    const-string v3, "Error: setting media file data object"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getImageData(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 3
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "obj"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 151
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const-string v1, "height"

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 152
    const-string v1, "width"

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 153
    return-object p2
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;
    .locals 11
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    const-wide/16 v9, 0x1

    const/4 v8, 0x1

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    .line 67
    iput-object p3, p0, Lcom/phonegap/Capture;->callbackId:Ljava/lang/String;

    .line 68
    iput-wide v9, p0, Lcom/phonegap/Capture;->limit:J

    .line 69
    iput-wide v6, p0, Lcom/phonegap/Capture;->duration:D

    .line 70
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    iput-object v4, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    .line 72
    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 73
    .local v2, "options":Lorg/json/JSONObject;
    if-eqz v2, :cond_0

    .line 74
    const-string v4, "limit"

    invoke-virtual {v2, v4, v9, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/phonegap/Capture;->limit:J

    .line 75
    const-string v4, "duration"

    invoke-virtual {v2, v4, v6, v7}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/phonegap/Capture;->duration:D

    .line 78
    :cond_0
    const-string v4, "getFormatData"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 80
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/phonegap/Capture;->getFormatData(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 81
    .local v1, "obj":Lorg/json/JSONObject;
    new-instance v3, Lcom/phonegap/api/PluginResult;

    sget-object v4, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v3, v4, v1}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .end local v1    # "obj":Lorg/json/JSONObject;
    :goto_0
    return-object v3

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Lorg/json/JSONException;
    new-instance v3, Lcom/phonegap/api/PluginResult;

    sget-object v4, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v3, v4}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    goto :goto_0

    .line 86
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1
    const-string v4, "captureAudio"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 87
    invoke-direct {p0}, Lcom/phonegap/Capture;->captureAudio()V

    .line 96
    :cond_2
    :goto_1
    new-instance v3, Lcom/phonegap/api/PluginResult;

    sget-object v4, Lcom/phonegap/api/PluginResult$Status;->NO_RESULT:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v3, v4}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    .line 97
    .local v3, "r":Lcom/phonegap/api/PluginResult;
    invoke-virtual {v3, v8}, Lcom/phonegap/api/PluginResult;->setKeepCallback(Z)V

    goto :goto_0

    .line 89
    .end local v3    # "r":Lcom/phonegap/api/PluginResult;
    :cond_3
    const-string v4, "captureImage"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 90
    invoke-direct {p0}, Lcom/phonegap/Capture;->captureImage()V

    goto :goto_1

    .line 92
    :cond_4
    const-string v4, "captureVideo"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 93
    iget-wide v4, p0, Lcom/phonegap/Capture;->duration:D

    invoke-direct {p0, v4, v5}, Lcom/phonegap/Capture;->captureVideo(D)V

    goto :goto_1
.end method

.method public fail(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "err"    # Lorg/json/JSONObject;

    .prologue
    .line 397
    new-instance v0, Lcom/phonegap/api/PluginResult;

    sget-object v1, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONObject;)V

    iget-object v1, p0, Lcom/phonegap/Capture;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/phonegap/Capture;->error(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    .line 398
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 12
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 228
    const/4 v8, -0x1

    if-ne p2, v8, :cond_6

    .line 230
    if-nez p1, :cond_2

    .line 232
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 234
    .local v1, "data":Landroid/net/Uri;
    iget-object v8, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    invoke-direct {p0, v1}, Lcom/phonegap/Capture;->createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 236
    iget-object v8, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    int-to-long v8, v8

    iget-wide v10, p0, Lcom/phonegap/Capture;->limit:J

    cmp-long v8, v8, v10

    if-ltz v8, :cond_1

    .line 238
    new-instance v8, Lcom/phonegap/api/PluginResult;

    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    iget-object v10, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    const-string v11, "navigator.device.capture._castMediaFile"

    invoke-direct {v8, v9, v10, v11}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONArray;Ljava/lang/String;)V

    iget-object v9, p0, Lcom/phonegap/Capture;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v8, v9}, Lcom/phonegap/Capture;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    .line 339
    .end local v1    # "data":Landroid/net/Uri;
    :cond_0
    :goto_0
    return-void

    .line 241
    .restart local v1    # "data":Landroid/net/Uri;
    :cond_1
    invoke-direct {p0}, Lcom/phonegap/Capture;->captureAudio()V

    goto :goto_0

    .line 243
    .end local v1    # "data":Landroid/net/Uri;
    :cond_2
    const/4 v8, 0x1

    if-ne p1, v8, :cond_4

    .line 250
    :try_start_0
    new-instance v4, Lcom/phonegap/ExifHelper;

    invoke-direct {v4}, Lcom/phonegap/ExifHelper;-><init>()V

    .line 251
    .local v4, "exif":Lcom/phonegap/ExifHelper;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-static {v9}, Lcom/phonegap/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/Capture.jpg"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/phonegap/ExifHelper;->createInFile(Ljava/lang/String;)V

    .line 252
    invoke-virtual {v4}, Lcom/phonegap/ExifHelper;->readExifData()V

    .line 255
    iget-object v8, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v8}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    iget-object v9, p0, Lcom/phonegap/Capture;->imageUri:Landroid/net/Uri;

    invoke-static {v8, v9}, Landroid/provider/MediaStore$Images$Media;->getBitmap(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 259
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 260
    .local v7, "values":Landroid/content/ContentValues;
    const-string v8, "mime_type"

    const-string v9, "image/jpeg"

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 261
    const/4 v6, 0x0

    .line 263
    .local v6, "uri":Landroid/net/Uri;
    :try_start_1
    iget-object v8, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v8}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    sget-object v9, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v8, v9, v7}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    .line 276
    :goto_1
    :try_start_2
    iget-object v8, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v8}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    invoke-virtual {v8, v6}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v5

    .line 277
    .local v5, "os":Ljava/io/OutputStream;
    sget-object v8, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v9, 0x64

    invoke-virtual {v0, v8, v9, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 278
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 280
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 281
    const/4 v0, 0x0

    .line 282
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 285
    iget-object v8, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-static {v6, v8}, Lcom/phonegap/FileUtils;->getRealPathFromURI(Landroid/net/Uri;Lcom/phonegap/api/PhonegapActivity;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/phonegap/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 286
    invoke-virtual {v4}, Lcom/phonegap/ExifHelper;->writeExifData()V

    .line 289
    iget-object v8, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    invoke-direct {p0, v6}, Lcom/phonegap/Capture;->createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 291
    iget-object v8, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    int-to-long v8, v8

    iget-wide v10, p0, Lcom/phonegap/Capture;->limit:J

    cmp-long v8, v8, v10

    if-ltz v8, :cond_3

    .line 293
    new-instance v8, Lcom/phonegap/api/PluginResult;

    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    iget-object v10, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    const-string v11, "navigator.device.capture._castMediaFile"

    invoke-direct {v8, v9, v10, v11}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONArray;Ljava/lang/String;)V

    iget-object v9, p0, Lcom/phonegap/Capture;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v8, v9}, Lcom/phonegap/Capture;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 298
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "exif":Lcom/phonegap/ExifHelper;
    .end local v5    # "os":Ljava/io/OutputStream;
    .end local v6    # "uri":Landroid/net/Uri;
    .end local v7    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v2

    .line 299
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 300
    const/4 v8, 0x0

    const-string v9, "Error capturing image."

    invoke-direct {p0, v8, v9}, Lcom/phonegap/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/phonegap/Capture;->fail(Lorg/json/JSONObject;)V

    goto/16 :goto_0

    .line 264
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v4    # "exif":Lcom/phonegap/ExifHelper;
    .restart local v6    # "uri":Landroid/net/Uri;
    .restart local v7    # "values":Landroid/content/ContentValues;
    :catch_1
    move-exception v2

    .line 265
    .local v2, "e":Ljava/lang/UnsupportedOperationException;
    :try_start_3
    const-string v8, "Capture"

    const-string v9, "Can\'t write to external media storage."

    invoke-static {v8, v9}, Lcom/phonegap/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 267
    :try_start_4
    iget-object v8, p0, Lcom/phonegap/Capture;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v8}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    sget-object v9, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v8, v9, v7}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_4
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    move-result-object v6

    goto :goto_1

    .line 268
    :catch_2
    move-exception v3

    .line 269
    .local v3, "ex":Ljava/lang/UnsupportedOperationException;
    :try_start_5
    const-string v8, "Capture"

    const-string v9, "Can\'t write to internal media storage."

    invoke-static {v8, v9}, Lcom/phonegap/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    const/4 v8, 0x0

    const-string v9, "Error capturing image - no media storage found."

    invoke-direct {p0, v8, v9}, Lcom/phonegap/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/phonegap/Capture;->fail(Lorg/json/JSONObject;)V

    goto/16 :goto_0

    .line 296
    .end local v2    # "e":Ljava/lang/UnsupportedOperationException;
    .end local v3    # "ex":Ljava/lang/UnsupportedOperationException;
    .restart local v5    # "os":Ljava/io/OutputStream;
    :cond_3
    invoke-direct {p0}, Lcom/phonegap/Capture;->captureImage()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_0

    .line 302
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "exif":Lcom/phonegap/ExifHelper;
    .end local v5    # "os":Ljava/io/OutputStream;
    .end local v6    # "uri":Landroid/net/Uri;
    .end local v7    # "values":Landroid/content/ContentValues;
    :cond_4
    const/4 v8, 0x2

    if-ne p1, v8, :cond_0

    .line 304
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 306
    .restart local v1    # "data":Landroid/net/Uri;
    iget-object v8, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    invoke-direct {p0, v1}, Lcom/phonegap/Capture;->createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 308
    iget-object v8, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    int-to-long v8, v8

    iget-wide v10, p0, Lcom/phonegap/Capture;->limit:J

    cmp-long v8, v8, v10

    if-ltz v8, :cond_5

    .line 310
    new-instance v8, Lcom/phonegap/api/PluginResult;

    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    iget-object v10, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    const-string v11, "navigator.device.capture._castMediaFile"

    invoke-direct {v8, v9, v10, v11}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONArray;Ljava/lang/String;)V

    iget-object v9, p0, Lcom/phonegap/Capture;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v8, v9}, Lcom/phonegap/Capture;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 313
    :cond_5
    iget-wide v8, p0, Lcom/phonegap/Capture;->duration:D

    invoke-direct {p0, v8, v9}, Lcom/phonegap/Capture;->captureVideo(D)V

    goto/16 :goto_0

    .line 318
    .end local v1    # "data":Landroid/net/Uri;
    :cond_6
    if-nez p2, :cond_8

    .line 320
    iget-object v8, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lez v8, :cond_7

    .line 321
    new-instance v8, Lcom/phonegap/api/PluginResult;

    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    iget-object v10, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    const-string v11, "navigator.device.capture._castMediaFile"

    invoke-direct {v8, v9, v10, v11}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONArray;Ljava/lang/String;)V

    iget-object v9, p0, Lcom/phonegap/Capture;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v8, v9}, Lcom/phonegap/Capture;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 325
    :cond_7
    const/4 v8, 0x3

    const-string v9, "Canceled."

    invoke-direct {p0, v8, v9}, Lcom/phonegap/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/phonegap/Capture;->fail(Lorg/json/JSONObject;)V

    goto/16 :goto_0

    .line 331
    :cond_8
    iget-object v8, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lez v8, :cond_9

    .line 332
    new-instance v8, Lcom/phonegap/api/PluginResult;

    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    iget-object v10, p0, Lcom/phonegap/Capture;->results:Lorg/json/JSONArray;

    const-string v11, "navigator.device.capture._castMediaFile"

    invoke-direct {v8, v9, v10, v11}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONArray;Ljava/lang/String;)V

    iget-object v9, p0, Lcom/phonegap/Capture;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v8, v9}, Lcom/phonegap/Capture;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 336
    :cond_9
    const/4 v8, 0x3

    const-string v9, "Did not complete!"

    invoke-direct {p0, v8, v9}, Lcom/phonegap/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/phonegap/Capture;->fail(Lorg/json/JSONObject;)V

    goto/16 :goto_0
.end method
