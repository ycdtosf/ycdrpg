import { LightningElement, api } from 'lwc';

export default class GameCharacterRepeater extends LightningElement {

    @api gameCharacterRecords;
    @api currentTurnRecord;

}