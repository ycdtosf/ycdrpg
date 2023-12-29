import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class Character extends LightningElement {

    @api characterRecord;
    @api characterRecordId;
    @api isActive;

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

    renderedCallback() {
        if(!this.template.querySelector('.container')) return;
        if(this.isActive === true) this.template.querySelector('.container').classList.add('activeContainer');
        else { this.template.querySelector('.container').classList.remove('activeContainer'); }
    }

    /*
    async connectedCallback() {
        if(this.characterRecord === null && this.characterRecordId !== null) {
            this.characterRecord = await getRecord({ recordId : this.characterRecordId, fields : [ 'Id', 'Name' ]});
        }
    }
    */

}