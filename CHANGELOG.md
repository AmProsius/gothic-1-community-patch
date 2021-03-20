# Changelog

## v1.1.0 (TBA)
### General
* Fix #192: Mages (NPCs fighting only with spells) no longer auto-equip weapons (e.g. after trading). This requires fix #59 to be active.

### Story
* Fix #174: Changed the name "Gomez' Bowl" to "Gomez' Key".
* Fix #175: Changed the name "Rice Lord's Bowl" to "Rice Lord's Key".

## v1.0.0 (2021-03-15)
### General
* Fix #1: NPCs no longer wake up immediately after going to bed, but remain sleeping.
* Fix #2: NPCs now open closed doors properly and walk through them.
* Fix #3: NPCs now always pick up their weapons and lost ammunition after a lost fight.
* Fix #7: NPCs no longer practice weapon training without a weapon. If the player picked up their weapon after defeating them, they now stand around.
* Fix #9: NPCs no longer freeze while fleeing.
* Fix #10: Followers adjust their walking speed according to the player character. However, the player character must be in sight of the follower to adjust their pace.
* Fix #11: The player can no longer bypass NPCs that are guarding a passage by entering combat mode.
* Fix #12: The player character no longer receives Experience once again when killing an NPC with a ranged weapon after previously having knocked them down.
* Fix #43: The dialog choices about learning skills now contain proper whitespace.
* Fix #44: Bugmeat is now listed as food in the inventory.
* Fix #59: Vendors now don't re-equip their best weapon when the player sells them a more powerful one. However, due to important game mechanics, they will still equip a weapon if they didn't have a weapon of that type (melee, ranged) equipped before.
* Fix #78: Human NPCs now correctly recognize orcs as enemies. This fixes Baal Lukor's behavior in the orc graveyard.
* Fix #125: The description of the sword *Butcher* now correctly labels it as a one-handed weapon.
* Fix #136: Followers now use ladders properly.
* Fix #157: The *Potion of Velocity* now has the correct ore value.
* Fix #158: The *Potion of Haste* now has the correct ore value.

### Story
* Fix #15: The player character doesn't lose Strength as part of the quest "Horatio the Peasant" if he had more than 100 Strength.
* Fix #16: Thorus can't be bribed if the player has already obtained the permit to pass the guards. Also the option to bribe Thorus disappears after the player has bribed him.
* Fix #17: Jackal doesn't ask for protection money anymore if the player has already joined a camp.
* Fix #18: Bloodwyn doesn't ask for protection money anymore if the player has already joined a camp.
* Fix #19: Scorpio can no longer be asked "Can you teach me to fight?" after he fled from the Old Camp to Cavalorn. Note: The teaching dialog itself is not affected and will still be available.
* Fix #20: Kirgo now correctly gives a beer to the player.
* Fix #21: Fletcher no longer reopens the quest "Vanished Guard" if it was closed before talking to him.
* Fix #22: Y'Berion now attacks the player instead of repeating himself calling the guards.
* Fix #24: Cor Kalom now correctly closes the quest "Taking Weeds to Gomez" instead of "The Weed Monopoly".
* Fix #25: Saturas no longer offers to sell a High Robe of Water if the player already obtained one.
* Fix #26: Lares' guard now attacks the player instead of repeating himself telling the player to go.
* Fix #27: Drax no longer teaches hunting skills before the player has given him a beer.
* Fix #28: Mordrag no longer escorts the player to the New Camp if the player forcibly threw him out of the Old Camp.
* Fix #29: Buster no longer teaches Acrobatics if the player character already gained the skill.
* Fix #30: Silas now trades with the player more than once.
* Fix #31: Wolf can't be offered Minecrawler's Armor Plates any longer if the player already gave him the requested amount.
* Fix #32: Gorn no longer attacks the player on the raid of the Free Mine.
* Fix #33: The quest "Shrike's Hut" can be closed no matter in which order the player gets to know about the quest and defeats Shrike.
* Fix #36: Fisk's quest "New Fence for Fisk" is now available regardless of how the quest "Thorus' Quest" is (successfully) completed.
* Fix #38: Snaf now offers the dialog about Nek even when the quest "Snaf's Recipe" is completed.
* Fix #39: Fingers no longer offers to teach level two of pickpocketing and lock picking before level one has been learned.
* Fix #40: Aleph doesn't offer to sell the key anymore when the player already obtained it.
* Fix #42: The Guards who guard the ore barons' house in the Old Camp no longer have two END dialog options.
* Fix #46: The door near the smithy in the castle of the Old Camp is now accessible with the correct key. It can now be obtained in Stone's cell in the dungeon of the Old Camp.
* Fix #49: The description of the dungeon key is corrected to "Opens the dungeons of the old camp.".
* Fix #50: The pillar in the Monastery Ruins now falls in the right directions and has collision.
* Fix #60: Jesse's quest is now available.
* Fix #79: Wolf now only trains dexterity if the player is part of the New Camp.
* Fix #102: The player now correctly loses 10 ore if he chooses to pay protection money for Jesse.
* Fix #109: The player now correctly loses 10 ore if he chooses to pay protection money to Bloodwyn later.
* Fix #111: The player now correctly loses 10 ore if he chooses to pay protection money to Jackal.
* Fix #112: The player now correctly loses 10 ore if he chooses to pay protection money to Jackal later.
* Fix #122: Cavalorn now correctly sleeps in his hut at night and stands outside at daytime.
* Fix #124: The guard of the castle gate in the Old Camp now has the correct daily routine to watch over and operate the winch of the gate.
* Fix #126: Sharky's dialog option for Fisk's quest "New Fence for Fisk" no longer opens the trading menu.
* Fix #163: The castle gate of the Old Camp is no longer blocked and can properly be closed.
