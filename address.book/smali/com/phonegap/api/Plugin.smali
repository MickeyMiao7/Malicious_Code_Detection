.class public abstract Lcom/phonegap/api/Plugin;
.super Ljava/lang/Object;
.source "Plugin.java"

# interfaces
.implements Lcom/phonegap/api/IPlugin;


# instance fields
.field public ctx:Lcom/phonegap/api/PhonegapActivity;

.field public id:Ljava/lang/String;

.field public webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public error(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V
    .locals 2
    .param p1, "pluginResult"    # Lcom/phonegap/api/PluginResult;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 188
    iget-object v0, p0, Lcom/phonegap/api/Plugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {p1, p2}, Lcom/phonegap/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/phonegap/api/PhonegapActivity;->sendJavascript(Ljava/lang/String;)V

    .line 189
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 208
    iget-object v0, p0, Lcom/phonegap/api/Plugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    new-instance v1, Lcom/phonegap/api/PluginResult;

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Lcom/phonegap/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/phonegap/api/PhonegapActivity;->sendJavascript(Ljava/lang/String;)V

    .line 209
    return-void
.end method

.method public error(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Lorg/json/JSONObject;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 198
    iget-object v0, p0, Lcom/phonegap/api/Plugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    new-instance v1, Lcom/phonegap/api/PluginResult;

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual {v1, p2}, Lcom/phonegap/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/phonegap/api/PhonegapActivity;->sendJavascript(Ljava/lang/String;)V

    .line 199
    return-void
.end method

.method public abstract execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 55
    const/4 v0, 0x0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 125
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 104
    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 113
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 98
    return-void
.end method

.method public onOverrideUrlLoading(Ljava/lang/String;)Z
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 134
    const/4 v0, 0x0

    return v0
.end method

.method public onPause(Z)V
    .locals 0
    .param p1, "multitasking"    # Z

    .prologue
    .line 84
    return-void
.end method

.method public onResume(Z)V
    .locals 0
    .param p1, "multitasking"    # Z

    .prologue
    .line 92
    return-void
.end method

.method public sendJavascript(Ljava/lang/String;)V
    .locals 1
    .param p1, "statement"    # Ljava/lang/String;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/phonegap/api/Plugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v0, p1}, Lcom/phonegap/api/PhonegapActivity;->sendJavascript(Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method public setContext(Lcom/phonegap/api/PhonegapActivity;)V
    .locals 0
    .param p1, "ctx"    # Lcom/phonegap/api/PhonegapActivity;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/phonegap/api/Plugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    .line 66
    return-void
.end method

.method public setView(Landroid/webkit/WebView;)V
    .locals 0
    .param p1, "webView"    # Landroid/webkit/WebView;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/phonegap/api/Plugin;->webView:Landroid/webkit/WebView;

    .line 76
    return-void
.end method

.method public success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V
    .locals 2
    .param p1, "pluginResult"    # Lcom/phonegap/api/PluginResult;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 158
    iget-object v0, p0, Lcom/phonegap/api/Plugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {p1, p2}, Lcom/phonegap/api/PluginResult;->toSuccessCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/phonegap/api/PhonegapActivity;->sendJavascript(Ljava/lang/String;)V

    .line 159
    return-void
.end method

.method public success(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 178
    iget-object v0, p0, Lcom/phonegap/api/Plugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    new-instance v1, Lcom/phonegap/api/PluginResult;

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Lcom/phonegap/api/PluginResult;->toSuccessCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/phonegap/api/PhonegapActivity;->sendJavascript(Ljava/lang/String;)V

    .line 179
    return-void
.end method

.method public success(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Lorg/json/JSONObject;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 168
    iget-object v0, p0, Lcom/phonegap/api/Plugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    new-instance v1, Lcom/phonegap/api/PluginResult;

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual {v1, p2}, Lcom/phonegap/api/PluginResult;->toSuccessCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/phonegap/api/PhonegapActivity;->sendJavascript(Ljava/lang/String;)V

    .line 169
    return-void
.end method
