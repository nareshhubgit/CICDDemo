trigger addtrigger on Addition__c (before insert,before update) {
    addition.add(Trigger.new);
    
}