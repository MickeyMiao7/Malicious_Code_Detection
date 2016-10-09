.class public Lcom/phonegap/PreferenceSet;
.super Ljava/lang/Object;
.source "PreferenceSet.java"


# instance fields
.field private innerSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/phonegap/PreferenceNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/phonegap/PreferenceSet;->innerSet:Ljava/util/HashSet;

    .line 12
    return-void
.end method


# virtual methods
.method public add(Lcom/phonegap/PreferenceNode;)V
    .locals 1
    .param p1, "node"    # Lcom/phonegap/PreferenceNode;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/phonegap/PreferenceSet;->innerSet:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 16
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/phonegap/PreferenceSet;->innerSet:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 24
    return-void
.end method

.method public pref(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "prefName"    # Ljava/lang/String;

    .prologue
    .line 27
    iget-object v2, p0, Lcom/phonegap/PreferenceSet;->innerSet:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/phonegap/PreferenceNode;

    .line 28
    .local v1, "n":Lcom/phonegap/PreferenceNode;
    iget-object v2, v1, Lcom/phonegap/PreferenceNode;->name:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 29
    iget-object v2, v1, Lcom/phonegap/PreferenceNode;->value:Ljava/lang/String;

    .line 31
    .end local v1    # "n":Lcom/phonegap/PreferenceNode;
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public prefMatches(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "prefName"    # Ljava/lang/String;
    .param p2, "prefValue"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1}, Lcom/phonegap/PreferenceSet;->pref(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 38
    const/4 v1, 0x0

    .line 40
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/phonegap/PreferenceSet;->innerSet:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    return v0
.end method
