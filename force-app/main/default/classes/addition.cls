public class addition {
    Public static Void Add(list<Addition__c> samlist){
        // <Addition__c> add =[Select id,First_Number__c,Second_Number__c,Result__c From Addition__c WHERE id IN:samlist];
        For(Addition__c a:samlist){
            if(a.Choose_one_of_the_picklist_value__c == 'Addition' ){
                
                a.Result__c = a.First_Number__c + a.Second_Number__c; 
            }
            if(a.Choose_one_of_the_picklist_value__c == 'Subtraction'){
                a.Result__c = a.First_Number__c - a.Second_Number__c; 
                
            }
            if(a.Choose_one_of_the_picklist_value__c == 'Multiplication'){
                a.Result__c = a.First_Number__c * a.Second_Number__c; 
                
            }
            if(a.Choose_one_of_the_picklist_value__c == 'Division'){
                a.Result__c = a.First_Number__c / a.Second_Number__c;
            }
        }
        
    }
    
}