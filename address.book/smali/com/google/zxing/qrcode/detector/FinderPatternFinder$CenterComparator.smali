.class Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;
.super Ljava/lang/Object;
.source "FinderPatternFinder.java"

# interfaces
.implements Lcom/google/zxing/common/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CenterComparator"
.end annotation


# instance fields
.field private final average:F


# direct methods
.method private constructor <init>(F)V
    .locals 0
    .param p1, "f"    # F

    .prologue
    .line 571
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 572
    iput p1, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;->average:F

    .line 573
    return-void
.end method

.method synthetic constructor <init>(FLcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;)V
    .locals 0

    .prologue
    .line 571
    invoke-direct {p0, p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;-><init>(F)V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4
    .param p1, "center1"    # Ljava/lang/Object;
    .param p2, "center2"    # Ljava/lang/Object;

    .prologue
    .line 575
    move-object v2, p2

    check-cast v2, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v3

    move-object v2, p1

    check-cast v2, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v2

    if-ne v3, v2, :cond_2

    .line 576
    check-cast p2, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .end local p2    # "center2":Ljava/lang/Object;
    invoke-virtual {p2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v2

    iget v3, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;->average:F

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 577
    .local v0, "dA":F
    check-cast p1, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .end local p1    # "center1":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v2

    iget v3, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;->average:F

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 578
    .local v1, "dB":F
    cmpg-float v2, v0, v1

    if-gez v2, :cond_0

    const/4 v2, 0x1

    .line 580
    .end local v0    # "dA":F
    .end local v1    # "dB":F
    :goto_0
    return v2

    .line 578
    .restart local v0    # "dA":F
    .restart local v1    # "dB":F
    :cond_0
    cmpl-float v2, v0, v1

    if-nez v2, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    const/4 v2, -0x1

    goto :goto_0

    .line 580
    .end local v0    # "dA":F
    .end local v1    # "dB":F
    .restart local p1    # "center1":Ljava/lang/Object;
    .restart local p2    # "center2":Ljava/lang/Object;
    :cond_2
    check-cast p2, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .end local p2    # "center2":Ljava/lang/Object;
    invoke-virtual {p2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v2

    check-cast p1, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .end local p1    # "center1":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v3

    sub-int/2addr v2, v3

    goto :goto_0
.end method
