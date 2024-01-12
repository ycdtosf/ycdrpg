# YCDRPG

YCDRPG is role-playing game engine built on Salesforce. 

## Classes

### GetNthCollectionItemIvocable
When passed a `List<sObject>` and an `index`, returns the Nth record in this List. This makes life a little easier vs. loops in Flows that evaluate indexes.

### GetRandomNumberInvocable
This Invocable Action accepts "min" and "max" parameters and returns a random value between them in decimal form (using  `Math.random()`)

## Flows

Many of the 

### New Game
Inits a new Game by selecting 1+ characters. Calls [New Game Quest](#new-game-quest)

### New Game Quest
Inits a new Quest in a Game based on their defined Sequence. Calls [New Game Quest Step](#new-game-quest-step)

### New Game Quest Step
Inits a new Step in a Game Quest. 

### New Game Quest Monster
Inits Monsters in a Game Quest Step. 

### New Game Quest Step Round
Inits a new Round in a Game Quest Step. This Flow is also integral to the logic flow for next round / step / quest / game, as well as endgame logic.

### New Game Quest Step Round Turns
Inits a new Round in a Game Quest Step Round.

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

### GameQuestStepRound
Represents a Round of battle between Players and Monsters.

### GameQuestStepRoundTurn
Represents a Turn within a Round of battle between Characters and Monsters.

### Monster
An enemy that will be faced in the steps of a Game Quest.

### Quest
A mission / level / challenge / something in a Game that takes characters down a path to fight Monsters, find Items, and generally move the Game forward.

## Backlog / Issues

- [Github Project](https://github.com/users/ycdtosf/projects/2)
- [Github Issues]https://github.com/ycdtosf/ycdrpg/issues)

## Episodes

Raw, full-length recordings of Twitch streams are uploaded to Youtube. 

- [11/14/2023 - Episode 4 - Battle Engine, Part Two](https://youtu.be/5GM7bB8kynU)
- [11/08/2023 - Episode 3 - Battle Engine](https://youtu.be/ZEJATURj0Ws)
- [10/31/2023 - Episode 2 - New Game Flow, New Game Quest Flow, Step Object, Monster Object](https://www.youtube.com/watch?v=kSzKJRkT07k)
- [10/24/2023 - Episode 1 - Concepts and Object Model](https://www.youtube.com/watch?v=m4rAQFux_F4)

## About

**You Can’t Do That on Salesforce** is a [Twitch](https://twitch.com/ycdtosf) stream where we build silly things that may or may not belong on the Salesforce platform for laughs and learning.

- [YCDTOSF on LinkedIn](https://www.ycdtosf.com/linkedin)
- [YCDTOSF on Twitch](https://www.ycdtosf.com/twitch)
- [YCDTOSF on Youtube](https://www.ycdtosf.com/youtube)
- [YCDTOSF on Github](https://www.ycdtosf.com/github)
- [YCDTOSF Website](https://www.ycdtosf.com)