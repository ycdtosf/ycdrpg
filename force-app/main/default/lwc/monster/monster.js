import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class Monster extends LightningElement {

    @api monsterRecord;
    @api monsterRecordId;
    @api isActive;

    @wire(getRecord, { recordId: '$monsterRecordId', fields : [ 'Monster__c.Id', 'Monster__c.Name' ]})
    handleGetRecord({ error, data }) {
        if(error) {
            console.log(error);
        }
        else if(data) {
            this.monsterRecord = {};
            for(var prop in data.fields) {
                this.monsterRecord[prop] = data.fields[prop].value;
            }
            console.log(this.monsterRecord);
        }
    }

    renderedCallback() {
        if(!this.template.querySelector('.container')) return;
        if(this.isActive === true) this.template.querySelector('.container').classList.add('activeContainer');
        else { this.template.querySelector('.container').classList.remove('activeContainer'); }
    }

}