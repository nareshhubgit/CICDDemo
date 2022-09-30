public class bikes  {
    @AuraEnabled(cacheable=true)
    public static Integer getActiveBikesCount(){
        Integer inactiveCount = [select COUNT() From Hub__c WHERE Active__c = true ];
        return inactiveCount;
    }
    @AuraEnabled(cacheable=true)
    public static Integer getBookedBikesCount(){
        return [select COUNT() From Bike__c WHERE IsBooked__c = true];
    }
    @AuraEnabled(cacheable=true)
    public static Integer getDueToServiceBikesCount(){
        return [select COUNT() From Bike__c WHERE DueToService__c = true];
    }
}