# Changelog

## v1.2.0 (TBA)
### General
* Fix [#58](https://g1cp.org/issues/58): Falling can no longer be interrupted by fight actions mid-air.
* Fix [#194](https://g1cp.org/issues/194): NPCs now correctly pick up the weapon of their defeated opponent.

### Story
* Fix [#42](https://g1cp.org/issues/42) (updated): One of the guards guarding the ore barons' house in the Old Camp no longer has two END dialog options.
* Fix [#55](https://g1cp.org/issues/55) (updated): Grim now correctly mentions In Extremo in the second chapter even if the concert has not yet started playing. For details on the fix, see [v1.1.0](https://g1cp.org/blob/master/CHANGELOG.md#v110-2021-05-01).
* Fix [#128](https://g1cp.org/issues/128): One of the guards who guard the diggers in the Old Mine no longer has two END dialog options.
* Fix [#129](https://g1cp.org/issues/129): Drake's body skin color now matches his head.
* Fix [#191](https://g1cp.org/issues/191): Cord's dialog option to teach One-handed Sword Level 2 now appears only after the player learned Level 1.
* Fix [#220](https://g1cp.org/issues/220): Gor Na Ran no longer attacks the player character in chapter 6.
* Fix [#224](https://g1cp.org/issues/224): Grash-Varrag-Arushat (the last undead orc priest) can no longer be killed by fall damage.
* Fix [#225](https://g1cp.org/issues/225): Mordrag can no longer be told to "get out of here" if he guided the player to the New Camp.
* Fix [#226](https://g1cp.org/issues/226): A misplaced mana potion is now correctly inserted in one of the chests in the crypt under the stonehenge.
* Fix [#228](https://g1cp.org/issues/228): Gorn can now correctly be asked about in ambient dialogs after the player talked to Lares.
* Fix [#244](https://g1cp.org/issues/244): One of the guards guarding the ore barons' house in the Old Camp no longer has two END dialog options.

## [v1.1.0](https://g1cp.org/releases/tag/v1.1.0) (2021-05-01)
### General
* Fix [#4](https://g1cp.org/issues/4): NPCs no longer confront the player when he is standing in their way if he has defeated them before.
* Fix [#14](https://g1cp.org/issues/14): The player can no longer cancel fights by entering and leaving a room. The behavior is unchanged, if trespassing into the room was the reason for the fight.
* Fix [#110](https://g1cp.org/issues/110): Mouse input is no longer locked when interacting with objects to allow adjusting the camera viewpoint.
* Fix [#149](https://g1cp.org/issues/149): The armor "Improved ore Armor" is now correctly labelled as "Improved Ore Armor".
* Fix [#152](https://g1cp.org/issues/152): The description of the ring "Protection of Fire" is corrected to "Ring of Fire Protection".
* Fix [#176](https://g1cp.org/issues/176): Items with no value no longer show an empty "Value:" in the inventory text.
* Fix [#192](https://g1cp.org/issues/192): Mages (NPCs fighting only with spells) no longer auto-equip weapons (e.g. after trading). This requires fix #59 to be active.
* Fix [#193](https://g1cp.org/issues/193): Objects activated by switches/levers/winches are no longer stuck after loading a game.

### Story
* Fix [#23](https://g1cp.org/issues/23): The armor "Novice's Armor" is now available in chapter 2 to make it accessible before receiving the first templar armor.
* Fix [#36](https://g1cp.org/issues/36) (updated): Fisk's quest "New Fence for Fisk" is now available when the player either knocked out or killed Mordrag.
* Fix [#37](https://g1cp.org/issues/37): Gravo is now correctly listed as "Merchant in the Old Camp" in the journal.
* Fix [#45](https://g1cp.org/issues/45): Two snappers outside the Monastery ruins now correctly spawn.
* Fix [#50](https://g1cp.org/issues/50): The inaccessible chest of the crypt below the stonehenge is now correctly positioned and accessible.
* Fix [#52](https://g1cp.org/issues/52): The grindstone in the New Camp now correctly requires a sword blade to use.
* Fix [#55](https://g1cp.org/issues/55): Given all necessary files are present, the In Extremo concert can be enabled in the settings. This fix is disabled by default due to legal ambiguities. See [here](https://g1cp.org/issues/55) on how to enable it. (revisited in v1.2.0)
* Fix [#115](https://g1cp.org/issues/115): The templars in the orc graveyard are now less likely to survive.
* Fix [#174](https://g1cp.org/issues/174): The key "Gomez' Bowl" is now correctly labelled as "Gomez' Key".
* Fix [#175](https://g1cp.org/issues/175): The key "Rice Lord's Bowl" is now correctly labelled as "Rice Lord's Key".
* Fix [#181](https://g1cp.org/issues/181): Swiney no longer takes off his own Digger's Dress when he gives one to the player.
* Fix [#182](https://g1cp.org/issues/182): The gate guard can now only be bribed once when bringing Dusty to the Swamp Camp.
* Fix [#183](https://g1cp.org/issues/183): Corristo no longer offers to sell a High Robe of Fire if the player already obtained one.
* Fix [#184](https://g1cp.org/issues/184): Bartholo can now be given Kalom's weed only once.
* Fix [#185](https://g1cp.org/issues/185): Scorpio no longer offers to teach crossbow level 1 if the player character already gained that skill.
* Fix [#186](https://g1cp.org/issues/186): Corristo's dialog option to become a mage now disappears when the player has already asked him before and met the level requirements.
* Fix [#188](https://g1cp.org/issues/188): Cor Kalom can now be told that the weed was delivered only once.
* Fix [#203](https://g1cp.org/issues/203): Graham is now correctly listed as "Merchant in the Old Camp" in the journal.
* Fix [#204](https://g1cp.org/issues/204): Finger's dialog about Cavalorn will now correctly create the entry in "Tutor outside the camps" in the journal.
* Fix [#205](https://g1cp.org/issues/205): Wolf is now correctly listed as "Merchant in the New Camp" in the journal.
* Fix [#212](https://g1cp.org/issues/212): The cauldron near the ore heap in the New Camp now correctly requires a scoop to use.
* Fix [#213](https://g1cp.org/issues/213): The cauldron near the entrance of the hollow of the New Camp now correctly requires a scoop to use.
* Fix [#214](https://g1cp.org/issues/214): Graham now correctly sits at the campfire in the evening.
* Fix [#215](https://g1cp.org/issues/215): Guy now correctly sits at the arena in the evening.
* Fix [#216](https://g1cp.org/issues/216): One of the diggers in the Old Camp now correctly repairs his hut during daytime.
* Fix [#217](https://g1cp.org/issues/217): One of the mercenaries now correctly guards the palisade at the Free Mine in the afternoon.
* Fix [#223](https://g1cp.org/issues/223): The quest log no longer shows entries for both Old Camp and New Camp for the quest "The Big Thing of the Brotherhood".

## [v1.0.0](https://github.com/AmProsius/gothic-1-community-patch/releases/tag/v1.0.0) (2021-03-15)
### General
* Fix [#1](https://g1cp.org/issues/1): NPCs no longer wake up immediately after going to bed, but remain sleeping.
* Fix [#2](https://g1cp.org/issues/2): NPCs now open closed doors properly and walk through them.
* Fix [#3](https://g1cp.org/issues/3): NPCs now always pick up their weapons and lost ammunition after a lost fight.
* Fix [#7](https://g1cp.org/issues/7): NPCs no longer practice weapon training without a weapon. If the player picked up their weapon after defeating them, they now stand around.
* Fix [#9](https://g1cp.org/issues/9): NPCs no longer freeze while fleeing.
* Fix [#10](https://g1cp.org/issues/10): Followers adjust their walking speed according to the player character. However, the player character must be in sight of the follower to adjust their pace.
* Fix [#11](https://g1cp.org/issues/11): The player can no longer bypass NPCs that are guarding a passage by entering combat mode.
* Fix [#12](https://g1cp.org/issues/12): The player character no longer receives Experience once again when killing an NPC with a ranged weapon after previously having knocked them down.
* Fix [#43](https://g1cp.org/issues/43): The dialog choices about learning skills now contain proper whitespace.
* Fix [#44](https://g1cp.org/issues/44): Bugmeat is now listed as food in the inventory.
* Fix [#59](https://g1cp.org/issues/59): Vendors now don't re-equip their best weapon when the player sells them a more powerful one. However, due to important game mechanics, they will still equip a weapon if they didn't have a weapon of that type (melee, ranged) equipped before.
* Fix [#78](https://g1cp.org/issues/78): Human NPCs now correctly recognize orcs as enemies. This fixes Baal Lukor's behavior in the orc graveyard.
* Fix [#125](https://g1cp.org/issues/125): The description of the sword "Butcher" now correctly labels it as a one-handed weapon.
* Fix [#136](https://g1cp.org/issues/136): Followers now use ladders properly.
* Fix [#157](https://g1cp.org/issues/157): The ore value of the potion "Potion of Velocity" is now correct.
* Fix [#158](https://g1cp.org/issues/158): The ore value of the potion "Potion of Haste" is now correct.

### Story
* Fix [#15](https://g1cp.org/issues/15): The player character doesn't lose Strength as part of the quest "Horatio the Peasant" if he had more than 100 Strength.
* Fix [#16](https://g1cp.org/issues/16): Thorus can't be bribed if the player has already obtained the permit to pass the guards. Also the option to bribe Thorus disappears after the player has bribed him.
* Fix [#17](https://g1cp.org/issues/17): Jackal doesn't ask for protection money anymore if the player has already joined a camp.
* Fix [#18](https://g1cp.org/issues/18): Bloodwyn doesn't ask for protection money anymore if the player has already joined a camp.
* Fix [#19](https://g1cp.org/issues/19): Scorpio can no longer be asked "Can you teach me to fight?" after he fled from the Old Camp to Cavalorn. Note: The teaching dialog itself is not affected and will still be available.
* Fix [#20](https://g1cp.org/issues/20): Kirgo now correctly gives a beer to the player.
* Fix [#21](https://g1cp.org/issues/21): Fletcher no longer reopens the quest "Vanished Guard" if it was closed before talking to him.
* Fix [#22](https://g1cp.org/issues/22): Y'Berion now attacks the player instead of repeating himself calling the guards.
* Fix [#24](https://g1cp.org/issues/24): Cor Kalom now correctly closes the quest "Taking Weeds to Gomez" instead of "The Weed Monopoly".
* Fix [#25](https://g1cp.org/issues/25): Saturas no longer offers to sell a High Robe of Water if the player already obtained one.
* Fix [#26](https://g1cp.org/issues/26): Lares' guard now attacks the player instead of repeating himself telling the player to go.
* Fix [#27](https://g1cp.org/issues/27): Drax no longer teaches hunting skills before the player has given him a beer.
* Fix [#28](https://g1cp.org/issues/28): Mordrag no longer escorts the player to the New Camp if the player forcibly threw him out of the Old Camp.
* Fix [#29](https://g1cp.org/issues/29): Buster no longer teaches Acrobatics if the player character already gained the skill.
* Fix [#30](https://g1cp.org/issues/30): Silas now trades with the player more than once.
* Fix [#31](https://g1cp.org/issues/31): Wolf can't be offered Minecrawler's Armor Plates any longer if the player already gave him the requested amount.
* Fix [#32](https://g1cp.org/issues/32): Gorn no longer attacks the player on the raid of the Free Mine.
* Fix [#33](https://g1cp.org/issues/33): The quest "Shrike's Hut" can be closed no matter in which order the player gets to know about the quest and defeats Shrike.
* Fix [#36](https://g1cp.org/issues/36): Fisk's quest "New Fence for Fisk" is now available regardless of how the quest "Thorus' Quest" is (successfully) completed. (revisited in v1.1.0)
* Fix [#38](https://g1cp.org/issues/38): Snaf now offers the dialog about Nek even when the quest "Snaf's Recipe" is completed.
* Fix [#39](https://g1cp.org/issues/39): Fingers no longer offers to teach level two of pickpocketing and lock picking before level one has been learned.
* Fix [#40](https://g1cp.org/issues/40): Aleph doesn't offer to sell the key anymore when the player already obtained it.
* Fix [#42](https://g1cp.org/issues/42): The guards guarding the ore barons' house in the Old Camp no longer have two END dialog options.
* Fix [#46](https://g1cp.org/issues/46): The door near the smithy in the castle of the Old Camp is now accessible with the correct key. It can now be obtained in Stone's cell in the dungeon of the Old Camp.
* Fix [#49](https://g1cp.org/issues/49): The description of the dungeon key is corrected to "Opens the dungeons of the old camp.".
* Fix [#50](https://g1cp.org/issues/50): The pillar in the Monastery Ruins now falls in the right directions and has collision.
* Fix [#60](https://g1cp.org/issues/60): Jesse's quest is now available.
* Fix [#79](https://g1cp.org/issues/79): Wolf now only trains dexterity if the player is part of the New Camp.
* Fix [#102](https://g1cp.org/issues/102): The player now correctly loses 10 ore if he chooses to pay protection money for Jesse.
* Fix [#109](https://g1cp.org/issues/109): The player now correctly loses 10 ore if he chooses to pay protection money to Bloodwyn later.
* Fix [#111](https://g1cp.org/issues/111): The player now correctly loses 10 ore if he chooses to pay protection money to Jackal.
* Fix [#112](https://g1cp.org/issues/112): The player now correctly loses 10 ore if he chooses to pay protection money to Jackal later.
* Fix [#122](https://g1cp.org/issues/122): Cavalorn now correctly sleeps in his hut at night and stands outside at daytime.
* Fix [#124](https://g1cp.org/issues/124): The guard of the castle gate in the Old Camp now has the correct daily routine to watch over and operate the winch of the gate.
* Fix [#126](https://g1cp.org/issues/126): Sharky's dialog option for Fisk's quest "New Fence for Fisk" no longer opens the trading menu.
* Fix [#163](https://g1cp.org/issues/163): The castle gate of the Old Camp is no longer blocked and can properly be closed.
