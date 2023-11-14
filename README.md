# YCDRPG

YCDRPG is role-playing game engine built on Salesforce. 

## Classes

### GetRandomNumberInvocable
This Invocable Action accepts "min" and "max" parameters and returns a random value between them in decimal form (using  `Math.random()`)

## Flows

### New Game
Inits a new Game by selecting 1+ characters. Calls [New Game Quest](#new-game-quest)

### New Game Quest
Inits a new Quest in a Game based on their defined Sequence. Calls [New Game Quest Step](#new-game-quest-step)

### New Game Quest Step
Inits a new Step in a Game Quest. 

## Objects

[Object Model Diagram](https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=ycdrpg.drawio#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D1bbdEhfxDGeK8xN4lKr3awgxZ4ZwbDdal%26export%3Ddownload)

### Character
Jim the Wizard. Kathy the Conjurer. Ed, Raiser of the Dead. You get the idea. Characters can play multiple games over time. Or maybe at the same time... somehow. Magic and stuff.

### Game
How Quests and Characters come together. In D&D, I think this is would be called a "Campaign"? But, that felt like a reserved word in Salesforce.

### GameCharacter
Associates a Character with a Game.

### GameQuestStep
Represents a Step in a Game Quest.

### Monster
An enemy that will be faced in the steps of a Game Quest.

### Quest
A mission / level / challenge / something in a Game that takes characters down a path to fight Monsters, find Items, and generally move the Game forward.

### GameQuestStep
Defines a "Step" in a Quest in a Game. We'll talk more today :)

## Backlog / Issues

- Probably need a "Turn" object so we can track fights and outcomes of Steps.
- Missing logic in New Game Quest Flow if Game Quest is over. Condition = There are no Quests where Previous__c = Latest Quest
- New Game Flow just restarts after completing. Need a "finished" screen.
- ✅ Random Number between two numbers
- ✅ Random Number (default between zero and 1)
- New Game Quest Step Monsters - quantity variable, type variable
- New Game - Character Selection / Create New - simplify across multiple screens?
- new Invocable - set random/sequence field on List of Records (aka one less loop)
- new Invocable - get first/Nth/last record from list
- In a round, what if you kill a monster before it's their turn???
- No Living Game Characters = Fail Game = Turn, Round, Step, Quest, Game = Failure Status
- No Living Monsters = Delete Pending Turns, Round Success, Assign Experience Points, Collect Rewards, Create New Step
- Where does Create New Step Logic live?
- When monster dies, delete pending turns assigned to monster
- Monster disposition - ie attack strongest / weakest / randomest
- Mental Buffs - attack = +1, attack critical = +2, attack dead = +3, damage = -1, critical damage = -2, 
- Attack outcomes - hit, critical, miss (enemy dodge, defense), kill
- end game screens after success or failure
- experience levels? 
- random sequence isn't working... but maybe that becomes part of turn outcome


## Episodes

Raw, full-length recordings of Twitch streams are uploaded to Youtube. 

- [10/31/2023 - Episode 2 - New Game Flow, New Game Quest Flow, Step Object, Monster Object](https://www.youtube.com/watch?v=kSzKJRkT07k)
- [10/24/2023 - Episode 1 - Concepts and Object Model](https://www.youtube.com/watch?v=m4rAQFux_F4)

## About

**You Can’t Do That on Salesforce** is a [Twitch](https://twitch.com/ycdtosf) stream where we build silly things that may or may not belong on the Salesforce platform for laughs and learning.

- [YCDTOSF on LinkedIn](https://www.ycdtosf.com/linkedin)
- [YCDTOSF on Twitch](https://www.ycdtosf.com/twitch)
- [YCDTOSF on Youtube](https://www.ycdtosf.com/youtube)
- [YCDTOSF on Github](https://www.ycdtosf.com/github)
- [YCDTOSF Website](https://www.ycdtosf.com)