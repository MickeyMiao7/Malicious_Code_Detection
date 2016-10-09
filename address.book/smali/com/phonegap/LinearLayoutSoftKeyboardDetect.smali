.class public Lcom/phonegap/LinearLayoutSoftKeyboardDetect;
.super Landroid/widget/LinearLayout;
.source "LinearLayoutSoftKeyboardDetect.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SoftKeyboardDetect"


# instance fields
.field private app:Lcom/phonegap/DroidGap;

.field private oldHeight:I

.field private oldWidth:I

.field private screenHeight:I

.field private screenWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 33
    iput v0, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    .line 34
    iput v0, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->oldWidth:I

    .line 35
    iput v0, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->screenWidth:I

    .line 36
    iput v0, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->screenHeight:I

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->app:Lcom/phonegap/DroidGap;

    .line 41
    iput p2, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->screenWidth:I

    .line 42
    iput p3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->screenHeight:I

    .line 43
    check-cast p1, Lcom/phonegap/DroidGap;

    .end local p1    # "context":Landroid/content/Context;
    iput-object p1, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->app:Lcom/phonegap/DroidGap;

    .line 44
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 9
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 58
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 60
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "We are in our onMeasure method"

    invoke-static {v3, v4}, Lcom/phonegap/api/LOG;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 67
    .local v0, "height":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 68
    .local v2, "width":I
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Old Height = %d"

    new-array v5, v8, [Ljava/lang/Object;

    iget v6, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Lcom/phonegap/api/LOG;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 69
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Height = %d"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Lcom/phonegap/api/LOG;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 70
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Old Width = %d"

    new-array v5, v8, [Ljava/lang/Object;

    iget v6, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->oldWidth:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Lcom/phonegap/api/LOG;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 71
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Width = %d"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Lcom/phonegap/api/LOG;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 75
    iget v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    if-eqz v3, :cond_0

    iget v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    if-ne v3, v0, :cond_2

    .line 76
    :cond_0
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Ignore this event"

    invoke-static {v3, v4}, Lcom/phonegap/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    :cond_1
    :goto_0
    iput v0, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    .line 101
    iput v2, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->oldWidth:I

    .line 102
    return-void

    .line 79
    :cond_2
    iget v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->screenHeight:I

    if-ne v3, v2, :cond_3

    .line 81
    iget v1, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->screenHeight:I

    .line 82
    .local v1, "tmp_var":I
    iget v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->screenWidth:I

    iput v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->screenHeight:I

    .line 83
    iput v1, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->screenWidth:I

    .line 84
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Orientation Change"

    invoke-static {v3, v4}, Lcom/phonegap/api/LOG;->v(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 88
    .end local v1    # "tmp_var":I
    :cond_3
    iget v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    if-le v0, v3, :cond_4

    .line 89
    iget-object v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->app:Lcom/phonegap/DroidGap;

    if-eqz v3, :cond_1

    .line 90
    iget-object v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->app:Lcom/phonegap/DroidGap;

    const-string v4, "PhoneGap.fireDocumentEvent(\'hidekeyboard\');"

    invoke-virtual {v3, v4}, Lcom/phonegap/DroidGap;->sendJavascript(Ljava/lang/String;)V

    goto :goto_0

    .line 94
    :cond_4
    iget v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    if-ge v0, v3, :cond_1

    .line 95
    iget-object v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->app:Lcom/phonegap/DroidGap;

    if-eqz v3, :cond_1

    .line 96
    iget-object v3, p0, Lcom/phonegap/LinearLayoutSoftKeyboardDetect;->app:Lcom/phonegap/DroidGap;

    const-string v4, "PhoneGap.fireDocumentEvent(\'showkeyboard\');"

    invoke-virtual {v3, v4}, Lcom/phonegap/DroidGap;->sendJavascript(Ljava/lang/String;)V

    goto :goto_0
.end method
