import { LightningElement,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import BOOKING_OBJECT from '@salesforce/schema/Booking__c';
import CUSTOMER_FIELD from '@salesforce/schema/Booking__c.Customer__c';
import BIKE_FIELD from '@salesforce/schema/Booking__c.Bike__c';
import START_HUB_FIELD from '@salesforce/schema/Booking__c.StartHub__c';
import END_HUB_FIELD from '@salesforce/schema/Booking__c.EndHub__c';
import DISTANCE_FIELD from '@salesforce/schema/Booking__c.DistanceKMs__c'

export default class BookingManager extends LightningElement {
    booking = BOOKING_OBJECT;
    customer = CUSTOMER_FIELD;
    bike = BIKE_FIELD;
    starthub = START_HUB_FIELD;
    endhub = END_HUB_FIELD;
    distance = DISTANCE_FIELD;
    rowvalue = ''
    @track rowvalue;
    handleOnBooking(){
        console.log('success');
        const event = new ShowToastEvent({
            title: 'Success!!',
            message: 'Creation of Booking is successfull',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }
    handleOnError(){
        const event = new ShowToastEvent({
            title: 'Failed!!',
            message: 'Creation of Booking is failed',
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }

    handleEvent(event){
        this.rowvalue = JSON.parse(JSON.stringify(event.detail));
        this.rowvalue = this.rowvalue['Id'];
    }

    
}