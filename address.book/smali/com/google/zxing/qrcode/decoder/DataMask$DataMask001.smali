.class Lcom/google/zxing/qrcode/decoder/DataMask$DataMask001;
.super Lcom/google/zxing/qrcode/decoder/DataMask;
.source "DataMask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/qrcode/decoder/DataMask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DataMask001"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/zxing/qrcode/decoder/DataMask;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask001;)V
    .locals 0

    .prologue
    .line 94
    invoke-direct {p0}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask001;-><init>()V

    return-void
.end method


# virtual methods
.method isMasked(II)Z
    .locals 1
    .param p1, "i"    # I
    .param p2, "j"    # I

    .prologue
    .line 96
    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
