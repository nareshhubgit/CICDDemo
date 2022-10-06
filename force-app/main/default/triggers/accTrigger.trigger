trigger accTrigger on Account (after update, before update) {
    
    if (Trigger.IsBefore && Trigger.Isupdate) {
        accountClass.beforeOwnerChange(Trigger.new);
    }
    if (Trigger.Isafter && Trigger.Isupdate){
        accountClass.afterOwnerChange(Trigger.new);
        
    }
}