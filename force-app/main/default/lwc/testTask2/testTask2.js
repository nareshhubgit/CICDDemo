import { LightningElement, track, wire ,api } from 'lwc';
import getOustandingFees from 
'@salesforce/apex/TestTask2Controller.getOustandingFees';
export default class TestTask2 extends LightningElement {
    @api recordId;
    outStandingFee;
    @wire(getOustandingFees, {contactId: '$recordId'})
    WireContactRecords({error, data}){
        if(data){
            this.outStandingFee = data;
            this.error = undefined;
        }else{
            this.error = error;
            this.outStandingFee = undefined;
        }
    }
}