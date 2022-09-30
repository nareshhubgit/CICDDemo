import { LightningElement,api,track,wire } from 'lwc';
import searchBikes from '@salesforce/apex/quickBook.searchBikes';
const columns = [
    {label : 'Name',fieldName:'Name', type: 'text'},
    {label : 'Distance Covered',fieldName:'KMCovered__c',type: 'text'},
    {label : 'Vehicle Number',fieldName:'VehicleNo__c',type: 'text'},
    {type: 'button', typeAttributes: {  
        label: 'Select',  
        name: 'Select',  
        title: 'Select',  
        disabled: false,  
        value: 'Select',  
        iconPosition: 'left'  
    }},

];
export default class HubSearch extends LightningElement {
    searchKey = '';
    columns = columns;
    bikeList;
    displayList=false;
    handleKeyChange(event) {
        const searchKey = event.target.value;
            this.searchKey = searchKey;
    }
   
    handleOnClick()
    {
        searchBikes({searchKey: this.searchKey}).then((result)=>{
            this.bikeList = result;
        })
        .catch((error)=>{
            const evt = new ShowToastEvent({
                title: "Error",
                message: error,
                variant: "error",
            });
            this. this.displayList=true;
        })

    }
    handleClick(event){
        const rowvalue = JSON.parse(JSON.stringify(event.detail.row));
        const myCustomEvent = new CustomEvent('buttonclick',{
            detail:rowvalue
        });
        this.dispatchEvent(myCustomEvent);
    }
}