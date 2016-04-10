.class Lcom/example/classtable/MainActivity$TimechangeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/classtable/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TimechangeReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/classtable/MainActivity;


# direct methods
.method private constructor <init>(Lcom/example/classtable/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 243
    iput-object p1, p0, Lcom/example/classtable/MainActivity$TimechangeReceiver;->this$0:Lcom/example/classtable/MainActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/example/classtable/MainActivity;Lcom/example/classtable/MainActivity$TimechangeReceiver;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 243
    invoke-direct {p0, p1}, Lcom/example/classtable/MainActivity$TimechangeReceiver;-><init>(Lcom/example/classtable/MainActivity;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 246
    iget-object v0, p0, Lcom/example/classtable/MainActivity$TimechangeReceiver;->this$0:Lcom/example/classtable/MainActivity;

    #getter for: Lcom/example/classtable/MainActivity;->timeList:Ljava/util/List;
    invoke-static {v0}, Lcom/example/classtable/MainActivity;->access$0(Lcom/example/classtable/MainActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 247
    iget-object v0, p0, Lcom/example/classtable/MainActivity$TimechangeReceiver;->this$0:Lcom/example/classtable/MainActivity;

    #calls: Lcom/example/classtable/MainActivity;->getStandardTime()Z
    invoke-static {v0}, Lcom/example/classtable/MainActivity;->access$1(Lcom/example/classtable/MainActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lcom/example/classtable/MainActivity$TimechangeReceiver;->this$0:Lcom/example/classtable/MainActivity;

    #calls: Lcom/example/classtable/MainActivity;->updateText()V
    invoke-static {v0}, Lcom/example/classtable/MainActivity;->access$2(Lcom/example/classtable/MainActivity;)V

    .line 251
    :cond_0
    :goto_0
    return-void

    .line 250
    :cond_1
    iget-object v0, p0, Lcom/example/classtable/MainActivity$TimechangeReceiver;->this$0:Lcom/example/classtable/MainActivity;

    #calls: Lcom/example/classtable/MainActivity;->updateText()V
    invoke-static {v0}, Lcom/example/classtable/MainActivity;->access$2(Lcom/example/classtable/MainActivity;)V

    goto :goto_0
.end method
