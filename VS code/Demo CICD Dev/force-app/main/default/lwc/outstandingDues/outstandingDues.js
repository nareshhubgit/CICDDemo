import { LightningElement,wire,api,track } from 'lwc';
import displayDues from '@salesforce/apex/outstandingDues.displayDues';

export default class outstandingDues extends LightningElement {
    @api recordId;
    @track Bookings;
    avgActualFare;
@wire(displayDues,{CustomerId:'$recordId'}) 
wiredBookings({error, data}){
    if(data){
        console.log('data '+data);
        this.avgActualFare = data;
        this.error = undefined;
    }else if(data == undefined)
    {
        console.log('data '+error);
        this.avgActualFare = 0;
    }
       
    }
}