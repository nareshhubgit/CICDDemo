public class bookings {
	@AuraEnabled
    public static List<Booking__c> getBike(Id hubId){
        return [Select Name,BookingTime__c,DistanceKMs__c,Bike__r.Name,Customer__r.Name from Booking__c where Bike__r.Hub__c=:hubId];
        //return [Select Name,(Select Name,BookingTime_c,DistanceKMs_c,Customer__r.Name from Bookings_r) from Bikec where Bikec.Hub_c=:hubId];
    }
}