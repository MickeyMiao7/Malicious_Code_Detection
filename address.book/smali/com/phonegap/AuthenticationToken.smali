.class public Lcom/phonegap/AuthenticationToken;
.super Ljava/lang/Object;
.source "AuthenticationToken.java"


# instance fields
.field private password:Ljava/lang/String;

.field private userName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/phonegap/AuthenticationToken;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/phonegap/AuthenticationToken;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/phonegap/AuthenticationToken;->password:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/phonegap/AuthenticationToken;->userName:Ljava/lang/String;

    .line 27
    return-void
.end method
