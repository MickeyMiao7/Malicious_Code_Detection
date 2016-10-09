.class public final Lcom/google/zxing/client/android/result/URIResultHandler;
.super Lcom/google/zxing/client/android/result/ResultHandler;
.source "URIResultHandler.java"


# static fields
.field private static final SECURE_PROTOCOLS:[Ljava/lang/String;

.field private static final buttons:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 34
    new-array v0, v3, [Ljava/lang/String;

    .line 35
    const-string v1, "otpauth:"

    aput-object v1, v0, v2

    .line 34
    sput-object v0, Lcom/google/zxing/client/android/result/URIResultHandler;->SECURE_PROTOCOLS:[Ljava/lang/String;

    .line 38
    const/4 v0, 0x4

    new-array v0, v0, [I

    .line 39
    sget v1, Lcom/google/zxing/client/android/R$string;->button_open_browser:I

    aput v1, v0, v2

    .line 40
    sget v1, Lcom/google/zxing/client/android/R$string;->button_share_by_email:I

    aput v1, v0, v3

    const/4 v1, 0x2

    .line 41
    sget v2, Lcom/google/zxing/client/android/R$string;->button_share_by_sms:I

    aput v2, v0, v1

    const/4 v1, 0x3

    .line 42
    sget v2, Lcom/google/zxing/client/android/R$string;->button_search_book_contents:I

    aput v2, v0, v1

    .line 38
    sput-object v0, Lcom/google/zxing/client/android/result/URIResultHandler;->buttons:[I

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "result"    # Lcom/google/zxing/client/result/ParsedResult;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/client/android/result/ResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    .line 47
    return-void
.end method


# virtual methods
.method public areContentsSecure()Z
    .locals 8

    .prologue
    const/4 v3, 0x0

    .line 89
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/URIResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/client/result/URIParsedResult;

    .line 90
    .local v2, "uriResult":Lcom/google/zxing/client/result/URIParsedResult;
    invoke-virtual {v2}, Lcom/google/zxing/client/result/URIParsedResult;->getURI()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 91
    .local v1, "uri":Ljava/lang/String;
    sget-object v5, Lcom/google/zxing/client/android/result/URIResultHandler;->SECURE_PROTOCOLS:[Ljava/lang/String;

    array-length v6, v5

    move v4, v3

    :goto_0
    if-lt v4, v6, :cond_0

    .line 96
    :goto_1
    return v3

    .line 91
    :cond_0
    aget-object v0, v5, v4

    .line 92
    .local v0, "secure":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 93
    const/4 v3, 0x1

    goto :goto_1

    .line 91
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public getButtonCount()I
    .locals 1

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/URIResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/client/result/URIParsedResult;

    invoke-virtual {v0}, Lcom/google/zxing/client/result/URIParsedResult;->getURI()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/client/android/LocaleManager;->isBookSearchUrl(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    sget-object v0, Lcom/google/zxing/client/android/result/URIResultHandler;->buttons:[I

    array-length v0, v0

    .line 54
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lcom/google/zxing/client/android/result/URIResultHandler;->buttons:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public getButtonText(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 59
    sget-object v0, Lcom/google/zxing/client/android/result/URIResultHandler;->buttons:[I

    aget v0, v0, p1

    return v0
.end method

.method public getDisplayTitle()I
    .locals 1

    .prologue
    .line 84
    sget v0, Lcom/google/zxing/client/android/R$string;->result_uri:I

    return v0
.end method

.method public handleButtonPress(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/URIResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/client/result/URIParsedResult;

    .line 65
    .local v1, "uriResult":Lcom/google/zxing/client/result/URIParsedResult;
    invoke-virtual {v1}, Lcom/google/zxing/client/result/URIParsedResult;->getURI()Ljava/lang/String;

    move-result-object v0

    .line 66
    .local v0, "uri":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 80
    :goto_0
    return-void

    .line 68
    :pswitch_0
    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/result/URIResultHandler;->openURL(Ljava/lang/String;)V

    goto :goto_0

    .line 71
    :pswitch_1
    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/result/URIResultHandler;->shareByEmail(Ljava/lang/String;)V

    goto :goto_0

    .line 74
    :pswitch_2
    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/result/URIResultHandler;->shareBySMS(Ljava/lang/String;)V

    goto :goto_0

    .line 77
    :pswitch_3
    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/result/URIResultHandler;->searchBookContents(Ljava/lang/String;)V

    goto :goto_0

    .line 66
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
