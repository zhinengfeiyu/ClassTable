.class Lcom/example/classtable/Modify$ClickListener;
.super Ljava/lang/Object;
.source "Modify.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/classtable/Modify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/classtable/Modify;


# direct methods
.method private constructor <init>(Lcom/example/classtable/Modify;)V
    .locals 0
    .parameter

    .prologue
    .line 104
    iput-object p1, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/example/classtable/Modify;Lcom/example/classtable/Modify$ClickListener;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lcom/example/classtable/Modify$ClickListener;-><init>(Lcom/example/classtable/Modify;)V

    return-void
.end method

.method static synthetic access$1(Lcom/example/classtable/Modify$ClickListener;)Lcom/example/classtable/Modify;
    .locals 1
    .parameter

    .prologue
    .line 104
    iget-object v0, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    const/4 v4, 0x0

    .line 107
    iget-object v1, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    #getter for: Lcom/example/classtable/Modify;->changeClassname:Landroid/widget/Button;
    invoke-static {v1}, Lcom/example/classtable/Modify;->access$0(Lcom/example/classtable/Modify;)Landroid/widget/Button;

    move-result-object v1

    if-ne p1, v1, :cond_1

    .line 108
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 109
    .local v0, editText:Landroid/widget/EditText;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 110
    const-string v2, "\u8bf7\u8f93\u5165\u8bfe\u7a0b\u540d\u79f0"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 111
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 112
    const-string v2, "\u786e\u8ba4"

    new-instance v3, Lcom/example/classtable/Modify$ClickListener$1;

    invoke-direct {v3, p0, v0}, Lcom/example/classtable/Modify$ClickListener$1;-><init>(Lcom/example/classtable/Modify$ClickListener;Landroid/widget/EditText;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 129
    const-string v2, "\u53d6\u6d88"

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 130
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 131
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 182
    .end local v0           #editText:Landroid/widget/EditText;
    :cond_0
    :goto_0
    return-void

    .line 133
    :cond_1
    iget-object v1, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    #getter for: Lcom/example/classtable/Modify;->changeClassroom:Landroid/widget/Button;
    invoke-static {v1}, Lcom/example/classtable/Modify;->access$4(Lcom/example/classtable/Modify;)Landroid/widget/Button;

    move-result-object v1

    if-ne p1, v1, :cond_2

    .line 134
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 135
    .restart local v0       #editText:Landroid/widget/EditText;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 136
    const-string v2, "\u8bf7\u8f93\u5165\u6559\u5ba4\u4f4d\u7f6e"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 137
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 138
    const-string v2, "\u786e\u8ba4"

    new-instance v3, Lcom/example/classtable/Modify$ClickListener$2;

    invoke-direct {v3, p0, v0}, Lcom/example/classtable/Modify$ClickListener$2;-><init>(Lcom/example/classtable/Modify$ClickListener;Landroid/widget/EditText;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 152
    const-string v2, "\u53d6\u6d88"

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 153
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 154
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 156
    .end local v0           #editText:Landroid/widget/EditText;
    :cond_2
    iget-object v1, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    #getter for: Lcom/example/classtable/Modify;->changeTeacher:Landroid/widget/Button;
    invoke-static {v1}, Lcom/example/classtable/Modify;->access$6(Lcom/example/classtable/Modify;)Landroid/widget/Button;

    move-result-object v1

    if-ne p1, v1, :cond_3

    .line 157
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 158
    .restart local v0       #editText:Landroid/widget/EditText;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 159
    const-string v2, "\u8bf7\u8f93\u5165\u6559\u5e08\u59d3\u540d"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 160
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 161
    const-string v2, "\u786e\u8ba4"

    new-instance v3, Lcom/example/classtable/Modify$ClickListener$3;

    invoke-direct {v3, p0, v0}, Lcom/example/classtable/Modify$ClickListener$3;-><init>(Lcom/example/classtable/Modify$ClickListener;Landroid/widget/EditText;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 175
    const-string v2, "\u53d6\u6d88"

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 176
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 177
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 179
    .end local v0           #editText:Landroid/widget/EditText;
    :cond_3
    iget-object v1, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    #getter for: Lcom/example/classtable/Modify;->back:Landroid/widget/Button;
    invoke-static {v1}, Lcom/example/classtable/Modify;->access$8(Lcom/example/classtable/Modify;)Landroid/widget/Button;

    move-result-object v1

    if-ne p1, v1, :cond_0

    .line 180
    iget-object v1, p0, Lcom/example/classtable/Modify$ClickListener;->this$0:Lcom/example/classtable/Modify;

    invoke-virtual {v1}, Lcom/example/classtable/Modify;->finish()V

    goto :goto_0
.end method
