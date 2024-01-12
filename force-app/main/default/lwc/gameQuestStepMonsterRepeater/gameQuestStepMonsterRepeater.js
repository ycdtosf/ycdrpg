import { LightningElement, api, wire } from 'lwc';
import { subscribe, unsubscribe, APPLICATION_SCOPE, MessageContext } from 'lightning/messageService';
import ycdrpgMessage from '@salesforce/messageChannel/YCDRPG__c';
import { FlowAttributeChangeEvent, FlowNavigationNextEvent } from 'lightning/flowSupport';

export default class GameQuestStepMonsterRepeater extends LightningElement {

    @api gameQuestStepMonsterRecords;
    @api currentTurnRecord;

    @api selectedGameQuestStepMonsterId;

    subscription = null;
    messageData = null;

    @wire(MessageContext)
    messageContext;

    subscribe() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                ycdrpgMessage,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

    unsubscribe() {
        unsubscribe(this.subscription);
        this.subscription = null;
    }

    handleMessage(message) {
        this.messageData = JSON.parse(message.data);
        if(this.messageData.event === 'GAME_QUEST_STEP_MONSTER_CLICKED') {
            // report selected monster to Flow...
            this.dispatchEvent(new FlowAttributeChangeEvent('selectedGameQuestStepMonsterId', this.messageData.recordId));
            this.dispatchEvent(new FlowNavigationNextEvent());
        }
    }

    connectedCallback() {
        this.subscribe();
    }

    disconnectedCallback() {
        this.unsubscribe();
    }

}