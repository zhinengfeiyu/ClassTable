.class Lcom/example/classtable/Query$2;
.super Ljava/lang/Object;
.source "Query.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    iput-object p1, p0, Lcom/example/classtable/Query$2;->this$0:Lcom/example/classtable/Query;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 53
    iget-object v0, p0, Lcom/example/classtable/Query$2;->this$0:Lcom/example/classtable/Query;

    invoke-virtual {v0}, Lcom/example/classtable/Query;->finish()V

    .line 54
    return-void
.end method
