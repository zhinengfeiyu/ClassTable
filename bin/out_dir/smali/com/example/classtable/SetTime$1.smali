.class Lcom/example/classtable/SetTime$1;
.super Ljava/lang/Object;
.source "SetTime.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/classtable/SetTime;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/classtable/SetTime;


# direct methods
.method constructor <init>(Lcom/example/classtable/SetTime;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    const/16 v7, 0xa

    const/4 v6, 0x0

    .line 40
    const/4 v2, 0x1

    .local v2, i:I
    :goto_0
    if-lt v2, v7, :cond_0

    .line 46
    new-instance v3, Lcom/example/classtable/DBHelper;

    iget-object v4, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    invoke-direct {v3, v4}, Lcom/example/classtable/DBHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Lcom/example/classtable/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 47
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v2, 0x0

    :goto_1
    if-lt v2, v7, :cond_2

    .line 53
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 54
    iget-object v3, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    const-string v4, "\u65f6\u95f4\u8bbe\u7f6e\u6210\u529f\uff01"

    invoke-static {v3, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 55
    iget-object v3, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    new-instance v4, Landroid/content/Intent;

    const-string v5, "newset"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/example/classtable/SetTime;->sendBroadcast(Landroid/content/Intent;)V

    .line 56
    .end local v1           #db:Landroid/database/sqlite/SQLiteDatabase;
    :goto_2
    return-void

    .line 41
    :cond_0
    iget-object v3, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    #getter for: Lcom/example/classtable/SetTime;->hourList:Ljava/util/List;
    invoke-static {v3}, Lcom/example/classtable/SetTime;->access$0(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v3

    add-int/lit8 v4, v2, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v4, v3, 0x3c

    iget-object v3, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    #getter for: Lcom/example/classtable/SetTime;->minuteList:Ljava/util/List;
    invoke-static {v3}, Lcom/example/classtable/SetTime;->access$1(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v3

    add-int/lit8 v5, v2, -0x1

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v4, v3

    iget-object v3, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    #getter for: Lcom/example/classtable/SetTime;->hourList:Ljava/util/List;
    invoke-static {v3}, Lcom/example/classtable/SetTime;->access$0(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/lit8 v5, v3, 0x3c

    iget-object v3, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    #getter for: Lcom/example/classtable/SetTime;->minuteList:Ljava/util/List;
    invoke-static {v3}, Lcom/example/classtable/SetTime;->access$1(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v3, v5

    if-lt v4, v3, :cond_1

    .line 42
    iget-object v3, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    const-string v4, "\u65f6\u95f4\u8bbe\u7f6e\u6709\u8bef"

    invoke-static {v3, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_2

    .line 40
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 48
    .restart local v1       #db:Landroid/database/sqlite/SQLiteDatabase;
    :cond_2
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 49
    .local v0, args:Landroid/content/ContentValues;
    const-string v4, "HOUR"

    iget-object v3, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    #getter for: Lcom/example/classtable/SetTime;->hourList:Ljava/util/List;
    invoke-static {v3}, Lcom/example/classtable/SetTime;->access$0(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v0, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 50
    const-string v4, "MINUTE"

    iget-object v3, p0, Lcom/example/classtable/SetTime$1;->this$0:Lcom/example/classtable/SetTime;

    #getter for: Lcom/example/classtable/SetTime;->minuteList:Ljava/util/List;
    invoke-static {v3}, Lcom/example/classtable/SetTime;->access$1(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v0, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 51
    const-string v3, "TIME_TABLE"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ID="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 47
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1
.end method
