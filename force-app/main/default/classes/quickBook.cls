public class quickBook {
    @AuraEnabled(cacheable=true)
    public static List<Bike__c> searchBikes(String searchKey){
        String key = '%' + searchKey + '%';
            return [
                SELECT Id, Name, KMCovered__c,VehicleNo__c
                FROM Bike__c
                WHERE Hub__r.Name LIKE :key 
        
                LIMIT 10
            ];
            
    }
}