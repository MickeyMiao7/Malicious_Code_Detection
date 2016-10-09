.class Lcom/phonegap/Notification$2;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/Notification;->confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/Notification;

.field final synthetic val$callbackId:Ljava/lang/String;

.field final synthetic val$ctx:Lcom/phonegap/api/PhonegapActivity;

.field final synthetic val$fButtons:[Ljava/lang/String;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$notification:Lcom/phonegap/Notification;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/phonegap/Notification;Lcom/phonegap/api/PhonegapActivity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/phonegap/Notification;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 227
    iput-object p1, p0, Lcom/phonegap/Notification$2;->this$0:Lcom/phonegap/Notification;

    iput-object p2, p0, Lcom/phonegap/Notification$2;->val$ctx:Lcom/phonegap/api/PhonegapActivity;

    iput-object p3, p0, Lcom/phonegap/Notification$2;->val$message:Ljava/lang/String;

    iput-object p4, p0, Lcom/phonegap/Notification$2;->val$title:Ljava/lang/String;

    iput-object p5, p0, Lcom/phonegap/Notification$2;->val$fButtons:[Ljava/lang/String;

    iput-object p6, p0, Lcom/phonegap/Notification$2;->val$notification:Lcom/phonegap/Notification;

    iput-object p7, p0, Lcom/phonegap/Notification$2;->val$callbackId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 229
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/phonegap/Notification$2;->val$ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 230
    .local v0, "dlg":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lcom/phonegap/Notification$2;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 231
    iget-object v1, p0, Lcom/phonegap/Notification$2;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 232
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 235
    iget-object v1, p0, Lcom/phonegap/Notification$2;->val$fButtons:[Ljava/lang/String;

    array-length v1, v1

    if-lez v1, :cond_0

    .line 236
    iget-object v1, p0, Lcom/phonegap/Notification$2;->val$fButtons:[Ljava/lang/String;

    aget-object v1, v1, v2

    new-instance v2, Lcom/phonegap/Notification$2$1;

    invoke-direct {v2, p0}, Lcom/phonegap/Notification$2$1;-><init>(Lcom/phonegap/Notification$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 246
    :cond_0
    iget-object v1, p0, Lcom/phonegap/Notification$2;->val$fButtons:[Ljava/lang/String;

    array-length v1, v1

    if-le v1, v3, :cond_1

    .line 247
    iget-object v1, p0, Lcom/phonegap/Notification$2;->val$fButtons:[Ljava/lang/String;

    aget-object v1, v1, v3

    new-instance v2, Lcom/phonegap/Notification$2$2;

    invoke-direct {v2, p0}, Lcom/phonegap/Notification$2$2;-><init>(Lcom/phonegap/Notification$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 257
    :cond_1
    iget-object v1, p0, Lcom/phonegap/Notification$2;->val$fButtons:[Ljava/lang/String;

    array-length v1, v1

    if-le v1, v4, :cond_2

    .line 258
    iget-object v1, p0, Lcom/phonegap/Notification$2;->val$fButtons:[Ljava/lang/String;

    aget-object v1, v1, v4

    new-instance v2, Lcom/phonegap/Notification$2$3;

    invoke-direct {v2, p0}, Lcom/phonegap/Notification$2$3;-><init>(Lcom/phonegap/Notification$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 268
    :cond_2
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 269
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 270
    return-void
.end method
