trigger annualTrigger on Account (before update) {
    for(Account acc : Trigger.New) {
        if (acc.AnnualRevenue > 10000){
            acc.Rating = 'Hot';
       
        }
        if (acc.AnnualRevenue > 100 && acc.AnnualRevenue < 10000 ){
            acc.Rating = 'cold';
        }
        else if (acc.AnnualRevenue < 100){
            acc.Rating = 'Warm';
        }
            
    }
}