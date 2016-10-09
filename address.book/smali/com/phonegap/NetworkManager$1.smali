.class Lcom/phonegap/NetworkManager$1;
.super Landroid/content/BroadcastReceiver;
.source "NetworkManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/NetworkManager;->setContext(Lcom/phonegap/api/PhonegapActivity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/NetworkManager;


# direct methods
.method constructor <init>(Lcom/phonegap/NetworkManager;)V
    .locals 0

    .prologue
    .line 99
    iput-object p1, p0, Lcom/phonegap/NetworkManager$1;->this$0:Lcom/phonegap/NetworkManager;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 102
    iget-object v1, p0, Lcom/phonegap/NetworkManager$1;->this$0:Lcom/phonegap/NetworkManager;

    const-string v0, "networkInfo"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/NetworkInfo;

    # invokes: Lcom/phonegap/NetworkManager;->updateConnectionInfo(Landroid/net/NetworkInfo;)V
    invoke-static {v1, v0}, Lcom/phonegap/NetworkManager;->access$000(Lcom/phonegap/NetworkManager;Landroid/net/NetworkInfo;)V

    .line 103
    return-void
.end method
