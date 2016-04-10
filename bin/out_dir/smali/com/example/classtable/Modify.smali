.class public Lcom/example/classtable/Modify;
.super Landroid/app/Activity;
.source "Modify.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/classtable/Modify$ClickListener;
    }
.end annotation


# instance fields
.field private back:Landroid/widget/Button;

.field private changeClassname:Landroid/widget/Button;

.field private changeClassroom:Landroid/widget/Button;

.field private changeTeacher:Landroid/widget/Button;

.field private classnameInfo:Landroid/widget/TextView;

.field private classroomInfo:Landroid/widget/TextView;

.field private daySpinner:Landroid/widget/Spinner;

.field private orderSpinner:Landroid/widget/Spinner;

.field private teacherInfo:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/example/classtable/Modify;)Landroid/widget/Button;
    .locals 1
    .parameter

    .prologue
    .line 27
    iget-object v0, p0, Lcom/example/classtable/Modify;->changeClassname:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$1(Lcom/example/classtable/Modify;)Landroid/widget/Spinner;
    .locals 1
    .parameter

    .prologue
    .line 22
    iget-object v0, p0, Lcom/example/classtable/Modify;->daySpinner:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$2(Lcom/example/classtable/Modify;)Landroid/widget/Spinner;
    .locals 1
    .parameter

    .prologue
    .line 23
    iget-object v0, p0, Lcom/example/classtable/Modify;->orderSpinner:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$3(Lcom/example/classtable/Modify;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 24
    iget-object v0, p0, Lcom/example/classtable/Modify;->classnameInfo:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4(Lcom/example/classtable/Modify;)Landroid/widget/Button;
    .locals 1
    .parameter

    .prologue
    .line 28
    iget-object v0, p0, Lcom/example/classtable/Modify;->changeClassroom:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$5(Lcom/example/classtable/Modify;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 25
    iget-object v0, p0, Lcom/example/classtable/Modify;->classroomInfo:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$6(Lcom/example/classtable/Modify;)Landroid/widget/Button;
    .locals 1
    .parameter

    .prologue
    .line 29
    iget-object v0, p0, Lcom/example/classtable/Modify;->changeTeacher:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$7(Lcom/example/classtable/Modify;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 26
    iget-object v0, p0, Lcom/example/classtable/Modify;->teacherInfo:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$8(Lcom/example/classtable/Modify;)Landroid/widget/Button;
    .locals 1
    .parameter

    .prologue
    .line 30
    iget-object v0, p0, Lcom/example/classtable/Modify;->back:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$9(Lcom/example/classtable/Modify;II)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lcom/example/classtable/Modify;->showInfo(II)V

    return-void
.end method

.method private showInfo(II)V
    .locals 11
    .parameter "weekday"
    .parameter "order"

    .prologue
    const/4 v10, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v3, 0x0

    .line 82
    mul-int/lit8 v1, p1, 0xa

    add-int v9, v1, p2

    .line 83
    .local v9, day_order:I
    new-instance v1, Lcom/example/classtable/DBHelper;

    invoke-direct {v1, p0}, Lcom/example/classtable/DBHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/example/classtable/DBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 84
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "TABLE_MAIN"

    .line 85
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "DAY_ORDER"

    aput-object v4, v2, v5

    const-string v4, "CLASSNAME"

    aput-object v4, v2, v6

    const-string v4, "CLASSROOM"

    aput-object v4, v2, v7

    const-string v4, "TEACHER"

    aput-object v4, v2, v10

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    .line 84
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 88
    .local v8, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 90
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    if-ne v1, v9, :cond_2

    .line 91
    iget-object v1, p0, Lcom/example/classtable/Modify;->classnameInfo:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u8bfe\u7a0b\uff1a\n\t"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    iget-object v1, p0, Lcom/example/classtable/Modify;->classroomInfo:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u6559\u5ba4\uff1a\n\t"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x2

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    iget-object v1, p0, Lcom/example/classtable/Modify;->teacherInfo:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u6559\u5e08\uff1a\n\t"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    :cond_1
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 101
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 102
    return-void

    .line 96
    :cond_2
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 98
    :catchall_0
    move-exception v1

    .line 99
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 100
    throw v1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x0

    const/4 v2, 0x0

    const/4 v6, 0x1

    .line 34
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    const v0, 0x7f030003

    invoke-virtual {p0, v0}, Lcom/example/classtable/Modify;->setContentView(I)V

    .line 37
    const v0, 0x7f070003

    invoke-virtual {p0, v0}, Lcom/example/classtable/Modify;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/example/classtable/Modify;->daySpinner:Landroid/widget/Spinner;

    .line 38
    const v0, 0x7f070004

    invoke-virtual {p0, v0}, Lcom/example/classtable/Modify;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/example/classtable/Modify;->orderSpinner:Landroid/widget/Spinner;

    .line 39
    const v0, 0x7f070005

    invoke-virtual {p0, v0}, Lcom/example/classtable/Modify;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/example/classtable/Modify;->classnameInfo:Landroid/widget/TextView;

    .line 40
    const v0, 0x7f070007

    invoke-virtual {p0, v0}, Lcom/example/classtable/Modify;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/example/classtable/Modify;->classroomInfo:Landroid/widget/TextView;

    .line 41
    const v0, 0x7f070009

    invoke-virtual {p0, v0}, Lcom/example/classtable/Modify;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/example/classtable/Modify;->teacherInfo:Landroid/widget/TextView;

    .line 42
    const v0, 0x7f070006

    invoke-virtual {p0, v0}, Lcom/example/classtable/Modify;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/example/classtable/Modify;->changeClassname:Landroid/widget/Button;

    .line 43
    const v0, 0x7f070008

    invoke-virtual {p0, v0}, Lcom/example/classtable/Modify;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/example/classtable/Modify;->changeClassroom:Landroid/widget/Button;

    .line 44
    const v0, 0x7f07000a

    invoke-virtual {p0, v0}, Lcom/example/classtable/Modify;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/example/classtable/Modify;->changeTeacher:Landroid/widget/Button;

    .line 45
    const v0, 0x7f07000b

    invoke-virtual {p0, v0}, Lcom/example/classtable/Modify;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/example/classtable/Modify;->back:Landroid/widget/Button;

    .line 47
    iget-object v0, p0, Lcom/example/classtable/Modify;->changeClassname:Landroid/widget/Button;

    new-instance v1, Lcom/example/classtable/Modify$ClickListener;

    invoke-direct {v1, p0, v2}, Lcom/example/classtable/Modify$ClickListener;-><init>(Lcom/example/classtable/Modify;Lcom/example/classtable/Modify$ClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    iget-object v0, p0, Lcom/example/classtable/Modify;->changeClassroom:Landroid/widget/Button;

    new-instance v1, Lcom/example/classtable/Modify$ClickListener;

    invoke-direct {v1, p0, v2}, Lcom/example/classtable/Modify$ClickListener;-><init>(Lcom/example/classtable/Modify;Lcom/example/classtable/Modify$ClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    iget-object v0, p0, Lcom/example/classtable/Modify;->changeTeacher:Landroid/widget/Button;

    new-instance v1, Lcom/example/classtable/Modify$ClickListener;

    invoke-direct {v1, p0, v2}, Lcom/example/classtable/Modify$ClickListener;-><init>(Lcom/example/classtable/Modify;Lcom/example/classtable/Modify$ClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    iget-object v0, p0, Lcom/example/classtable/Modify;->back:Landroid/widget/Button;

    new-instance v1, Lcom/example/classtable/Modify$ClickListener;

    invoke-direct {v1, p0, v2}, Lcom/example/classtable/Modify$ClickListener;-><init>(Lcom/example/classtable/Modify;Lcom/example/classtable/Modify$ClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    iget-object v0, p0, Lcom/example/classtable/Modify;->daySpinner:Landroid/widget/Spinner;

    new-instance v1, Landroid/widget/ArrayAdapter;

    const v2, 0x1090008

    .line 53
    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "\u661f\u671f\u4e00"

    aput-object v4, v3, v7

    const-string v4, "\u661f\u671f\u4e8c"

    aput-object v4, v3, v6

    const-string v4, "\u661f\u671f\u4e09"

    aput-object v4, v3, v8

    const-string v4, "\u661f\u671f\u56db"

    aput-object v4, v3, v9

    const/4 v4, 0x4

    const-string v5, "\u661f\u671f\u4e94"

    aput-object v5, v3, v4

    invoke-direct {v1, p0, v2, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 54
    iget-object v0, p0, Lcom/example/classtable/Modify;->orderSpinner:Landroid/widget/Spinner;

    new-instance v1, Landroid/widget/ArrayAdapter;

    const v2, 0x1090008

    .line 55
    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "\u7b2c1\uff0c2\u8282"

    aput-object v4, v3, v7

    const-string v4, "\u7b2c3\uff0c4\u8282"

    aput-object v4, v3, v6

    const-string v4, "\u7b2c5\uff0c6\u8282"

    aput-object v4, v3, v8

    const-string v4, "\u7b2c7\uff0c8\u8282"

    aput-object v4, v3, v9

    const/4 v4, 0x4

    const-string v5, "\u7b2c9\uff0c10\u8282"

    aput-object v5, v3, v4

    invoke-direct {v1, p0, v2, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 56
    invoke-direct {p0, v6, v6}, Lcom/example/classtable/Modify;->showInfo(II)V

    .line 58
    iget-object v0, p0, Lcom/example/classtable/Modify;->daySpinner:Landroid/widget/Spinner;

    new-instance v1, Lcom/example/classtable/Modify$1;

    invoke-direct {v1, p0}, Lcom/example/classtable/Modify$1;-><init>(Lcom/example/classtable/Modify;)V

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 69
    iget-object v0, p0, Lcom/example/classtable/Modify;->orderSpinner:Landroid/widget/Spinner;

    new-instance v1, Lcom/example/classtable/Modify$2;

    invoke-direct {v1, p0}, Lcom/example/classtable/Modify$2;-><init>(Lcom/example/classtable/Modify;)V

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 79
    return-void
.end method
