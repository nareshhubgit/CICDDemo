public class UpdateOpportunityType {
    public static void updateType(){
        List<Opportunity> opplist= [Select ID,Name,Type,StageName from Opportunity];
        for (Opportunity opp: opplist){
            if (opp.StageName == 'Closed Lost'){
                opp.Type = 'Existing Customer - Upgrade';
            }
            if (opp.StageName == 'Closed Won'){
                opp.Type = 'New Customer';
            }
        }
        // Retriving from org pull request
        update opplist;
     
    }

}