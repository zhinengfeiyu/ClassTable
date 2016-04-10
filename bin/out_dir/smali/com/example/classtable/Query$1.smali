.class Lcom/example/classtable/Query$1;
.super Ljava/lang/Object;
.source "Query.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/classtable/Query;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/classtable/Query;


# direct methods
.method constructor <init>(Lcom/example/classtable/Query;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/classtable/Query$1;->this$0:Lcom/example/classtable/Query;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 1
    .parameter "group"
    .parameter "checkedId"

    .prologue
    .line 45
    iget-object v0, p0, Lcom/example/classtable/Query$1;->this$0:Lcom/example/classtable/Query;

    #calls: Lcom/example/classtable/Query;->showInfo(I)V
    invoke-static {v0, p2}, Lcom/example/classtable/Query;->access$0(Lcom/example/classtable/Query;I)V

    .line 46
    return-void
.end method
