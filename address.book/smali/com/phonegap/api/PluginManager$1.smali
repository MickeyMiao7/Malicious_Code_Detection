.class Lcom/phonegap/api/PluginManager$1;
.super Ljava/lang/Object;
.source "PluginManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/api/PluginManager;->exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/api/PluginManager;

.field final synthetic val$action:Ljava/lang/String;

.field final synthetic val$args:Lorg/json/JSONArray;

.field final synthetic val$callbackId:Ljava/lang/String;

.field final synthetic val$ctx:Lcom/phonegap/api/PhonegapActivity;

.field final synthetic val$plugin:Lcom/phonegap/api/IPlugin;


# direct methods
.method constructor <init>(Lcom/phonegap/api/PluginManager;Lcom/phonegap/api/IPlugin;Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;Lcom/phonegap/api/PhonegapActivity;)V
    .locals 0

    .prologue
    .line 146
    iput-object p1, p0, Lcom/phonegap/api/PluginManager$1;->this$0:Lcom/phonegap/api/PluginManager;

    iput-object p2, p0, Lcom/phonegap/api/PluginManager$1;->val$plugin:Lcom/phonegap/api/IPlugin;

    iput-object p3, p0, Lcom/phonegap/api/PluginManager$1;->val$action:Ljava/lang/String;

    iput-object p4, p0, Lcom/phonegap/api/PluginManager$1;->val$args:Lorg/json/JSONArray;

    iput-object p5, p0, Lcom/phonegap/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    iput-object p6, p0, Lcom/phonegap/api/PluginManager$1;->val$ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 150
    :try_start_0
    iget-object v3, p0, Lcom/phonegap/api/PluginManager$1;->val$plugin:Lcom/phonegap/api/IPlugin;

    iget-object v4, p0, Lcom/phonegap/api/PluginManager$1;->val$action:Ljava/lang/String;

    iget-object v5, p0, Lcom/phonegap/api/PluginManager$1;->val$args:Lorg/json/JSONArray;

    iget-object v6, p0, Lcom/phonegap/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-interface {v3, v4, v5, v6}, Lcom/phonegap/api/IPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;

    move-result-object v0

    .line 151
    .local v0, "cr":Lcom/phonegap/api/PluginResult;
    invoke-virtual {v0}, Lcom/phonegap/api/PluginResult;->getStatus()I

    move-result v2

    .line 154
    .local v2, "status":I
    sget-object v3, Lcom/phonegap/api/PluginResult$Status;->NO_RESULT:Lcom/phonegap/api/PluginResult$Status;

    invoke-virtual {v3}, Lcom/phonegap/api/PluginResult$Status;->ordinal()I

    move-result v3

    if-ne v2, v3, :cond_0

    invoke-virtual {v0}, Lcom/phonegap/api/PluginResult;->getKeepCallback()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 170
    .end local v2    # "status":I
    :goto_0
    return-void

    .line 158
    .restart local v2    # "status":I
    :cond_0
    sget-object v3, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-virtual {v3}, Lcom/phonegap/api/PluginResult$Status;->ordinal()I

    move-result v3

    if-eq v2, v3, :cond_1

    sget-object v3, Lcom/phonegap/api/PluginResult$Status;->NO_RESULT:Lcom/phonegap/api/PluginResult$Status;

    invoke-virtual {v3}, Lcom/phonegap/api/PluginResult$Status;->ordinal()I

    move-result v3

    if-ne v2, v3, :cond_2

    .line 159
    :cond_1
    iget-object v3, p0, Lcom/phonegap/api/PluginManager$1;->val$ctx:Lcom/phonegap/api/PhonegapActivity;

    iget-object v4, p0, Lcom/phonegap/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lcom/phonegap/api/PluginResult;->toSuccessCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/phonegap/api/PhonegapActivity;->sendJavascript(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 166
    .end local v0    # "cr":Lcom/phonegap/api/PluginResult;
    .end local v2    # "status":I
    :catch_0
    move-exception v1

    .line 167
    .local v1, "e":Ljava/lang/Exception;
    new-instance v0, Lcom/phonegap/api/PluginResult;

    sget-object v3, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V

    .line 168
    .restart local v0    # "cr":Lcom/phonegap/api/PluginResult;
    iget-object v3, p0, Lcom/phonegap/api/PluginManager$1;->val$ctx:Lcom/phonegap/api/PhonegapActivity;

    iget-object v4, p0, Lcom/phonegap/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lcom/phonegap/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/phonegap/api/PhonegapActivity;->sendJavascript(Ljava/lang/String;)V

    goto :goto_0

    .line 164
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "status":I
    :cond_2
    :try_start_1
    iget-object v3, p0, Lcom/phonegap/api/PluginManager$1;->val$ctx:Lcom/phonegap/api/PhonegapActivity;

    iget-object v4, p0, Lcom/phonegap/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lcom/phonegap/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/phonegap/api/PhonegapActivity;->sendJavascript(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
