.class Lcom/phonegap/DroidGap$3;
.super Ljava/lang/Object;
.source "DroidGap.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/DroidGap;->loadUrlIntoView(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/DroidGap;

.field final synthetic val$me:Lcom/phonegap/DroidGap;

.field final synthetic val$time:I

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/phonegap/DroidGap;ILcom/phonegap/DroidGap;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 629
    iput-object p1, p0, Lcom/phonegap/DroidGap$3;->this$0:Lcom/phonegap/DroidGap;

    iput p2, p0, Lcom/phonegap/DroidGap$3;->val$time:I

    iput-object p3, p0, Lcom/phonegap/DroidGap$3;->val$me:Lcom/phonegap/DroidGap;

    iput-object p4, p0, Lcom/phonegap/DroidGap$3;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 632
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 633
    :try_start_1
    iget v1, p0, Lcom/phonegap/DroidGap$3;->val$time:I

    int-to-long v1, v1

    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V

    .line 634
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 638
    :goto_0
    iget-object v1, p0, Lcom/phonegap/DroidGap$3;->val$me:Lcom/phonegap/DroidGap;

    iget-boolean v1, v1, Lcom/phonegap/DroidGap;->cancelLoadUrl:Z

    if-nez v1, :cond_0

    .line 639
    iget-object v1, p0, Lcom/phonegap/DroidGap$3;->val$me:Lcom/phonegap/DroidGap;

    iget-object v2, p0, Lcom/phonegap/DroidGap$3;->val$url:Ljava/lang/String;

    # invokes: Lcom/phonegap/DroidGap;->loadUrlIntoView(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/phonegap/DroidGap;->access$200(Lcom/phonegap/DroidGap;Ljava/lang/String;)V

    .line 645
    :goto_1
    return-void

    .line 634
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 635
    :catch_0
    move-exception v0

    .line 636
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 642
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    iget-object v1, p0, Lcom/phonegap/DroidGap$3;->val$me:Lcom/phonegap/DroidGap;

    iput-boolean v5, v1, Lcom/phonegap/DroidGap;->cancelLoadUrl:Z

    .line 643
    sget-object v1, Lcom/phonegap/DroidGap;->TAG:Ljava/lang/String;

    const-string v2, "Aborting loadUrl(%s): Another URL was loaded before timer expired."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/phonegap/DroidGap$3;->val$url:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Lcom/phonegap/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1
.end method
