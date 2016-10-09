.class Lcom/phonegap/DroidGap$5;
.super Ljava/lang/Object;
.source "DroidGap.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/DroidGap;->onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/DroidGap;

.field final synthetic val$errorUrl:Ljava/lang/String;

.field final synthetic val$me:Lcom/phonegap/DroidGap;


# direct methods
.method constructor <init>(Lcom/phonegap/DroidGap;Lcom/phonegap/DroidGap;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1195
    iput-object p1, p0, Lcom/phonegap/DroidGap$5;->this$0:Lcom/phonegap/DroidGap;

    iput-object p2, p0, Lcom/phonegap/DroidGap$5;->val$me:Lcom/phonegap/DroidGap;

    iput-object p3, p0, Lcom/phonegap/DroidGap$5;->val$errorUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 1197
    iget-object v0, p0, Lcom/phonegap/DroidGap$5;->val$me:Lcom/phonegap/DroidGap;

    iget-object v1, p0, Lcom/phonegap/DroidGap$5;->val$errorUrl:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/phonegap/DroidGap;->showWebPage(Ljava/lang/String;ZZLjava/util/HashMap;)V

    .line 1198
    return-void
.end method
