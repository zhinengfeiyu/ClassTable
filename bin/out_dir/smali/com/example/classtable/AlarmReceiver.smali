.class public Lcom/example/classtable/AlarmReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AlarmReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private changeMode(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 26
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 54
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v12

    .line 55
    .local v12, calendar:Ljava/util/Calendar;
    const/4 v4, 0x7

    invoke-virtual {v12, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v25, v4, -0x1

    .line 56
    .local v25, weekday:I
    const/16 v4, 0xb

    invoke-virtual {v12, v4}, Ljava/util/Calendar;->get(I)I

    move-result v16

    .line 57
    .local v16, hour:I
    const/16 v4, 0xc

    invoke-virtual {v12, v4}, Ljava/util/Calendar;->get(I)I

    move-result v17

    .line 58
    .local v17, minute:I
    new-instance v4, Lcom/example/classtable/DBHelper;

    move-object/from16 v0, p1

    invoke-direct {v4, v0}, Lcom/example/classtable/DBHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4}, Lcom/example/classtable/DBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 59
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    const/16 v20, -0x1

    .line 60
    .local v20, order:I
    const/16 v24, -0x1

    .line 61
    .local v24, react:I
    const-string v4, "TIME_TABLE"

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "HOUR*60+MINUTE>"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    mul-int/lit8 v7, v16, 0x3c

    add-int v7, v7, v17

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 62
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v10, "ID"

    .line 61
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 63
    .local v13, cursor:Landroid/database/Cursor;
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 64
    const-string v4, "ID"

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    div-int/lit8 v20, v4, 0x2

    .line 65
    const-string v4, "ID"

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    rem-int/lit8 v24, v4, 0x2

    .line 68
    :cond_0
    const/4 v4, 0x1

    move/from16 v0, v24

    if-eq v0, v4, :cond_1

    const/4 v4, -0x1

    move/from16 v0, v24

    if-ne v0, v4, :cond_2

    .line 69
    :cond_1
    invoke-direct/range {p0 .. p1}, Lcom/example/classtable/AlarmReceiver;->switchToNoisyMode(Landroid/content/Context;)V

    .line 87
    :goto_0
    const/4 v4, -0x1

    move/from16 v0, v20

    if-eq v0, v4, :cond_5

    .line 88
    const-string v4, "HOUR"

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    .line 89
    .local v18, nextHour:I
    const-string v4, "MINUTE"

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v19

    .line 90
    .local v19, nextMinute:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 91
    move/from16 v0, v18

    mul-int/lit16 v6, v0, 0xe10

    mul-int/lit8 v7, v19, 0x3c

    add-int/2addr v6, v7

    move/from16 v0, v16

    mul-int/lit16 v7, v0, 0xe10

    sub-int/2addr v6, v7

    mul-int/lit8 v7, v17, 0x3c

    sub-int/2addr v6, v7

    mul-int/lit16 v6, v6, 0x3e8

    int-to-long v6, v6

    .line 90
    add-long v21, v4, v6

    .line 103
    .local v21, passedMilliseconds:J
    :goto_1
    const/4 v4, 0x0

    .line 104
    new-instance v5, Landroid/content/Intent;

    const-class v6, Lcom/example/classtable/AlarmReceiver;

    move-object/from16 v0, p1

    invoke-direct {v5, v0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v6, 0x0

    .line 103
    move-object/from16 v0, p1

    invoke-static {v0, v4, v5, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v23

    .line 105
    .local v23, pendingIntent:Landroid/app/PendingIntent;
    const-string v4, "alarm"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/AlarmManager;

    .line 106
    .local v11, alarmManager:Landroid/app/AlarmManager;
    const/4 v4, 0x0

    move-wide/from16 v0, v21

    move-object/from16 v2, v23

    invoke-virtual {v11, v4, v0, v1, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 107
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 109
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 110
    return-void

    .line 72
    .end local v11           #alarmManager:Landroid/app/AlarmManager;
    .end local v18           #nextHour:I
    .end local v19           #nextMinute:I
    .end local v21           #passedMilliseconds:J
    .end local v23           #pendingIntent:Landroid/app/PendingIntent;
    :cond_2
    const-string v4, "TABLE_MAIN"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "DAY_ORDER"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "CLASSNAME"

    aput-object v7, v5, v6

    .line 73
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "DAY_ORDER="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    mul-int/lit8 v7, v25, 0xa

    add-int v7, v7, v20

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    .line 72
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 74
    .local v14, cursor2:Landroid/database/Cursor;
    invoke-interface {v14}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 75
    const/4 v4, 0x1

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 76
    invoke-direct/range {p0 .. p1}, Lcom/example/classtable/AlarmReceiver;->switchToNoisyMode(Landroid/content/Context;)V

    .line 83
    :goto_2
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 78
    :cond_3
    invoke-direct/range {p0 .. p1}, Lcom/example/classtable/AlarmReceiver;->switchToSilentMode(Landroid/content/Context;)V

    goto :goto_2

    .line 81
    :cond_4
    invoke-direct/range {p0 .. p1}, Lcom/example/classtable/AlarmReceiver;->switchToNoisyMode(Landroid/content/Context;)V

    goto :goto_2

    .line 94
    .end local v14           #cursor2:Landroid/database/Cursor;
    :cond_5
    const-string v4, "TIME_TABLE"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "HOUR"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "MINUTE"

    aput-object v7, v5, v6

    .line 95
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    .line 94
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 96
    .local v15, cursor3:Landroid/database/Cursor;
    invoke-interface {v15}, Landroid/database/Cursor;->moveToFirst()Z

    .line 97
    const/4 v4, 0x0

    invoke-interface {v15, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    .line 98
    .restart local v18       #nextHour:I
    const/4 v4, 0x1

    invoke-interface {v15, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v19

    .line 99
    .restart local v19       #nextMinute:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 100
    const v6, 0x15180

    move/from16 v0, v16

    mul-int/lit16 v7, v0, 0xe10

    sub-int/2addr v6, v7

    mul-int/lit8 v7, v17, 0x3c

    sub-int/2addr v6, v7

    move/from16 v0, v18

    mul-int/lit16 v7, v0, 0xe10

    add-int/2addr v6, v7

    mul-int/lit8 v7, v19, 0x3c

    add-int/2addr v6, v7

    mul-int/lit16 v6, v6, 0x3e8

    int-to-long v6, v6

    .line 99
    add-long v21, v4, v6

    .line 101
    .restart local v21       #passedMilliseconds:J
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    goto/16 :goto_1
.end method

.method private switchToNoisyMode(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const/4 v5, 0x3

    const/4 v2, 0x2

    const/4 v4, 0x0

    .line 113
    const-string v1, "audio"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 114
    .local v0, audioManager:Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    if-eq v1, v2, :cond_0

    .line 115
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->setRingerMode(I)V

    .line 117
    const-string v1, "auto_alarm"

    invoke-virtual {p1, v1, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "last_volume"

    .line 118
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    .line 117
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 116
    invoke-virtual {v0, v5, v1, v4}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 119
    const-string v1, "\u81ea\u52a8\u5207\u6362\u5230\u6b63\u5e38\u97f3\u91cf\u6a21\u5f0f"

    const/4 v2, 0x1

    invoke-static {p1, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 121
    :cond_0
    return-void
.end method

.method private switchToSilentMode(Landroid/content/Context;)V
    .locals 7
    .parameter "context"

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 124
    const-string v2, "audio"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 125
    .local v0, audioManager:Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v2

    if-eq v2, v5, :cond_0

    .line 126
    const-string v2, "auto_alarm"

    invoke-virtual {p1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 127
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "last_volume"

    invoke-virtual {v0, v6}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 128
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 129
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->setRingerMode(I)V

    .line 130
    const-string v2, "\u81ea\u52a8\u5207\u6362\u5230\u632f\u52a8\u6a21\u5f0f"

    invoke-static {p1, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 132
    .end local v1           #editor:Landroid/content/SharedPreferences$Editor;
    :cond_0
    invoke-virtual {v0, v6, v4, v4}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 133
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x0

    .line 21
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    .line 22
    invoke-direct {p0, p1, p2}, Lcom/example/classtable/AlarmReceiver;->changeMode(Landroid/content/Context;Landroid/content/Intent;)V

    .line 51
    :cond_0
    :goto_0
    return-void

    .line 26
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 27
    const-string v2, "auto_alarm"

    invoke-virtual {p1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "auto_alarm"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/example/classtable/AlarmReceiver;->changeMode(Landroid/content/Context;Landroid/content/Intent;)V

    .line 29
    const-string v2, "\u5f00\u673a\u542f\u52a8\u81ea\u52a8\u9759\u97f3"

    const/4 v3, 0x1

    invoke-static {p1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 33
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "newset"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 34
    const-string v2, "auto_alarm"

    invoke-virtual {p1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "auto_alarm"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_3

    .line 36
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/example/classtable/AlarmReceiver;

    invoke-direct {v2, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 35
    invoke-static {p1, v4, v2, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 37
    .local v1, pendingIntent:Landroid/app/PendingIntent;
    const-string v2, "alarm"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 38
    .local v0, alarmManager:Landroid/app/AlarmManager;
    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    goto :goto_0

    .line 43
    .end local v0           #alarmManager:Landroid/app/AlarmManager;
    .end local v1           #pendingIntent:Landroid/app/PendingIntent;
    :cond_3
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/example/classtable/AlarmReceiver;

    invoke-direct {v2, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 42
    invoke-static {p1, v4, v2, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 44
    .restart local v1       #pendingIntent:Landroid/app/PendingIntent;
    const-string v2, "alarm"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 45
    .restart local v0       #alarmManager:Landroid/app/AlarmManager;
    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/example/classtable/AlarmReceiver;->changeMode(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_0
.end method
