.class Lcom/example/classtable/SetTime$2;
.super Ljava/lang/Object;
.source "SetTime.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/classtable/SetTime;->onStart()V
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
    iput-object p1, p0, Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/example/classtable/SetTime$2;)Lcom/example/classtable/SetTime;
    .locals 1
    .parameter

    .prologue
    .line 92
    iget-object v0, p0, Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    .line 96
    move-object v6, p1

    .line 97
    .local v6, currentBtn:Landroid/view/View;
    new-instance v0, Landroid/app/TimePickerDialog;

    iget-object v1, p0, Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;

    .line 98
    new-instance v2, Lcom/example/classtable/SetTime$2$1;

    invoke-direct {v2, p0, v6}, Lcom/example/classtable/SetTime$2$1;-><init>(Lcom/example/classtable/SetTime$2;Landroid/view/View;)V

    .line 107
    iget-object v3, p0, Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;

    #getter for: Lcom/example/classtable/SetTime;->hourList:Ljava/util/List;
    invoke-static {v3}, Lcom/example/classtable/SetTime;->access$0(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;

    #getter for: Lcom/example/classtable/SetTime;->idList:Ljava/util/List;
    invoke-static {v4}, Lcom/example/classtable/SetTime;->access$2(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v4

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;

    #getter for: Lcom/example/classtable/SetTime;->minuteList:Ljava/util/List;
    invoke-static {v4}, Lcom/example/classtable/SetTime;->access$1(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v4

    iget-object v5, p0, Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;

    #getter for: Lcom/example/classtable/SetTime;->idList:Ljava/util/List;
    invoke-static {v5}, Lcom/example/classtable/SetTime;->access$2(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v5

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 108
    const/4 v5, 0x1

    .line 97
    invoke-direct/range {v0 .. v5}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;Landroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 109
    .local v0, dialog:Landroid/app/TimePickerDialog;
    invoke-virtual {v0}, Landroid/app/TimePickerDialog;->show()V

    .line 110
    return-void
.end method
