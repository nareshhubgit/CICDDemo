trigger accountTrigger on Account (after update) {
    List <opportunity> opp = [select Id, ownerId from opportunity where accountid = : Trigger.new];
    List <opportunity> upt = new List<opportunity>();
        for (Account a : Trigger.new)
        {
            if (a.OwnerId != Trigger.oldMap.get(a.Id).OwnerId)
            {
                for (opportunity opps : opp)
                {
                    if(opps.ownerId != Trigger.oldMap.get(a.Id).OwnerId)
                    opps.ownerId = Trigger.oldMap.get(a.Id).OwnerId;
                    upt.add(opps);
                } 
            }
        }
     update upt; 
}