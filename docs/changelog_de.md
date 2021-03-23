# Changelog (DE)

## v1.1.0 (TBA)
### General
* Fix #144: Die Rüstung "Gomez'Rüstung" heißt nun korrekt "Gomez' Rüstung".
* Fix #147: Die Rüstung "Crawler-Plattenrüstung" heißt nun korrekt "Crawlerplatten-Rüstung".
* Fix #149: Die Rüstung "verbesserte Erzrüstung" heißt nun korrekt "Verbesserte Erzrüstung".
* Fix #192: Magier (NSCs, die nur mit Magie kämpfen) rüsten nicht länger automatisch Nah- und Fernkampfwaffen aus (z.B. nach dem Handeln). Dieser Fix setzt den Fix #59 voraus.

### Story
* Fix #93: Im Tagebucheintrag zu der Quest "Horatio der Bauer" is nun die Phrase "[...] stärker zuzuschalgen." korrigiert zu "[...] stärker zuzuschlagen."
* Fix #91: Die Dialogauswahl mit Horatio: "Ja. Ich will es mit Ricelord und seinen Schlägern aufnehmen können!" is nun korrigiert zu "Ja. Ich will es mit dem Reislord und seinen Schlägern aufnehmen können!"
* Fix #94: Die Dialogoption mit Horatio "Ich hab' nochmal über die Sache nachgedacht..." ist nun korrigiert zu "Ich hab' noch einmal über die Sache nachgedacht...".
* Fix #121: Der Name der Quest "Shrike's Hütte" ist nun korrigiert zu "Shrikes Hütte".

## [v1.0.0](https://github.com/AmProsius/gothic-1-community-patch/releases/tag/v1.0.0) (2021-03-15)
### General
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
* Fix #125: Die Beschreibung des Schwertes "Schlachter" ist nun korrekt "Einhandwaffe".
* Fix #136: Begleiter benutzen Leitern nun korrekt.
* Fix #157: Der Kaufwert des "Tranks der Schnelligkeit" ist korrigiert.
* Fix #158: Der Kaufwert des "Tranks der Eile" ist korrigiert.

### Story
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
