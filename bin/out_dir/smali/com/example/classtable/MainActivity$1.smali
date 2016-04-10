.class Lcom/example/classtable/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/classtable/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/classtable/MainActivity;


# direct methods
.method constructor <init>(Lcom/example/classtable/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/classtable/MainActivity$1;->this$0:Lcom/example/classtable/MainActivity;

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 51
    iget-object v0, p0, Lcom/example/classtable/MainActivity$1;->this$0:Lcom/example/classtable/MainActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/example/classtable/MainActivity$1;->this$0:Lcom/example/classtable/MainActivity;

    const-class v3, Lcom/example/classtable/Query;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/example/classtable/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 52
    return-void
.end method
