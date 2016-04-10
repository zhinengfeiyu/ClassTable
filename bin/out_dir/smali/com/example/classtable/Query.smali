.class public Lcom/example/classtable/Query;
.super Landroid/app/Activity;
.source "Query.java"


# instance fields
.field private back:Landroid/widget/Button;

.field private group:Landroid/widget/RadioGroup;

.field private final ids:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private info:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private list:Landroid/widget/ListView;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 23
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    const v2, 0x7f07000d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const v2, 0x7f07000e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 24
    const v2, 0x7f07000f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const v2, 0x7f070010

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const v2, 0x7f070011

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/classtable/Query;->ids:Ljava/util/List;

    .line 18
    return-void
.end method

.method static synthetic access$0(Lcom/example/classtable/Query;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcom/example/classtable/Query;->showInfo(I)V

    return-void
.end method

.method private showInfo(I)V
    .locals 13
    .parameter "checkedId"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v12, 0x2

    const/4 v3, 0x0

    .line 65
    new-instance v1, Lcom/example/classtable/DBHelper;

    invoke-direct {v1, p0}, Lcom/example/classtable/DBHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/example/classtable/DBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 66
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "TABLE_MAIN"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "DAY_ORDER"

    aput-object v4, v2, v5

    const-string v4, "CLASSNAME"

    aput-object v4, v2, v6

    const-string v4, "CLASSROOM"

    aput-object v4, v2, v12

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 69
    .local v10, cursor:Landroid/database/Cursor;
    :try_start_0
    iget-object v1, p0, Lcom/example/classtable/Query;->ids:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    add-int/lit8 v11, v1, 0x1

    .line 70
    .local v11, weekday:I
    iget-object v1, p0, Lcom/example/classtable/Query;->info:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 71
    add-int/lit8 v1, v11, -0x1

    mul-int/lit8 v1, v1, 0x5

    invoke-interface {v10, v1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 73
    :cond_0
    const/4 v1, 0x1

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 74
    .local v9, class_info:Ljava/lang/String;
    const-string v1, ""

    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\t\t"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 78
    :goto_0
    iget-object v1, p0, Lcom/example/classtable/Query;->info:Ljava/util/List;

    invoke-interface {v1, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    const/4 v1, 0x0

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    rem-int/lit8 v8, v1, 0xa
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .local v8, choice:I
    const/4 v1, 0x5

    if-ne v8, v1, :cond_3

    .line 86
    .end local v8           #choice:I
    .end local v9           #class_info:Ljava/lang/String;
    :cond_1
    :goto_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 88
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 89
    iget-object v1, p0, Lcom/example/classtable/Query;->list:Landroid/widget/ListView;

    new-instance v2, Landroid/widget/ArrayAdapter;

    const v3, 0x7f030001

    iget-object v4, p0, Lcom/example/classtable/Query;->info:Ljava/util/List;

    invoke-direct {v2, p0, v3, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 90
    return-void

    .line 77
    .restart local v9       #class_info:Ljava/lang/String;
    :cond_2
    :try_start_1
    const-string v9, "\u6ca1\u8bfe"

    goto :goto_0

    .line 81
    .restart local v8       #choice:I
    :cond_3
    if-eq v8, v12, :cond_4

    const/4 v1, 0x4

    if-ne v8, v1, :cond_5

    .line 82
    :cond_4
    iget-object v1, p0, Lcom/example/classtable/Query;->info:Ljava/util/List;

    const-string v2, ""

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    :cond_5
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 85
    .end local v8           #choice:I
    .end local v9           #class_info:Ljava/lang/String;
    .end local v11           #weekday:I
    :catchall_0
    move-exception v1

    .line 86
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 87
    throw v1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 29
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 30
    const v1, 0x7f030004

    invoke-virtual {p0, v1}, Lcom/example/classtable/Query;->setContentView(I)V

    .line 32
    const v1, 0x7f07000c

    invoke-virtual {p0, v1}, Lcom/example/classtable/Query;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RadioGroup;

    iput-object v1, p0, Lcom/example/classtable/Query;->group:Landroid/widget/RadioGroup;

    .line 33
    const v1, 0x7f070012

    invoke-virtual {p0, v1}, Lcom/example/classtable/Query;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/example/classtable/Query;->list:Landroid/widget/ListView;

    .line 34
    const v1, 0x7f07000b

    invoke-virtual {p0, v1}, Lcom/example/classtable/Query;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/example/classtable/Query;->back:Landroid/widget/Button;

    .line 35
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/example/classtable/Query;->info:Ljava/util/List;

    .line 37
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    const/4 v2, 0x7

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 38
    .local v0, today:I
    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    const/4 v1, 0x6

    if-gt v0, v1, :cond_0

    .line 39
    iget-object v2, p0, Lcom/example/classtable/Query;->group:Landroid/widget/RadioGroup;

    iget-object v1, p0, Lcom/example/classtable/Query;->ids:Ljava/util/List;

    add-int/lit8 v3, v0, -0x2

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 42
    :goto_0
    iget-object v1, p0, Lcom/example/classtable/Query;->group:Landroid/widget/RadioGroup;

    new-instance v2, Lcom/example/classtable/Query$1;

    invoke-direct {v2, p0}, Lcom/example/classtable/Query$1;-><init>(Lcom/example/classtable/Query;)V

    invoke-virtual {v1, v2}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 49
    iget-object v1, p0, Lcom/example/classtable/Query;->back:Landroid/widget/Button;

    new-instance v2, Lcom/example/classtable/Query$2;

    invoke-direct {v2, p0}, Lcom/example/classtable/Query$2;-><init>(Lcom/example/classtable/Query;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    return-void

    .line 41
    :cond_0
    iget-object v2, p0, Lcom/example/classtable/Query;->group:Landroid/widget/RadioGroup;

    iget-object v1, p0, Lcom/example/classtable/Query;->ids:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0
.end method

.method protected onStart()V
    .locals 1

    .prologue
    .line 60
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 61
    iget-object v0, p0, Lcom/example/classtable/Query;->group:Landroid/widget/RadioGroup;

    invoke-virtual {v0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/example/classtable/Query;->showInfo(I)V

    .line 62
    return-void
.end method
