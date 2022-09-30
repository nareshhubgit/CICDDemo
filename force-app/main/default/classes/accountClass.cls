public with sharing class accountClass {
    public static Map <id,id> accmap = new map <id,id> ();
    public static void beforeOwnerChange ( List<account> accList) {
        List <opportunity> opp = [select Id,accountId, ownerId from opportunity where accountid = : accList];
        for (opportunity op : opp){
            accmap.put ( op.AccountId,op.ownerId);
            
        }
    }
    
    Public static void afterOwnerChange (List<account> accList){
        system.debug ('####' + accmap);        
        
        List <opportunity> opp = [select Id,accountId, ownerId from opportunity where accountid = : accList];
        List <opportunity> upt = new List<opportunity>();
        for (opportunity opps : opp){
            if (accmap.containsKey(opps.AccountId)){
                opps.ownerid = accmap.get(opps.AccountId);
                upt.add(opps);
            }
        }
        
        system.debug('****'+upt);
        update upt; 
    }
}