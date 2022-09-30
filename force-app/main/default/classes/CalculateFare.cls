public class CalculateFare {
    public void updateFare(List<Booking__c> listBooking){
        Double fare;
        Double Distance;
        //List<Booking__c> listBooking2 = new List<Booking__c>();
        List<Booking__c> listBooking2  = [SELECT Id,EndHub__c,StartHub__c,StartLocation__c,EndLocation__c,ActualFare__c,ExpectedFare__c,DistanceKMs__c FROM Booking__c where Id=: listBooking];
        List<Hub__c> listHub = new List<Hub__c>();
        
        system.debug(listBooking);
        for(Booking__c b: listBooking2){
            Location StartLoc = b.StartLocation__c ;
            Location EndLoc = b.EndLocation__c;
            system.debug('Start LOc::'+StartLoc);
            system.debug('End LOc::'+EndLoc);
            if(StartLoc != null && EndLoc != null){
                Distance = StartLoc.getDistance(EndLoc,'km');
                system.debug('Distance::'+Distance);
            }
            if(Distance > 200)
                b.addError('Booking Above 200 KM not allowed');
            else{
                if(Distance>15)
                    fare = 15 + 2*(Distance-15);
                else
                    fare = Distance;
                Integer Speed = 50;
                Double timeTakenCost = (Distance/Speed) * 60 * 1.7;
                Double ExpectedFare = fare + timeTakenCost;
                Double ActualFare = ExpectedFare + 0.18*ExpectedFare;
                List<Booking__c> updateFare = [Select ExpectedFare__c,ActualFare__c,DistanceKMs__c from Booking__c];
                for(Booking__c book:listBooking){
                    
                    book.ExpectedFare__c = ExpectedFare;
                    book.ActualFare__c = ActualFare;
                    book.DistanceKMs__c = Distance;
                    system.debug('Expected Fare'+b.ExpectedFare__c +'::::'+b.ActualFare__c);
                    
                }
            }
            
        }
        
        
    }
    
}