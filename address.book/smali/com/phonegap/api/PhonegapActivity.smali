.class public abstract Lcom/phonegap/api/PhonegapActivity;
.super Landroid/app/Activity;
.source "PhonegapActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract addService(Ljava/lang/String;Ljava/lang/String;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract loadUrl(Ljava/lang/String;)V
.end method

.method public abstract postMessage(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract sendJavascript(Ljava/lang/String;)V
.end method

.method public abstract setActivityResultCallback(Lcom/phonegap/api/IPlugin;)V
.end method

.method public abstract startActivityForResult(Lcom/phonegap/api/IPlugin;Landroid/content/Intent;I)V
.end method
