public class AnnualRevenueChange {
    public static void updateAnnualRevenue(){
       List<Account> acclist= [Select ID,Name,Rating,AnnualRevenue from Account];
        for (Account acc: acclist){
            if (acc.Rating == 'Hot'){
                acc.AnnualRevenue = 10000;
            }
            if (acc.Rating == 'Warm'){
                acc.AnnualRevenue = 5000;
            }
        }
        // make the changes for repo 
        // Welcome to salesforce
        update acclist;
     
    }

}