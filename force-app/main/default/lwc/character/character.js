import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class Character extends LightningElement {

    @api characterRecord;
    @api characterRecordId;

    @wire(getRecord, { recordId: '$characterRecordId', fields : [ 'Character__c.Id', 'Character__c.Name' ]})
    handleGetRecord({ error, data }) {
        if(error) {
            console.log(error);
        }
        else if(data) {
            this.characterRecord = {};
            for(var prop in data.fields) {
                this.characterRecord[prop] = data.fields[prop].value;
            }
            console.log(this.characterRecord);
        }
    }

    /*
    async connectedCallback() {
        if(this.characterRecord === null && this.characterRecordId !== null) {
            this.characterRecord = await getRecord({ recordId : this.characterRecordId, fields : [ 'Id', 'Name' ]});
        }
    }
    */

}