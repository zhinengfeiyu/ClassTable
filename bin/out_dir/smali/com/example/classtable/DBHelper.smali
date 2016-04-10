.class public Lcom/example/classtable/DBHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DBHelper.java"


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String; = "classtable.db"

.field private static final DATABASE_VERSION:I = 0x6

.field private static final TABLE_CREATE_DDL:Ljava/lang/String; = "CREATE TABLE TABLE_MAIN (DAY_ORDER INTEGER PRIMARY KEY,CLASSNAME TEXT,CLASSROOM TEXT,TEACHER TEXT);"

.field private static final TABLE_CREATE_DDL_2:Ljava/lang/String; = "CREATE TABLE TIME_TABLE (ID INTEGER PRIMARY KEY,HOUR INTEGER,MINUTE INTEGER);"


# instance fields
.field private final TABLE_DELETE_DDL:Ljava/lang/String;

.field private final TABLE_DELETE_DDL_2:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 20
    const-string v0, "classtable.db"

    const/4 v1, 0x0

    const/4 v2, 0x6

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 16
    const-string v0, "DROP TABLE IF EXISTS TABLE_MAIN;"

    iput-object v0, p0, Lcom/example/classtable/DBHelper;->TABLE_DELETE_DDL:Ljava/lang/String;

    .line 17
    const-string v0, "DROP TABLE IF EXISTS TIME_TABLE;"

    iput-object v0, p0, Lcom/example/classtable/DBHelper;->TABLE_DELETE_DDL_2:Ljava/lang/String;

    .line 21
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "arg0"

    .prologue
    .line 25
    const-string v0, "CREATE TABLE TABLE_MAIN (DAY_ORDER INTEGER PRIMARY KEY,CLASSNAME TEXT,CLASSROOM TEXT,TEACHER TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 26
    const-string v0, "CREATE TABLE TIME_TABLE (ID INTEGER PRIMARY KEY,HOUR INTEGER,MINUTE INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 27
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1
    .parameter "arg0"
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    .line 31
    const-string v0, "DROP TABLE IF EXISTS TABLE_MAIN;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 32
    const-string v0, "DROP TABLE IF EXISTS TIME_TABLE;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 33
    const-string v0, "CREATE TABLE TABLE_MAIN (DAY_ORDER INTEGER PRIMARY KEY,CLASSNAME TEXT,CLASSROOM TEXT,TEACHER TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 34
    const-string v0, "CREATE TABLE TIME_TABLE (ID INTEGER PRIMARY KEY,HOUR INTEGER,MINUTE INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 35
    return-void
.end method
