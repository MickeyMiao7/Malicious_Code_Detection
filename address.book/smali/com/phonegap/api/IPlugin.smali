.class public interface abstract Lcom/phonegap/api/IPlugin;
.super Ljava/lang/Object;
.source "IPlugin.java"


# virtual methods
.method public abstract execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;
.end method

.method public abstract isSynch(Ljava/lang/String;)Z
.end method

.method public abstract onActivityResult(IILandroid/content/Intent;)V
.end method

.method public abstract onDestroy()V
.end method

.method public abstract onMessage(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract onNewIntent(Landroid/content/Intent;)V
.end method

.method public abstract onOverrideUrlLoading(Ljava/lang/String;)Z
.end method

.method public abstract onPause(Z)V
.end method

.method public abstract onResume(Z)V
.end method

.method public abstract setContext(Lcom/phonegap/api/PhonegapActivity;)V
.end method

.method public abstract setView(Landroid/webkit/WebView;)V
.end method
