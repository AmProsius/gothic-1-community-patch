# Changelog

## EN
### v1.0.0 (2021-03-15)
#### General
* Fix #1: NPCs no longer wake up immediately after going to bed but remain sleeping.
* Fix #2: NPCs open closed doors properly and walk through them.
* Fix #3: NPCs now always pick up their weapons after a lost fight.
* Fix #7: NPCs no longer practice weapon training without a weapon.
* Fix #9: NPCs no longer freeze while fleeing.
* Fix #10: Followers adjust their walking speed according to the player. However, the player must be in sight of the follower if the player starts running after walking.
* Fix #11: The player can no longer bypass NPCs that are guarding a passage by drawing the weapon.
* Fix #12: The player no longer receives double XP when killing an NPC with a ranged weapon after already beaten the NPC in melee combat.
* Fix #43: The dialog choices about learning skills now contain proper whitespace.
* Fix #59: Vendors don't re-equip their weapon when the player sells them a more powerful one. However, due to important game mechanics, they will still equip a weapon if they didn't have a weapon of that type (meelee, ranged) equipped before.
* Fix #78: Human NPCs now correctly recognize orcs as enemies. This fixes Baal Lukor's behavior in the orc graveyard.
#### Story
* Fix #15: The player doesn't lose Strength as part of the quest "Horatio the Peasant" if he had more than 100 Strength.
* Fix #16: Thorus can't be bribed if the player has already obtained the permit to pass the guards. Also the option to bribe Thorus disappears after the player has bribed him.
* Fix #17: Jackal doesn't ask for protection money anymore if the player has already joined a camp.
* Fix #18: Bloodwyn doesn't ask for protection money anymore if the player has already joined a camp.
* Fix #19: Scorpio can no longer be asked "Can you teach me to fight?" after he fled from the Old Camp to Cavalorn. Note: The player can still learn how to fight from him since that is a different dialog option.
* Fix #20: Kirgo now correctly gives a beer to the player.
* Fix #21: Fletcher no longer reopens the quest "Vanished Guard" if it was closed before talking to him.
* Fix #22: Y'Berion now attacks the player instead of repeating himself calling the guards.
* Fix #24: Cor Kalom now correctly closes the quest "Taking Weeds to Gomez" instead of "The Weed Monopoly".
* Fix #25: Saturas no longer offers to sell a High Robe of Water if the player already obtained one.
* Fix #26: Lares' guard now attacks the player instead of repeating himself telling the player to go.
* Fix #27: Drax no longer teaches hunting skills before the player has given him a beer.
* Fix #28: Mordrag no longer escorts the player to the New Camp if the player forcibly threw him out of the Old Camp.
* Fix #29: Buster no longer teaches Acrobatics if the player already gained the skill.
* Fix #30: Silas now trades with the player more than once.
* Fix #31: Wolf can't be offered Minecrawler's Armor Plates any longer if the player already gave him the requested amount.
* Fix #36: Fisk's quest "New Fence for Fisk" is now available regardless of how the quest "Thorus' Quest" is (successfully) completed.
* Fix #38: Snaf now offers the dialog about Nek even when the quest "Snaf's Recipe" is completed.
* Fix #39: Fingers no longer offers to teach level two of pickpocketing and lock picking before level one has been learned.
* Fix #40: Aleph doesn't offer to sell the key anymore when the player already obtained it.
* Fix #42: Two guards in the Old Camp no longer have two END dialog options.
* Fix #44: Bugmeat is now listed as food in the inventory.
* Fix #49: The description of the dungeon key is corrected to "Opens the dungeons of the old camp.".
* Fix #50: The pillar in the Monastery Ruins now falls in the right directions and has collision.
* Fix #60: Jesse's quest is now available.
* Fix #79: Wolf now only trains dexterity if the player is part of the New Camp.
* Fix #102: The player now correctly loses 10 ore if he chooses to pay protection money for Jesse.
* Fix #109: The player now correctly loses 10 ore if he chooses to pay protection money to Bloodwyn later.
* Fix #111: The player now correctly loses 10 ore if he chooses to pay protection money to Jackal.
* Fix #112: The player now correctly loses 10 ore if he chooses to pay protection money to Jackal later.
* Fix #122: Cavalron now correctly sleeps in his hut at night and stands outside at daytime.
* Fix #125: The description of the sword "Butcher" now correctly lists it as one-handed weapon.
* Fix #136: NPCs now use ladders properly when following the player.

## DE

### v1.0.0 (2021-03-15)
#### General
* Fix #1: NSCs wachen nicht mehr sofort auf, nachdem sie ins Bett gegangen sind, sondern bleiben liegen.
* Fix #2: NSCs öffnen nun korrekt geschlossene Türen und gehen hindurch.
* Fix #3: NSCs heben nun immer ihre Waffen nach einem verlorenen Kampf auf.
* Fix #7: NSCs trainieren nicht mehr ohne eine Waffe in der Hand.
* Fix #9: NSCs frieren nicht mehr beim Fliehen ein.
* Fix #10: Begleiter passen ihre Laufgeschwindigkeit dem Spieler an. Der Spieler muss allerdings in Sichtweite des Begleiters sein, wenn er anfängt zu rennen, nachdem er vorher gegangen ist.
* Fix #11: Der Spieler kann nicht mehr mit gezogener Waffe an Wachen vorbei gelangen.
* Fix #12: Der Spieler erhält nicht mehr ein zweites Mal Erfahrungspunkte durch Erlegen eines NPC im Fernkampf, wenn dieser zuvor schon im Nahkampf besiegt wurde.
* Fix #59: Händler rüsten nicht mehr ihre Waffe um, wenn der Spieler ihnen eine stärkere verkauft. Aufgrund einer wichtigen Spielmechanik wird allerdings eine Waffe ausgerüstet, sofern der Händler vorher noch keine Waffe diese Art (Nahkampf, Fernkampf) ausgerüstet hatte.
* Fix #78: Menschliche NPCs erkennen Orks nun als Gegner an. Damit ist Baal Lukors Wahrnehmung im Orkfriedhof korrigiert.
#### Story
* Fix #15: Der Spieler verliert keine Stärke mehr im Zuge der Quest "Horatio der Bauer", wenn er vorher mehr als 100 Stärke hatte.
* Fix #16: Thorus kann nicht mehr bestochen werden, wenn der Spieler bereits Zugang zur Burg hat. Außerdem verschwindet der Bestechen-Dialog, wenn der Spieler ihn bereits bestochen hat.
* Fix #17: Jackal verlangt kein Schutzgeld mehr vom Spieler, sobald dieser sich einem Lager angeschlossen hat.
* Fix #18: Bloodwyn verlangt kein Schutzgeld mehr vom Spieler, sobald dieser sich einem Lager angeschlossen hat.
* Fix #19: Scorpio kann nicht mehr gefragt werden: "Kannst du mir beibringen zu kämpfen?", nachdem er aus dem Alten Lager zu Cavalorn geflohen ist. Hinweis: Der Spieler kann immer noch von ihm Nahkampf lernen, da dies eine andere Dialogoption ist.
* Fix #20: Kirgo gibt dem Spieler nun korrekterweise ein Bier.
* Fix #21: Fletcher öffnet die Quest "Verschwundener Gardist" nicht mehr, wenn sie bereits abgeschlossen wurde, bevor der Spieler mit ihm gesprochen hat.
* Fix #22: Y'Berion greift den Spieler nun an, statt in einer Dialogschleife die Wachen zu rufen.
* Fix #24: Cor Kalom schließt nun korrekterweise die Quest "Kraut zu Gomez bringen" statt "Das Krautmonopol".
* Fix #25: Saturas bietet nun keine Große Wasserrobe mehr an, wenn der Spieler bereits eine erworben hat.
* Fix #26: Lares' Wache greift den Spieler nun an, statt ihm in einer Dialogschleife zu sagen, er solle verschwinden.
* Fix #27: Drax bringt dem Spieler nicht mehr Jagdtalente bei bevor dieser ihm nicht ein Bier spendiert hat.
* Fix #28: Mordrag bringt den Spieler nicht mehr zum Neuen Lager, wenn dieser ihn vorher verprügelt und aus dem Alten Lager vertireben hat.
* Fix #29: Buster bringt dem Spieler nicht mehr Akrobatik bei, wenn dieser das Talent bereits gelernt hat.
* Fix #30: Silas handelt mit dem Spieler nun mehr als nur einmal.
* Fix #31: Wolf können keine Minecrawlerpanzerplatten mehr angeboten werden, wenn der Spieler ihm schon die erforderliche Anzahl gebracht hat.
* Fix #36: Fisks Quest "Neuer Hehler für Fisk" is nun immer erhältlich, egal, wie Thorus' Quest "Auftrag von Thorus" (erfolgreich) beendet wurde.  
* Fix #38: Snaf spricht nun auch über Nek, wenn die Quest "Snafs Rezept" abgeschlossen wurde. 
* Fix #39: Fingers bringt dem Spieler nicht mehr Taschendiebstahl und Schlösserknacken auf Stufe zwei bei, wenn Stufe eins jeweils noch nicht gelernt wurde.
* Fix #40: Aleph bietet den Schlüssel nun nicht noch einmal an, wenn der Spieler ihn schon erhalten hat.
* Fix #42: Zwei Gardisten des Alten Lagers haben nun nicht mehr zwei ENDE Dialogoptionen.
* Fix #44: Wanzenfleisch ist nun unter "Essen" im Inventar zu finden.
* Fix #49: Die Beschreibung des Kerkerschlüssels ist korrigiert zu "öffnet den Kerker des Alten Lagers.".
* Fix #50: Die Säule in der Klosterruine fällt jetzt in die richtige Richtung und hat Kollision.
* Fix #60: Jesses Quest ist nun verfügbar.
* Fix #79: Wolf lehrt nun nur dann Geschicklichkeit, wenn der Spieler teil des Neuen Lagers ist.
* Fix #102: Der Spieler verliert nun tatsächlich 10 Erz, wenn er Schutzgeld für Jesse zahlt.
* Fix #109: Der Spieler verliert nun tatsächlich 10 Erz, wenn er später doch Schutzgeld an Bloodwyn zahlt.
* Fix #111: Der Spieler verliert nun tatsächlich 10 Erz, wenn er Schutzgeld an Jackal zahlt.
* Fix #112: Der Spieler verliert nun tatsächlich 10 Erz, wenn er später doch Schutzgeld an Jackal zahlt.
* Fix #122: Cavalron schläft nun nachts tatsächlich in seiner Hütte und steht tagsüber draußen.
* Fix #125: Die Beschreibung des Schertes "Schlachter" ist korrigiert zu "Einhandwaffe".
* Fix #136: NSCs benutzen Leitern nun korrekt, wenn sie dem Spieler folgen.
