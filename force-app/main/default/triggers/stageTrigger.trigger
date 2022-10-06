trigger stageTrigger on Opportunity (before insert,before update) {
    
    if(Trigger.isBefore &&(Trigger.isInsert||Trigger.isUpdate)){
        
    
    for (Opportunity opp : trigger.new){
        if (opp.account.AnnualRevenue > 10000){
            opp.StageName = 'Prospecting'; 
        }
    }
    
}
}