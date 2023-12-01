List<Monster__c> monsters = new List<Monster__c>();
monsters.add(new Monster__c(Name = 'Ghost', MaxExperiencePoints__c = 10, MaxHitPoints__c = 20, MinExperiencePoints__c = 5, MinHitPoints__c = 10));
monsters.add(new Monster__c(Name = 'Goblin', MaxExperiencePoints__c = 7, MaxHitPoints__c = 10, MinExperiencePoints__c = 3, MinHitPoints__c = 5));
insert monsters;

List<Character__c> characters = new List<Character__c>();
characters.add(new Character__c(Name = 'Thor'));
characters.add(new Character__c(Name = 'Merlin'));
characters.add(new Character__c(Name = 'Hermione Granger'));
insert characters;

List<Quest__c> quests = new List<Quest__c>();
quests.add(new Quest__c(Name = 'Dark Cave of Darkness', Level__c = 1, MaxStepMonsters__c = 2, MaxSteps__c = 10, MinStepMonsters__c = 1, MinSteps__c = 8, Required__c = true));
quests.add(new Quest__c(Name = 'Flaming Volcano of Fire', Level__c = 2, MaxStepMonsters__c = 3, MaxSteps__c = 15, MinStepMonsters__c = 1, MinSteps__c = 12, Required__c = true));
insert quests;
quests[1].PreviousQuest__c = quests[0].Id;
update quests[1];