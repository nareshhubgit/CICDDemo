public class hubcmp {
    @AuraEnabled
    public static List<bookingWrapper> getBookingData(String hubId){
        List<bookingWrapper> wrapperList = new List<bookingWrapper>();
        try {
            Map<String, List<Booking__c>> bookingToBikeMap = new Map<String, List<Booking__c>>();
            List<Booking__c> bookings = [SELECT Id,Name, Bike__r.Name, BookingTime__c, DistanceKMs__c, Customer__r.Name, Customer__r.Status__c FROM Booking__c WHERE StartHub__c =: hubId];
            for(Booking__c b: bookings) {
                if(bookingToBikeMap.containsKey(b.Bike__r.Name)) {
                    List<Booking__c> tempBooking = bookingToBikeMap.get(b.Bike__r.Name);
                    tempBooking.add(b);
                    bookingToBikeMap.put(b.Bike__r.Name,tempBooking);
                } else {
                    bookingToBikeMap.put(b.Bike__r.Name, new List<Booking__c>{b});
                }
            }

            if(!bookingToBikeMap.isEmpty()) {
                for(String bike: bookingToBikeMap.keySet()) {
                    bookingWrapper wrap = new bookingWrapper();
                    wrap.BikeName = bike;
                    wrap.bookings = bookingToBikeMap.get(bike); 
                    wrapperList.add(wrap);
                }
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return wrapperList;
    }

    public class bookingWrapper {
        @AuraEnabled public String BikeName;
        @AuraEnabled public List<Booking__c> bookings;
    }

}