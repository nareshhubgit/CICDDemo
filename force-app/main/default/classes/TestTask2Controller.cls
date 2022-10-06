public with sharing class TestTask2Controller {
    @AuraEnabled(cacheable=true)
    public static integer getOustandingFees(String contactId){
        return 40;
    }
}