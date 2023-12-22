import { LightningElement, api } from 'lwc';

export default class GameCharacter extends LightningElement {

    @api gameCharacterRecord;
    @api currentTurnRecord;

    get isActive() {
        if(this.gameCharacterRecord === null || this.currentTurnRecord === null) return false;
        return this.gameCharacterRecord.Id === this.currentTurnRecord.GameCharacter__c;
    }

}