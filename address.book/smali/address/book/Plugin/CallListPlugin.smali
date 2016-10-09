.class public Laddress/book/Plugin/CallListPlugin;
.super Lcom/phonegap/api/Plugin;
.source "CallListPlugin.java"


# static fields
.field private static final ACTION:Ljava/lang/String; = "list"

.field private static final CONTACT_ACTION:Ljava/lang/String; = "contact"

.field private static final SHOW_ACTION:Ljava/lang/String; = "show"

.field private static final TAG:Ljava/lang/String; = "CallListPlugin"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/phonegap/api/Plugin;-><init>()V

    return-void
.end method

.method private getCallListing(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 13
    .param p1, "period"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 117
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 119
    .local v7, "callLog":Lorg/json/JSONObject;
    const/16 v0, 0x8

    new-array v2, v0, [Ljava/lang/String;

    .line 120
    const-string v0, "date"

    aput-object v0, v2, v1

    .line 121
    const-string v0, "number"

    aput-object v0, v2, v3

    .line 122
    const-string v0, "type"

    aput-object v0, v2, v4

    .line 123
    const-string v0, "duration"

    aput-object v0, v2, v5

    .line 124
    const-string v0, "new"

    aput-object v0, v2, v12

    const/4 v0, 0x5

    .line 125
    const-string v1, "name"

    aput-object v1, v2, v0

    const/4 v0, 0x6

    .line 126
    const-string v1, "numbertype"

    aput-object v1, v2, v0

    const/4 v0, 0x7

    .line 127
    const-string v1, "numberlabel"

    aput-object v1, v2, v0

    .line 130
    .local v2, "strFields":[Ljava/lang/String;
    :try_start_0
    iget-object v0, p0, Laddress/book/Plugin/CallListPlugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v0}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 131
    sget-object v1, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    .line 133
    const-string v3, "date>?"

    .line 134
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    .line 135
    const-string v5, "date DESC"

    .line 130
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 137
    .local v8, "callLogCursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v6

    .line 139
    .local v6, "callCount":I
    if-lez v6, :cond_1

    .line 140
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 141
    .local v9, "callLogItem":Lorg/json/JSONObject;
    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10}, Lorg/json/JSONArray;-><init>()V

    .line 143
    .local v10, "callLogItems":Lorg/json/JSONArray;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 145
    :cond_0
    const-string v0, "date"

    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v9, v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 146
    const-string v0, "number"

    const/4 v1, 0x1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    const-string v0, "type"

    const/4 v1, 0x2

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 148
    const-string v0, "duration"

    const/4 v1, 0x3

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v9, v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 149
    const-string v0, "new"

    const/4 v1, 0x4

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 150
    const-string v0, "cachedName"

    const/4 v1, 0x5

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 151
    const-string v0, "cachedNumberType"

    const/4 v1, 0x6

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 153
    invoke-virtual {v10, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 154
    new-instance v9, Lorg/json/JSONObject;

    .end local v9    # "callLogItem":Lorg/json/JSONObject;
    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 155
    .restart local v9    # "callLogItem":Lorg/json/JSONObject;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    .line 144
    if-nez v0, :cond_0

    .line 156
    const-string v0, "rows"

    invoke-virtual {v7, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 159
    .end local v9    # "callLogItem":Lorg/json/JSONObject;
    .end local v10    # "callLogItems":Lorg/json/JSONArray;
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    .end local v6    # "callCount":I
    .end local v8    # "callLogCursor":Landroid/database/Cursor;
    :goto_0
    return-object v7

    .line 160
    :catch_0
    move-exception v11

    .line 161
    .local v11, "e":Ljava/lang/Exception;
    const-string v0, "CallLog_Plugin"

    .line 162
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, " ERROR : SQL to get cursor: ERROR "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 161
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getContactNameFromNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 185
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v4, "display_name"

    aput-object v4, v2, v0

    const/4 v0, 0x1

    const-string v4, "number"

    aput-object v4, v2, v0

    .line 188
    .local v2, "projection":[Ljava/lang/String;
    sget-object v0, Landroid/provider/Contacts$Phones;->CONTENT_FILTER_URL:Landroid/net/Uri;

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 191
    .local v1, "contactUri":Landroid/net/Uri;
    iget-object v0, p0, Laddress/book/Plugin/CallListPlugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v0}, Lcom/phonegap/api/PhonegapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 195
    .local v6, "c":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    const-string v0, "display_name"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 197
    .local v7, "name":Ljava/lang/String;
    invoke-interface {v6}, Landroid/database/Cursor;->deactivate()V

    .line 202
    .end local v7    # "name":Ljava/lang/String;
    :goto_0
    return-object v7

    :cond_0
    move-object v7, p1

    goto :goto_0
.end method

.method private viewContact(Ljava/lang/String;)V
    .locals 5
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 173
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.contacts.action.SHOW_OR_CREATE_CONTACT"

    .line 174
    const-string v2, "tel: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 173
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 175
    .local v0, "i":Landroid/content/Intent;
    iget-object v1, p0, Laddress/book/Plugin/CallListPlugin;->ctx:Lcom/phonegap/api/PhonegapActivity;

    invoke-virtual {v1, v0}, Lcom/phonegap/api/PhonegapActivity;->startActivity(Landroid/content/Intent;)V

    .line 176
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;
    .locals 12
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "data"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 46
    const-string v9, "CallListPlugin"

    const-string v10, "Plugin Called"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    const/4 v8, 0x0

    .line 48
    .local v8, "result":Lcom/phonegap/api/PluginResult;
    const-string v9, "list"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 50
    const/4 v5, -0x1

    .line 53
    .local v5, "limit":I
    const/4 v9, 0x0

    :try_start_0
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v9

    if-nez v9, :cond_0

    .line 54
    const/4 v9, 0x0

    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 55
    .local v3, "d":Ljava/lang/String;
    const-string v9, "CallListPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Time period is: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    const-string v9, "week"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 57
    const/4 v5, -0x7

    .line 65
    .end local v3    # "d":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 66
    .local v0, "calendar":Ljava/util/Calendar;
    new-instance v9, Ljava/util/Date;

    invoke-direct {v9}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v9}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 67
    const/4 v9, 0x6

    invoke-virtual {v0, v9, v5}, Ljava/util/Calendar;->add(II)V

    .line 68
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v6

    .line 69
    .local v6, "limitDate":Ljava/util/Date;
    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    .line 72
    .local v7, "limiter":Ljava/lang/String;
    invoke-direct {p0, v7}, Laddress/book/Plugin/CallListPlugin;->getCallListing(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 73
    .local v1, "callInfo":Lorg/json/JSONObject;
    const-string v9, "CallListPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Returning "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    new-instance v8, Lcom/phonegap/api/PluginResult;

    .end local v8    # "result":Lcom/phonegap/api/PluginResult;
    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v8, v9, v1}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 101
    .end local v0    # "calendar":Ljava/util/Calendar;
    .end local v1    # "callInfo":Lorg/json/JSONObject;
    .end local v5    # "limit":I
    .end local v6    # "limitDate":Ljava/util/Date;
    .end local v7    # "limiter":Ljava/lang/String;
    .restart local v8    # "result":Lcom/phonegap/api/PluginResult;
    :cond_1
    :goto_1
    return-object v8

    .line 58
    .restart local v3    # "d":Ljava/lang/String;
    .restart local v5    # "limit":I
    :cond_2
    const-string v9, "month"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 59
    const/16 v5, -0x1e

    goto :goto_0

    .line 60
    :cond_3
    const-string v9, "all"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v9

    if-eqz v9, :cond_0

    .line 61
    const v5, -0xf4240

    goto :goto_0

    .line 75
    .end local v3    # "d":Ljava/lang/String;
    .end local v8    # "result":Lcom/phonegap/api/PluginResult;
    :catch_0
    move-exception v4

    .line 76
    .local v4, "jsonEx":Lorg/json/JSONException;
    const-string v9, "CallListPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Got JSON Exception "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    new-instance v8, Lcom/phonegap/api/PluginResult;

    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->JSON_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v8, v9}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    .restart local v8    # "result":Lcom/phonegap/api/PluginResult;
    goto :goto_1

    .line 79
    .end local v4    # "jsonEx":Lorg/json/JSONException;
    .end local v5    # "limit":I
    :cond_4
    const-string v9, "show"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 81
    const/4 v9, 0x0

    :try_start_1
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v9

    if-nez v9, :cond_1

    .line 82
    const/4 v9, 0x0

    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Laddress/book/Plugin/CallListPlugin;->viewContact(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    goto :goto_1

    .line 84
    :catch_1
    move-exception v4

    .line 85
    .restart local v4    # "jsonEx":Lorg/json/JSONException;
    const-string v9, "CallListPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Got JSON Exception "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    new-instance v8, Lcom/phonegap/api/PluginResult;

    .end local v8    # "result":Lcom/phonegap/api/PluginResult;
    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->JSON_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v8, v9}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    .restart local v8    # "result":Lcom/phonegap/api/PluginResult;
    goto :goto_1

    .line 88
    .end local v4    # "jsonEx":Lorg/json/JSONException;
    :cond_5
    const-string v9, "contact"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 90
    const/4 v9, 0x0

    :try_start_2
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Laddress/book/Plugin/CallListPlugin;->getContactNameFromNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 91
    .local v2, "contactInfo":Ljava/lang/String;
    const-string v9, "CallListPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Returning "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    new-instance v8, Lcom/phonegap/api/PluginResult;

    .end local v8    # "result":Lcom/phonegap/api/PluginResult;
    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->OK:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v8, v9, v2}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .restart local v8    # "result":Lcom/phonegap/api/PluginResult;
    goto/16 :goto_1

    .line 93
    .end local v2    # "contactInfo":Ljava/lang/String;
    .end local v8    # "result":Lcom/phonegap/api/PluginResult;
    :catch_2
    move-exception v4

    .line 94
    .restart local v4    # "jsonEx":Lorg/json/JSONException;
    const-string v9, "CallListPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Got JSON Exception "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    new-instance v8, Lcom/phonegap/api/PluginResult;

    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->JSON_EXCEPTION:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v8, v9}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    .restart local v8    # "result":Lcom/phonegap/api/PluginResult;
    goto/16 :goto_1

    .line 98
    .end local v4    # "jsonEx":Lorg/json/JSONException;
    :cond_6
    new-instance v8, Lcom/phonegap/api/PluginResult;

    .end local v8    # "result":Lcom/phonegap/api/PluginResult;
    sget-object v9, Lcom/phonegap/api/PluginResult$Status;->INVALID_ACTION:Lcom/phonegap/api/PluginResult$Status;

    invoke-direct {v8, v9}, Lcom/phonegap/api/PluginResult;-><init>(Lcom/phonegap/api/PluginResult$Status;)V

    .line 99
    .restart local v8    # "result":Lcom/phonegap/api/PluginResult;
    const-string v9, "CallListPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Invalid action : "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " passed"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 87
    :catch_3
    move-exception v9

    goto/16 :goto_1
.end method
