import { LightningElement, api, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import ycdrpgMessage from '@salesforce/messageChannel/YCDRPG__c';

export default class GameQuestStepMonster extends LightningElement {

    @api gameQuestStepMonsterRecord;
    @api currentTurnRecord;

    @wire(MessageContext)
    messageContext;

    handleClick(event) {

        let data = {
            event : 'GAME_QUEST_STEP_MONSTER_CLICKED',
            recordId : this.gameQuestStepMonsterRecord.Id
        };

        publish(this.messageContext, ycdrpgMessage, { data: JSON.stringify(data) });
        
    }

}