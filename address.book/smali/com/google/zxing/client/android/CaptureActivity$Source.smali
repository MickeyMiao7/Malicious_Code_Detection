.class final enum Lcom/google/zxing/client/android/CaptureActivity$Source;
.super Ljava/lang/Enum;
.source "CaptureActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/client/android/CaptureActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Source"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/zxing/client/android/CaptureActivity$Source;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/google/zxing/client/android/CaptureActivity$Source;

.field public static final enum NATIVE_APP_INTENT:Lcom/google/zxing/client/android/CaptureActivity$Source;

.field public static final enum NONE:Lcom/google/zxing/client/android/CaptureActivity$Source;

.field public static final enum PRODUCT_SEARCH_LINK:Lcom/google/zxing/client/android/CaptureActivity$Source;

.field public static final enum ZXING_LINK:Lcom/google/zxing/client/android/CaptureActivity$Source;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 109
    new-instance v0, Lcom/google/zxing/client/android/CaptureActivity$Source;

    const-string v1, "NATIVE_APP_INTENT"

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/client/android/CaptureActivity$Source;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/client/android/CaptureActivity$Source;->NATIVE_APP_INTENT:Lcom/google/zxing/client/android/CaptureActivity$Source;

    .line 110
    new-instance v0, Lcom/google/zxing/client/android/CaptureActivity$Source;

    const-string v1, "PRODUCT_SEARCH_LINK"

    invoke-direct {v0, v1, v3}, Lcom/google/zxing/client/android/CaptureActivity$Source;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/client/android/CaptureActivity$Source;->PRODUCT_SEARCH_LINK:Lcom/google/zxing/client/android/CaptureActivity$Source;

    .line 111
    new-instance v0, Lcom/google/zxing/client/android/CaptureActivity$Source;

    const-string v1, "ZXING_LINK"

    invoke-direct {v0, v1, v4}, Lcom/google/zxing/client/android/CaptureActivity$Source;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/client/android/CaptureActivity$Source;->ZXING_LINK:Lcom/google/zxing/client/android/CaptureActivity$Source;

    .line 112
    new-instance v0, Lcom/google/zxing/client/android/CaptureActivity$Source;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v5}, Lcom/google/zxing/client/android/CaptureActivity$Source;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/client/android/CaptureActivity$Source;->NONE:Lcom/google/zxing/client/android/CaptureActivity$Source;

    .line 108
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/google/zxing/client/android/CaptureActivity$Source;

    sget-object v1, Lcom/google/zxing/client/android/CaptureActivity$Source;->NATIVE_APP_INTENT:Lcom/google/zxing/client/android/CaptureActivity$Source;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/zxing/client/android/CaptureActivity$Source;->PRODUCT_SEARCH_LINK:Lcom/google/zxing/client/android/CaptureActivity$Source;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/zxing/client/android/CaptureActivity$Source;->ZXING_LINK:Lcom/google/zxing/client/android/CaptureActivity$Source;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/zxing/client/android/CaptureActivity$Source;->NONE:Lcom/google/zxing/client/android/CaptureActivity$Source;

    aput-object v1, v0, v5

    sput-object v0, Lcom/google/zxing/client/android/CaptureActivity$Source;->ENUM$VALUES:[Lcom/google/zxing/client/android/CaptureActivity$Source;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 108
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/zxing/client/android/CaptureActivity$Source;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/google/zxing/client/android/CaptureActivity$Source;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/client/android/CaptureActivity$Source;

    return-object v0
.end method

.method public static values()[Lcom/google/zxing/client/android/CaptureActivity$Source;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/google/zxing/client/android/CaptureActivity$Source;->ENUM$VALUES:[Lcom/google/zxing/client/android/CaptureActivity$Source;

    array-length v1, v0

    new-array v2, v1, [Lcom/google/zxing/client/android/CaptureActivity$Source;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
