.class public Lcom/phonegap/CameraLauncher;
.super Lcom/phonegap/api/Plugin;
.source "CameraLauncher.java"


# static fields
.field private static final ALLMEDIA:I = 0x2

.field private static final CAMERA:I = 0x1

.field private static final DATA_URL:I = 0x0

.field private static final FILE_URI:I = 0x1

.field private static final GET_All:Ljava/lang/String; = "Get All"

.field private static final GET_PICTURE:Ljava/lang/String; = "Get Picture"

.field private static final GET_VIDEO:Ljava/lang/String; = "Get Video"

.field private static final JPEG:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "CameraLauncher"

.field private static final PHOTOLIBRARY:I = 0x0

.field private static final PICTURE:I = 0x0

.field private static final PNG:I = 0x1

.field private static final SAVEDPHOTOALBUM:I = 0x2

.field private static final VIDEO:I = 0x1


# instance fields
.field public callbackId:Ljava/lang/String;

.field private encodingType:I

.field private imageUri:Landroid/net/Uri;

.field private mQuality:I

.field private mediaType:I

.field private numPics:I

.field private targetHeight:I

.field private targetWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/phonegap/api/Plugin;-><init>()V

    .line 86
    return-void
.end method

.method private checkForDuplicateImage(I)V
    .locals 8
    .param p1, "type"    # I

    .prologue
    const/4 v7, 0x0

    .line 455
    const/4 v2, 0x1

    .line 456
    .local v2, "diff":I
    invoke-direct {p0}, Lcom/phonegap/CameraLauncher;->queryImgDB()Landroid/database/Cursor;

    move-result-object v1

    .line 457
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 459
    .local v0, "currentNumOfImages":I
    const/4 v5, 0x1

    if-ne p1, v5, :cond_0

    .line 460
    const/4 v2, 0x2

    .line 464
    :cond_0
    iget v5, p0, Lcom/phonegap/CameraLauncher;->numPics:I

    sub-int v5, v0, v5

    if-ne v5, v2, :cond_1

    .line 465
    invoke-interface {v1}, Landroid/database/Cursor;->moveToLast()Z

    .line 466
    const-string v5, "_id"

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v3, v5, -0x1

    .line 467
    .local v3, "id":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 468
    .local v4, "uri":Landroid/net/Uri;
    iget-object v5, p0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v5}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v4, v7, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 470
    .end local v3    # "id":I
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_1
    return-void
.end method

.method private createCaptureFile(I)Ljava/io/File;
    .locals 4
    .param p1, "encodingType"    # I

    .prologue
    .line 180
    const/4 v0, 0x0

    .line 181
    .local v0, "photo":Ljava/io/File;
    if-nez p1, :cond_0

    .line 182
    new-instance v0, Ljava/io/File;

    .end local v0    # "photo":Ljava/io/File;
    iget-object v1, p0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-static {v1}, Lcom/phonegap/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Pic.jpg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .restart local v0    # "photo":Ljava/io/File;
    :goto_0
    return-object v0

    .line 183
    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 184
    new-instance v0, Ljava/io/File;

    .end local v0    # "photo":Ljava/io/File;
    iget-object v1, p0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-static {v1}, Lcom/phonegap/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Pic.png"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "photo":Ljava/io/File;
    goto :goto_0

    .line 186
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid Encoding Type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private queryImgDB()Landroid/database/Cursor;
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 439
    iget-object v0, p0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v0}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;
    .locals 9
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 97
    sget-object v6, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    .line 98
    .local v6, "status":Lcom/phonegap/api/PluginResult$Status;
    const-string v4, ""

    .line 99
    .local v4, "result":Ljava/lang/String;
    iput-object p3, p0, Lcom/phonegap/CameraLauncher;->callbackId:Ljava/lang/String;

    .line 102
    :try_start_0
    const-string v7, "takePicture"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 103
    const/4 v5, 0x1

    .line 104
    .local v5, "srcType":I
    const/4 v0, 0x1

    .line 105
    .local v0, "destType":I
    const/4 v7, 0x0

    iput v7, p0, Lcom/phonegap/CameraLauncher;->targetHeight:I

    .line 106
    const/4 v7, 0x0

    iput v7, p0, Lcom/phonegap/CameraLauncher;->targetWidth:I

    .line 107
    const/4 v7, 0x0

    iput v7, p0, Lcom/phonegap/CameraLauncher;->encodingType:I

    .line 108
    const/4 v7, 0x0

    iput v7, p0, Lcom/phonegap/CameraLauncher;->mediaType:I

    .line 109
    const/16 v7, 0x50

    iput v7, p0, Lcom/phonegap/CameraLauncher;->mQuality:I

    .line 111
    const/4 v7, 0x0

    invoke-virtual {p2, v7}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 112
    .local v2, "options":Lorg/json/JSONObject;
    if-eqz v2, :cond_0

    .line 113
    const-string v7, "sourceType"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 114
    const-string v7, "destinationType"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 115
    const-string v7, "targetHeight"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/phonegap/CameraLauncher;->targetHeight:I

    .line 116
    const-string v7, "targetWidth"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/phonegap/CameraLauncher;->targetWidth:I

    .line 117
    const-string v7, "encodingType"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/phonegap/CameraLauncher;->encodingType:I

    .line 118
    const-string v7, "mediaType"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/phonegap/CameraLauncher;->mediaType:I

    .line 119
    const-string v7, "quality"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/phonegap/CameraLauncher;->mQuality:I

    .line 122
    :cond_0
    if-ne v5, v8, :cond_2

    .line 123
    iget v7, p0, Lcom/phonegap/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v0, v7}, Lcom/phonegap/CameraLauncher;->takePicture(II)V

    .line 128
    :cond_1
    :goto_0
    new-instance v3, Lcom/phonegap/api/PluginResult;

    sget-object v7, Lcom/phonegap/api/PluginResult$Status;->NO_RESULT:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v3, v7}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    .line 129
    .local v3, "r":Lcom/phonegap/api/PluginResult;
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Lcom/phonegap/api/PluginResult;->setKeepCallback(Z)V

    .line 135
    .end local v0    # "destType":I
    .end local v2    # "options":Lorg/json/JSONObject;
    .end local v3    # "r":Lcom/phonegap/api/PluginResult;
    .end local v5    # "srcType":I
    :goto_1
    return-object v3

    .line 125
    .restart local v0    # "destType":I
    .restart local v2    # "options":Lorg/json/JSONObject;
    .restart local v5    # "srcType":I
    :cond_2
    if-eqz v5, :cond_3

    const/4 v7, 0x2

    if-ne v5, v7, :cond_1

    .line 126
    :cond_3
    invoke-virtual {p0, v5, v0}, Lcom/phonegap/CameraLauncher;->getImage(II)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 133
    .end local v0    # "destType":I
    .end local v2    # "options":Lorg/json/JSONObject;
    .end local v5    # "srcType":I
    :catch_0
    move-exception v1

    .line 134
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 135
    new-instance v3, Lcom/phonegap/api/PluginResult;

    sget-object v7, Lcom/phonegap/api/PluginResult$Status;->JSON_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v3, v7}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    goto :goto_1

    .line 132
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_4
    :try_start_1
    new-instance v3, Lcom/phonegap/api/PluginResult;

    invoke-direct {v3, v6, v4}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public failPicture(Ljava/lang/String;)V
    .locals 2
    .param p1, "err"    # Ljava/lang/String;

    .prologue
    .line 502
    new-instance v0, Lcom/phonegap/api/PluginResult;

    sget-object v1, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/phonegap/CameraLauncher;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/phonegap/CameraLauncher;->error(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    .line 503
    return-void
.end method

.method public getImage(II)V
    .locals 5
    .param p1, "srcType"    # I
    .param p2, "returnType"    # I

    .prologue
    .line 200
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 201
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "Get Picture"

    .line 202
    .local v1, "title":Ljava/lang/String;
    iget v2, p0, Lcom/phonegap/CameraLauncher;->mediaType:I

    if-nez v2, :cond_1

    .line 203
    const-string v2, "image/*"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 216
    :cond_0
    :goto_0
    const-string v2, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 217
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 218
    iget-object v2, p0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v3

    add-int/lit8 v4, p1, 0x1

    mul-int/lit8 v4, v4, 0x10

    add-int/2addr v4, p2

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v2, p0, v3, v4}, Lcom/phonegap/api/PhonegapActivity;->startActivityForResult(Lcom/phonegap/api/IPlugin;Landroid/content/Intent;I)V

    .line 220
    return-void

    .line 205
    :cond_1
    iget v2, p0, Lcom/phonegap/CameraLauncher;->mediaType:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 206
    const-string v2, "video/*"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 207
    const-string v1, "Get Video"

    goto :goto_0

    .line 209
    :cond_2
    iget v2, p0, Lcom/phonegap/CameraLauncher;->mediaType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 212
    const-string v2, "*/*"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 213
    const-string v1, "Get All"

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 17
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 277
    div-int/lit8 v12, p1, 0x10

    add-int/lit8 v9, v12, -0x1

    .line 278
    .local v9, "srcType":I
    rem-int/lit8 v12, p1, 0x10

    add-int/lit8 v2, v12, -0x1

    .line 281
    .local v2, "destType":I
    const/4 v12, 0x1

    if-ne v9, v12, :cond_7

    .line 283
    const/4 v12, -0x1

    move/from16 v0, p2

    if-ne v0, v12, :cond_5

    .line 286
    :try_start_0
    new-instance v5, Lcom/phonegap/ExifHelper;

    invoke-direct {v5}, Lcom/phonegap/ExifHelper;-><init>()V

    .line 287
    .local v5, "exif":Lcom/phonegap/ExifHelper;
    move-object/from16 v0, p0

    iget v12, v0, Lcom/phonegap/CameraLauncher;->encodingType:I

    if-nez v12, :cond_0

    .line 288
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-static {v13}, Lcom/phonegap/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/Pic.jpg"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Lcom/phonegap/ExifHelper;->createInFile(Ljava/lang/String;)V

    .line 289
    invoke-virtual {v5}, Lcom/phonegap/ExifHelper;->readExifData()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 295
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v12}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/phonegap/CameraLauncher;->imageUri:Landroid/net/Uri;

    invoke-static {v12, v13}, Landroid/provider/MediaStore$Images$Media;->getBitmap(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 302
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    :goto_0
    :try_start_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/phonegap/CameraLauncher;->scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 305
    if-nez v2, :cond_3

    .line 306
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/phonegap/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;)V

    .line 307
    const/4 v12, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/phonegap/CameraLauncher;->checkForDuplicateImage(I)V

    .line 344
    :cond_1
    :goto_1
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 345
    const/4 v1, 0x0

    .line 346
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 348
    const/4 v12, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/phonegap/CameraLauncher;->checkForDuplicateImage(I)V

    .line 431
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "exif":Lcom/phonegap/ExifHelper;
    :cond_2
    :goto_2
    return-void

    .line 296
    .restart local v5    # "exif":Lcom/phonegap/ExifHelper;
    :catch_0
    move-exception v3

    .line 297
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v10

    .line 298
    .local v10, "uri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v12}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    .line 299
    .local v8, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {v8, v10}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v12

    invoke-static {v12}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .restart local v1    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_0

    .line 311
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    .end local v8    # "resolver":Landroid/content/ContentResolver;
    .end local v10    # "uri":Landroid/net/Uri;
    :cond_3
    const/4 v12, 0x1

    if-ne v2, v12, :cond_1

    .line 314
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 315
    .local v11, "values":Landroid/content/ContentValues;
    const-string v12, "mime_type"

    const-string v13, "image/jpeg"

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 316
    const/4 v10, 0x0

    .line 318
    .restart local v10    # "uri":Landroid/net/Uri;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v12}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    sget-object v13, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v12, v13, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_3
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v10

    .line 331
    :goto_3
    :try_start_4
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v12}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    invoke-virtual {v12, v10}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v7

    .line 332
    .local v7, "os":Ljava/io/OutputStream;
    sget-object v12, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move-object/from16 v0, p0

    iget v13, v0, Lcom/phonegap/CameraLauncher;->mQuality:I

    invoke-virtual {v1, v12, v13, v7}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 333
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 336
    move-object/from16 v0, p0

    iget v12, v0, Lcom/phonegap/CameraLauncher;->encodingType:I

    if-nez v12, :cond_4

    .line 337
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-static {v10, v12}, Lcom/phonegap/FileUtils;->getRealPathFromURI(Landroid/net/Uri;Lcom/phonegap/api/PhonegapActivity;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Lcom/phonegap/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 338
    invoke-virtual {v5}, Lcom/phonegap/ExifHelper;->writeExifData()V

    .line 342
    :cond_4
    new-instance v12, Lcom/phonegap/api/PluginResult;

    sget-object v13, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/phonegap/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/phonegap/CameraLauncher;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_1

    .line 349
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "exif":Lcom/phonegap/ExifHelper;
    .end local v7    # "os":Ljava/io/OutputStream;
    .end local v10    # "uri":Landroid/net/Uri;
    .end local v11    # "values":Landroid/content/ContentValues;
    :catch_1
    move-exception v3

    .line 350
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 351
    const-string v12, "Error capturing image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/phonegap/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 319
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v1    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v5    # "exif":Lcom/phonegap/ExifHelper;
    .restart local v10    # "uri":Landroid/net/Uri;
    .restart local v11    # "values":Landroid/content/ContentValues;
    :catch_2
    move-exception v3

    .line 320
    .local v3, "e":Ljava/lang/UnsupportedOperationException;
    :try_start_5
    const-string v12, "CameraLauncher"

    const-string v13, "Can\'t write to external media storage."

    invoke-static {v12, v13}, Lcom/phonegap/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 322
    :try_start_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v12}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    sget-object v13, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v12, v13, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_6
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    move-result-object v10

    goto :goto_3

    .line 323
    :catch_3
    move-exception v4

    .line 324
    .local v4, "ex":Ljava/lang/UnsupportedOperationException;
    :try_start_7
    const-string v12, "CameraLauncher"

    const-string v13, "Can\'t write to internal media storage."

    invoke-static {v12, v13}, Lcom/phonegap/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    const-string v12, "Error capturing image - no media storage found."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/phonegap/CameraLauncher;->failPicture(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    goto/16 :goto_2

    .line 356
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "e":Ljava/lang/UnsupportedOperationException;
    .end local v4    # "ex":Ljava/lang/UnsupportedOperationException;
    .end local v5    # "exif":Lcom/phonegap/ExifHelper;
    .end local v10    # "uri":Landroid/net/Uri;
    .end local v11    # "values":Landroid/content/ContentValues;
    :cond_5
    if-nez p2, :cond_6

    .line 357
    const-string v12, "Camera cancelled."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/phonegap/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 362
    :cond_6
    const-string v12, "Did not complete!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/phonegap/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 367
    :cond_7
    if-eqz v9, :cond_8

    const/4 v12, 0x2

    if-ne v9, v12, :cond_2

    .line 368
    :cond_8
    const/4 v12, -0x1

    move/from16 v0, p2

    if-ne v0, v12, :cond_c

    .line 369
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v10

    .line 370
    .restart local v10    # "uri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v12}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    .line 374
    .restart local v8    # "resolver":Landroid/content/ContentResolver;
    move-object/from16 v0, p0

    iget v12, v0, Lcom/phonegap/CameraLauncher;->mediaType:I

    if-eqz v12, :cond_9

    .line 375
    new-instance v12, Lcom/phonegap/api/PluginResult;

    sget-object v13, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/phonegap/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/phonegap/CameraLauncher;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 379
    :cond_9
    if-nez v2, :cond_a

    .line 381
    :try_start_8
    invoke-virtual {v8, v10}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v12

    invoke-static {v12}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 382
    .restart local v1    # "bitmap":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/phonegap/CameraLauncher;->scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 383
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/phonegap/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;)V

    .line 384
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 385
    const/4 v1, 0x0

    .line 386
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_4

    goto/16 :goto_2

    .line 387
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    :catch_4
    move-exception v3

    .line 388
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 389
    const-string v12, "Error retrieving image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/phonegap/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 394
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :cond_a
    const/4 v12, 0x1

    if-ne v2, v12, :cond_2

    .line 396
    move-object/from16 v0, p0

    iget v12, v0, Lcom/phonegap/CameraLauncher;->targetHeight:I

    if-lez v12, :cond_b

    move-object/from16 v0, p0

    iget v12, v0, Lcom/phonegap/CameraLauncher;->targetWidth:I

    if-lez v12, :cond_b

    .line 398
    :try_start_9
    invoke-virtual {v8, v10}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v12

    invoke-static {v12}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 399
    .restart local v1    # "bitmap":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/phonegap/CameraLauncher;->scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 401
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-static {v13}, Lcom/phonegap/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/resize.jpg"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 402
    .local v6, "fileName":Ljava/lang/String;
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 403
    .restart local v7    # "os":Ljava/io/OutputStream;
    sget-object v12, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move-object/from16 v0, p0

    iget v13, v0, Lcom/phonegap/CameraLauncher;->mQuality:I

    invoke-virtual {v1, v12, v13, v7}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 404
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 406
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 407
    const/4 v1, 0x0

    .line 411
    new-instance v12, Lcom/phonegap/api/PluginResult;

    sget-object v13, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "file://"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "?"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    invoke-virtual/range {v14 .. v16}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/phonegap/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/phonegap/CameraLauncher;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    .line 412
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    goto/16 :goto_2

    .line 413
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v6    # "fileName":Ljava/lang/String;
    .end local v7    # "os":Ljava/io/OutputStream;
    :catch_5
    move-exception v3

    .line 414
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 415
    const-string v12, "Error retrieving image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/phonegap/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 419
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_b
    new-instance v12, Lcom/phonegap/api/PluginResult;

    sget-object v13, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/phonegap/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/phonegap/CameraLauncher;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 424
    .end local v8    # "resolver":Landroid/content/ContentResolver;
    .end local v10    # "uri":Landroid/net/Uri;
    :cond_c
    if-nez p2, :cond_d

    .line 425
    const-string v12, "Selection cancelled."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/phonegap/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 428
    :cond_d
    const-string v12, "Selection did not complete!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/phonegap/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method public processPicture(Landroid/graphics/Bitmap;)V
    .locals 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 478
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 480
    .local v2, "jpeg_data":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iget v6, p0, Lcom/phonegap/CameraLauncher;->mQuality:I

    invoke-virtual {p1, v5, v6, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 481
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 482
    .local v0, "code":[B
    invoke-static {v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v4

    .line 483
    .local v4, "output":[B
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    .line 484
    .local v3, "js_out":Ljava/lang/String;
    new-instance v5, Lcom/phonegap/api/PluginResult;

    sget-object v6, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v5, v6, v3}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    iget-object v6, p0, Lcom/phonegap/CameraLauncher;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v5, v6}, Lcom/phonegap/CameraLauncher;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 485
    const/4 v3, 0x0

    .line 486
    const/4 v4, 0x0

    .line 493
    .end local v0    # "code":[B
    .end local v3    # "js_out":Ljava/lang/String;
    .end local v4    # "output":[B
    :cond_0
    :goto_0
    const/4 v2, 0x0

    .line 494
    return-void

    .line 490
    :catch_0
    move-exception v1

    .line 491
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "Error compressing image."

    invoke-virtual {p0, v5}, Lcom/phonegap/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 12
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 229
    iget v3, p0, Lcom/phonegap/CameraLauncher;->targetWidth:I

    .line 230
    .local v3, "newWidth":I
    iget v0, p0, Lcom/phonegap/CameraLauncher;->targetHeight:I

    .line 231
    .local v0, "newHeight":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    .line 232
    .local v7, "origWidth":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 235
    .local v4, "origHeight":I
    if-gtz v3, :cond_0

    if-gtz v0, :cond_0

    .line 263
    .end local p1    # "bitmap":Landroid/graphics/Bitmap;
    :goto_0
    return-object p1

    .line 239
    .restart local p1    # "bitmap":Landroid/graphics/Bitmap;
    :cond_0
    if-lez v3, :cond_2

    if-gtz v0, :cond_2

    .line 240
    mul-int v8, v3, v4

    div-int v0, v8, v7

    .line 263
    :cond_1
    :goto_1
    const/4 v8, 0x1

    invoke-static {p1, v3, v0, v8}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_0

    .line 243
    :cond_2
    if-gtz v3, :cond_3

    if-lez v0, :cond_3

    .line 244
    mul-int v8, v0, v7

    div-int v3, v8, v4

    goto :goto_1

    .line 253
    :cond_3
    int-to-double v8, v3

    int-to-double v10, v0

    div-double v1, v8, v10

    .line 254
    .local v1, "newRatio":D
    int-to-double v8, v7

    int-to-double v10, v4

    div-double v5, v8, v10

    .line 256
    .local v5, "origRatio":D
    cmpl-double v8, v5, v1

    if-lez v8, :cond_4

    .line 257
    mul-int v8, v3, v4

    div-int v0, v8, v7

    goto :goto_1

    .line 258
    :cond_4
    cmpg-double v8, v5, v1

    if-gez v8, :cond_1

    .line 259
    mul-int v8, v0, v7

    div-int v3, v8, v4

    goto :goto_1
.end method

.method public takePicture(II)V
    .locals 4
    .param p1, "returnType"    # I
    .param p2, "encodingType"    # I

    .prologue
    .line 159
    invoke-direct {p0}, Lcom/phonegap/CameraLauncher;->queryImgDB()Landroid/database/Cursor;

    move-result-object v2

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    iput v2, p0, Lcom/phonegap/CameraLauncher;->numPics:I

    .line 162
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 166
    .local v0, "intent":Landroid/content/Intent;
    invoke-direct {p0, p2}, Lcom/phonegap/CameraLauncher;->createCaptureFile(I)Ljava/io/File;

    move-result-object v1

    .line 167
    .local v1, "photo":Ljava/io/File;
    const-string v2, "output"

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 168
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    iput-object v2, p0, Lcom/phonegap/CameraLauncher;->imageUri:Landroid/net/Uri;

    .line 170
    iget-object v2, p0, Lcom/phonegap/CameraLauncher;->ctx:Lcom/phonegap/api/PhonegapActivity;

    add-int/lit8 v3, p1, 0x20

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, p0, v0, v3}, Lcom/phonegap/api/PhonegapActivity;->startActivityForResult(Lcom/phonegap/api/IPlugin;Landroid/content/Intent;I)V

    .line 171
    return-void
.end method
