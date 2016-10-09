.class public final Lcom/google/zxing/common/PerspectiveTransform;
.super Ljava/lang/Object;
.source "PerspectiveTransform.java"


# instance fields
.field private final a11:F

.field private final a12:F

.field private final a13:F

.field private final a21:F

.field private final a22:F

.field private final a23:F

.field private final a31:F

.field private final a32:F

.field private final a33:F


# direct methods
.method private constructor <init>(FFFFFFFFF)V
    .locals 0
    .param p1, "a11"    # F
    .param p2, "a21"    # F
    .param p3, "a31"    # F
    .param p4, "a12"    # F
    .param p5, "a22"    # F
    .param p6, "a32"    # F
    .param p7, "a13"    # F
    .param p8, "a23"    # F
    .param p9, "a33"    # F

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput p1, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    .line 34
    iput p4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    .line 35
    iput p7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    .line 36
    iput p2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    .line 37
    iput p5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    .line 38
    iput p8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    .line 39
    iput p3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    .line 40
    iput p6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    .line 41
    iput p9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    .line 42
    return-void
.end method

.method public static quadrilateralToQuadrilateral(FFFFFFFFFFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;
    .locals 3
    .param p0, "x0"    # F
    .param p1, "y0"    # F
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "x3"    # F
    .param p7, "y3"    # F
    .param p8, "x0p"    # F
    .param p9, "y0p"    # F
    .param p10, "x1p"    # F
    .param p11, "y1p"    # F
    .param p12, "x2p"    # F
    .param p13, "y2p"    # F
    .param p14, "x3p"    # F
    .param p15, "y3p"    # F

    .prologue
    .line 53
    invoke-static/range {p0 .. p7}, Lcom/google/zxing/common/PerspectiveTransform;->quadrilateralToSquare(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v0

    .line 54
    .local v0, "qToS":Lcom/google/zxing/common/PerspectiveTransform;
    invoke-static/range {p8 .. p15}, Lcom/google/zxing/common/PerspectiveTransform;->squareToQuadrilateral(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v1

    .line 55
    .local v1, "sToQ":Lcom/google/zxing/common/PerspectiveTransform;
    invoke-virtual {v1, v0}, Lcom/google/zxing/common/PerspectiveTransform;->times(Lcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v2

    return-object v2
.end method

.method public static quadrilateralToSquare(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;
    .locals 1
    .param p0, "x0"    # F
    .param p1, "y0"    # F
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "x3"    # F
    .param p7, "y3"    # F

    .prologue
    .line 119
    invoke-static/range {p0 .. p7}, Lcom/google/zxing/common/PerspectiveTransform;->squareToQuadrilateral(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/zxing/common/PerspectiveTransform;->buildAdjoint()Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v0

    return-object v0
.end method

.method public static squareToQuadrilateral(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;
    .locals 17
    .param p0, "x0"    # F
    .param p1, "y0"    # F
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "x3"    # F
    .param p7, "y3"    # F

    .prologue
    .line 94
    sub-float v15, p7, p5

    .line 95
    .local v15, "dy2":F
    sub-float v0, p1, p3

    add-float v0, v0, p5

    sub-float v16, v0, p7

    .line 96
    .local v16, "dy3":F
    const/4 v0, 0x0

    cmpl-float v0, v15, v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    cmpl-float v0, v16, v0

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Lcom/google/zxing/common/PerspectiveTransform;

    sub-float v1, p2, p0

    sub-float v2, p4, p2

    .line 98
    sub-float v4, p3, p1

    sub-float v5, p5, p3

    .line 99
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    move/from16 v3, p0

    move/from16 v6, p1

    .line 97
    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/PerspectiveTransform;-><init>(FFFFFFFFF)V

    .line 108
    :goto_0
    return-object v0

    .line 101
    :cond_0
    sub-float v11, p2, p4

    .line 102
    .local v11, "dx1":F
    sub-float v12, p6, p4

    .line 103
    .local v12, "dx2":F
    sub-float v0, p0, p2

    add-float v0, v0, p4

    sub-float v13, v0, p6

    .line 104
    .local v13, "dx3":F
    sub-float v14, p3, p5

    .line 105
    .local v14, "dy1":F
    mul-float v0, v11, v15

    mul-float v1, v12, v14

    sub-float v10, v0, v1

    .line 106
    .local v10, "denominator":F
    mul-float v0, v13, v15

    mul-float v1, v12, v16

    sub-float/2addr v0, v1

    div-float v7, v0, v10

    .line 107
    .local v7, "a13":F
    mul-float v0, v11, v16

    mul-float v1, v13, v14

    sub-float/2addr v0, v1

    div-float v8, v0, v10

    .line 108
    .local v8, "a23":F
    new-instance v0, Lcom/google/zxing/common/PerspectiveTransform;

    sub-float v1, p2, p0

    mul-float v2, v7, p2

    add-float/2addr v1, v2

    sub-float v2, p6, p0

    mul-float v3, v8, p6

    add-float/2addr v2, v3

    .line 109
    sub-float v3, p3, p1

    mul-float v4, v7, p3

    add-float/2addr v4, v3

    sub-float v3, p7, p1

    mul-float v5, v8, p7

    add-float/2addr v5, v3

    .line 110
    const/high16 v9, 0x3f800000    # 1.0f

    move/from16 v3, p0

    move/from16 v6, p1

    .line 108
    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/PerspectiveTransform;-><init>(FFFFFFFFF)V

    goto :goto_0
.end method


# virtual methods
.method buildAdjoint()Lcom/google/zxing/common/PerspectiveTransform;
    .locals 12

    .prologue
    .line 124
    new-instance v0, Lcom/google/zxing/common/PerspectiveTransform;

    iget v1, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    .line 125
    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    .line 126
    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v4, v5

    sub-float/2addr v3, v4

    .line 127
    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v5, v6

    sub-float/2addr v4, v5

    .line 128
    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v5, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v6, v7

    sub-float/2addr v5, v6

    .line 129
    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v6, v7

    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v7, v8

    sub-float/2addr v6, v7

    .line 130
    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v7, v8

    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v8, v9

    sub-float/2addr v7, v8

    .line 131
    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v8, v9

    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v10, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v9, v10

    sub-float/2addr v8, v9

    .line 132
    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v10, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v9, v10

    iget v10, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v11, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v10, v11

    sub-float/2addr v9, v10

    .line 124
    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/PerspectiveTransform;-><init>(FFFFFFFFF)V

    return-object v0
.end method

.method times(Lcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/PerspectiveTransform;
    .locals 12
    .param p1, "other"    # Lcom/google/zxing/common/PerspectiveTransform;

    .prologue
    .line 136
    new-instance v0, Lcom/google/zxing/common/PerspectiveTransform;

    iget v1, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v2, p1, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    iget v3, p1, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    iget v3, p1, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    .line 137
    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v3, p1, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    iget v4, p1, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    iget v4, p1, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    .line 138
    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v4, p1, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    iget v5, p1, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    iget v5, p1, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    .line 139
    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v5, p1, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    iget v6, p1, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    iget v6, p1, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    .line 140
    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v6, p1, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v5, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    iget v7, p1, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v6, v7

    add-float/2addr v5, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    iget v7, p1, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v6, v7

    add-float/2addr v5, v6

    .line 141
    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v7, p1, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v6, v7

    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    iget v8, p1, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v7, v8

    add-float/2addr v6, v7

    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    iget v8, p1, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v7, v8

    add-float/2addr v6, v7

    .line 142
    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v8, p1, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    mul-float/2addr v7, v8

    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    iget v9, p1, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    mul-float/2addr v8, v9

    add-float/2addr v7, v8

    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    iget v9, p1, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    mul-float/2addr v8, v9

    add-float/2addr v7, v8

    .line 143
    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v9, p1, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v8, v9

    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    iget v10, p1, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v9, v10

    add-float/2addr v8, v9

    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    iget v10, p1, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v9, v10

    add-float/2addr v8, v9

    .line 144
    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v10, p1, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v9, v10

    iget v10, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    iget v11, p1, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v10, v11

    add-float/2addr v9, v10

    iget v10, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    iget v11, p1, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v10, v11

    add-float/2addr v9, v10

    .line 136
    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/PerspectiveTransform;-><init>(FFFFFFFFF)V

    return-object v0
.end method

.method public transformPoints([F)V
    .locals 18
    .param p1, "points"    # [F

    .prologue
    .line 59
    move-object/from16 v0, p1

    array-length v12, v0

    .line 60
    .local v12, "max":I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    .line 61
    .local v1, "a11":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    .line 62
    .local v2, "a12":F
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    .line 63
    .local v3, "a13":F
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    .line 64
    .local v4, "a21":F
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    .line 65
    .local v5, "a22":F
    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    .line 66
    .local v6, "a23":F
    move-object/from16 v0, p0

    iget v7, v0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    .line 67
    .local v7, "a31":F
    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    .line 68
    .local v8, "a32":F
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    .line 69
    .local v9, "a33":F
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    if-lt v11, v12, :cond_0

    .line 76
    return-void

    .line 70
    :cond_0
    aget v13, p1, v11

    .line 71
    .local v13, "x":F
    add-int/lit8 v15, v11, 0x1

    aget v14, p1, v15

    .line 72
    .local v14, "y":F
    mul-float v15, v3, v13

    mul-float v16, v6, v14

    add-float v15, v15, v16

    add-float v10, v15, v9

    .line 73
    .local v10, "denominator":F
    mul-float v15, v1, v13

    mul-float v16, v4, v14

    add-float v15, v15, v16

    add-float/2addr v15, v7

    div-float/2addr v15, v10

    aput v15, p1, v11

    .line 74
    add-int/lit8 v15, v11, 0x1

    mul-float v16, v2, v13

    mul-float v17, v5, v14

    add-float v16, v16, v17

    add-float v16, v16, v8

    div-float v16, v16, v10

    aput v16, p1, v15

    .line 69
    add-int/lit8 v11, v11, 0x2

    goto :goto_0
.end method

.method public transformPoints([F[F)V
    .locals 7
    .param p1, "xValues"    # [F
    .param p2, "yValues"    # [F

    .prologue
    .line 80
    array-length v2, p1

    .line 81
    .local v2, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v2, :cond_0

    .line 88
    return-void

    .line 82
    :cond_0
    aget v3, p1, v1

    .line 83
    .local v3, "x":F
    aget v4, p2, v1

    .line 84
    .local v4, "y":F
    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    mul-float/2addr v5, v3

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v6, v4

    add-float/2addr v5, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    add-float v0, v5, v6

    .line 85
    .local v0, "denominator":F
    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    mul-float/2addr v5, v3

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v6, v4

    add-float/2addr v5, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    add-float/2addr v5, v6

    div-float/2addr v5, v0

    aput v5, p1, v1

    .line 86
    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    mul-float/2addr v5, v3

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v6, v4

    add-float/2addr v5, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    add-float/2addr v5, v6

    div-float/2addr v5, v0

    aput v5, p2, v1

    .line 81
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
