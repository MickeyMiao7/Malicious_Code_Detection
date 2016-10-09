.class Lcom/phonegap/Notification$4$1;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/Notification$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/phonegap/Notification$4;


# direct methods
.method constructor <init>(Lcom/phonegap/Notification$4;)V
    .locals 0

    .prologue
    .line 334
    iput-object p1, p0, Lcom/phonegap/Notification$4$1;->this$1:Lcom/phonegap/Notification$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 336
    iget-object v0, p0, Lcom/phonegap/Notification$4$1;->this$1:Lcom/phonegap/Notification$4;

    iget-object v0, v0, Lcom/phonegap/Notification$4;->val$notification:Lcom/phonegap/Notification;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/phonegap/Notification;->progressDialog:Landroid/app/ProgressDialog;

    .line 337
    return-void
.end method
