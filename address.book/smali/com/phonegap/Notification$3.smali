.class Lcom/phonegap/Notification$3;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/Notification;->activityStart(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/Notification;

.field final synthetic val$ctx:Lcom/phonegap/api/PhonegapActivity;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$notification:Lcom/phonegap/Notification;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/phonegap/Notification;Lcom/phonegap/Notification;Lcom/phonegap/api/PhonegapActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 288
    iput-object p1, p0, Lcom/phonegap/Notification$3;->this$0:Lcom/phonegap/Notification;

    iput-object p2, p0, Lcom/phonegap/Notification$3;->val$notification:Lcom/phonegap/Notification;

    iput-object p3, p0, Lcom/phonegap/Notification$3;->val$ctx:Lcom/phonegap/api/PhonegapActivity;

    iput-object p4, p0, Lcom/phonegap/Notification$3;->val$title:Ljava/lang/String;

    iput-object p5, p0, Lcom/phonegap/Notification$3;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v3, 0x1

    .line 290
    iget-object v6, p0, Lcom/phonegap/Notification$3;->val$notification:Lcom/phonegap/Notification;

    iget-object v0, p0, Lcom/phonegap/Notification$3;->val$ctx:Lcom/phonegap/api/PhonegapActivity;

    iget-object v1, p0, Lcom/phonegap/Notification$3;->val$title:Ljava/lang/String;

    iget-object v2, p0, Lcom/phonegap/Notification$3;->val$message:Ljava/lang/String;

    new-instance v5, Lcom/phonegap/Notification$3$1;

    invoke-direct {v5, p0}, Lcom/phonegap/Notification$3$1;-><init>(Lcom/phonegap/Notification$3;)V

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, v6, Lcom/phonegap/Notification;->spinnerDialog:Landroid/app/ProgressDialog;

    .line 296
    return-void
.end method
