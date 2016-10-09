.class Lcom/phonegap/Notification$1;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/Notification;->alert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/Notification;

.field final synthetic val$buttonLabel:Ljava/lang/String;

.field final synthetic val$callbackId:Ljava/lang/String;

.field final synthetic val$ctx:Lcom/phonegap/api/PhonegapActivity;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$notification:Lcom/phonegap/Notification;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/phonegap/Notification;Lcom/phonegap/api/PhonegapActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/phonegap/Notification;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 190
    iput-object p1, p0, Lcom/phonegap/Notification$1;->this$0:Lcom/phonegap/Notification;

    iput-object p2, p0, Lcom/phonegap/Notification$1;->val$ctx:Lcom/phonegap/api/PhonegapActivity;

    iput-object p3, p0, Lcom/phonegap/Notification$1;->val$message:Ljava/lang/String;

    iput-object p4, p0, Lcom/phonegap/Notification$1;->val$title:Ljava/lang/String;

    iput-object p5, p0, Lcom/phonegap/Notification$1;->val$buttonLabel:Ljava/lang/String;

    iput-object p6, p0, Lcom/phonegap/Notification$1;->val$notification:Lcom/phonegap/Notification;

    iput-object p7, p0, Lcom/phonegap/Notification$1;->val$callbackId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 193
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/phonegap/Notification$1;->val$ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 194
    .local v0, "dlg":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lcom/phonegap/Notification$1;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 195
    iget-object v1, p0, Lcom/phonegap/Notification$1;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 196
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 197
    iget-object v1, p0, Lcom/phonegap/Notification$1;->val$buttonLabel:Ljava/lang/String;

    new-instance v2, Lcom/phonegap/Notification$1$1;

    invoke-direct {v2, p0}, Lcom/phonegap/Notification$1$1;-><init>(Lcom/phonegap/Notification$1;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 204
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 205
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 206
    return-void
.end method
