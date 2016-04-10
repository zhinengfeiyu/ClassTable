.class Lcom/example/classtable/Modify$ClickListener$1;
.super Ljava/lang/Object;
.source "Modify.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/classtable/Modify$ClickListener;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/example/classtable/Modify$ClickListener;

.field private final synthetic val$editText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/example/classtable/Modify$ClickListener;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/classtable/Modify$ClickListener$1;->this$1:Lcom/example/classtable/Modify$ClickListener;

    iput-object p2, p0, Lcom/example/classtable/Modify$ClickListener$1;->val$editText:Landroid/widget/EditText;

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v7, 0x0

    .line 115
    new-instance v3, Lcom/example/classtable/DBHelper;

    iget-object v4, p0, Lcom/example/classtable/Modify$ClickListener$1;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v4}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/example/classtable/DBHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Lcom/example/classtable/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 116
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 117
    .local v0, args:Landroid/content/ContentValues;
    const-string v3, "CLASSNAME"

    iget-object v4, p0, Lcom/example/classtable/Modify$ClickListener$1;->val$editText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    const-string v3, "DAY_ORDER=%1$d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    .line 119
    iget-object v5, p0, Lcom/example/classtable/Modify$ClickListener$1;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v5}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v5

    #getter for: Lcom/example/classtable/Modify;->daySpinner:Landroid/widget/Spinner;
    invoke-static {v5}, Lcom/example/classtable/Modify;->access$1(Lcom/example/classtable/Modify;)Landroid/widget/Spinner;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    mul-int/lit8 v5, v5, 0xa

    iget-object v6, p0, Lcom/example/classtable/Modify$ClickListener$1;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v6}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v6

    #getter for: Lcom/example/classtable/Modify;->orderSpinner:Landroid/widget/Spinner;
    invoke-static {v6}, Lcom/example/classtable/Modify;->access$2(Lcom/example/classtable/Modify;)Landroid/widget/Spinner;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    .line 118
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 120
    .local v2, whereClause:Ljava/lang/String;
    const-string v3, "TABLE_MAIN"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v0, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 121
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 122
    iget-object v3, p0, Lcom/example/classtable/Modify$ClickListener$1;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v3}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v3

    #getter for: Lcom/example/classtable/Modify;->classnameInfo:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/example/classtable/Modify;->access$3(Lcom/example/classtable/Modify;)Landroid/widget/TextView;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u8bfe\u7a0b\uff1a\n\t"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/example/classtable/Modify$ClickListener$1;->val$editText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    iget-object v3, p0, Lcom/example/classtable/Modify$ClickListener$1;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v3}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v3

    const-string v4, "auto_alarm"

    invoke-virtual {v3, v4, v7}, Lcom/example/classtable/Modify;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "auto_alarm"

    invoke-interface {v3, v4, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 124
    iget-object v3, p0, Lcom/example/classtable/Modify$ClickListener$1;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v3}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v3

    new-instance v4, Landroid/content/Intent;

    const-string v5, "newset"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/example/classtable/Modify;->sendBroadcast(Landroid/content/Intent;)V

    .line 125
    iget-object v3, p0, Lcom/example/classtable/Modify$ClickListener$1;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v3}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v3

    const-string v4, "\u81ea\u52a8\u9759\u97f3\u91cd\u7f6e"

    invoke-static {v3, v4, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 127
    :cond_0
    return-void
.end method
