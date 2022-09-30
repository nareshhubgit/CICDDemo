public with sharing class outstandingDues  {
    @AuraEnabled(cacheable= true)
    public static decimal displayDues(String CustomerId)
    {
        decimal avgActualFare = 0;
        AggregateResult[] groupedResults = [select SUM(ActualFare__c)sum  from Booking__C where Customer__c =:CustomerId and Paid__c=false];
        decimal amt= (decimal)groupedResults[0].get('sum');
        if(amt != NULL)
        {
            avgActualFare = amt;
        }
        
        system.debug(avgActualFare);
        return avgActualFare;
    }
    
}