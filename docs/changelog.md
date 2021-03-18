# Changelog

## EN

### v1.1.0 (TBA)
* Fix #174: Changed the name "Gomez' Bowl" to "Gomez' Key".

### v1.0.0 (2021-03-15)
#### General
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
#### Story
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

## DE

### v1.0.0 (2021-03-15)
#### General
* Fix #1: NSCs wachen nicht mehr sofort auf, nachdem sie ins Bett gegangen sind, sondern bleiben liegen.
* Fix #2: NSCs öffnen nun korrekt geschlossene Türen und gehen hindurch.
* Fix #3: NSCs heben nun immer ihre Waffen und verlorene Munition nach einem verlorenen Kampf auf.
* Fix #7: NSCs trainieren nicht mehr ohne eine Waffe in der Hand. Hat der Spieler ihre Waffe aufgehoben, nachdem er sie besiegt hat, stehen sie jetzt herum.
* Fix #9: NSCs frieren nicht mehr beim Fliehen ein.
* Fix #10: Begleiter passen ihre Laufgeschwindigkeit dem Spielercharakter an. Dazu muss der Spielercharakter allerdings im Sichtfeld des Begleiters sein.
* Fix #11: Der Spieler kann nicht mehr an Wachen vorbeigelangen, indem er in den Kampfmodus wechselt.
* Fix #12: Der Spielercharakter erhält nicht mehr ein zweites Mal Erfahrung durch das Töten eines NSCs mit einer Fernkampfwaffe, wenn dieser zuvor schon im Nahkampf besiegt wurde.
* Fix #44: Wanzenfleisch ist nun unter "Essen" im Inventar zu finden.
* Fix #59: Händler rüsten nicht mehr ihre Waffe um, wenn der Spieler ihnen eine stärkere verkauft. Aufgrund einer wichtigen Spielmechanik wird allerdings eine Waffe ausgerüstet, sofern der Händler vorher noch keine Waffe diese Art (Nahkampf, Fernkampf) ausgerüstet hatte.
* Fix #78: Menschliche NSCs erkennen Orks nun als Gegner an. Damit ist Baal Lukors Wahrnehmung im Orkfriedhof korrigiert.
* Fix #125: Die Beschreibung des Schwertes *Schlachter* ist korrigiert zu "Einhandwaffe".
* Fix #136: Begleiter benutzen Leitern nun korrekt.
* Fix #157: Der Kaufwert des *Tranks der Schnelligkeit* ist korrigiert.
* Fix #158: Der Kaufwert des *Tranks der Eile* ist korrigiert.
#### Story
* Fix #15: Der Spielercharakter verliert keine Stärke mehr im Zuge der Quest "Horatio der Bauer", wenn er vorher mehr als 100 Stärke hatte.
* Fix #16: Thorus kann nicht mehr bestochen werden, wenn der Spieler bereits Zugang zur Burg hat. Außerdem verschwindet der Bestechen-Dialog, wenn der Spieler ihn bereits bestochen hat.
* Fix #17: Jackal verlangt kein Schutzgeld mehr vom Spieler, sobald dieser sich einem Lager angeschlossen hat.
* Fix #18: Bloodwyn verlangt kein Schutzgeld mehr vom Spieler, sobald dieser sich einem Lager angeschlossen hat.
* Fix #19: Scorpio kann nicht mehr gefragt werden: "Kannst du mir beibringen zu kämpfen?", nachdem er aus dem Alten Lager zu Cavalorn geflohen ist. Hinweis: Der Lerndialog selbst ist nicht betroffen und bleibt weiterhin verfügbar.
* Fix #20: Kirgo gibt dem Spieler nun korrekterweise ein Bier.
* Fix #21: Fletcher öffnet die Quest "Verschwundener Gardist" nicht mehr, wenn sie bereits abgeschlossen wurde, bevor der Spieler mit ihm gesprochen hat.
* Fix #22: Y'Berion greift den Spieler nun an, statt in einer Dialogschleife die Wachen zu rufen.
* Fix #24: Cor Kalom schließt nun korrekterweise die Quest "Kraut zu Gomez bringen" statt "Das Krautmonopol".
* Fix #25: Saturas bietet nun keine Große Wasserrobe mehr an, wenn der Spieler bereits eine erworben hat.
* Fix #26: Lares' Wache greift den Spieler nun an, statt ihm in einer Dialogschleife zu sagen, er solle verschwinden.
* Fix #27: Drax lehrt nicht mehr Jagdtalente, bevor der Spieler ihm nicht ein Bier spendiert hat.
* Fix #28: Mordrag bringt den Spieler nicht mehr zum Neuen Lager, wenn dieser ihn vorher verprügelt und aus dem Alten Lager vertireben hat.
* Fix #29: Buster lehrt nicht mehr Akrobatik, wenn der Spielercharakter das Talent bereits gelernt hat.
* Fix #30: Silas handelt mit dem Spieler nun mehr als nur einmal.
* Fix #31: Wolf können keine Minecrawlerpanzerplatten mehr angeboten werden, wenn der Spieler ihm schon die erforderliche Anzahl gebracht hat.
* Fix #32: Gorn greift den Spieler nicht mehr beim Überfall auf die Freie Mine an.
* Fix #33: Die Quest "Shrike's Hütte" kann nun abgeschlossen werden, unabhängig davon, ob der Spieler zuerst von der Quest erfährt oder Shrike besiegt.
* Fix #36: Fisks Quest "Neuer Hehler für Fisk" is nun immer erhältlich, egal, wie Thorus' Quest "Auftrag von Thorus" (erfolgreich) beendet wurde.  
* Fix #38: Snaf spricht nun auch über Nek, wenn die Quest "Snafs Rezept" abgeschlossen wurde. 
* Fix #39: Fingers lehrt nicht mehr Taschendiebstahl und Schlösserknacken auf Stufe zwei, wenn Stufe eins jeweils noch nicht gelernt wurde.
* Fix #40: Aleph bietet den Schlüssel nun nicht noch einmal an, wenn der Spieler ihn schon erhalten hat.
* Fix #42: Zwei Gardisten des Alten Lagers haben nun nicht mehr zwei ENDE Dialogoptionen.
* Fix #46: Die Tür nahe der Schmiede in der Burg des Alten Lagers ist nun mit dem korrekten Schlüssel begehbar. Dieser kann nun in Stones Zelle im Kerker des Alten Lagers erlangt werden kann.
* Fix #49: Die Beschreibung des Kerkerschlüssels ist korrigiert zu "öffnet den Kerker des Alten Lagers.".
* Fix #50: Die Säule in der Klosterruine fällt jetzt in die richtige Richtung und hat Kollision.
* Fix #60: Jesses Quest ist nun verfügbar.
* Fix #79: Wolf lehrt nun nur dann Geschicklichkeit, wenn der Spieler teil des Neuen Lagers ist.
* Fix #102: Der Spieler verliert nun tatsächlich 10 Erz, wenn er Schutzgeld für Jesse zahlt.
* Fix #109: Der Spieler verliert nun tatsächlich 10 Erz, wenn er später doch Schutzgeld an Bloodwyn zahlt.
* Fix #111: Der Spieler verliert nun tatsächlich 10 Erz, wenn er Schutzgeld an Jackal zahlt.
* Fix #112: Der Spieler verliert nun tatsächlich 10 Erz, wenn er später doch Schutzgeld an Jackal zahlt.
* Fix #122: Cavalorn schläft nun nachts tatsächlich in seiner Hütte und steht tagsüber draußen.
* Fix #124: Die Wache des Burgtors vom Alten Lager hat nun den korrekten Tagesablauf, um die Winde des Burgtors zu bewachen und zu bedienen.
* Fix #126: Sharkys Dialog zu Fisks Quest "Neuer Hehler für Fisk" öffnet nicht mehr das Handelsmenü.
* Fix #163: Das Burgtor des Alten Lagers ist nicht mehr blockiert und lässt sich korrekt schließen.
