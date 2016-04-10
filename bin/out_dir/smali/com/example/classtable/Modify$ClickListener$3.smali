.class Lcom/example/classtable/Modify$ClickListener$3;
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
    iput-object p1, p0, Lcom/example/classtable/Modify$ClickListener$3;->this$1:Lcom/example/classtable/Modify$ClickListener;

    iput-object p2, p0, Lcom/example/classtable/Modify$ClickListener$3;->val$editText:Landroid/widget/EditText;

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 164
    new-instance v3, Lcom/example/classtable/DBHelper;

    iget-object v4, p0, Lcom/example/classtable/Modify$ClickListener$3;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v4}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/example/classtable/DBHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Lcom/example/classtable/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 165
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 166
    .local v0, args:Landroid/content/ContentValues;
    const-string v3, "TEACHER"

    iget-object v4, p0, Lcom/example/classtable/Modify$ClickListener$3;->val$editText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    const-string v3, "DAY_ORDER=%1$d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 168
    iget-object v6, p0, Lcom/example/classtable/Modify$ClickListener$3;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v6}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v6

    #getter for: Lcom/example/classtable/Modify;->daySpinner:Landroid/widget/Spinner;
    invoke-static {v6}, Lcom/example/classtable/Modify;->access$1(Lcom/example/classtable/Modify;)Landroid/widget/Spinner;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    mul-int/lit8 v6, v6, 0xa

    iget-object v7, p0, Lcom/example/classtable/Modify$ClickListener$3;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v7}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v7

    #getter for: Lcom/example/classtable/Modify;->orderSpinner:Landroid/widget/Spinner;
    invoke-static {v7}, Lcom/example/classtable/Modify;->access$2(Lcom/example/classtable/Modify;)Landroid/widget/Spinner;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    .line 167
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 169
    .local v2, whereClause:Ljava/lang/String;
    const-string v3, "TABLE_MAIN"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v0, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 170
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 171
    iget-object v3, p0, Lcom/example/classtable/Modify$ClickListener$3;->this$1:Lcom/example/classtable/Modify$ClickListener;

    #getter for: Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;
    invoke-static {v3}, Lcom/example/classtable/Modify$ClickListener;->access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;

    move-result-object v3

    #getter for: Lcom/example/classtable/Modify;->teacherInfo:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/example/classtable/Modify;->access$7(Lcom/example/classtable/Modify;)Landroid/widget/TextView;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u6559\u5e08\uff1a\n\t"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/example/classtable/Modify$ClickListener$3;->val$editText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    return-void
.end method
