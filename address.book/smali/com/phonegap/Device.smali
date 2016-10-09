.class public Lcom/phonegap/Device;
.super Lcom/phonegap/api/Plugin;
.source "Device.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "Device"

.field public static phonegapVersion:Ljava/lang/String;

.field public static platform:Ljava/lang/String;

.field public static uuid:Ljava/lang/String;


# instance fields
.field telephonyReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const-string v0, "1.4.1"

    sput-object v0, Lcom/phonegap/Device;->phonegapVersion:Ljava/lang/String;

    .line 41
    const-string v0, "Android"

    sput-object v0, Lcom/phonegap/Device;->platform:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/phonegap/api/Plugin;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/phonegap/Device;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    .line 50
    return-void
.end method

.method private initTelephonyReceiver()V
    .locals 4

    .prologue
    .line 125
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 126
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.PHONE_STATE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 127
    iget-object v1, p0, Lcom/phonegap/Device;->ctx:Lcom/phonegap/api/PhonegapActivity;

    .line 128
    .local v1, "myctx":Lcom/phonegap/api/PhonegapActivity;
    new-instance v2, Lcom/phonegap/Device$1;

    invoke-direct {v2, p0, v1}, Lcom/phonegap/Device$1;-><init>(Lcom/phonegap/Device;Lcom/phonegap/api/PhonegapActivity;)V

    iput-object v2, p0, Lcom/phonegap/Device;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    .line 155
    iget-object v2, p0, Lcom/phonegap/Device;->ctx:Lcom/phonegap/api/PhonegapActivity;

    iget-object v3, p0, Lcom/phonegap/Device;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v0}, Lcom/phonegap/api/PhonegapActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 156
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;
    .locals 6
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 73
    sget-object v3, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    .line 74
    .local v3, "status":Lcom/phonegap/api/PluginResult$Status;
    const-string v2, ""

    .line 77
    .local v2, "result":Ljava/lang/String;
    :try_start_0
    const-string v4, "getDeviceInfo"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 78
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 79
    .local v1, "r":Lorg/json/JSONObject;
    const-string v4, "uuid"

    sget-object v5, Lcom/phonegap/Device;->uuid:Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    const-string v4, "version"

    invoke-virtual {p0}, Lcom/phonegap/Device;->getOSVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    const-string v4, "platform"

    sget-object v5, Lcom/phonegap/Device;->platform:Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    const-string v4, "name"

    invoke-virtual {p0}, Lcom/phonegap/Device;->getProductName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    const-string v4, "phonegap"

    sget-object v5, Lcom/phonegap/Device;->phonegapVersion:Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    new-instance v4, Lcom/phonegap/api/PluginResult;

    invoke-direct {v4, v3, v1}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 91
    .end local v1    # "r":Lorg/json/JSONObject;
    :goto_0
    return-object v4

    .line 89
    :cond_0
    new-instance v4, Lcom/phonegap/api/PluginResult;

    invoke-direct {v4, v3, v2}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Lorg/json/JSONException;
    new-instance v4, Lcom/phonegap/api/PluginResult;

    sget-object v5, Lcom/phonegap/api/PluginResult$Status;->JSON_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v4, v5}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    goto :goto_0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 187
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 188
    .local v0, "model":Ljava/lang/String;
    return-object v0
.end method

.method public getOSVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 202
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 203
    .local v0, "osversion":Ljava/lang/String;
    return-object v0
.end method

.method public getPhonegapVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 183
    sget-object v0, Lcom/phonegap/Device;->phonegapVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getPlatform()Ljava/lang/String;
    .locals 1

    .prologue
    .line 164
    sget-object v0, Lcom/phonegap/Device;->platform:Ljava/lang/String;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 192
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 193
    .local v0, "productname":Ljava/lang/String;
    return-object v0
.end method

.method public getSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 207
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    .line 208
    .local v0, "sdkversion":Ljava/lang/String;
    return-object v0
.end method

.method public getTimeZoneID()Ljava/lang/String;
    .locals 2

    .prologue
    .line 213
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    .line 214
    .local v0, "tz":Ljava/util/TimeZone;
    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getUuid()Ljava/lang/String;
    .locals 3

    .prologue
    .line 173
    iget-object v1, p0, Lcom/phonegap/Device;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v1}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, "uuid":Ljava/lang/String;
    return-object v0
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 102
    const-string v0, "getDeviceInfo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    const/4 v0, 0x1

    .line 105
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 112
    iget-object v0, p0, Lcom/phonegap/Device;->ctx:Lcom/phonegap/api/PhonegapActivity;

    iget-object v1, p0, Lcom/phonegap/Device;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Lcom/phonegap/api/PhonegapActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 113
    return-void
.end method

.method public setContext(Lcom/phonegap/api/PhonegapActivity;)V
    .locals 1
    .param p1, "ctx"    # Lcom/phonegap/api/PhonegapActivity;

    .prologue
    .line 59
    invoke-super {p0, p1}, Lcom/phonegap/api/Plugin;->setContext(Lcom/phonegap/api/PhonegapActivity;)V

    .line 60
    invoke-virtual {p0}, Lcom/phonegap/Device;->getUuid()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/phonegap/Device;->uuid:Ljava/lang/String;

    .line 61
    invoke-direct {p0}, Lcom/phonegap/Device;->initTelephonyReceiver()V

    .line 62
    return-void
.end method
