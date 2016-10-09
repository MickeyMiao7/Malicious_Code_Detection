.class public Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;
.super Lcom/phonegap/api/Plugin;
.source "BarcodeScanner.java"


# static fields
.field private static final EMAIL_TYPE:Ljava/lang/String; = "EMAIL_TYPE"

.field private static final PHONE_TYPE:Ljava/lang/String; = "PHONE_TYPE"

.field public static final REQUEST_CODE:I = 0xba7c0de

.field private static final SMS_TYPE:Ljava/lang/String; = "SMS_TYPE"

.field private static final TEXT_TYPE:Ljava/lang/String; = "TEXT_TYPE"


# instance fields
.field public callback:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/phonegap/api/Plugin;-><init>()V

    .line 39
    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 135
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.phonegap.plugins.barcodescanner.ENCODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 136
    .local v0, "intentEncode":Landroid/content/Intent;
    const-string v1, "ENCODE_TYPE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    const-string v1, "ENCODE_DATA"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v1, v0}, Lcom/phonegap/api/PhonegapActivity;->startActivity(Landroid/content/Intent;)V

    .line 140
    return-void
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;
    .locals 6
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p3, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callback:Ljava/lang/String;

    .line 52
    const-string v4, "encode"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 53
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 54
    .local v1, "obj":Lorg/json/JSONObject;
    if-eqz v1, :cond_2

    .line 55
    const-string v4, "type"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 56
    .local v3, "type":Ljava/lang/String;
    const-string v4, "data"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "data":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 60
    const-string v3, "TEXT_TYPE"

    .line 63
    :cond_0
    if-nez v0, :cond_1

    .line 64
    new-instance v2, Lcom/phonegap/api/PluginResult;

    sget-object v4, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    const-string v5, "User did not specify data to encode"

    invoke-direct {v2, v4, v5}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    .line 79
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "obj":Lorg/json/JSONObject;
    .end local v3    # "type":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 67
    .restart local v0    # "data":Ljava/lang/String;
    .restart local v1    # "obj":Lorg/json/JSONObject;
    .restart local v3    # "type":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v3, v0}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->encode(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "obj":Lorg/json/JSONObject;
    .end local v3    # "type":Ljava/lang/String;
    :goto_1
    new-instance v2, Lcom/phonegap/api/PluginResult;

    sget-object v4, Lcom/phonegap/api/PluginResult$Status;->NO_RESULT:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v2, v4}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    .line 78
    .local v2, "r":Lcom/phonegap/api/PluginResult;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/phonegap/api/PluginResult;->setKeepCallback(Z)V

    goto :goto_0

    .line 69
    .end local v2    # "r":Lcom/phonegap/api/PluginResult;
    .restart local v1    # "obj":Lorg/json/JSONObject;
    :cond_2
    new-instance v2, Lcom/phonegap/api/PluginResult;

    sget-object v4, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    const-string v5, "User did not specify data to encode"

    invoke-direct {v2, v4, v5}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    goto :goto_0

    .line 72
    .end local v1    # "obj":Lorg/json/JSONObject;
    :cond_3
    const-string v4, "scan"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 73
    invoke-virtual {p0}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->scan()V

    goto :goto_1

    .line 75
    :cond_4
    new-instance v2, Lcom/phonegap/api/PluginResult;

    sget-object v4, Lcom/phonegap/api/PluginResult$Status;->INVALID_ACTION:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v2, v4}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 102
    const v1, 0xba7c0de

    if-ne p1, v1, :cond_1

    .line 103
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 104
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 106
    .local v0, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "text"

    const-string v2, "SCAN_RESULT"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 107
    const-string v1, "format"

    const-string v2, "SCAN_RESULT_FORMAT"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 108
    const-string v1, "cancelled"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 112
    :goto_0
    new-instance v1, Lcom/phonegap/api/PluginResult;

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v1, v2, v0}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONObject;)V

    iget-object v2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callback:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    .line 113
    .end local v0    # "obj":Lorg/json/JSONObject;
    :cond_0
    if-nez p2, :cond_2

    .line 114
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 116
    .restart local v0    # "obj":Lorg/json/JSONObject;
    :try_start_1
    const-string v1, "text"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 117
    const-string v1, "format"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 118
    const-string v1, "cancelled"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 122
    :goto_1
    new-instance v1, Lcom/phonegap/api/PluginResult;

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v1, v2, v0}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONObject;)V

    iget-object v2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callback:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    .line 127
    .end local v0    # "obj":Lorg/json/JSONObject;
    :cond_1
    :goto_2
    return-void

    .line 124
    :cond_2
    new-instance v1, Lcom/phonegap/api/PluginResult;

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v1, v2}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    iget-object v2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callback:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->error(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    goto :goto_2

    .line 119
    .restart local v0    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    goto :goto_1

    .line 109
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method public scan()V
    .locals 3

    .prologue
    .line 87
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.phonegap.plugins.barcodescanner.SCAN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 88
    .local v0, "intentScan":Landroid/content/Intent;
    const-string v1, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 90
    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->ctx:Lcom/phonegap/api/PhonegapActivity;

    const v2, 0xba7c0de

    invoke-virtual {v1, p0, v0, v2}, Lcom/phonegap/api/PhonegapActivity;->startActivityForResult(Lcom/phonegap/api/IPlugin;Landroid/content/Intent;I)V

    .line 91
    return-void
.end method
