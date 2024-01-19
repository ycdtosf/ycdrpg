@isTest
public class GetCollectionItemByProbabilityInvTests {
    
    @isTest
    public static void test() {

        List<QuestStep__c> questSteps = new List<QuestStep__c>();
        questSteps.add(new QuestStep__c(Probability__c = 75)); // volcano
        questSteps.add(new QuestStep__c(Probability__c = 25)); // cave

        GetCollectionItemByProbabilityInvocable.Request r = new GetCollectionItemByProbabilityInvocable.Request();
        r.records = questSteps;
        r.probabilityField = 'Probability__c';

        GetCollectionItemByProbabilityInvocable.testRandom = .5;
        
        List<GetCollectionItemByProbabilityInvocable.Response> outs = GetCollectionItemByProbabilityInvocable.execute(new List<GetCollectionItemByProbabilityInvocable.Request> { r });
        
        // given random = .5, expect .75 probability returned
        system.assertEquals(75, outs[0].record.get('Probability__c'));

    }

    @isTest
    public static void test2() {
        
        List<QuestStep__c> questSteps = new List<QuestStep__c>();
        questSteps.add(new QuestStep__c(Probability__c = 75)); // volcano
        questSteps.add(new QuestStep__c(Probability__c = 25)); // cave

        GetCollectionItemByProbabilityInvocable.Request r = new GetCollectionItemByProbabilityInvocable.Request();
        r.records = questSteps;
        r.probabilityField = 'Probability__c';

        GetCollectionItemByProbabilityInvocable.testRandom = .8;
        
        List<GetCollectionItemByProbabilityInvocable.Response> outs = GetCollectionItemByProbabilityInvocable.execute(new List<GetCollectionItemByProbabilityInvocable.Request> { r });
        
        // given random = .8, expect .25 probability returned
        system.assertEquals(25, outs[0].record.get('Probability__c'));

    }

    @isTest
    public static void test3() {
        
        List<QuestStep__c> questSteps = new List<QuestStep__c>();
        questSteps.add(new QuestStep__c(Probability__c = 75)); // volcano
        questSteps.add(new QuestStep__c(Probability__c = 20)); // cave
        questSteps.add(new QuestStep__c(Probability__c = 05)); // magma

        GetCollectionItemByProbabilityInvocable.Request r = new GetCollectionItemByProbabilityInvocable.Request();
        r.records = questSteps;
        r.probabilityField = 'Probability__c';

        GetCollectionItemByProbabilityInvocable.testRandom = .97;
        
        List<GetCollectionItemByProbabilityInvocable.Response> outs = GetCollectionItemByProbabilityInvocable.execute(new List<GetCollectionItemByProbabilityInvocable.Request> { r });
        
        // given random = .97, expect .05 probability returned
        system.assertEquals(05, outs[0].record.get('Probability__c'));

    }

}