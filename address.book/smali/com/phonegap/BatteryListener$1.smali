.class Lcom/phonegap/BatteryListener$1;
.super Landroid/content/BroadcastReceiver;
.source "BatteryListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/BatteryListener;->execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/BatteryListener;


# direct methods
.method constructor <init>(Lcom/phonegap/BatteryListener;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/phonegap/BatteryListener$1;->this$0:Lcom/phonegap/BatteryListener;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/phonegap/BatteryListener$1;->this$0:Lcom/phonegap/BatteryListener;

    # invokes: Lcom/phonegap/BatteryListener;->updateBatteryInfo(Landroid/content/Intent;)V
    invoke-static {v0, p2}, Lcom/phonegap/BatteryListener;->access$000(Lcom/phonegap/BatteryListener;Landroid/content/Intent;)V

    .line 75
    return-void
.end method
