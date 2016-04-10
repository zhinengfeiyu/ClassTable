.class Lcom/example/classtable/SetTime$2$1;
.super Ljava/lang/Object;
.source "SetTime.java"

# interfaces
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/classtable/SetTime$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/example/classtable/SetTime$2;

.field private final synthetic val$currentBtn:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/example/classtable/SetTime$2;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/classtable/SetTime$2$1;->this$1:Lcom/example/classtable/SetTime$2;

    iput-object p2, p0, Lcom/example/classtable/SetTime$2$1;->val$currentBtn:Landroid/view/View;

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimeSet(Landroid/widget/TimePicker;II)V
    .locals 4
    .parameter "view"
    .parameter "hourOfDay"
    .parameter "minute"

    .prologue
    .line 102
    iget-object v1, p0, Lcom/example/classtable/SetTime$2$1;->this$1:Lcom/example/classtable/SetTime$2;

    #getter for: Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;
    invoke-static {v1}, Lcom/example/classtable/SetTime$2;->access$0(Lcom/example/classtable/SetTime$2;)Lcom/example/classtable/SetTime;

    move-result-object v1

    #getter for: Lcom/example/classtable/SetTime;->idList:Ljava/util/List;
    invoke-static {v1}, Lcom/example/classtable/SetTime;->access$2(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/example/classtable/SetTime$2$1;->val$currentBtn:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 103
    .local v0, index:I
    iget-object v1, p0, Lcom/example/classtable/SetTime$2$1;->this$1:Lcom/example/classtable/SetTime$2;

    #getter for: Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;
    invoke-static {v1}, Lcom/example/classtable/SetTime$2;->access$0(Lcom/example/classtable/SetTime$2;)Lcom/example/classtable/SetTime;

    move-result-object v1

    #getter for: Lcom/example/classtable/SetTime;->hourList:Ljava/util/List;
    invoke-static {v1}, Lcom/example/classtable/SetTime;->access$0(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 104
    iget-object v1, p0, Lcom/example/classtable/SetTime$2$1;->this$1:Lcom/example/classtable/SetTime$2;

    #getter for: Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;
    invoke-static {v1}, Lcom/example/classtable/SetTime$2;->access$0(Lcom/example/classtable/SetTime$2;)Lcom/example/classtable/SetTime;

    move-result-object v1

    #getter for: Lcom/example/classtable/SetTime;->minuteList:Ljava/util/List;
    invoke-static {v1}, Lcom/example/classtable/SetTime;->access$1(Lcom/example/classtable/SetTime;)Ljava/util/List;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 105
    iget-object v1, p0, Lcom/example/classtable/SetTime$2$1;->val$currentBtn:Landroid/view/View;

    check-cast v1, Landroid/widget/Button;

    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/example/classtable/SetTime$2$1;->this$1:Lcom/example/classtable/SetTime$2;

    #getter for: Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;
    invoke-static {v3}, Lcom/example/classtable/SetTime$2;->access$0(Lcom/example/classtable/SetTime$2;)Lcom/example/classtable/SetTime;

    move-result-object v3

    #calls: Lcom/example/classtable/SetTime;->formatNum(I)Ljava/lang/String;
    invoke-static {v3, p2}, Lcom/example/classtable/SetTime;->access$3(Lcom/example/classtable/SetTime;I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/example/classtable/SetTime$2$1;->this$1:Lcom/example/classtable/SetTime$2;

    #getter for: Lcom/example/classtable/SetTime$2;->this$0:Lcom/example/classtable/SetTime;
    invoke-static {v3}, Lcom/example/classtable/SetTime$2;->access$0(Lcom/example/classtable/SetTime$2;)Lcom/example/classtable/SetTime;

    move-result-object v3

    #calls: Lcom/example/classtable/SetTime;->formatNum(I)Ljava/lang/String;
    invoke-static {v3, p3}, Lcom/example/classtable/SetTime;->access$3(Lcom/example/classtable/SetTime;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 106
    return-void
.end method
