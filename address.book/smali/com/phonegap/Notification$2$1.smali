.class Lcom/phonegap/Notification$2$1;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/Notification$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/phonegap/Notification$2;


# direct methods
.method constructor <init>(Lcom/phonegap/Notification$2;)V
    .locals 0

    .prologue
    .line 237
    iput-object p1, p0, Lcom/phonegap/Notification$2$1;->this$1:Lcom/phonegap/Notification$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 239
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 240
    iget-object v0, p0, Lcom/phonegap/Notification$2$1;->this$1:Lcom/phonegap/Notification$2;

    iget-object v0, v0, Lcom/phonegap/Notification$2;->val$notification:Lcom/phonegap/Notification;

    new-instance v1, Lcom/phonegap/api/PluginResult;

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;I)V

    iget-object v2, p0, Lcom/phonegap/Notification$2$1;->this$1:Lcom/phonegap/Notification$2;

    iget-object v2, v2, Lcom/phonegap/Notification$2;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/phonegap/Notification;->success(Lcom/phonegap/api/PluginResult;Ljava/lang/String;)V

    .line 241
    return-void
.end method
