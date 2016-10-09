.class Lcom/phonegap/DroidGap$1;
.super Ljava/lang/Object;
.source "DroidGap.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/DroidGap;->loadUrlIntoView(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/DroidGap;

.field final synthetic val$me:Lcom/phonegap/DroidGap;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/phonegap/DroidGap;Lcom/phonegap/DroidGap;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 494
    iput-object p1, p0, Lcom/phonegap/DroidGap$1;->this$0:Lcom/phonegap/DroidGap;

    iput-object p2, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iput-object p3, p0, Lcom/phonegap/DroidGap$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 498
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iget-object v7, v7, Lcom/phonegap/DroidGap;->appView:Landroid/webkit/WebView;

    if-nez v7, :cond_0

    .line 499
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    invoke-virtual {v7}, Lcom/phonegap/DroidGap;->init()V

    .line 503
    :cond_0
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    # invokes: Lcom/phonegap/DroidGap;->handleActivityParameters()V
    invoke-static {v7}, Lcom/phonegap/DroidGap;->access$000(Lcom/phonegap/DroidGap;)V

    .line 506
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    # getter for: Lcom/phonegap/DroidGap;->urls:Ljava/util/Stack;
    invoke-static {v7}, Lcom/phonegap/DroidGap;->access$100(Lcom/phonegap/DroidGap;)Ljava/util/Stack;

    move-result-object v7

    iget-object v8, p0, Lcom/phonegap/DroidGap$1;->val$url:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 507
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iget-object v7, v7, Lcom/phonegap/DroidGap;->appView:Landroid/webkit/WebView;

    invoke-virtual {v7}, Landroid/webkit/WebView;->clearHistory()V

    .line 510
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iget-object v7, v7, Lcom/phonegap/DroidGap;->callbackServer:Lcom/phonegap/CallbackServer;

    if-nez v7, :cond_3

    .line 511
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    new-instance v8, Lcom/phonegap/CallbackServer;

    invoke-direct {v8}, Lcom/phonegap/CallbackServer;-><init>()V

    iput-object v8, v7, Lcom/phonegap/DroidGap;->callbackServer:Lcom/phonegap/CallbackServer;

    .line 512
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iget-object v7, v7, Lcom/phonegap/DroidGap;->callbackServer:Lcom/phonegap/CallbackServer;

    iget-object v8, p0, Lcom/phonegap/DroidGap$1;->val$url:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/phonegap/CallbackServer;->init(Ljava/lang/String;)V

    .line 517
    :goto_0
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iget-object v7, v7, Lcom/phonegap/DroidGap;->pluginManager:Lcom/phonegap/api/PluginManager;

    if-nez v7, :cond_4

    .line 518
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    new-instance v8, Lcom/phonegap/api/PluginManager;

    iget-object v9, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iget-object v9, v9, Lcom/phonegap/DroidGap;->appView:Landroid/webkit/WebView;

    iget-object v10, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    invoke-direct {v8, v9, v10}, Lcom/phonegap/api/PluginManager;-><init>(Landroid/webkit/WebView;Lcom/phonegap/api/PhonegapActivity;)V

    iput-object v8, v7, Lcom/phonegap/DroidGap;->pluginManager:Lcom/phonegap/api/PluginManager;

    .line 525
    :goto_1
    const/4 v2, 0x0

    .line 526
    .local v2, "loading":Ljava/lang/String;
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    # getter for: Lcom/phonegap/DroidGap;->urls:Ljava/util/Stack;
    invoke-static {v7}, Lcom/phonegap/DroidGap;->access$100(Lcom/phonegap/DroidGap;)Ljava/util/Stack;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Stack;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_5

    .line 527
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    const-string v8, "loadingDialog"

    invoke-virtual {v7, v8, v11}, Lcom/phonegap/DroidGap;->getStringProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 532
    :goto_2
    if-eqz v2, :cond_2

    .line 534
    const-string v6, ""

    .line 535
    .local v6, "title":Ljava/lang/String;
    const-string v3, "Loading Application..."

    .line 537
    .local v3, "message":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    .line 538
    const/16 v7, 0x2c

    invoke-virtual {v2, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 539
    .local v0, "comma":I
    if-lez v0, :cond_6

    .line 540
    const/4 v7, 0x0

    invoke-virtual {v2, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 541
    add-int/lit8 v7, v0, 0x1

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 548
    .end local v0    # "comma":I
    :cond_1
    :goto_3
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    invoke-virtual {v7, v6, v3}, Lcom/phonegap/DroidGap;->spinnerStart(Ljava/lang/String;Ljava/lang/String;)V

    .line 552
    .end local v3    # "message":Ljava/lang/String;
    .end local v6    # "title":Ljava/lang/String;
    :cond_2
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iget v1, v7, Lcom/phonegap/DroidGap;->loadUrlTimeout:I

    .line 553
    .local v1, "currentLoadUrlTimeout":I
    new-instance v4, Lcom/phonegap/DroidGap$1$1;

    invoke-direct {v4, p0, v1}, Lcom/phonegap/DroidGap$1$1;-><init>(Lcom/phonegap/DroidGap$1;I)V

    .line 571
    .local v4, "runnable":Ljava/lang/Runnable;
    new-instance v5, Ljava/lang/Thread;

    invoke-direct {v5, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 572
    .local v5, "thread":Ljava/lang/Thread;
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 573
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iget-object v7, v7, Lcom/phonegap/DroidGap;->appView:Landroid/webkit/WebView;

    iget-object v8, p0, Lcom/phonegap/DroidGap$1;->val$url:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 574
    return-void

    .line 515
    .end local v1    # "currentLoadUrlTimeout":I
    .end local v2    # "loading":Ljava/lang/String;
    .end local v4    # "runnable":Ljava/lang/Runnable;
    .end local v5    # "thread":Ljava/lang/Thread;
    :cond_3
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iget-object v7, v7, Lcom/phonegap/DroidGap;->callbackServer:Lcom/phonegap/CallbackServer;

    iget-object v8, p0, Lcom/phonegap/DroidGap$1;->val$url:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/phonegap/CallbackServer;->reinit(Ljava/lang/String;)V

    goto :goto_0

    .line 521
    :cond_4
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    iget-object v7, v7, Lcom/phonegap/DroidGap;->pluginManager:Lcom/phonegap/api/PluginManager;

    invoke-virtual {v7}, Lcom/phonegap/api/PluginManager;->reinit()V

    goto :goto_1

    .line 530
    .restart local v2    # "loading":Ljava/lang/String;
    :cond_5
    iget-object v7, p0, Lcom/phonegap/DroidGap$1;->val$me:Lcom/phonegap/DroidGap;

    const-string v8, "loadingPageDialog"

    invoke-virtual {v7, v8, v11}, Lcom/phonegap/DroidGap;->getStringProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 544
    .restart local v0    # "comma":I
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v6    # "title":Ljava/lang/String;
    :cond_6
    const-string v6, ""

    .line 545
    move-object v3, v2

    goto :goto_3
.end method
