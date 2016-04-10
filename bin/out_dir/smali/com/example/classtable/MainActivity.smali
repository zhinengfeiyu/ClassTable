.class public Lcom/example/classtable/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/classtable/MainActivity$TimechangeReceiver;
    }
.end annotation


# instance fields
.field private queryBtn:Landroid/widget/Button;

.field private receiver:Lcom/example/classtable/MainActivity$TimechangeReceiver;

.field private showText:Landroid/widget/TextView;

.field private timeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private toggleButton:Landroid/widget/ToggleButton;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/example/classtable/MainActivity;)Ljava/util/List;
    .locals 1
    .parameter

    .prologue
    .line 29
    iget-object v0, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1(Lcom/example/classtable/MainActivity;)Z
    .locals 1
    .parameter

    .prologue
    .line 102
    invoke-direct {p0}, Lcom/example/classtable/MainActivity;->getStandardTime()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2(Lcom/example/classtable/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 133
    invoke-direct {p0}, Lcom/example/classtable/MainActivity;->updateText()V

    return-void
.end method

.method static synthetic access$3(Lcom/example/classtable/MainActivity;)Landroid/widget/ToggleButton;
    .locals 1
    .parameter

    .prologue
    .line 30
    iget-object v0, p0, Lcom/example/classtable/MainActivity;->toggleButton:Landroid/widget/ToggleButton;

    return-object v0
.end method

.method private changeToText(I)Ljava/lang/String;
    .locals 4
    .parameter "minute"

    .prologue
    .line 202
    const/16 v2, 0x3c

    if-ge p1, v2, :cond_0

    .line 203
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\u5206\u949f"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 207
    :goto_0
    return-object v2

    .line 205
    :cond_0
    div-int/lit8 v0, p1, 0x3c

    .line 206
    .local v0, hour:I
    rem-int/lit8 v1, p1, 0x3c

    .line 207
    .local v1, min:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\u5c0f\u65f6"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\u5206\u949f"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private databaseEmpty()Z
    .locals 14

    .prologue
    const/4 v13, 0x5

    const/4 v5, 0x0

    const/4 v3, 0x0

    .line 212
    const/4 v12, 0x1

    .line 213
    .local v12, result:Z
    new-instance v1, Lcom/example/classtable/DBHelper;

    invoke-direct {v1, p0}, Lcom/example/classtable/DBHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/example/classtable/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 214
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "TABLE_MAIN"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "CLASSNAME"

    aput-object v4, v2, v5

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 217
    .local v9, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 219
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_2

    .line 220
    const/4 v12, 0x0

    .line 237
    :cond_1
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 239
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 240
    return v12

    .line 223
    :cond_2
    :try_start_1
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 225
    :cond_3
    const/4 v10, 0x1

    .local v10, i:I
    :goto_1
    if-gt v10, v13, :cond_1

    .line 226
    const/4 v11, 0x1

    .local v11, j:I
    :goto_2
    if-le v11, v13, :cond_4

    .line 225
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 227
    :cond_4
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 228
    .local v8, args:Landroid/content/ContentValues;
    const-string v1, "DAY_ORDER"

    mul-int/lit8 v2, v10, 0xa

    add-int/2addr v2, v11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 229
    const-string v1, "CLASSNAME"

    const-string v2, ""

    invoke-virtual {v8, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    const-string v1, "CLASSROOM"

    const-string v2, ""

    invoke-virtual {v8, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    const-string v1, "TEACHER"

    const-string v2, ""

    invoke-virtual {v8, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    const-string v1, "TABLE_MAIN"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v8}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 226
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 236
    .end local v8           #args:Landroid/content/ContentValues;
    .end local v10           #i:I
    .end local v11           #j:I
    :catchall_0
    move-exception v1

    .line 237
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 238
    throw v1
.end method

.method private getStandardTime()Z
    .locals 10

    .prologue
    const/4 v6, 0x1

    const/4 v3, 0x0

    const/4 v5, 0x0

    .line 104
    new-instance v1, Lcom/example/classtable/DBHelper;

    invoke-direct {v1, p0}, Lcom/example/classtable/DBHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/example/classtable/DBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 106
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "TIME_TABLE"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "HOUR"

    aput-object v4, v2, v5

    const-string v4, "MINUTE"

    aput-object v4, v2, v6

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 109
    .local v8, cursor:Landroid/database/Cursor;
    const/4 v1, 0x1

    :try_start_0
    invoke-interface {v8, v1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 110
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    if-nez v1, :cond_0

    .line 111
    const-string v1, "\u8bf7\u5148\u8bbe\u7f6e\u4e0a\u8bfe\u65f6\u95f4"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    const/4 v9, 0x0

    .line 127
    .local v9, result:Z
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 129
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 130
    return v9

    .line 115
    .end local v9           #result:Z
    :cond_0
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 116
    iget-object v1, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 118
    :cond_1
    iget-object v1, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x3c

    const/4 v3, 0x1

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 120
    const/4 v9, 0x1

    .line 122
    .restart local v9       #result:Z
    goto :goto_0

    .line 123
    .end local v9           #result:Z
    :cond_2
    const-string v1, "\u8bf7\u5148\u8bbe\u7f6e\u4e0a\u8bfe\u65f6\u95f4"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    const/4 v9, 0x0

    .line 126
    .restart local v9       #result:Z
    goto :goto_0

    .end local v9           #result:Z
    :catchall_0
    move-exception v1

    .line 127
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 128
    throw v1
.end method

.method private showInfo(II)Z
    .locals 11
    .parameter "weekday"
    .parameter "order"

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v3, 0x0

    .line 174
    new-instance v1, Lcom/example/classtable/DBHelper;

    invoke-direct {v1, p0}, Lcom/example/classtable/DBHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/example/classtable/DBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 175
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "TABLE_MAIN"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "DAY_ORDER"

    aput-object v4, v2, v9

    .line 176
    const-string v4, "CLASSNAME"

    aput-object v4, v2, v10

    const-string v4, "CLASSROOM"

    aput-object v4, v2, v5

    const-string v4, "TEACHER"

    aput-object v4, v2, v6

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    .line 175
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 179
    .local v8, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 181
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    mul-int/lit8 v2, p1, 0xa

    add-int/2addr v2, p2

    if-ne v1, v2, :cond_2

    .line 182
    const/4 v1, 0x1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 183
    iget-object v1, p0, Lcom/example/classtable/MainActivity;->showText:Landroid/widget/TextView;

    const-string v2, "\u4e0b\u9762\u6ca1\u8bfe"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    move v1, v9

    .line 198
    :goto_0
    return v1

    .line 186
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/example/classtable/MainActivity;->showText:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u8bfe\u7a0b\uff1a\n\t"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 187
    const-string v3, "\n\n\u6559\u5ba4\uff1a\n\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x2

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 188
    const-string v3, "\n\n\u6559\u5e08\uff1a\n\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 186
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 195
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    move v1, v10

    .line 189
    goto :goto_0

    .line 192
    :cond_2
    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    .line 195
    :cond_3
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 197
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    move v1, v9

    .line 198
    goto :goto_0

    .line 194
    :catchall_0
    move-exception v1

    .line 195
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 196
    throw v1
.end method

.method private updateText()V
    .locals 10

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 134
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 135
    .local v0, calendar:Ljava/util/Calendar;
    const/4 v6, 0x7

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    add-int/lit8 v5, v6, -0x1

    .line 136
    .local v5, weekday:I
    const/16 v6, 0xb

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 137
    .local v1, hour:I
    const/16 v6, 0xc

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 138
    .local v3, minute:I
    mul-int/lit8 v6, v1, 0x3c

    add-int v4, v6, v3

    .line 140
    .local v4, totalMinute:I
    const/4 v6, 0x6

    if-eq v5, v6, :cond_0

    if-nez v5, :cond_2

    .line 141
    :cond_0
    iget-object v6, p0, Lcom/example/classtable/MainActivity;->showText:Landroid/widget/TextView;

    const-string v7, "\u4eca\u5929\u662f\u5468\u672b\uff0c\u6ca1\u8bfe"

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    :cond_1
    :goto_0
    return-void

    .line 142
    :cond_2
    iget-object v6, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v4, v6, :cond_3

    .line 143
    invoke-direct {p0, v5, v8}, Lcom/example/classtable/MainActivity;->showInfo(II)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 144
    iget-object v7, p0, Lcom/example/classtable/MainActivity;->showText:Landroid/widget/TextView;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v6, "\n\n\u8ddd\u79bb\u4e0a\u8bfe\u65f6\u95f4\u8fd8\u6709\uff1a\n       "

    invoke-direct {v8, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    iget-object v6, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-direct {p0, v6}, Lcom/example/classtable/MainActivity;->changeToText(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 144
    invoke-virtual {v7, v6}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 146
    :cond_3
    iget-object v6, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    const/16 v7, 0x9

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-le v4, v6, :cond_4

    .line 147
    iget-object v6, p0, Lcom/example/classtable/MainActivity;->showText:Landroid/widget/TextView;

    const-string v7, "\u63a5\u4e0b\u53bb\u6ca1\u8bfe\u4e86\n\u4e00\u5929\u7684\u8bfe\u5df2\u7ecf\u7ed3\u675f"

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 149
    :cond_4
    const/4 v2, 0x1

    .local v2, i:I
    :goto_1
    const/16 v6, 0xa

    if-ge v2, v6, :cond_1

    .line 150
    iget-object v6, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    add-int/lit8 v7, v2, -0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-lt v4, v6, :cond_6

    .line 151
    iget-object v6, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-gt v4, v6, :cond_6

    .line 152
    rem-int/lit8 v6, v2, 0x2

    if-ne v6, v8, :cond_5

    .line 153
    div-int/lit8 v6, v2, 0x2

    add-int/lit8 v6, v6, 0x1

    invoke-direct {p0, v5, v6}, Lcom/example/classtable/MainActivity;->showInfo(II)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 154
    iget-object v7, p0, Lcom/example/classtable/MainActivity;->showText:Landroid/widget/TextView;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v6, "\n\n\u76ee\u524d\u6b63\u5728\u4e0a\u8bfe\u4e2d\n\n\u8ddd\u79bb\u4e0b\u8bfe\u8fd8\u6709\uff1a\n      "

    invoke-direct {v8, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    iget-object v6, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 156
    sub-int/2addr v6, v4

    .line 155
    invoke-direct {p0, v6}, Lcom/example/classtable/MainActivity;->changeToText(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 154
    invoke-virtual {v7, v6}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 160
    :cond_5
    div-int/lit8 v6, v2, 0x2

    add-int/lit8 v6, v6, 0x1

    invoke-direct {p0, v5, v6}, Lcom/example/classtable/MainActivity;->showInfo(II)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 161
    iget-object v7, p0, Lcom/example/classtable/MainActivity;->showText:Landroid/widget/TextView;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v6, "\n\n\u8ddd\u79bb\u4e0a\u8bfe\u65f6\u95f4\u8fd8\u6709\uff1a\n       "

    invoke-direct {v8, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 162
    iget-object v6, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 163
    sub-int/2addr v6, v4

    .line 162
    invoke-direct {p0, v6}, Lcom/example/classtable/MainActivity;->changeToText(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 161
    invoke-virtual {v7, v6}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 149
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 34
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/example/classtable/MainActivity;->setContentView(I)V

    .line 37
    invoke-direct {p0}, Lcom/example/classtable/MainActivity;->databaseEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    const-string v0, "\u8bf7\u5148\u8bbe\u7f6e\u8bfe\u7a0b\u8868"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 40
    :cond_0
    const/high16 v0, 0x7f07

    invoke-virtual {p0, v0}, Lcom/example/classtable/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/example/classtable/MainActivity;->showText:Landroid/widget/TextView;

    .line 41
    const v0, 0x7f070001

    invoke-virtual {p0, v0}, Lcom/example/classtable/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/example/classtable/MainActivity;->queryBtn:Landroid/widget/Button;

    .line 42
    const v0, 0x7f070002

    invoke-virtual {p0, v0}, Lcom/example/classtable/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lcom/example/classtable/MainActivity;->toggleButton:Landroid/widget/ToggleButton;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    .line 45
    new-instance v0, Lcom/example/classtable/MainActivity$TimechangeReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/example/classtable/MainActivity$TimechangeReceiver;-><init>(Lcom/example/classtable/MainActivity;Lcom/example/classtable/MainActivity$TimechangeReceiver;)V

    iput-object v0, p0, Lcom/example/classtable/MainActivity;->receiver:Lcom/example/classtable/MainActivity$TimechangeReceiver;

    .line 46
    iget-object v0, p0, Lcom/example/classtable/MainActivity;->receiver:Lcom/example/classtable/MainActivity$TimechangeReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.TIME_TICK"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/example/classtable/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 48
    iget-object v0, p0, Lcom/example/classtable/MainActivity;->queryBtn:Landroid/widget/Button;

    new-instance v1, Lcom/example/classtable/MainActivity$1;

    invoke-direct {v1, p0}, Lcom/example/classtable/MainActivity$1;-><init>(Lcom/example/classtable/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    iget-object v0, p0, Lcom/example/classtable/MainActivity;->toggleButton:Landroid/widget/ToggleButton;

    new-instance v1, Lcom/example/classtable/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/example/classtable/MainActivity$2;-><init>(Lcom/example/classtable/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/example/classtable/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f06

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 86
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 79
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 80
    iget-object v0, p0, Lcom/example/classtable/MainActivity;->receiver:Lcom/example/classtable/MainActivity$TimechangeReceiver;

    invoke-virtual {p0, v0}, Lcom/example/classtable/MainActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 81
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "item"

    .prologue
    const/4 v0, 0x1

    .line 91
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 99
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 93
    :pswitch_0
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/example/classtable/Modify;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/example/classtable/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 96
    :pswitch_1
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/example/classtable/SetTime;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/example/classtable/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 91
    nop

    :pswitch_data_0
    .packed-switch 0x7f07001e
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onStart()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 69
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 70
    invoke-direct {p0}, Lcom/example/classtable/MainActivity;->getStandardTime()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    invoke-direct {p0}, Lcom/example/classtable/MainActivity;->updateText()V

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/example/classtable/MainActivity;->toggleButton:Landroid/widget/ToggleButton;

    const-string v1, "auto_alarm"

    invoke-virtual {p0, v1, v3}, Lcom/example/classtable/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "auto_alarm"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 73
    iget-object v0, p0, Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 74
    iget-object v0, p0, Lcom/example/classtable/MainActivity;->toggleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, v3}, Landroid/widget/ToggleButton;->setClickable(Z)V

    .line 75
    :cond_1
    return-void
.end method
