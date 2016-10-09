.class public Lcom/phonegap/PreferenceNode;
.super Ljava/lang/Object;
.source "PreferenceNode.java"


# instance fields
.field public name:Ljava/lang/String;

.field public readonly:Z

.field public value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "readonly"    # Z

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/phonegap/PreferenceNode;->name:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/phonegap/PreferenceNode;->value:Ljava/lang/String;

    .line 14
    iput-boolean p3, p0, Lcom/phonegap/PreferenceNode;->readonly:Z

    .line 15
    return-void
.end method
