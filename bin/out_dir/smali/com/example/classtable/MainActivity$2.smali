.class Lcom/example/classtable/MainActivity$2;
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
    iput-object p1, p0, Lcom/example/classtable/MainActivity$2;->this$0:Lcom/example/classtable/MainActivity;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    const/4 v3, 0x0

    .line 58
    iget-object v1, p0, Lcom/example/classtable/MainActivity$2;->this$0:Lcom/example/classtable/MainActivity;

    const-string v2, "auto_alarm"

    invoke-virtual {v1, v2, v3}, Lcom/example/classtable/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 59
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v1, "auto_alarm"

    iget-object v2, p0, Lcom/example/classtable/MainActivity$2;->this$0:Lcom/example/classtable/MainActivity;

    #getter for: Lcom/example/classtable/MainActivity;->toggleButton:Landroid/widget/ToggleButton;
    invoke-static {v2}, Lcom/example/classtable/MainActivity;->access$3(Lcom/example/classtable/MainActivity;)Landroid/widget/ToggleButton;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 60
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 61
    iget-object v1, p0, Lcom/example/classtable/MainActivity$2;->this$0:Lcom/example/classtable/MainActivity;

    const-string v2, "\u81ea\u52a8\u9759\u97f3\u8bbe\u7f6e\u5df2\u88ab\u4fee\u6539"

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 62
    iget-object v1, p0, Lcom/example/classtable/MainActivity$2;->this$0:Lcom/example/classtable/MainActivity;

    new-instance v2, Landroid/content/Intent;

    const-string v3, "newset"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/example/classtable/MainActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 63
    return-void
.end method
