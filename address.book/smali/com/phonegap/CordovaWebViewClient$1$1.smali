.class Lcom/phonegap/CordovaWebViewClient$1$1;
.super Ljava/lang/Object;
.source "CordovaWebViewClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/CordovaWebViewClient$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/phonegap/CordovaWebViewClient$1;


# direct methods
.method constructor <init>(Lcom/phonegap/CordovaWebViewClient$1;)V
    .locals 0

    .prologue
    .line 230
    iput-object p1, p0, Lcom/phonegap/CordovaWebViewClient$1$1;->this$1:Lcom/phonegap/CordovaWebViewClient$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 232
    iget-object v0, p0, Lcom/phonegap/CordovaWebViewClient$1$1;->this$1:Lcom/phonegap/CordovaWebViewClient$1;

    iget-object v0, v0, Lcom/phonegap/CordovaWebViewClient$1;->this$0:Lcom/phonegap/CordovaWebViewClient;

    iget-object v0, v0, Lcom/phonegap/CordovaWebViewClient;->ctx:Lcom/phonegap/DroidGap;

    iget-object v0, v0, Lcom/phonegap/DroidGap;->appView:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 233
    iget-object v0, p0, Lcom/phonegap/CordovaWebViewClient$1$1;->this$1:Lcom/phonegap/CordovaWebViewClient$1;

    iget-object v0, v0, Lcom/phonegap/CordovaWebViewClient$1;->this$0:Lcom/phonegap/CordovaWebViewClient;

    iget-object v0, v0, Lcom/phonegap/CordovaWebViewClient;->ctx:Lcom/phonegap/DroidGap;

    invoke-virtual {v0}, Lcom/phonegap/DroidGap;->spinnerStop()V

    .line 234
    return-void
.end method
