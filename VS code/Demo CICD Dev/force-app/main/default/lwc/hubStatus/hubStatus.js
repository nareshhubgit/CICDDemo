import { LightningElement,api,wire,track } from 'lwc';
import getActiveBikesCount from '@salesforce/apex/bikes.getActiveBikesCount';
import getBookedBikesCount from '@salesforce/apex/bikes.getBookedBikesCount';
import getDueToServiceBikesCount from '@salesforce/apex/bikes.getDueToServiceBikesCount';
export default class bikes extends LightningElement {
    inActive =0;
    serviceCount =0;
    dueCount  = 0;
    connectedCallback()
    {
        getActiveBikesCount().then((result)=>{
            this.inActive = result;
        })
        .catch((error)=>{
            const evt = new ShowToastEvent({
                title: "Error",
                message: error,
                variant: "error",
            });
            this.dispatchEvent(evt);
        })


        getActiveBikesCount().then((result2)=>{
            this.serviceCount = result2;
        })
        .catch((error)=>{
            const evt = new ShowToastEvent({
                title: "Error",
                message: error,
                variant: "error",
            });
            this.dispatchEvent(evt);
        })

        getDueToServiceBikesCount().then((result2)=>{
            this.dueCount = result2;
        })
        .catch((error)=>{
            const evt = new ShowToastEvent({
                title: "Error",
                message: error,
                variant: "error",
            });
            this.dispatchEvent(evt);
        })


}
}