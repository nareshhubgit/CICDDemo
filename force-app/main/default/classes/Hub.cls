public class Hub {
	@AuraEnabled
    public static List<Hub__c> getHubs(){
        return [Select Id,Name,Active__c,Rating__c,State__c,style_class__c from Hub__c];
    }
}