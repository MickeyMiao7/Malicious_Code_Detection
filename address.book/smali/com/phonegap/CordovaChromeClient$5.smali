.class Lcom/phonegap/CordovaChromeClient$5;
.super Ljava/lang/Object;
.source "CordovaChromeClient.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/CordovaChromeClient;->onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/CordovaChromeClient;

.field final synthetic val$result:Landroid/webkit/JsResult;


# direct methods
.method constructor <init>(Lcom/phonegap/CordovaChromeClient;Landroid/webkit/JsResult;)V
    .locals 0

    .prologue
    .line 123
    iput-object p1, p0, Lcom/phonegap/CordovaChromeClient$5;->this$0:Lcom/phonegap/CordovaChromeClient;

    iput-object p2, p0, Lcom/phonegap/CordovaChromeClient$5;->val$result:Landroid/webkit/JsResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 125
    iget-object v0, p0, Lcom/phonegap/CordovaChromeClient$5;->val$result:Landroid/webkit/JsResult;

    invoke-virtual {v0}, Landroid/webkit/JsResult;->cancel()V

    .line 126
    return-void
.end method
