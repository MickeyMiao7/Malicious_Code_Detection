.class public final enum Lcom/phonegap/api/PluginResult$Status;
.super Ljava/lang/Enum;
.source "PluginResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/phonegap/api/PluginResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/phonegap/api/PluginResult$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/phonegap/api/PluginResult$Status;

.field public static final enum CLASS_NOT_FOUND_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

.field public static final enum ERROR:Lcom/phonegap/api/PluginResult$Status;

.field public static final enum ILLEGAL_ACCESS_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

.field public static final enum INSTANTIATION_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

.field public static final enum INVALID_ACTION:Lcom/phonegap/api/PluginResult$Status;

.field public static final enum IO_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

.field public static final enum JSON_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

.field public static final enum MALFORMED_URL_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

.field public static final enum NO_RESULT:Lcom/phonegap/api/PluginResult$Status;

.field public static final enum OK:Lcom/phonegap/api/PluginResult$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 129
    new-instance v0, Lcom/phonegap/api/PluginResult$Status;

    const-string v1, "NO_RESULT"

    invoke-direct {v0, v1, v3}, Lcom/phonegap/api/PluginResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->NO_RESULT:Lcom/phonegap/api/PluginResult$Status;

    .line 130
    new-instance v0, Lcom/phonegap/api/PluginResult$Status;

    const-string v1, "OK"

    invoke-direct {v0, v1, v4}, Lcom/phonegap/api/PluginResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    .line 131
    new-instance v0, Lcom/phonegap/api/PluginResult$Status;

    const-string v1, "CLASS_NOT_FOUND_EXCEPTION"

    invoke-direct {v0, v1, v5}, Lcom/phonegap/api/PluginResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->CLASS_NOT_FOUND_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    .line 132
    new-instance v0, Lcom/phonegap/api/PluginResult$Status;

    const-string v1, "ILLEGAL_ACCESS_EXCEPTION"

    invoke-direct {v0, v1, v6}, Lcom/phonegap/api/PluginResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->ILLEGAL_ACCESS_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    .line 133
    new-instance v0, Lcom/phonegap/api/PluginResult$Status;

    const-string v1, "INSTANTIATION_EXCEPTION"

    invoke-direct {v0, v1, v7}, Lcom/phonegap/api/PluginResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->INSTANTIATION_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    .line 134
    new-instance v0, Lcom/phonegap/api/PluginResult$Status;

    const-string v1, "MALFORMED_URL_EXCEPTION"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/phonegap/api/PluginResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->MALFORMED_URL_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    .line 135
    new-instance v0, Lcom/phonegap/api/PluginResult$Status;

    const-string v1, "IO_EXCEPTION"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/phonegap/api/PluginResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->IO_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    .line 136
    new-instance v0, Lcom/phonegap/api/PluginResult$Status;

    const-string v1, "INVALID_ACTION"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/phonegap/api/PluginResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->INVALID_ACTION:Lcom/phonegap/api/PluginResult$Status;

    .line 137
    new-instance v0, Lcom/phonegap/api/PluginResult$Status;

    const-string v1, "JSON_EXCEPTION"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/phonegap/api/PluginResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->JSON_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    .line 138
    new-instance v0, Lcom/phonegap/api/PluginResult$Status;

    const-string v1, "ERROR"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/phonegap/api/PluginResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    .line 128
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/phonegap/api/PluginResult$Status;

    sget-object v1, Lcom/phonegap/api/PluginResult$Status;->NO_RESULT:Lcom/phonegap/api/PluginResult$Status;

    aput-object v1, v0, v3

    sget-object v1, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    aput-object v1, v0, v4

    sget-object v1, Lcom/phonegap/api/PluginResult$Status;->CLASS_NOT_FOUND_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    aput-object v1, v0, v5

    sget-object v1, Lcom/phonegap/api/PluginResult$Status;->ILLEGAL_ACCESS_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    aput-object v1, v0, v6

    sget-object v1, Lcom/phonegap/api/PluginResult$Status;->INSTANTIATION_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->MALFORMED_URL_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->IO_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->INVALID_ACTION:Lcom/phonegap/api/PluginResult$Status;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->JSON_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/phonegap/api/PluginResult$Status;->ERROR:Lcom/phonegap/api/PluginResult$Status;

    aput-object v2, v0, v1

    sput-object v0, Lcom/phonegap/api/PluginResult$Status;->$VALUES:[Lcom/phonegap/api/PluginResult$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 128
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/phonegap/api/PluginResult$Status;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 128
    const-class v0, Lcom/phonegap/api/PluginResult$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/phonegap/api/PluginResult$Status;

    return-object v0
.end method

.method public static values()[Lcom/phonegap/api/PluginResult$Status;
    .locals 1

    .prologue
    .line 128
    sget-object v0, Lcom/phonegap/api/PluginResult$Status;->$VALUES:[Lcom/phonegap/api/PluginResult$Status;

    invoke-virtual {v0}, [Lcom/phonegap/api/PluginResult$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/phonegap/api/PluginResult$Status;

    return-object v0
.end method
