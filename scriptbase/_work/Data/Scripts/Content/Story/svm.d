// **********************************************
// Standard	Voice Module
// **********************************************

// Diese Klasse	kann beliebig von den Skriptern	erweitert um
// "VAR	STRING xxxx" erweitert werden, diese k�nnen	dann in	den
// einzelnen SVM - Instanzen initialisiert werden.


CLASS C_SVM
{
// SC hat Waffe oder Magie gezogen oder zielt auf NSC
	VAR	STRING	StopMagic;					// NSC  sieht wie in seiner N�he gezaubert wird -> er fordert auf, damit aufzuh�ren!
	VAR	STRING	ISaidStopMagic;				// NSC hat bereits mit $StopMagic gewarnt und greift nun an	(nachdem er	diesen Satz	gesagt hat;	WICHTIG: dies ist KEINE	letzte Warnung,	sonder sofort Angriff!)

	var string	WeaponDown				;	//ZS_AssessFighter: SC steht mit gezogener Waffe vor NSC -> NSC ist NEUTRAL zu SC	-> (herausfordernd,	bei	P�nten-Stimme etwas	unsicher, trotzdem kernig)
	var string	ISaidWeaponDown			;	//Kommt nachdem der SC $WeaponDown ignoriert hat!

	VAR	STRING	WatchYourAim;				// ein FRIENDLY-SC zielt mit einer Fernkampfwaffe auf den NSC .	'Pa� auf! Ziel woanders	hin!' B_Orc_AssessThreat hat das auch noch
	var string	WatchYourAimAngry		;	// SC zielt mit einer Fernkampfwaffe auf den Angry-NSC. (genervte Auffordern, damit	aufzuh�ren)
	VAR	STRING	WhatAreYouDoing;			// NSC wird von einem FRIENDLY-SC/NSC geschlagen

// SC hat Waffe weggesteckt, NSC beendet Kampf
	VAR	STRING	LetsForgetOurLittleFight;	//Friede, kann direkt kommen ( Wenn freundliche k�mpfen und der Spieler die Waffe wegsteckt) oder als Reaction �ber das news-Ged�chtnis, sollte daher Zeitneutral sein (--> nicht wie jetzt lass uns den Streit von letztens vergessen

// NSC hat Gegner aus den Augen verloren
	VAR	STRING	Strange			;			// 1. NSC wird attackiert -> rennt mit gezogener Waffe zum Angreifer ->	kann ihn pl�tzlich nicht mehr entdecken	-> (muttering to himself)
											// 2. NSC sieht	einen Mord -> rennt	mit	gezogener Waffe	zum	M�rder -> kann ihn pl�tzlich nicht mehr	entdecken

// NSC greift an!
	var string	DieMonster				;	// NSC greift Monster an -> "Aus dir mach ich Gulasch, Drecksvieh!"
	var string	DieMOrtalEnemy;				// Der Nsc greift an, da er durch die Story permanent Hostile ist, d.h. die Lager sind in Blutfehde

	VAR	STRING	NowWait;					// NSC hat den SC fr�her noch NICHT besiegt -> SC greift den NSC an -> "Na warte!"
	VAR	STRING	YouStillNotHaveEnough	;	// NSC hat den SC fr�her besiegt ->	SC greift den NSC an -> "Hast du immer noch nicht genug?!"

	var	string	YouAskedForIt			;	// 1. SC hat eine Aufforderung ignoriert: den Raum zu verlassen, ein Item zur�ckzugeben, seine Waffe wegzustecken -> "Wer nicht h�ren will mu� f�hlen..."
	var string	NowWaitIntruder			;	// SC hat einen bewachten Durchgang durchbrochen...

	var	string	IWillTeachYouRespectForForeignProperty;	// 1. SC benutzt ein Besitz-Mob(T�r,Fallgitter-Drehkreuz,Kiste,...) und	wird ohne Vorwarnung attackiert
											// 2. SC tr�gt Waffe des NSCs -> NSC ist st�rker und holt sie sich mit Gewalt wieder ->	vorher dieser Spruch

	VAR	STRING	DirtyThief;					// 1. NSC ertappt den (schw�cheren)	SC mit den Fingern in den eigenen Taschen
											// 2. NSC sieht	wie	der	(schw�chere) SC	etwas nimmt, da� ihm geh�rt	(z.B. Waffe	auf	den	Tisch)
											// 3. NSC sieht	feindlichen, schw�cheren SC, der ihn vorher	mal	beklaut	hat	und	sagt ihm diesen	Spruch,	bevor er angreift "Da hab ich Dich also	wieder,	Du dreckiger Dieb"
											// 4. Nsc ist in einen Raum eingedrungen

	var string	YouAttackedMyCharge		;	// SC/NSC greift einen Sch�tzling einer NSC-Wache an -> Wache attackiert den Angreifer danach
	var string	YouKilledOneOfUs;			// NSC erblickt feindlichen SC, der einen Freund des NSCs get�tet hat -> Angriff!

// im Kampf
	VAR	STRING	Dead			;			// T�dlich verletzt
	VAR	STRING	Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_3			;			// Treffer kassiert im Kampf	

	var string	Berzerk			;			// Wahnsinnsschrei im Zustand der Raserei!

// SC hat NSC niedergeschlagen oder bedroht
	VAR	STRING	YoullBeSorryForThis;		// NSC wurde durch SC/aNSC besiegt und wacht aus der Ohnmacht wieder auf: 'Das wird	Dir	noch leidtun!'

	VAR	STRING	YesYes			;			// 1. NSC wurde	im Kampf besiegt ->	erwacht	wieder ist aber	sch�cher als sein Kontrahent
											// 2. SC zieht Waffe oder n�hert sich mit Waffe und NSC ist schw�cher als SC
// NSC flieht
	var string	ShitWhatAMonster		;	// NSC flieht vor zu starkem Monster -> "Schei�e, was ein H�llenvieh. Nichts wie weg!"
	VAR	STRING	Help;						// NSC flieht vor Gegner, Babe Nsc flieht vor Spieler, Orcs haben das auch
	var	STRING	WeWillMeetAgain;			// NSC flieht vor Gegner, ist aber eigentlich St�rker als er, ist aber trotzdem besiegt worden

// SC wurde von NSC besiegt und wird gepl�ndert
	VAR	STRING	NeverTryThatAgain	;		// NSC hat Gegner besiegt -> ("Versuch das NIE wieder!!")
	var string	ITakeYourWeapon;			// NSC pl�ndert bewu�tlosen SC/aNSC. W�hrend er sich b�ckt, um nach der vom Besiegten fallengelassenen Waffe zu greifen sagt er diesen Spruch.
	VAR	STRING	ITookYourOre	;			// NSC pl�ndert bewu�tlosen SC/aNSC. Nachdem er sich einen Teil des Erzes genommen hat, sagt er diesen Spruch.
	var string	ShitNoOre		;			// NSC �rgert sich dar�ber, da� er beim Durchsuchen eines bewu�tlosen/toten K�rpers kein Erz gefunden hat!

// NSC verwarnt SC
	VAR	STRING	HandsOff;					// SC manipuliert ein MOB (Drehkreuz, Truhe, T�r) und ein befreundeter bzw. gildengleicher NSC sieht das...
	VAR	STRING	GetOutOfHere		;		// NSC erwischt	schw�cheren	SC in seiner H�tte -> ("Raus hier")	(SC	soll aus Raum gehen)
	var	string	YouViolatedForbiddenTerritory		;	// SC wird beim Betreten eines verbotenen Portalraums erwischt -> Warnung!

	var	STRING	YouWannaFoolMe;				// SC schnappt NSC ein Item vor der Nase weg und wird mit $GiveItToMe aufgefordert es zur�ckzugeben -> SC gibt ein falsches Item an den NSC -> 'Willst Du mich verarschen'

	VAR	STRING	WhatsThisSupposedToBe	;	// 1. SC schleicht vor den Augen des NSCs -> "Was schleichst Du	hier rum?" (besser als "Was	soll das denn werden", weil	besseres Feedback!)
											// 2. SC bewegt	sich hinter	einer Wache	-> diese dreht sich	um und sagt	dann
	var string	WhyAreYouInHere			;	//im ZS_ClearRoom / SC steht in verbotenem Portalraum	-> schw�cherer NSC fragt
	var string	WhatDidYouInThere		;	// Wache sieht Sc aus einer H�tte rauskommen und verwarnt ihn, ohne das ein Angriff folgt

	VAR	STRING	WiseMove;					// 1. NSC wurde	gewarnt, seine Waffe wegzustecken ($RemoveYourWeapon) -> SC	befolgt	dies und steckt	die	Waffe weg
											// 2. SC steht in verbotenem Raum und wird mit $GetOutOfHere aufgefordert, rauszugehen -> SC befolgt die Aufforderung
											// 3. SC hat NSC ein Item vor der Nase weggeschnappt und wurde mit $GiveItToMe aufgefordert	es zur�ckzugeben ->	SC gehorcht

// NSC alarmiert/warnt andere NSCs vor SC
	VAR	STRING	Alarm;						// Wache alarmiert die Sichtung	eines permanent	HOSTILE	SC/aNSC	"Alaaaaaaarm!!!!!"
											// Nicht Wache sieht wie ein Portalraum betreten wird, der einer Gilde zugeordnet ist und ruft die Wachen
											// Gem�se (NpcWorker) ruft Wachen nach einem Diebstahl/beobachteten Diebstahl etc.
	var string	IntruderAlert;				// SC hat einen bewachten Durchgang durchbrochen und die Wache alarmiert alle umstehenden
	VAR	STRING	BehindYou;					// NSC sieht, wie ein anderer NSC vom SC bestohlen wird	und	warnt das Opfer

// NSC beobachtet Kampf
	var	string	TheresAFight	;			// NSC entdeckt	einen Kampf	und	will zuschauen (ZS_WatchFight) -> vorher ein Spruch	wie	"Hey da	dr�ben gibt's einen	Kampf"
	VAR	STRING	HeyHeyHey;					// Hintergrund anfeuern	beim Beobachten	eines Kampfes: 'Hau	ihm	aufs Maul!'	(kommt alle	paar Sekunden!)
	VAR	STRING	CheerFight;					// NSC ist im Zustand WatchFight: Neutraler	K�mpfer	schl�gt irgendeinen Typen. '5 Erz auf den Dicken'
	VAR	STRING	CheerFriend;				// NSC ist im Zustand WatchFight: Freund landet	einen Treffer. 'Immer in die Fresse!'
	VAR	STRING	Ooh;						// NSC ist im Zustand WatchFight: Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var	STRING	YeahWellDone;				// NSC sieht, wie SC/aNSC, zu dem er ANGRY/HOSTILE ist get�tet wird. 'Gut gemacht, das hat sie Sau verdient.'

// NSC-Gegner flieht
	VAR	STRING	RunCoward;					// 1. Der NSC befindet sich	im Zustand WatchFight -> einer der K�mpfer haut	ab
											// 2. Der Gegner des NSCs flieht
	var	string	HeDefeatedHim	;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC besiegt 	(WICHTIG: dies ist der normale Ausgang!)
	var	string	HeDeservedIt	;			// NSC sieht wie ein SC/aNSC, zu dem er	ANGRY/HOSTILE steht, besiegt wird -> ("DAS hat er verdient!")
	var	string	HeKilledHim		;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC t�tet	(WICHTIG: dies ist ein Skandal, niemand wird normalerweise	in einer "Schl�gerei" get�tet)
	var	string	ItWasAGoodFight	;			// NSC sieht wie ein FRIENDLY/NEUTRAL-SC/aNSC einen	anderen	besiegt

	VAR	STRING	Awake			;			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, r�keln)

// Gr��e
	VAR	STRING	FriendlyGreetings;			// 1. Am Anfang	eines Dialoges, wenn NSC FRIENDLY/NEUTRAL zum SC,  2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	ALGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC aus Altem Lager und FRIENDLY/NEUTRAL ('F�r Gomez'), 2. Wenn sie sich unterwegs begegnen.
	var	STRING	MageGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC beide Magier und FRIENDLY/NEUTRAL, 2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	SectGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC aus Psi-Camp und FRIENDLY/NEUTRAL	zum	SC ('Erwache. Der Schl�fer erwache.') 2. Wenn sie sich unterwegs begegnen.

	var string	ThereHeIs;					// NSC zeigt SC wo ein anderer NSC steht nach dem der SC gefragt hat: "Da dr�ben ist er"

// Lehrer-Kommentare
	var string	NoLearnNoPoints			;	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string	NoLearnOverMax			;	// NSC-Lehrer verbietet Attribut-Steigerung �ber 100
	var string	NoLearnYouAlreadyKnow	;	// Du mu�t erst Fortgeschritten sein, bevor du ein Meister werden kannst!
	var string	NoLearnYoureBetter		;	// Du bist jetzt schon besser!

// NSC spricht SC an
	VAR	STRING	HeyYou;						// z.B. Wache, die den SC im R�umen erwischt, wo er nicht hin darf sagt HeyYou, und geht dann zum SC

// NSC will nicht reden
	VAR	STRING	NotNow;						// NSC / Babe wird vom SC angesprochen,	lehnt aber ein Gespr�ch	ab.

// SC zu nah
	VAR	STRING	WhatDoYouWant;				// SC r�ckt NSC zu dicht auf die Pelle -> "Kann ich was f�r Dich tun?"
	VAR	STRING	ISaidWhatDoYouWant;			// NSC hat $WhatDoYouWant gesagt, aber der SC hat nicht reagiert -> "Was willst Du?"
// SC im Weg
	VAR	STRING	MakeWay;					// SC steht	schw�cherem NSC im Weg	-> Aufforderung, Platz zu	machen
	VAR	STRING	OutOfMyWay;					// SC steht st�rkerem NSC (Magier, Erzbaron) im Weg -> aggressive Aufforderung, Platz zu machen
	VAR	STRING	YouDeafOrWhat;				// SC folgt	nicht der Aufforderung des st�rkeren NSCs	-> letzte Warnung, danach Angriff

// SC spricht NSC an, der ihn besiegt hat
	VAR	STRING	LookingForTroubleAgain;		//Erster Satz eines Dialoges, nachdem der NSC und der SC gek�mpft haben (entweder wurde der SC besiegt oder es gab keinen klaren Ausgang des Kampfes)

// NSC ist schw�cher...
	var string	LookAway;					// Eingesch�chterter NSC guckt weg bei bedrohlichen Situationen
	VAR	STRING	OkayKeepIt;					// SC tr�gt	Waffe des sch�cheren NSCs -> NSCs verlangt die Waffe zur�ck	($GiveItToMe) -> SC	bedroht	NSC	-> ("Okay, okay, du	kannst das Ding	behalten..." zur�ckweichen)
	VAR	STRING	WhatsThat;					// Verwandelter SC wird vor den Augen des NSCs wieder zum Menschen (Erschreckter Ausruf) Nsc wird aus dem MagicSleep wieder wach und wundert sich...

	VAR	STRING	ThatsMyWeapon;				// SC tr�gt	eine Waffe,	die	dem	NSC	geh�rt -> Folge: ZS_GetBackBelongings
	VAR	STRING	GiveItToMe;					// 1. SC tr�gt Waffe des NSCs -> NSC ist schw�cher (also kein Kampf) ->	"Gib sie mir wieder"
	VAR	STRING	YouCanKeeptheCrap;			// 1. SC tr�gt Waffe des schw�cheren NSCs ->	NSCs verlangt die Waffe	zur�ck ($GiveItToMe) ->	SC geht	einfach	weg	-> ("Behalt	das	Schei�-Ding	doch!)
											// 2. NSC will ein Item	aufheben und wird von einem	st�rkeren NSC gewarnt, der das auch	tun	will ->	unser NSC weicht zur�ck

	VAR	STRING	TheyKilledMyFriend;			// NSC T�ter - NSC zu Opfer freundlich, zu T�ter freundlich oder neutral

	var	string	YouDisturbedMySlumber;		// NSC wurde vom SC	mittelsanft	aus	dem	Schlaf gerissen	(z.B. durch	Ansprechen)

// Angry NSCs kommentieren SC-Aktionen
	VAR	STRING	SuckerGotSome;				// Angry NSC hat geh�rt, da� der SC umgehauen wurde. "Das Dich jemand umgehauen hat, geschieht Dir Recht!"

	VAR	STRING	SuckerDefeatedEBr;			// Du hast einen	EBR	besiegt. Er war wirklich beeindruckt!
	VAR	STRING	SuckerDefeatedGur;			// Du hast einen	GUR	niedergeschlagen,	Du bist	ein	toter Mann
	VAR	STRING	SuckerDefeatedMage;			// (News) - im Stil von SuckerDefeatedXY

	var string	SuckerDefeatedNOV_Guard;	// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist ANGRY zu Spieler
	var string	SuckerDefeatedVLK_Guard;	// Der Spieler hat einen Sch�tzling der Wache niedergeschlagen
	var string	YouDefeatedMyComrade;		// Wache stellt fest, das sie gesehen/geh�rt hat, da� ich eine andere Wache umgehauen habe
	var string	YouDefeatedNOV_Guard;		// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist NEUTRAL/FRIENDLY zu Spieler
	var string	YouDefeatedVLK_Guard;		// Der Spieler hat einen Buddler umgehauen, Wache spricht den Spieler an, Wache ist NEUTRAL/FRIENDLY zu Spieler
	VAR	STRING	YouStoleFromMe;				// Du Sau hast mich beklaut

//Wichtige Person (Lehrer, Auftraggeber?), hat davon geh�rt, da� Du Mist gebaut hat...
// FIXME: damit das so benutzt werden kann m�ssen noch Anpassungen in der B_ReactToMemory.d gemacht werden
	VAR	STRING	YouStoleFromUs;				// eigene oder befreundete Gilde beklaut.
	VAR	STRING	YouStoleFromEBr;			// Erzbarone beklaut.
	VAR	STRING	YouStoleFromGur;			// Gurus beklaut.
	VAR	STRING	StoleFromMage;				// Magier beklaut.

	VAR	STRING	YouKilledMyFriend;			// jemand aus eigener oder befreundeter Gilde get�tet
	var	STRING	YouKilledEBr;				// Erzbaron get�tet
	VAR	STRING	YouKilledGur;				// Guru get�tet
	VAR	STRING	YouKilledMage;				// Guru get�tet

	VAR	STRING	YouKilledOCfolk;			// Gardist, Schatten oder Buddler get�tet.
	VAR	STRING	YouKilledNCfolk;			// S�ldner, Organisator, Sch�rfer oder Bauer get�tet
	VAR	STRING	YouKilledPSIfolk;			// Templer oder Novize get�tet

	VAR	STRING	GetThingsRight;				//SC hat Mist gebaut. NSC sagt, "Das wieder hinzubiegen wird nicht einfach!"

	VAR	STRING	YouDefeatedMeWell;			//Zu SC	freundlich/neutral:	Du hast	mich ganz sch�n	gepl�ttet

// Ambient-Unterhaltungen zwischen zwei NSCs (gemurmelte Wortfetzen, die zuf�llig zu "Dialogen" zusammengew�rfelt werden...
	VAR	STRING	Smalltalk01;				// ...wenn Du meinst...
	VAR	STRING	Smalltalk02;				// ...kann schon sein...
	VAR	STRING	Smalltalk03;				// ...war nicht besonders schlau....
	VAR	STRING	Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	STRING	Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	STRING	Smalltalk06;				// ...war doch klar, da� das �rger gibt...
	VAR	STRING	Smalltalk07;				// ...aber behalt's f�r Dich, mu� nicht gleich jeder wissen...
	VAR	STRING	Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	STRING	Smalltalk09;				// ...an der Gechichte mu� wohl doch was dran sein...
	VAR	STRING	Smalltalk10;				// ...man mu� eben aufpassen was man rumerz�hlt...
	VAR	STRING	Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	STRING	Smalltalk12;				// ...man darf auch nicht alles glauben, was man h�rt...
	VAR	STRING	Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	STRING	Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	STRING	Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	STRING	Smalltalk16;				// ...fr�her w�re das ganz anders gelaufen...
	VAR	STRING	Smalltalk17;				// ...gequatscht wird viel...
	VAR	STRING	Smalltalk18;				// ...ich h�r nicht mehr auf das Gefasel...
	VAR	STRING	Smalltalk19;				// ...verla� Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	STRING	Smalltalk20;				// ...ich glaube kaum, da� sich daran was �ndern wird...
	VAR	STRING	Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	STRING	Smalltalk22;				// ...erstmal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird...
	VAR	STRING	Smalltalk23;				// ...ich dachte, das w�re schon lange gekl�rt, aber das ist wohl nicht so...
	VAR	STRING	Smalltalk24;				// ...la� uns lieber �ber was anderes reden...
	VAR	STRING	Om;							// Ommm (Meditation)

// SC Dialog
	var string	SC_HeyTurnAround;			//SC: Hey du! (Nsc ansprechen, steht mit R�cken zu dir)                                   
	var string	SC_HeyWaitASecond;			//SC: Warte mal! (Nsc im vorgeigehen anhalten)                                            
	var string DoesntWork;				
	var string PickBroke;				
	var string NeedKey;					
	var string NoMorePicks;				
	var string InvFull;					

};


instance SVM_0 (C_SVM)				// wird nur intern gebraucht...
{

};


// ********************************
// 		Die SVM-Instanzen		(ToDo: News noch �berarbeiten wie in Prototypen)
// ********************************

// Die einzelnen Instanzen der SVMs
// Diese m�ssen	immer "SVM_x" heissen, wobei x die VoiceNummer ist.

instance SVM_1 (C_SVM)	//Malocher (Volk, Sch�rfer)	N�rgler, Alkoholiker, schimpft �ber	alles - zieht Kraft aus seinem Hass

{
	StopMagic					=	"SVM_1_StopMagic"					;//H�r auf mit dieser Magie-Schei�e!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Willst du Schl�ge? H�r sofort damit auf!!!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Steck die Waffe weg!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Steck endlich die Schei�waffe weg!!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Nimm das Ding runter!!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Wenn du eine aufs Maul willst, ziel ruhig weiter auf mich!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Pass auf! Noch mal und ich verpass dir eine.
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Lass uns den kleinen Streit vergessen, okay?
	Strange						=	"SVM_1_Strange"						;//Komm raus, du Dreckskerl!
	DieMonster					=	"SVM_1_DieMonster"					;//Verdammtes Drecksvieh!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Jetzt musst du dran glauben!
	NowWait						=	"SVM_1_NowWait"						;//Jetzt gibt's was aufs Maul ...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Du willst wohl noch eine aufs Maul!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Du wolltest so es so haben!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Jetzt sorg ich daf�r, dass du in Einzelteilen hier weggeschafft wirst!
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Ich habe dich gewarnt, die Drecksfinger von meinen Sachen zu lassen!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Ich mach dich fertig, du Dieb!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Niemand vergreift sich an meinen Kumpels!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Du hast einen von uns platt gemacht. Jetzt mach' ich DICH platt!
	Dead						=	"SVM_1_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Das wird dir noch Leid tun!
	YesYes						=	"SVM_1_YesYes"						;//Keine Panik! Hast gewonnen!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//Schei�e! Nichts wie weg!
	Help						=	"SVM_1_Help"						;//Verdammt!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Wir sehen uns wieder!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Noch einmal und du kannst was erleben.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Nette Waffe! Her damit!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Danke f�r das Erz, du Held!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Du arme Wurst, hast ja nicht mal Erz dabei!
	HandsOff					=	"SVM_1_HandsOff"					;//Flossen weg!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Verschwinde hier!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Hey! Wie kommst du hier rein?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Du glaubst wohl, ich bin bescheuert!
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hey du! Was schleichst du da rum.
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Raus aus meiner H�tte oder ich ruf die Wachen!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Du hast da drinnen nichts verloren! Verschwinde!
	WiseMove					=	"SVM_1_WiseMove"					;//Kluges Kerlchen!
	Alarm						=	"SVM_1_Alarm"						;//Wachen! Hierher!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//ALARM!!! EINDRINGLING!!!
	BehindYou					=	"SVM_1_BehindYou"					;//Hinter dir!
	TheresAFight				=	"SVM_1_TheresAFight"				;//Ah, ein Kampf!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Fester!
	CheerFight					=	"SVM_1_CheerFight"					;//Ihr k�mpft wie Frauen!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Mach ihn alle!!
	Ooh							=	"SVM_1_Ooh"							;//Schlag doch zur�ck!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Gib's ihm!
	RunCoward					=	"SVM_1_RunCoward"					;//Komm zur�ck, du Feigling!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Der hat genug!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Geschieht ihm recht!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Warum hast du ihn kaltgemacht? Du bist so gut wie tot!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Sch�ner Kampf!
	Awake						=	"SVM_1_Awake"						;//G����hn
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Hallo
	ALGreetings					=	"SVM_1_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_1_MageGreetings"				;//Magie zu Ehren!
	SectGreetings				=	"SVM_1_SectGreetings"				;//Erwache!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Da dr�ben ist er.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_1_HeyYou"						;//Hey, du!
	NotNow						=	"SVM_1_NotNow"						;//Nicht jetzt!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Was willst du?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Kann ich irgendwas f�r dich tun?!
	MakeWay						=	"SVM_1_MakeWay"						;//Lass mich mal vorbei!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Mach endlich Platz, Mann!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Bist du taub? WEG DA!!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Suchst du wieder Streit?
	LookAway					=	"SVM_1_LookAway"					;//���h! Ich hab nichts gesehen!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Okay, Okay! Behalt es einfach!
	WhatsThat					=	"SVM_1_WhatsThat"					;//Was war das denn?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Du rennst mit MEINER Waffe rum!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Her mit dem Ding!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Dann behalt es eben! Ich brauch es sowieso nicht!
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Sie haben einen von unseren Leuten umgebracht. Wenn ich das Schwein kriege ...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Verdammt, warum weckst du mich?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Haste was aufs Maul gekriegt? Geschieht dir recht!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Du hast einen Erzbaron umgehauen. Er ist so richtig w�tend!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Du hast einen Guru niedergeschlagen. Irgendwie ziehst du �rger an!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Einen Magier zu besiegen ist 'ne wirklich beschissene Idee!
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Du kannst hier nicht rumrennen und die Novizen verpr�geln!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Lass die Finger von meinen Jungs!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Du hast einen Kumpel von mir umgehauen ...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Das l�uft nicht, dass du hier Unruhe stiftest!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Wenn du jemanden verpr�gelst, der unter meinem Schutz steht, hat das Konsequenzen!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Du Arsch hast mich beklaut! Versuch das nicht noch mal!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Wir wollen unsere Sachen wiederhaben! Lass sehen!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Du hast die Erzbarone beklaut! Was soll der Schei�?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Du hast die Gurus beklaut? Dumm nur, dass es rausgekommen ist!
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Du hast die Magier beklaut! Eine echt d�mliche Idee!
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Einer unserer eigenen Leute hat ins Gras gebissen und du hast damit zu tun! Der kleinste Fehler noch und du bist Freiwild!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist verstorben und dein Name wird dabei erw�hnt ...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint, warst du das!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//War ein guter Kampf. Du hast mir ganz sch�n aufs Maul gehauen, Mann!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ... der letzte Schei� ...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ... kann schon sein, aber wen interessiert das? ...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ... absolut idiotisch ...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ... warum passiert so was immer wieder? ...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ... an der Geschichte muss doch wohl was dran sein ...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ... nicht so viel quatschen, ja, ja ...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ... so lange ich nichts damit zu tun habe ...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ... man darf auch nicht alles glauben ...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_1_Om"							;// Ommm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einsch�chterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//Keine Magie!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//HEY! Keine Magie, hab' ich gesagt!
	WeaponDown					=	"SVM_2_WeaponDown"					;//Komm, steck das Ding weg!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Weg mit der Waffe!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Pass auf, wo du hinzielst!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Wenn du weiter auf mich anlegst, muss ich das wohl pers�nlich nehmen!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Hey, was soll denn das??
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Lass uns die Sache vergessen, ok?
	Strange						=	"SVM_2_Strange"						;//Seltsam? Wo ist er denn hin?!
	DieMonster					=	"SVM_2_DieMonster"					;//Schon wieder eins!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//Ich bef�rchte, ich muss dich beseitigen!
	NowWait						=	"SVM_2_NowWait"						;//Du bist selbst Schuld!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Hast du noch nicht genug?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Wenn du es unbedingt willst!
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Du wei�t doch, dass du hier nichts zu Suchen hast!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Warum fummelst du auch an Sachen rum, die dir nicht geh�ren?!
	DirtyThief					=	"SVM_2_DirtyThief"					;//Du hast mich beklaut! Das nehme ich dir echt �bel!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Niemand vergreift sich an meinen Jungs!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Du hast einen von uns umgebracht! Daf�r musst du b��en!
	Dead						=	"SVM_2_Dead"						;//Aaargl
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Das wird dir noch Leid tun!
	YesYes						=	"SVM_2_YesYes"						;//Langsam, langsam, du hast gewonnen!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Ich - �hm - geh' Hilfe holen!
	Help						=	"SVM_2_Help"						;//Keine Zeit, ich muss noch was erledigen!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Wir sehen uns bestimmt noch mal wieder!
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//Versuch das nicht noch mal!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//Die Waffe nehm' ich mir!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//Etwas Erz kannst du doch entbehren!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Du hast kein Erz? Scheint heute nicht dein Tag zu sein!
	HandsOff					=	"SVM_2_HandsOff"					;//Finger weg!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Raus hier!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Hey! Wie bist du denn hier reingekommen?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Nicht sehr klug von dir, mich verschaukeln zu wollen!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Was schleichst du da rum?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Raus aus meiner H�tte oder ich ruf die Wachen!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Bleib aus den H�tten drau�en!
	WiseMove					=	"SVM_2_WiseMove"					;//Die richtige Entscheidung.
	Alarm						=	"SVM_2_Alarm"						;//Wachen, hierher!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//ALARM!!!
	BehindYou					=	"SVM_2_BehindYou"					;//Hinter dir!
	TheresAFight				=	"SVM_2_TheresAFight"				;//Ah, ein Kampf!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//Ist das alles!
	CheerFight					=	"SVM_2_CheerFight"					;//Nicht so m�de!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Guter Schlag!
	Ooh							=	"SVM_2_Ooh"							;//Das tat weh!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Der bewegt sich noch!
	RunCoward					=	"SVM_2_RunCoward"					;//Bleib hier, du Feigling!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Der hat genug!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//Das hat er verdient!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Du hast ihn umgebracht! War das n�tig?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Ganz ordentlich, nur zu kurz!
	Awake						=	"SVM_2_Awake"						;//G����hn 
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Hallo.
	ALGreetings					=	"SVM_2_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_2_MageGreetings"				;//Magie zu Ehren!
	SectGreetings				=	"SVM_2_SectGreetings"				;//Erwache!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Da dr�ben.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_2_HeyYou"						;//Hey, du!
	NotNow						=	"SVM_2_NotNow"						;//Jetzt nicht.
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Was willst du?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Kann ich was f�r dich tun?
	MakeWay						=	"SVM_2_MakeWay"						;//Lass mich mal vorbei!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//Mach Platz!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Verschwinde, sonst lauf ich �ber dich dr�ber!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Willst du dich noch mal mit mir anlegen?
	LookAway					=	"SVM_2_LookAway"					;//Ich hab' NICHTS gesehen! KEIN Problem!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Schon gut! Es geh�rt dir!
	WhatsThat					=	"SVM_2_WhatsThat"					;//Was? Wie?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//Sieht aus wie meine Waffe, was du da hast!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//Na los, her damit!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//Ich brauche es sowieso nicht mehr!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Jemand hat einen von uns get�tet! Wenn wir den erwischen, ist er dran!
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Warum weckst du mich?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Du bist niedergeschlagen worden! Ich gebe zu, dass mich das freut!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Du hast einen Erzbaron besiegt.
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Einen Guru niederzuschlagen! Bin nicht sicher, ob das mutig ist oder irre!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Einen Magier zu besiegen ... Du bist ja einer!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Ich sorge daf�r, dass hier Ruhe herrscht!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Egal worum es ging! Wenn du einen Buddler schl�gst, gibt's �rger!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Du hast einen Kumpel von mir zusammengeschlagen!
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Lass die Novizen in Ruhe!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//Keine Schl�gereien mit meinen Jungs! Verstanden?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Wieso hast du mich beklaut?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Du hast da etwas, das uns geh�rt. Das m�chten wir gerne zur�ck haben!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Mann! Du hast die Erzbarone beklaut! Die werden toben!
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Du hast die Gurus beklaut! Wenn du dich wenigstens nicht erwischen lassen w�rdest!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Die Magier m�gen es nicht, wenn man in ihren Sachen rumst�bert!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist tot und du sollst damit zu tun haben ...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint hast du ihn beseitigt!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Hast du 'ne Ahnung wie schwierig das ist, so was wieder hinzubiegen?!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Ja, du hast mich besiegt. War ein guter Kampf! Aber jetzt ist genug!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_2_Om"							;// Ommm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gem�se. "Ich schau noch�n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//Weg mit der Magie!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Steck endlich die Magie weg.
	WeaponDown					=	"SVM_3_WeaponDown"					;//Nimm die Waffe runter!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Ich krieg' schlechte Laune, wenn du weiter mit der Waffe rumfummelst!!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Warum zielst du auf mich?!
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Waffe runter, sonst werd ich b�se!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Heeeeeey! Was soll der Schei�??
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//Nun gut, wir betrachten unsere Auseinandersetzung als Missverst�ndnis.
	Strange						=	"SVM_3_Strange"						;//Er ist weg, einfach verschwunden?!
	DieMonster					=	"SVM_3_DieMonster"					;//Du Mistvieh nervst mich nicht mehr!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//Gleich hast du's hinter dir!
	NowWait						=	"SVM_3_NowWait"						;//Ich muss wohl noch deutlicher werden!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Du hast wohl noch nicht genug!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Du wolltest es so!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Hier hast du nichts zu suchen! Jetzt muss ich dich platt machen!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Ich muss dir wohl auf die Flossen hauen, du verstehst es einfach nicht!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Du beklaust mich! Ich glaub' es nicht!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Hier kannst du nicht einfach jedem aufs Maul hauen!
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Du hast einen von uns umgebracht! Das war dein letzter Fehler!
	Dead						=	"SVM_3_Dead"						;//Aaargl
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Das wird dir noch Leid tun!
	YesYes						=	"SVM_3_YesYes"						;//Du hast gewonnen! Schon gut!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//Schei�e! Nichts wie weg!
	Help						=	"SVM_3_Help"						;//Ich muss weg!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Wir sehen uns wieder!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Versuch so was nicht noch mal!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Danke f�r die Waffe!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Ich nehme mir noch etwas Erz ...
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Kein Erz dabei? Das ist traurig, Mann, echt traurig!
	HandsOff					=	"SVM_3_HandsOff"					;//Finger weg!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Verzieh dich!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Hey! Wo kommst du denn her?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Ich bin nicht so bescheuert wie du denkst!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//H�r auf, hier herumzuschleichen!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Verschwinde aus meiner H�tte oder ich rufe die Wachen!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Was machst du da? Wenn ich dich erwische, bist du dran!
	WiseMove					=	"SVM_3_WiseMove"					;//Du wei�t ja doch, was gut f�r dich ist!
	Alarm						=	"SVM_3_Alarm"						;//Wachen, hierher!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//ALARM!!!
	BehindYou					=	"SVM_3_BehindYou"					;//Pass auf!
	TheresAFight				=	"SVM_3_TheresAFight"				;//Ein Kampf!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Haue!
	CheerFight					=	"SVM_3_CheerFight"					;//Was wird das denn?
	CheerFriend					=	"SVM_3_CheerFriend"					;//Guter Schlag!!
	Ooh							=	"SVM_3_Ooh"							;//Ooooh!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Ja! Gut gemacht!
	RunCoward					=	"SVM_3_RunCoward"					;//Der haut einfach ab!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//Er hat ihn fertig gemacht.
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//Das war schon l�nger f�llig!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Der bewegt sich nicht mehr. Du hast ihn umgebracht!
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Immer nur K�mpfe ...
	Awake						=	"SVM_3_Awake"						;//Ein neuer Tag und nichts hat sich ge�ndert ...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Hey, Mann.
	ALGreetings					=	"SVM_3_ALGreetings"					;//F�r Gomez, ja, ja.
	MageGreetings				=	"SVM_3_MageGreetings"				;//Magie zu Ehren!
	SectGreetings				=	"SVM_3_SectGreetings"				;//Erwache!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Da dr�ben ist er.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Du hast nicht genug Erfahrung. Ich kann dir das nicht beibringen!
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_3_HeyYou"						;//Hey, du!
	NotNow						=	"SVM_3_NotNow"						;//Nicht jetzt!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Willst du was von mir?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Kann ich irgendwas f�r dich tun?
	MakeWay						=	"SVM_3_MakeWay"						;//Lass mich mal vorbei!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Mach Platz, Mann!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Wie oft denn noch? Lass mich durch!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Willst du dich wieder mit mir anlegen?
	LookAway					=	"SVM_3_LookAway"					;//Ich hab' NICHTS gesehen! Bin gar nicht hier!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Gut, gut, behalt es!
	WhatsThat					=	"SVM_3_WhatsThat"					;//Was war denn das?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//Du hast da meine Waffe dabei!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Her damit!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Wie du meinst! Ich brauch' es sowieso nicht.
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Sie haben schon wieder einen von uns gekillt. Hier kommt keiner von uns lebendig raus ...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//Warum rei�t du mich aus den Tr�umen?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Geschieht dir Recht, dass du 'ne Abreibung bekommen hast!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Du hast einen Erzbaron besiegt! Du suchst wohl immer nach �rger, Mann!
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Du hast einen der Gurus besiegt. Das nehmen sie dir echt �bel!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Einen Magier zu besiegen wird gro�en �rger geben!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//Die Novizen solltest du n�chstes Mal in Ruhe lassen!
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Wenn du einem Buddler aufs Maul haust, muss ich das bei dir tun!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Du hast meinen Kumpel niedergeschlagen!
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Die Novizen stehen unter meinem Schutz! Lass sie in Ruhe!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Die Buddler bezahlen mich, damit sie keinen �rger haben! So soll das auch bleiben!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Du hast mich bestohlen, du dreckiger Dieb?
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//Du hast einige Sachen, die uns geh�ren. Gib sie besser wieder her.
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Mann! Du hast die Erzbarone beklaut! Die werden toben!
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Du hast die Gurus beklaut! Dumm nur, dass sie es schon wissen.
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Wenn du die Magier beklaust, dann solltest du geschickter sein!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein klitzekleiner Fehler und du bist dran!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist verstorben und dein Name wird dabei erw�hnt ...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//Die Bruderschaft ist um einen Anh�nger �rmer und du hast ihn auf dem Gewissen!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//War ein fairer Kampf! Schwamm dr�ber, dass du mich umgehauen hast!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ... ich halt' mich da lieber raus ...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ... erst mal abwarten. Es wird l�ngst nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_3_Om"							;// Ommm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Gr�nschn�beln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//Steck lieber die Magie weg!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//H�r besser auf meinen Rat und steck die Magie weg!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Steck die Waffe weg, wenn du keinen �rger willst!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//Steck schon endlich die Waffe weg!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Pass lieber auf, wo du hinzielst!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Wenn du nicht aufh�rst, nehme ich dir das Spielzeug weg!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//He da! Pass doch auf!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Vergessen wir unseren kleinen Streit!
	Strange						=	"SVM_4_Strange"						;//Komm raus! Zeig dich!
	DieMonster					=	"SVM_4_DieMonster"					;//Egal wie viele man t�tet, es werden einfach nicht weniger!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//�lter wirst du nicht mehr!
	NowWait						=	"SVM_4_NowWait"						;//Ich werde dich lehren, dich mit mir anzulegen ...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Hast du denn noch nicht genug?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Das hast du dir selbst zuzuschreiben!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//Hier einzudringen war sehr dumm von dir!!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Du kannst nicht einfach ungestraft �berall rumfummeln!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Du hat es gewagt, mich zu bestehlen!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Wenn du dich mit uns anlegst, wird dir das nicht gut bekommen.
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Du hast einen von uns get�tet! Dein Leben f�r seins!
	Dead						=	"SVM_4_Dead"						;//Aaargl
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Das wirst du noch bereuen!
	YesYes						=	"SVM_4_YesYes"						;//Nicht aufregen, du hast gewonnen!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Schnell weg von hier!
	Help						=	"SVM_4_Help"						;//Ich bin zu alt f�r so was!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Das werde ich nicht so schnell vergessen!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Versuch das besser nicht noch mal!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Die Waffe nehme ich besser mal mit!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Dein Erz ist bei mir in besseren H�nden!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Nicht mal ein paar armselige Erz-Nuggets
	HandsOff					=	"SVM_4_HandsOff"					;//Finger weg!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Verschwinde hier!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Hier drinnen hast du nichts verloren!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Ich bin nicht in der Stimmung f�r solche Scherze!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Hey, du! Was schleichst du da rum.
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Geh raus, sonst ruf' ich die Wachen!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Was hast du da drinnen getrieben?
	WiseMove					=	"SVM_4_WiseMove"					;//Da hast du noch mal Gl�ck gehabt.
	Alarm						=	"SVM_4_Alarm"						;//Wachen, hier her!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//EINDRINGLING!!!
	BehindYou					=	"SVM_4_BehindYou"					;//Hinter dir!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Schon wieder ein Kampf.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Fester!
	CheerFight					=	"SVM_4_CheerFight"					;//Ist das alles, was ihr draufhabt?!
	CheerFriend					=	"SVM_4_CheerFriend"					;//Gib's ihm!
	Ooh							=	"SVM_4_Ooh"							;//Schlag mal zur�ck!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Gut gemacht!
	RunCoward					=	"SVM_4_RunCoward"					;//Der Feigling verzieht sich!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Wir haben damals mehr ausgehalten!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//Selbst schuld!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Du hast ihn umgebracht! Das war ein gro�er Fehler!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//Fr�her waren die K�mpfe besser.
	Awake						=	"SVM_4_Awake"						;//G����hn 
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Sei gegr��t.
	ALGreetings					=	"SVM_4_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_4_MageGreetings"				;//Magie zu Ehren!
	SectGreetings				=	"SVM_4_SectGreetings"				;//Erwache!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Du findest ihn dort dr�ben.
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_4_HeyYou"						;//He da!
	NotNow						=	"SVM_4_NotNow"						;//Nicht jetzt.
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Was willst du?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Willst du was von mir?
	MakeWay						=	"SVM_4_MakeWay"						;//Lass mich vorbei.
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Mach schon Platz!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Beiseite, sonst bereust du es!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Willst du dich noch mal mit mir anlegen?
	LookAway					=	"SVM_4_LookAway"					;//Nichts sehen, nichts h�ren, nichts reden ...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Behalt es doch einfach!
	WhatsThat					=	"SVM_4_WhatsThat"					;//Was war denn das?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//R�ck mal sch�n meine Waffe wieder raus!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//Los, gib schon her!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Dann eben nicht! Ich bin froh, dass ich es los bin!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Wenn ich rauskriege, wer einen von uns auf dem Gewissen hat ...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Du st�rst meine Nachtruhe!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Du bist umgehauen worden! 'ne kleine Abreibung hattest du auch mal n�tig!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Du hast einen Erzbaron besiegt!
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Du hast einen der Gurus besiegt. Respekt. Aber lass dir nicht einfallen, das noch mal zu probieren.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Einen Magier zu besiegen ... Du bist einer!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Du hast sie ja wohl nicht alle, einfach einen Novizen umhauen.
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Was f�llt dir eigentlich ein, einen Buddler zu verkloppen ?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Du hast dich mit einem Freund von mir angelegt! Du bist wirklich unvorsichtig!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Vergreif dich noch einmal an einem Novizen und es wird dir Leid tun!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Du bist echt zu mutig, einen meiner Sch�tzlinge anzufassen, kann dich teuer zu stehen kommen.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Lass blo� die Finger von meinen Sachen, verstanden?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//Du hast da etwas, was uns geh�rt. Gib es uns wieder!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Mann! Du hast die Erzbarone beklaut! Die werden toben!
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Du hast die Gurus beklaut! Wenn du dich wenigstens nicht erwischen lassen w�rdest!
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Die Magier m�gen es nicht, wenn man in ihren Sachen rumst�bert!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist tot und du sollst damit zu tun haben ...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//Im Neuen Lager steht wieder 'ne H�tte leer, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//Die Bruderschaft ist um einen Anh�nger �rmer, und wie es scheint, hast du ihn beseitigt!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Du hast mir ganz sch�n aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_4_Om"							;// Ommm
};


instance SVM_5 (C_SVM)				//Lebensk�nstler, offen, Fr�hlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewu�t, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//Pack mal lieber die Magie weg!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Wenn ich 'Magie weg' sage, dann mein' ich das auch so!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Was hast du mit der Waffe vor, Mann!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Komm schon, steck weg, das Ding!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Du zielst auf mich, du Komiker!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Wenn du nicht aufh�rst, dann �be ich gleich auch mal mit dir!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hey, bist du blind oder was?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Den kleinen Streit vergessen wir, okay?
	Strange						=	"SVM_5_Strange"						;//Eben war er noch da!? Seltsam! 
	DieMonster					=	"SVM_5_DieMonster"					;//Du bist f�llig, Mistvieh!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//Jetzt wird abgerechnet!
	NowWait						=	"SVM_5_NowWait"						;//Du brauchst wohl dringend was hinter die Ohren!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Hast du immer noch nicht genug?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Na gut, du willst es scheinbar so!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Hier werden sie dich raustragen m�ssen!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Ich hab' dich gewarnt. Wer an meine Sachen geht, kriegt �rger!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Du Dieb! Ich bring dir Manieren bei!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Niemand vergreift sich ungestraft an meinen Jungs!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Du hast einen meiner Jungs platt gemacht. Jetzt mach' ich DICH platt!
	Dead						=	"SVM_5_Dead"					;//Aaargl
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Das wird dir noch Leid tun!
	YesYes						=	"SVM_5_YesYes"						;//Bleib locker! Hast gewonnen.
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//Das ist 'ne Nummer zu gro� f�r mich!
	Help						=	"SVM_5_Help"						;//Verdammt!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//Beim n�chsten Mal sieht die Sache wieder anders aus!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//Versuch das nicht noch mal!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Die Waffe gef�llt mir!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Ich sorg daf�r, dass dein Erz gut angelegt wird!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//So ein Pech! Kein Erz!
	HandsOff					=	"SVM_5_HandsOff"					;//Finger weg!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Raus hier!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Hey! Wo kommst du denn her?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Guter Witz!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Weshalb schleichst du hier rum?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Raus hier, sonst ruf' ich die Wachen!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Du hast da drinnen nichts verloren!
	WiseMove					=	"SVM_5_WiseMove"					;//Du lernst schnell!
	Alarm						=	"SVM_5_Alarm"						;//Wachen, hier her!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//ALARM!!!!
	BehindYou					=	"SVM_5_BehindYou"					;//Hey, pass auf!
	TheresAFight				=	"SVM_5_TheresAFight"				;//Ein Kampf!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Drauf!
	CheerFight					=	"SVM_5_CheerFight"					;//Gut so!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Hau ihn endlich um!
	Ooh							=	"SVM_5_Ooh"							;//Pass doch auf!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//Wurde aber auch Zeit!
	RunCoward					=	"SVM_5_RunCoward"					;//Der Typ verdr�ckt sich!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Klarer Sieger w�rde ich sagen!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Es hat den Richtigen erwischt!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Einfach einen kalt machen. Du hast jetzt echt ein Problem!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//Was f�r ein Kampf!
	Awake						=	"SVM_5_Awake"						;//G����hn 
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Hi Ho Kumpel!
	ALGreetings					=	"SVM_5_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_5_MageGreetings"				;//Magie zu Ehren!
	SectGreetings				=	"SVM_5_SectGreetings"				;//Erwache!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Da dr�ben.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//So unerfahren, wie du bist, kann ich dir nichts beibringen.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_5_HeyYou"						;//Hey du!
	NotNow						=	"SVM_5_NotNow"						;//Nicht jetzt.
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Kann ich dir helfen?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Was willst du?
	MakeWay						=	"SVM_5_MakeWay"						;//Lass mich mal durch.
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//Komm schon, ich will vorbei!
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Bist du taub oder suchst du Streit?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Willst du dich noch mal mit mir anlegen?
	LookAway					=	"SVM_5_LookAway"					;//Ich hab' NICHTS gesehen ... war irgendwas?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Schon gut, behalt es!
	WhatsThat					=	"SVM_5_WhatsThat"					;//Was war denn das?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Ich w�rde es vorziehen, meine Waffe zur�ckzubekommen!
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Gib schon her!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Na ja, auch nicht so schlimm! Ich hab' noch mehr davon!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Sie haben einen unserer Jungs erwischt. Wenn ich das Schwein kriege ...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Hey, was soll das? Warum weckst du mich?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//Na? Haste was aufs Maul gekriegt? Geschieht dir recht!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Du hast einen Erzbaron umgehauen. Er war beeindruckt!
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Du hast einen der Gurus besiegt. Respekt. Aber lass dir nicht einfallen, das noch mal zu probieren.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Einen Magier zu besiegen ... Du bist ja einer!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Du hast sie ja wohl nicht alle, einfach einen Novizen umzuhauen.
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Was f�llt dir eigentlich ein, einen Buddler zu verkloppen ?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Du hast einen Kumpel von mir ausgeknockt, was sollte das?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Vergreif dich noch einmal an unseren Jungs und es wird dir Leid tun.
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Du bist echt zu mutig, einen meiner Sch�tzlinge anzufassen, kann dich teuer zu stehen kommen.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Du wagst es, mir unter die Augen zu treten, dreckiger Dieb?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//Du hast einige Sachen, die uns geh�ren. Gib sie besser wieder her.
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Mann! Du hast die Erzbarone beklaut! Die werden toben!
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Du hast die Gurus beklaut! Wenn du dich wenigstens nicht erwischen lassen w�rdest!
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Die Magier m�gen es nicht, wenn man in ihren Sachen rumst�bert!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist tot und du sollst damit zu tun haben ...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint hast du ihn beseitigt!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Du hast mir ganz sch�n aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_5_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Gr�lt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//H�r auf mit der Magie-Schei�e!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Magie weg! Sofort!!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Steck die schei� Waffe weg!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Soll ich dir aufs Maul hauen? Steck das Ding weg!!!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Nimm das Ding runter, oder es passiert was!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Na, ziel ruhig weiter auf mich, wenn du eine aufs Mauls willst!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//He! Pass auf!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Hey, Mann! Lass uns den kleinen Streit vergessen, okay?
	Strange						=	"SVM_6_Strange"						;//Komm raus! Zeig dich!
	DieMonster					=	"SVM_6_DieMonster"					;//Aus dir mach' ich Gulasch, Drecksvieh!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//Jetzt musst du dran glauben!
	NowWait						=	"SVM_6_NowWait"						;//Na warte, jetzt gibt's was aufs Maul...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Du willst wohl noch eine auf's Maul!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Du wolltest es so haben!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Jetzt mach' ich Hackfleisch aus dir!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Ich hab' dich gewarnt. Wer an meine Sachen geht, kriegt �rger!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Du Dieb! Ich mach dich fertig!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Niemand vergreift sich an meinen Jungs!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Du hast einen meiner Jungs platt gemacht. Jetzt mach' ich DICH platt!
	Dead						=	"SVM_6_Dead"						;//Aaargl
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Das wird dir noch leid tun!
	YesYes						=	"SVM_6_YesYes"						;//Ja, Ja! Keine Panik! Hast gewonnen.
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//Verdammt, was f�r ein Vieh! Nichts wie weg!
	Help						=	"SVM_6_Help"						;//Verdammt!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Du wirst mich noch kennen lernen!!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Noch einmal und du kannst was erleben.
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Die Waffe sieht brauchbar aus!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Danke f�r das Erz, ich trink einen auf dich mit!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Schei�e, nicht mal Erz dabei...
	HandsOff					=	"SVM_6_HandsOff"					;//Finger weg!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Raus hier!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Hey! Wo kommst du denn her?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Ja, du glaubst wohl, ich bin bescheuert, was?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Hey! Was soll das Rumgeschleiche?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Geh raus oder ich ruf' die Wachen!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Was hast du da drinnen getrieben?
	WiseMove					=	"SVM_6_WiseMove"					;//Gl�ck gehabt!
	Alarm						=	"SVM_6_Alarm"						;//Wachen, hier her!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//ALARM!!! EINDRINGLING!!!
	BehindYou					=	"SVM_6_BehindYou"					;//Hinter dir!
	TheresAFight				=	"SVM_6_TheresAFight"				;//Ah, ein Kampf!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Fester!
	CheerFight					=	"SVM_6_CheerFight"					;//Ihr k�mpft wie Frauen!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Mach ihn alle!!
	Ooh							=	"SVM_6_Ooh"							;//Lass dir das nicht bieten! Hau ihm auf's Maul!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Jetzt gib's ihm. Ja, der bewegt sich noch!
	RunCoward					=	"SVM_6_RunCoward"					;//Feigling, komm zur�ck!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Der hat genug!
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Geschieht ihm recht!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Du bist so gut wie tot! Einfach einen kalt machen.
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Hahaha! Na, dem hast du's aber gezeigt!
	Awake						=	"SVM_6_Awake"						;//G����hn
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Hallo.
	ALGreetings					=	"SVM_6_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_6_MageGreetings"				;//Magie zu Ehren!
	SectGreetings				=	"SVM_6_SectGreetings"				;//Erwache!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Da vorne ist er.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_6_HeyYou"						;//Hey du!
	NotNow						=	"SVM_6_NotNow"						;//Nicht jetzt.
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Was willst du?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//Willst du was von mir?
	MakeWay						=	"SVM_6_MakeWay"						;//Lass mich mal vorbei!
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//Komm, geh zur Seite!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Weg da! Oder soll ich's in dich reinpr�geln?
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Willst du wieder �rger?
	LookAway					=	"SVM_6_LookAway"					;//Ich hab' nichts gesehen! Wirklich nicht!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Gut, gut, behalt den Kram!
	WhatsThat					=	"SVM_6_WhatsThat"					;//Was war denn das?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//R�ck mal meine Waffe raus, Witzbold!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Gib schon her, Mann!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Mir egal! Ich brauch es sowieso nicht mehr!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Sie haben einen unserer Jungs erwischt. Wenn ich das Schwein kriege ...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Verdammt, warum weckst du mich?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Haste was aufs Maul gekriegt? Geschieht dir Recht!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Du hast einen Erzbaron umgehauen. Er ist so richtig w�tend!
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Du hast einen Guru niedergeschlagen. Irgendwie ziehst du �rger an!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Einen Magier zu besiegen ist 'ne wirklich beschissene Idee, Mann!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Du kannst hier nicht rumrennen und die Novizen verpr�geln!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Lass die Finger von meinen Jungs!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Du hast einen Kumpel von mir umgehauen ...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Das l�uft nicht, dass du hier Unruhe stiftest!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Wenn du jemand verpr�gelst, der unter meinem Schutz steht, hat das Konsequenzen!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Du Arsch hast mich beklaut! Versuch das nicht noch mal!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Wir wollen unsere Sachen wiederhaben! Lass sehen!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Du hast die Erzbarone beklaut! Was soll der Schei�?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Du hast die Gurus beklaut? Zu bl�d, dass es rausgekommen ist!
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Du hast die Magier beklaut! Eine echt beschissene Schei�idee!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Einer unserer eigenen Leute ist tot und du hast damit zu tun! Der kleinste Fehler noch und du bist Freiwild!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Du hast einen Erzbaron umgelegt! Mann, du bist wirklich komplett durchgedreht!
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Du hast einen Magier umgebracht! Wie zum Teufel sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist tot und Dein Name wird dabei erw�hnt ...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint, warst du das!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//Du hast mir ganz sch�n aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ... h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ... glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ... erst mal abwarten. Wird nich' so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_6_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Steck das weg! Steck es weg!!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//Die Magie weg, pack sie weg!!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Weg mit der Waffe, weg damit!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Ich mein's ernst! Weg damit!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//Auf mich zielen? Pass auf du!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Willst du mir Angst machen? Ich hab' keine Angst!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Das merk ich mir! Pass auf!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Den Streit vergisst du, okay?
	Strange						=	"SVM_7_Strange"						;//Wo ist er hin? Das kann nicht sein! Das gibt es nicht!!
	DieMonster					=	"SVM_7_DieMonster"					;//Ich zerhack dich, du Mistvieh!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Jetzt sezier ich dich! Du bist dran! Keine Gnade!
	NowWait						=	"SVM_7_NowWait"						;//Endlich lieferst du mir einen Grund!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//Du willst es doch wohl nicht noch mal versuchen?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Blut! Dein Blut!!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Ich schneide dich in Streifen!
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//Die Finger sollte ich dir abschneiden!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Du mieser Dieb! Ich will dich leiden sehen!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Wenn hier jemand Pr�gel austeilt, bin ich das!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Du hast einen von uns gekillt!
	Dead						=	"SVM_7_Dead"						;//Aaargl
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Du wirst wenig Zeit haben, das zu bereuen!
	YesYes						=	"SVM_7_YesYes"						;//Schon gut! Schon gut!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//Ich hab' nicht die richtige Waffe. Wir sehen uns ...
	Help						=	"SVM_7_Help"						;//Verdammt!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Wir sprechen uns noch!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Tu das nie wieder!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Die Waffe behalte ich!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Lieber w�rde ich dich umbringen, aber das Erz ist auch nicht schlecht!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Kein Erz? Du nutzloses St�ck Dreck!
	HandsOff					=	"SVM_7_HandsOff"					;//Behalt deine Drecksgriffel bei dir!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Verzieh dich! Raus hier!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Wie kommst du hier rein?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Du versuchst tats�chlich mich zu verarschen!
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Hey du! Was schleichst du da rum.
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Verschwinde, sonst ruf ich die Wachen!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Du hast da drinnen nichts zu suchen!
	WiseMove					=	"SVM_7_WiseMove"					;//Dein Gl�ck! Aber ich h�tte dir auch gerne die Fresse poliert!
	Alarm						=	"SVM_7_Alarm"						;//Wachen, zu mir!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//ALARM!!
	BehindYou					=	"SVM_7_BehindYou"					;//Hinter dir!
	TheresAFight				=	"SVM_7_TheresAFight"				;//Ein Kampf!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Fester!
	CheerFight					=	"SVM_7_CheerFight"					;//Ich will Blut sehen!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Mach ihn fertig!!
	Ooh							=	"SVM_7_Ooh"							;//Wehr dich, du Flasche!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Jaaaa!!!
	RunCoward					=	"SVM_7_RunCoward"					;//Renn heim zu Mutti!!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Der hat genug!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//Selbst schuld!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Du bist wirklich lebensm�de, vor Zeugen jemanden kaltzumachen.
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Netter Kampf!
	Awake						=	"SVM_7_Awake"						;//Schon wieder aufstehen!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Hallo
	ALGreetings					=	"SVM_7_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_7_MageGreetings"				;//Magie zu Ehren!
	SectGreetings				=	"SVM_7_SectGreetings"				;//Erwache!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Bist du blind? Da vorne!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_7_HeyYou"						;//Hey du!
	NotNow						=	"SVM_7_NotNow"						;//Nicht jetzt!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Was willst du von mir?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Kann ich was f�r dich tun?!
	MakeWay						=	"SVM_7_MakeWay"						;//Lass mich vorbei.
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Mach Platz!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Suchst du Streit? Weg da!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Willst du dich noch mal mit mir anlegen?
	LookAway					=	"SVM_7_LookAway"					;//Ich hab' NICHTS gesehen!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Gut, gut! Kannst es behalten!
	WhatsThat					=	"SVM_7_WhatsThat"					;//Was war denn das?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Gib mir meine Waffe zur�ck!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Her damit!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//Auch gut! Behalt es! Ich finde 'ne andere L�sung!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Einer von uns hat ins Gras gebissen! Das schreit nach Rache!
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Warum weckst du mich?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Geschieht dir recht, dass du 'ne Abreibung bekommen hast!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Du hast einen Erzbaron umgehauen. Er ist so richtig w�tend!
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Du hast einen Guru niedergeschlagen. Irgendwie ziehst du �rger an!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Einen Magier zu besiegen ist 'ne wirklich beschissene Idee!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//Du verpr�gelst also die Novizen!
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Lass die Finger von meinen Jungs!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Du hast den Falschen umgehauen! Wir halten hier zusammen!
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Das l�uft nicht, dass du hier Unruhe stiftest!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Wenn du jemand verpr�gelst, der unter meinem Schutz steht, hat das Konsequenzen!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Du Arsch hast mich beklaut! Versuch das nicht noch mal!
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Wir wollen unsere Sachen wiederhaben! Lass sehen!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Du hast die Erzbarone beklaut! Was soll der Schei�?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Du hast die Gurus beklaut? Zu bl�d, dass es rausgekommen ist!
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Du hast die Magier beklaut! Eine echt beschissene Idee!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Einer unserer eigenen Leute ist tot und du hast damit zu tun! Der kleinste Fehler noch und du bist Freiwild!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Du hast einen Magier umgebracht! Wie zum Teufel sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist tot und dein Name wird dabei erw�hnt ...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint, warst du das!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//Du hast mir ganz sch�n aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_7_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, n�chtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Keine Zaubereien, in meiner N�he!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Aufh�ren, sag' ich! Sofort!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Waffe weg!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Steck das Ding weg, oder du bist dran!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Waffe runter, Idiot!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Du Wurm wagst es, auf mich anzulegen?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Pass doch auf!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Gut, vergessen wir unseren kleinen Streit.
	Strange						=	"SVM_8_Strange"						;//Komm raus! Ich wei�, dass du mich h�rst!
	DieMonster					=	"SVM_8_DieMonster"					;//L�stige Viecher!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Jetzt stirbst du. Nimm's nicht pers�nlich!
	NowWait						=	"SVM_8_NowWait"						;//Du Wurm greifst MICH an! Na warte ...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//hab' ich dich nicht schon mal in den Staub getreten? Auf ein Neues ...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Wer nicht h�ren will, muss f�hlen!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//Du wagst es, HIER rumzulaufen? Na warte!
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Ich muss dir wohl auf die Flossen hauen!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Das h�ttest du nicht klauen sollen!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Niemand vergreift sich ungestraft an meinen Jungs!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Einen von uns umzubringen war dein letzter Fehler!
	Dead						=	"SVM_8_Dead"						;//Aaargl
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Das wird dir noch sehr Leid tun!
	YesYes						=	"SVM_8_YesYes"						;//Ganz ruhig. Alles in Ordnung!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//Dieses Biest sehe ich mir lieber aus der Entfernung an!
	Help						=	"SVM_8_Help"						;//Nichts wie weg!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Wir sehen uns wieder!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Noch einmal und du bist tot!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//Die Waffe gef�llt mir!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//Du hast bestimmt noch keine Erzsteuern an mich entrichtet!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//Klar, dass ein Verlierer wie du kein Erz hat!
	HandsOff					=	"SVM_8_HandsOff"					;//Finger weg!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Raus hier!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Hey, wie kommst DU hier rein?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Bist ein ganz Schlauer, was?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Hey du! Was schleichst du da rum.
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Verschwinde, sonst ruf ich die Wachen!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Was hast du da drinnen getrieben?
	WiseMove					=	"SVM_8_WiseMove"					;//Da hast du noch mal Gl�ck gehabt.
	Alarm						=	"SVM_8_Alarm"						;//Wachen, hierher!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//ALARM!!! EINDRINGLING!!!
	BehindYou					=	"SVM_8_BehindYou"					;//Hinter dir!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Mal sehen, wer da k�mpft!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Fester!
	CheerFight					=	"SVM_8_CheerFight"					;//Ja! Weiter, weiter!
	CheerFriend					=	"SVM_8_CheerFriend"					;//Gut so! Nicht nachlassen!
	Ooh							=	"SVM_8_Ooh"							;//Lass dir das nicht bieten! Hau ihm aufs Maul!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Ja, gib's ihm. Der bewegt sich noch!
	RunCoward					=	"SVM_8_RunCoward"					;//Lass dich hier nicht mehr blicken!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Langweiliger Kampf!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Geschieht ihm recht!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//Das war unn�tig. du wirst die Folgen zu tragen haben.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//War'n guter Kampf!
	Awake						=	"SVM_8_Awake"						;//G����hn
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Hallo.
	ALGreetings					=	"SVM_8_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_8_MageGreetings"				;//Magie zu Ehren!
	SectGreetings				=	"SVM_8_SectGreetings"				;//Erwache!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Da vorne ist er.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_8_HeyYou"						;//Hey du!
	NotNow						=	"SVM_8_NotNow"						;//Nicht jetzt.
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Was willst du?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Kann ich was f�r dich tun?
	MakeWay						=	"SVM_8_MakeWay"						;//Kann ich da mal vorbei?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//Geh zur Seite!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Soll ich's in dich reinpr�geln? Weg da!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Willst du dich noch mal mit mir anlegen?
	LookAway					=	"SVM_8_LookAway"					;//�hem ...  ... wirklich sch�ne Aussicht!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Gut! Es geh�rt dir.
	WhatsThat					=	"SVM_8_WhatsThat"					;//H�h? Was war das?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Du tr�gst meine Waffe ...?
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Her damit! Sofort!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Behalt's, ich brauch's sowieso nicht.
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Sie haben einen unserer Jungs erwischt. Wenn ich das Schwein kriege ...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Was ist los?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//Na? Haste was aufs Maul gekriegt? Geschieht dir Recht!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Du hast einen Erzbaron umgehauen. Er war beeindruckt!
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Du hast einen der Gurus besiegt. Respekt. Aber lass dir nicht einfallen, das noch einmal zu probieren.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Einen Magier zu besiegen ... Du bist ja einer!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Du wei�t, dass die Novizen unter meinem Schutz stehen. Und trotzdem vergreifst du dich an Ihnen?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Wenn du dich an Buddlern vergreifst, vergreifst du dich an meiner Kasse!
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Du solltest dich nicht mit meinen Freunden anlegen.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Vergreif dich noch einmal an unseren Jungs und es wird dir Leid tun.
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Einen meiner Sch�tzlinge anzugreifen kann dich den Kopf kosten.
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Du wagst es mir unter die Augen zu treten, dreckiger Dieb?
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//Du hast einige Sachen, die uns geh�ren. Gib sie besser wieder her.
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Mann! Du hast die Erzbarone beklaut! Na, die werden toben!
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Du hast die Gurus um ein paar Sachen erleichtert, was?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Du hast die Magier um ein paar Sachen erleichtert, was?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist verstorben und dein Name wird dabei erw�hnt ...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint, warst du das!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Du hast mir ganz sch�n aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ... das ist nun wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ... das war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ... aber behalt's f�r dich, ich meine, muss ja nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ... man muss eben aufpassen, was man so rumerz�hlt ...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ... erst mal abwarten. Komm, es wird ja auch nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ... Ah, ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ....
	Om							= 	"SVM_8_Om"							;//Ommm
};


instance SVM_9 (C_SVM)				// brummig		   gem�tlicher H�ne, Besonnen, Brummiger B�r, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Ich will keine Magie in meiner N�he!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Aufh�ren, sag' ich! Sofort!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Willst du mich angreifen?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Soll ich dir aufs Maul hauen oder steckst du das Ding weg?
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Pass auf, wo du hinzielst!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Pack das Ding weg!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//He! Pass auf!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//Von mir aus k�nnen wir unseren Streit vergessen ...
	Strange						=	"SVM_9_Strange"						;//Zeig dich. Ich wei�, dass du mich h�rst!
	DieMonster					=	"SVM_9_DieMonster"					;//Die Biester sind wirklich saudumm!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//Jetzt musst du dran glauben!
	NowWait						=	"SVM_9_NowWait"						;//Jetzt wirst du mich kennen lernen!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Du bist verdammt hartn�ckig!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Wer nicht h�ren will, muss f�hlen!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Jetzt mach' ich Hackfleisch aus dir, Eindringling!
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Ich habe dich gewarnt. Wer an meine Sachen geht, kriegt �rger!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Du Dieb! Ich mach dich fertig!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Niemand vergreift sich an meinen Jungs!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Du hast einen meiner Jungs platt gemacht. Jetzt mach' ich DICH platt!
	Dead						=	"SVM_9_Dead"						;//Aaargl
	Aargh_1						=	"SVM_9_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_9_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Du bist schon tot, du wei�t es nur noch nicht.
	YesYes						=	"SVM_9_YesYes"						;//Ganz ruhig. Alles in Ordnung!
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Schei�e, was ein Biest!
	Help						=	"SVM_9_Help"						;//Nichts wie weg!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Man sieht sich immer zweimal.
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//Beim n�chsten Mal werde ich dich umbringen!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Die Waffe geh�rt jetzt mir!
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Erz! Na das ist doch besser als gar nichts!
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//Der hat ja nicht mal Erz dabei!
	HandsOff					=	"SVM_9_HandsOff"					;//Finger weg, Freundchen!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Raus hier!
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Was hast du hier zu suchen?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Willst du mich verarschen, Mann?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Hey du! Was schleichst du da rum.
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Geh raus oder ich hol die Wachen!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Was hast du da drinnen getrieben?
	WiseMove					=	"SVM_9_WiseMove"					;//Kluges K�pfchen!
	Alarm						=	"SVM_9_Alarm"						;//Wachen, hier her!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//ALARM!!! EINDRINGLING!!!
	BehindYou					=	"SVM_9_BehindYou"					;//Hinter dir!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Mal sehen, was die so draufhaben ...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Weiter so!
	CheerFight					=	"SVM_9_CheerFight"					;//Ja! Weiter, weiter!
	CheerFriend					=	"SVM_9_CheerFriend"					;//Gut so!
	Ooh							=	"SVM_9_Ooh"							;//Oh, das hat gesessen!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Souver�n gemeistert, Junge!
	RunCoward					=	"SVM_9_RunCoward"					;//Lass dich hier nie wieder blicken!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//Der Kampf ist entschieden.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//Selbst schuld!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//Das war unn�tig. du wirst die Folgen zu tragen haben.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//War'n guter Kampf!
	Awake						=	"SVM_9_Awake"						;//G����hn
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Hallo.
	ALGreetings					=	"SVM_9_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_9_MageGreetings"				;//Magie zu Ehren!
	SectGreetings				=	"SVM_9_SectGreetings"				;//Erwache!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Bist du blind? Da vorne! //*** 9er war falsch betont!***
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_9_HeyYou"						;//Heh, du!
	NotNow						=	"SVM_9_NotNow"						;//Nicht jetzt.
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Was willst du?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//Kann ich dir helfen?!
	MakeWay						=	"SVM_9_MakeWay"						;//Lass mich mal vorbei!
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Geh zur Seite!
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//Na los, verschwinde schon!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Suchst du wieder Streit? Und schon wieder bei mir?
	LookAway					=	"SVM_9_LookAway"					;//Ach ja! Sch�nes Wetter heute!
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Gut! Es geh�rt dir.
	WhatsThat					=	"SVM_9_WhatsThat"					;//Was war das denn?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Ich z�hl' bis drei, dann hab' ich meine Waffe wieder.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Her damit! Sofort!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Behalt's, ich brauch's sowieso nicht.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Sie haben einen unserer Jungs erwischt. Wenn ich das Schwein kriege ...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Was ist los?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//Na? Haste was aufs Maul gekriegt? Geschieht dir recht!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Du hast einen Erzbaron umgehauen. Er war beeindruckt!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Du hast einen der Gurus besiegt. Respekt. Aber lass dir nicht einfallen, das noch mal zu probieren.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Einen Magier zu besiegen ... Du bist ja einer!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Du hast ja wohl nicht alle, einfach einen Novizen umzuhauen.
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Was f�llt dir eigentlich ein, einen Buddler zu verkloppen ?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Du hast einen Kumpel von mir ausgeknockt, was sollte das?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Vergreif dich noch einmal an unseren Jungs und es wird dir Leid tun.
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Du bist echt zu mutig, einen meiner Sch�tzlinge anzufassen, kann dich teuer zu stehen kommen.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Du wagst es, mir unter die Augen zu treten, dreckiger Dieb?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Unsere Leute zu beklauen ist das Letzte! Das wirst du b��en!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Mann! Du hast die Erzbarone beklaut! Die werden toben!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Du hast die Gurus um ein paar Sachen erleichtert, was?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Du hast die Magier um ein paar Sachen erleichtert, was?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Du hast einen Erzbaron umgelegt! Mann, du bist komplett durchgedreht!?
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist verstorben und dein Name wird dabei erw�hnt ...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint, warst du das!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Ein guter Kampf. Dein Training hat sich ausgezahlt.
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ... ja, wenn du meinst ...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht jeder gleich wissen ...
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ... ja, wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ... ich dachte, das w�r' schon lange gekl�rt ...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_9_Om"							;//Ommm
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//H�r mit der Magie auf!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//H�r sofort damit auf!!!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Steck die Waffe weg!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Was soll das werden? Willst du dich mit mir anlegen?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Nimm das Ding runter, oder ich sorg' selbst daf�r!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Wenn du eins aufs Maul willst, ziel ruhig weiter auf mich!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//He! Pass auf! Noch mal und ich verpass' dir eine.
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Hey, Mann! Lass uns unseren kleinen Streit von letztens vergessen, okay?
	Strange						=	"SVM_10_Strange"						;//Komm raus! Zeig dich!
	DieMonster					=	"SVM_10_DieMonster"						;//Drecksviecher!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Jetzt musst du dran glauben!
	NowWait						=	"SVM_10_NowWait"						;//Jetzt rechnen wir ab!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Du willst wohl noch eine auf's Maul!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//Du wolltest so es so haben!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Jetzt mach' ich Hackfleisch aus dir, Eindringling!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Ich hab' dich gewarnt. Wer an meine Sachen geht, kriegt �rger!
	DirtyThief					=	"SVM_10_DirtyThief"						;//Du Dieb! Ich mach dich fertig!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Niemand vergreift sich an meinen Jungs!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Du hast einen meiner Jungs platt gemacht. Jetzt mach' ich DICH platt!
	Dead						=	"SVM_10_Dead"							;//Aaargl
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Das wirst du noch zu sp�ren kriegen! Bastard!
	YesYes						=	"SVM_10_YesYes"							;//Ja, Ja! Keine Panik! Hast gewonnen.
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Was f�r ein Monstrum, nichts wie weg!
	Help						=	"SVM_10_Help"							;//R�ckzug!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Du wirst mich noch kennen lernen!!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Noch einmal und du kannst was erleben.
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Die Waffe geh�rt jetzt mir!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Ich nehm' mir mal etwas von deinem Erz!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Kein Erz dabei, Mist!
	HandsOff					=	"SVM_10_HandsOff"						;//Du Ratte! Finger weg!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Raus hier!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Hey! Wo kommst du denn her?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Du glaubst wohl wirklich, ich bin bescheuert!
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Hey, du! Was schleichst du da rum?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Raus oder ich rufe die Wachen!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Was hast du da drinnen getrieben?
	WiseMove					=	"SVM_10_WiseMove"						;//Da hast du noch mal Gl�ck gehabt.
	Alarm						=	"SVM_10_Alarm"							;//Wachen, hier her!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//ALARM!!! EINDRINGLING!!!
	BehindYou					=	"SVM_10_BehindYou"						;//Hinter dir!
	TheresAFight				=	"SVM_10_TheresAFight"					;//Ah, ein Kampf!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Fester!
	CheerFight					=	"SVM_10_CheerFight"						;//Keine Gnade!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Mach ihn alle!!
	Ooh							=	"SVM_10_Ooh"							;//Lass dir das nicht bieten!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Hau ihm aufs Maul!
	RunCoward					=	"SVM_10_RunCoward"						;//Feigling, komm zur�ck!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Ein kleiner Windsto� und er w�re von alleine umgefallen.
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Geschieht ihm recht!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Du bist so gut wie tot! Einfach einen kalt machen.
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Dem hast du's aber gezeigt!
	Awake						=	"SVM_10_Awake"							;//G����hn
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Hallo.
	ALGreetings					=	"SVM_10_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_10_MageGreetings"					;//Magie zu Ehren!
	SectGreetings				=	"SVM_10_SectGreetings"					;//Erwache!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Da vorne ist er.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_10_HeyYou"							;//Heh, du!
	NotNow						=	"SVM_10_NotNow"							;//Nicht jetzt.
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Was willst du?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Kann ich dir helfen?
	MakeWay						=	"SVM_10_MakeWay"						;//Lass mich mal durch.
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Mach Platz!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Soll ich's in dich reinpr�geln? Weg da!
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Willst du dich noch mal mit mir anlegen?
	LookAway					=	"SVM_10_LookAway"						;//Ich bin gar nicht hier ...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Behalt den Kram doch!
	WhatsThat					=	"SVM_10_WhatsThat"						;//Was war das denn?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//R�ck meine Waffe raus.
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Her damit!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Nimm's dir. Ich brauch' das eh nicht.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Sie haben einen unserer Jungs erwischt. Das macht mich verdammt w�tend!
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//Warum weckst du mich?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//Na? Haste was aufs Maul gekriegt? Geschieht dir recht!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Du hast einen Erzbaron umgehauen.
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Du hast einen der Gurus besiegt.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Einen Magier zu besiegen ...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Du solltest wissen, mit wem du dich anlegst, wenn du Novizen umhaust!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//Ich muss hier f�r Ordnung sorgen! Lass meine Leute in Ruhe!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Du hast einen Kumpel von mir niedergeschlagen.
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Vergreif dich noch einmal an unseren Jungs und es wird dir Leid tun.
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Einen meiner Sch�tzlinge anzufassen kann dich teuer zu stehen kommen.
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//Versuch das nicht noch mal, du Dieb!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Du hast einige Sachen, die uns geh�ren. Gib sie besser wieder her.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Mann! Du hast die Erzbarone beklaut! Die werden toben!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Du hast die Gurus um ein paar Sachen erleichtert, nicht sehr schlau sich dabei erwischen zu lassen!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Du hast die Magier um ein paar Sachen erleichtert, was?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgeknallt?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist verstorben und dein Name wird dabei erw�hnt ...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint, warst du das!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Alle Achtung! Du hast mich sauber besiegt. War ein guter Kampf.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ... solange ich nichts damit zu tun habe ...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ... manche lernen aber gar nichts dazu ...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ... ich h�re nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_10_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vern�nftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Keine Zaubereien in meiner N�he!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Aufh�ren, sag' ich! Sofort!
	WeaponDown					=	"SVM_11_WeaponDown"						;//Wenn du Streit suchst, komm ruhig n�her!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Steck das Ding weg, oder du bist dran!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Nimm das Ding runter!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Du willst dich also mit mir anlegen? Bist du sicher?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Was machst du! Lass das!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Gut, vergessen wir unseren kleinen Streit.
	Strange						=	"SVM_11_Strange"						;//Mmh! Mist! Wo ist er abgeblieben?
	DieMonster					=	"SVM_11_DieMonster"						;//Die werden aussterben, wenn sie mir st�ndig �ber den Weg laufen!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Wer sich Todfeinde macht, muss auch damit umgehen k�nnen, stirb.
	NowWait						=	"SVM_11_NowWait"						;//Das h�ttest du nicht tun sollen!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Hab' ich dich nicht schon mal in den Staub getreten? Auf ein Neues ...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Wer nicht h�ren will, muss f�hlen!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//He Eindringling. Nun kommt deine Lektion!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Ich muss dir wohl auf die Flossen hauen!
	DirtyThief					=	"SVM_11_DirtyThief"						;//Diebstahl lohnt nicht!
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Du bringst Unruhe in meinen Bereich! Jetzt muss ich dich fertig machen!
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Einen von uns umzubringen war dein letzter Fehler!
	Dead						=	"SVM_11_Dead"							;//Aaargl
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//Das h�ttest du besser nicht getan!
	YesYes						=	"SVM_11_YesYes"							;//Schon gut! Du hast ja gewonnen!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//Dieses Vieh ist eine Nummer zu gro� f�r mich!
	Help						=	"SVM_11_Help"							;//R�ckzug!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Das hat noch ein Nachspiel, Freundchen.
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//Versuch das nicht noch einmal!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Deine Waffe ist bei mir besser aufgehoben!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//Nett, dass du mir etwas von deinem Erz �berl�sst!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Fehlanzeige, kein Erz!
	HandsOff					=	"SVM_11_HandsOff"						;//Nimm deine Griffel weg!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Raus hier, sonst mach' ich dir Beine!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Hey, wie kommst DU hier rein?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Nicht mit mir, Freundchen!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Was wird das denn, wenn's fertig ist?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//Die H�tte geh�rt mir. Raus oder ich ruf die Wachen!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Was wolltest du da drin? Verschwinde, bevor ich mich mit dir besch�ftige!
	WiseMove					=	"SVM_11_WiseMove"						;//Gut! Mach das nicht noch mal!
	Alarm						=	"SVM_11_Alarm"							;//Wachen, hier her!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//ALARM!!! EINDRINGLING!!!
	BehindYou					=	"SVM_11_BehindYou"						;//Hinter dir!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Mal sehen, wer diesmal gewinnt!
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//Na los, mach schon!
	CheerFight					=	"SVM_11_CheerFight"						;//H�r auf, mit ihm zu spielen!
	CheerFriend					=	"SVM_11_CheerFriend"					;//Na, mit dem wirst du doch wohl noch fertig!
	Ooh							=	"SVM_11_Ooh"							;//Ouh! Nicht gut!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Mmh! Nicht schlecht.
	RunCoward					=	"SVM_11_RunCoward"						;//Lass dich hier nie mehr blicken!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Der hat gesessen!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Macht nix! Er hat's verdient!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Du hast ihn get�tet! Das gibt gro�en �rger!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Gut gemacht! Eine saubere Vorstellung!
	Awake						=	"SVM_11_Awake"							;//G����hn
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Hallo.
	ALGreetings					=	"SVM_11_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_11_MageGreetings"					;//Magie zu Ehren!
	SectGreetings				=	"SVM_11_SectGreetings"					;//Erwache!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Bist du blind? Da vorne! //*** 11er war falsch betont!***
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_11_HeyYou"							;//Heh, du!
	NotNow						=	"SVM_11_NotNow"							;//Nicht jetzt.
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Was willst du?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Kann ich was f�r dich tun?
	MakeWay						=	"SVM_11_MakeWay"						;//Kann ich da mal vorbei?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Geh zur Seite!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Soll ich's in dich reinpr�geln? Weg da!
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Willst du dich noch mal mit mir anlegen?
	LookAway					=	"SVM_11_LookAway"						;//Man muss sich ja auch nicht �berall einmischen ...
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Gut! Es geh�rt dir.
	WhatsThat					=	"SVM_11_WhatsThat"						;//Was war denn das?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Du tr�gst meine Waffe ... ?
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//Komm, gib schon her!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Behalt's, ich brauch's sowieso nicht.
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Sie haben einen unserer Jungs erwischt. Wenn ich das Schwein kriege ...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Was ist denn los?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Haste was aufs Maul gekriegt? Geschieht dir recht!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Du hast einen der Erzbarone besiegt. Das war eindrucksvoll, aber dumm. Sehr dumm.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Du hast einen der Gurus besiegt.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Einen Magier zu besiegen ... ist nicht besonders clever!
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Ich besch�tze die Jungs hier und du hast einen von ihnen umgehauen ...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Wenn du dich an den Buddlern vergreifst, vergreifst du dich an meiner Kasse!
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Wer meine Kameraden verletzt, verletzt mich.
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Vergreif dich noch einmal an unseren Jungs und es wird dir Leid tun.
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Meine Sch�tzlinge anzugreifen kann dich den Kopf kosten.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Du wagst es, mir unter die Augen zu treten, dreckiger Dieb?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//Du hast einige Sachen, die uns geh�ren. Gib sie besser wieder her.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Mann! Du hast die Erzbarone beklaut! Na, die werden toben!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Du hast die Gurus um ein paar Sachen erleichtert, was?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Du hast die Magier um ein paar Sachen erleichtert, was?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Du hast die Regel Nr.1 gebrochen! Kein T�ten!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist verstorben und dein Name wird dabei erw�hnt ...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint, warst du das!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//Das war ein guter Kampf. Die Schmerzen werde ich noch tagelang sp�ren. Aber jetzt ist gut!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_11_Om"							;//Ommm
};


instance SVM_12	(C_SVM)		//Bazaar-H�ndler		Nach au�en freundlich,jovial,Innen hinterh�ltig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//Pack die Magie weg!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Wenn ich 'Magie weg' sage, dann mein' ich das auch so!
	WeaponDown					=	"SVM_12_WeaponDown"						;//Was hast du mit der Waffe vor, Mann!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Steck weg, das Ding!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Du zielst auf mich!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Wenn du nicht aufh�rst, gibt's �rger!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Hey, bist du blind oder was?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Den kleinen Streit vergessen wir, okay?
	Strange						=	"SVM_12_Strange"						;//Eben war er doch noch da!? Seltsam! 
	DieMonster					=	"SVM_12_DieMonster"						;//Du bist f�llig, Mistvieh!!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//Jetzt wird abgerechnet!
	NowWait						=	"SVM_12_NowWait"						;//Du brauchst wohl dringend was hinter die Ohren!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Hast du immer noch nicht genug?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//Na gut, du willst es scheinbar so!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Hier werden sie dich raustragen m�ssen!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Ich hab' dich gewarnt. Wer an meine Sachen geht, kriegt �rger!
	DirtyThief					=	"SVM_12_DirtyThief"						;//Du Dieb! Ich bring' dir Manieren bei!
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Niemand vergreift sich ungestraft an meinen Jungs!
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Du hast einen meiner Jungs platt gemacht. Jetzt mach' ich DICH platt!
	Dead						=	"SVM_12_Dead"							;//Aaargl
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Das wird dir noch Leid tun!
	YesYes						=	"SVM_12_YesYes"							;//Bleib locker! Hast gewonnen.
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//Das ist 'ne Nummer zu gro�! Ich hau ab!
	Help						=	"SVM_12_Help"							;//Verdammt!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//Beim n�chsten Mal sieht die Sache anders aus!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//Versuch das nicht noch mal!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//Die Waffe gef�llt mir!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Ich sorg daf�r, dass dein Erz gut angelegt wird!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//Mist! Kein Erz!
	HandsOff					=	"SVM_12_HandsOff"						;//Finger weg!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Raus hier!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Hey! Wo kommst du denn her?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//H�ltst du mich f�r so d�mlich?!
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Weshalb schleichst du hier rum?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Raus hier, sonst rufe ich die Wachen!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Du hast da drinnen nichts verloren!
	WiseMove					=	"SVM_12_WiseMove"						;//Du lernst schnell!
	Alarm						=	"SVM_12_Alarm"							;//Wachen, hierher!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//ALARM!!!!
	BehindYou					=	"SVM_12_BehindYou"						;//Hey, pass auf!
	TheresAFight				=	"SVM_12_TheresAFight"					;//Ein Kampf!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Drauf!
	CheerFight					=	"SVM_12_CheerFight"						;//Gut so!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Hau ihn endlich um!
	Ooh							=	"SVM_12_Ooh"							;//Pass doch auf!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//Wurde aber auch Zeit!
	RunCoward					=	"SVM_12_RunCoward"						;//Der Typ verdr�ckt sich!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Klarer Sieger, w�rde ich sagen!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Es hat den Richtigen erwischt!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Einfach einen kaltmachen. Du hast jetzt echt ein Problem!
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Was f�r ein Kampf!
	Awake						=	"SVM_12_Awake"							;//G����hn 
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Hallo, Freund!
	ALGreetings					=	"SVM_12_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_12_MageGreetings"					;//Magie zu Ehren!
	SectGreetings				=	"SVM_12_SectGreetings"					;//Erwache!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Da dr�ben.
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//So unerfahren, wie du bist, kann ich dir nichts beibringen.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_12_HeyYou"							;//Hey du!
	NotNow						=	"SVM_12_NotNow"							;//Nicht jetzt.
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//Kann ich dir helfen?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Was willst du?
	MakeWay						=	"SVM_12_MakeWay"						;//Lass mich mal durch.
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//Na los, lass mich vorbei!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Bist du taub oder suchst du Streit?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Willst du dich noch mal mit mir anlegen?
	LookAway					=	"SVM_12_LookAway"						;//War irgendwas? Ich hab' NICHTS gesehen ...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Schon gut, behalt es!
	WhatsThat					=	"SVM_12_WhatsThat"						;//Was war denn das?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//Ich w�rde es vorziehen, meine Waffe zur�ckzubekommen!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Gib schon her!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//Na ja, auch nicht so schlimm! Ich hab' noch mehr davon!
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Sie haben einen unserer Jungs erwischt. Wenn ich das Schwein kriege ...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hm, was soll denn das? Warum weckst du mich?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//Na? Haste was aufs Maul gekriegt? Geschieht dir Recht!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Du hast einen Erzbaron umgehauen. Er war beeindruckt!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Du hast einen der Gurus besiegt. Respekt. Aber lass dir nicht einfallen, das noch mal zu probieren.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Einen Magier zu besiegen ... Du bist ja einer!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Du hast sie ja wohl nicht alle, einfach einen Novizen umzuhauen.
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Was f�llt dir eigentlich ein, einen Buddler zu verkloppen?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Du hast einen Kumpel von mir ausgeknockt, was sollte das?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Vergreif dich noch einmal an unseren Jungs und es wird dir Leid tun.
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Du bist echt zu mutig, einen meiner Sch�tzlinge anzufassen, kann dich teuer zu stehen kommen.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Du wagst es mir unter die Augen zu treten, dreckiger Dieb?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Du hast einige Sachen, die uns geh�ren. Gib sie besser wieder her.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Mann! Du hast die Erzbarone beklaut! Die werden toben!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Du hast die Gurus beklaut! Wenn du dich wenigstens nicht erwischen lassen w�rdest!
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Die Magier m�gen es nicht, wenn man in ihren Sachen rumst�bert!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist tot und du sollst damit zu tun haben ...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//Die Bruderschaft ist um einen Anh�nger �rmer, und wie es scheint, hast du ihn beseitigt!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Du hast mir ganz sch�n aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird  ...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_12_Om"							;//Ommm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, �bereifrig, �hnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y�berion blind,	Mitl�ufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//Steck die Magie weg!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Pack sie weg, WEG!!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Die Waffe weg!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Weg mit der Waffe!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//Auf mich zielen? Pass auf du!
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Du bist auf dem besten Wege zu sterben. Ziel gef�lligst woanders hin!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//Was soll das werden?!
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Den Streit vergessen wir, okay?
	Strange						=	"SVM_13_Strange"						;//Wo ist er hin? Das kann nicht sein!
	DieMonster					=	"SVM_13_DieMonster"						;//Heute Abend gibt es Fleisch!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//Du bist dran! Keine Gnade!
	NowWait						=	"SVM_13_NowWait"						;//Das gibt Pr�gel ...
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//Du willst es doch wohl nicht noch mal versuchen?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//Du wolltest es so!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Jetzt gehts dir an den Kragen, Eindringling!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Die Finger sollte ich dir abschneiden!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Dreckiger Dieb! Ich werde dir die H�nde brechen ...
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//Wenn hier jemand Pr�gel austeilt, bin ich das!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Du hast einen von uns gekillt!
	Dead						=	"SVM_13_Dead"							;//Aaargl
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Du wirst wenig Zeit haben, das zu bereuen!
	YesYes						=	"SVM_13_YesYes"							;//Kein Problem, es gibt kein Problem!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Ich hab' nicht die richtige Waffe. Wir sehen uns ...
	Help						=	"SVM_13_Help"							;//Woooooaaahhh! Weg hier!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//Wir sprechen uns noch!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//Beim n�chsten Mal bring ich dich um!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//Nette Waffe! Geh�rt die dir? Nein? Okay!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Du hast bestimmt nichts dagegen, wenn ich etwas Erz behalte.
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Du hast je nicht mal etwas Erz in den Taschen!
	HandsOff					=	"SVM_13_HandsOff"						;//Du Ratte! Finger weg! Dir zeig' ich's!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Verzieh Dich! Raus hier!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Was machst du denn hier?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Du versuchst tats�chlich mich zu verarschen!
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Hey du! Was schleichst du da rum?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Was machst du hier? Geh oder ich ruf die Wachen!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Du hast da drinnen nichts zu suchen!
	WiseMove					=	"SVM_13_WiseMove"						;//Dein Gl�ck! Aber ich h�tte dir auch gerne die Fresse poliert!
	Alarm						=	"SVM_13_Alarm"							;//Wachen, zu mir!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//ALARM!!
	BehindYou					=	"SVM_13_BehindYou"						;//Hinter dir!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Mal sehen, wer gleich Staub schluckt.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Ja, noch mal!
	CheerFight					=	"SVM_13_CheerFight"						;//Ich will Blut sehen!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Mach ihn fertig!!
	Ooh							=	"SVM_13_Ooh"							;//Wehr Dich, du Flasche!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Jaaaa!!!
	RunCoward					=	"SVM_13_RunCoward"						;//Ja, verschwinde!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//K�mmerliche Vorstellung! Ein kleiner Windsto� und er w�re auch umgefallen.
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Pah, geschieht ihm recht!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//Du bist wirklich lebensm�de, vor Zeugen jemand kalt zu machen.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Netter Kampf!
	Awake						=	"SVM_13_Awake"							;//G���hn!!
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Alles klar bei dir?
	ALGreetings					=	"SVM_13_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_13_MageGreetings"					;//Magie zu Ehren!
	SectGreetings				=	"SVM_13_SectGreetings"					;//Erwache!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Bist du blind? Da vorne!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_13_HeyYou"							;//Hey du!
	NotNow						=	"SVM_13_NotNow"							;//Nicht jetzt!
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Was willst du von mir?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Kann ich was f�r dich tun?!
	MakeWay						=	"SVM_13_MakeWay"						;//Lass mich vorbei.
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Mach Platz!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Suchst du Streit? Weg da!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Willst du dich noch mal mit mir anlegen?
	LookAway					=	"SVM_13_LookAway"						;//Ich hab' NICHTS gesehen!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Ganz ruhig. Das Teil geh�rt dir.
	WhatsThat					=	"SVM_13_WhatsThat"						;//Was war denn das?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Gib mir meine Waffe zur�ck!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Her damit!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//Auch gut! Behalt es! Ich finde 'ne andere L�sung!
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Einer von uns hat ins Gras gebissen! Das schreit nach Rache!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Warum weckst du mich?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Geschieht dir recht, dass du 'ne Abreibung bekommen hast!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Du hast einen Erzbaron umgehauen. Er ist so richtig w�tend!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Du hast einen Guru niedergeschlagen. Irgendwie ziehst du �rger an!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Einen Magier zu besiegen ist 'ne wirklich beschissene Idee!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//Du verpr�gelst also die Novizen!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Lass die Finger von meinen Jungs!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Dich an meinen Kumpels zu vergreifen ist echt keine gute Idee.
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Das l�uft nicht, dass du hier Unruhe stiftest!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Wenn du jemand verpr�gelst, der unter meinem Schutz steht, hat das Konsequenzen!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Du Arsch hast mich beklaut! Versuch das nicht noch mal!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Wir wollen unsere Sachen wieder haben! Lass sehen!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Du hast die Erzbarone beklaut! Was soll der Schei�?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Du hast die Gurus beklaut? Zu bl�d, dass es rausgekommen ist!
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Du hast die Magier beklaut! Eine echt beschissene Idee!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//Einer unserer eigenen Leute ist tot und du hast damit zu tun! Der kleinste Fehler noch und du bist Freiwild!
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Du hast einen Magier umgebracht! Wie zum Teufel sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist tot und dein Name wird dabei erw�hnt ...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint, warst du das!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Du hast mir ganz sch�n aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ... aber behalt's f�r dich, muss nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_13_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erz�hler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Steck den Zauber weg!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//H�rst du nicht, steck den Zauber weg!
	WeaponDown					=	"SVM_14_WeaponDown"						;//Was willst du mit der Waffe?
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Steck die Waffe ein!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Du hast mich im Visier!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//W�rdest du aufh�ren, auf mich zu zielen!
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Pass doch auf!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Vergessen wir unsere Meinungsverschiedenheit!
	Strange						=	"SVM_14_Strange"						;//Ein guter Trick, er ist einfach verschwunden!
	DieMonster					=	"SVM_14_DieMonster"						;//L�stige Kreatur.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Nimm es nicht pers�nlich, dass ich dich t�ten muss!
	NowWait						=	"SVM_14_NowWait"						;//Das reicht jetzt!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//Du willst doch nicht wieder �rger?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Du wolltest es so haben!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Du kommst ungebeten!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//Mein Besitz ist nichts f�r dich!
	DirtyThief					=	"SVM_14_DirtyThief"						;//Du hast dir etwas von mir geliehen! Jetzt musst du auch daf�r bezahlen!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Du musst lernen, dich an die Regeln zu halten!
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Du hast jemanden get�tet!
	Dead						=	"SVM_14_Dead"							;//Aaargl
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Das wirst du noch bereuen!
	YesYes						=	"SVM_14_YesYes"							;//Schon gut, schon gut!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Dieser Herausforderung will ich mich jetzt nicht stellen.
	Help						=	"SVM_14_Help"							;//Ich muss mich meinen Studien widmen!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Wir sehen uns sicher wieder!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//Tu das besser nicht noch mal!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Die Waffe nehm' ich an mich!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Das Erz ist sicher n�tzlich!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//Du hast kein Erz.
	HandsOff					=	"SVM_14_HandsOff"						;//Finger weg!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Raus hier!
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Wie konntest du hier 'reinkommen?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Du beliebst wohl zu scherzen!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Warum schleichst du?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Geh einfach wieder, bevor ich die Wachen rufe!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Da drin hast du nichts zu suchen! Verstanden?
	WiseMove					=	"SVM_14_WiseMove"						;//Kluge Entscheidung!
	Alarm						=	"SVM_14_Alarm"							;//Wachen, hier, hier!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//EINDRINGLING!!!
	BehindYou					=	"SVM_14_BehindYou"						;//Hinter dir!
	TheresAFight				=	"SVM_14_TheresAFight"					;//Ein Kampf!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Na ja.
	CheerFight					=	"SVM_14_CheerFight"						;//Wie uneffektiv!
	CheerFriend					=	"SVM_14_CheerFriend"					;//Sieht anstrengend aus!
	Ooh							=	"SVM_14_Ooh"							;//Schmerzhaft!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//So geht's auch ...
	RunCoward					=	"SVM_14_RunCoward"						;//Er hat was gelernt!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//Das war's ja dann wohl
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Geschieht ihm recht!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Ihn umzubringen war unn�tig und wird dir gro�e Probleme machen!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Diese K�mpfe langweilen mich!
	Awake						=	"SVM_14_Awake"							;//hab' ich etwa geschlafen?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Sei gegr��t.
	ALGreetings					=	"SVM_14_ALGreetings"					;//F�r Gomez!
	MageGreetings				=	"SVM_14_MageGreetings"					;//Magie zu Ehren!
	SectGreetings				=	"SVM_14_SectGreetings"					;//Erwache!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Da vorne ist er.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Du bist am Ende deiner M�glichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//Du bist jetzt schon besser!
	HeyYou						=	"SVM_14_HeyYou"							;//He du!
	NotNow						=	"SVM_14_NotNow"							;//Nicht jetzt.
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Was kann ich f�r dich tun?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Kann ich dir helfen?
	MakeWay						=	"SVM_14_MakeWay"						;//Geh zur Seite.
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Lass mich vorbei.
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Verschwinde endlich!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Willst du dich noch mal mit mir anlegen?
	LookAway					=	"SVM_14_LookAway"						;//Was ihr da macht, interessiert mich nicht!
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Behalt es!
	WhatsThat					=	"SVM_14_WhatsThat"						;//Was war denn das?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Gib mir meine Waffe zur�ck.
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Her damit!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//Schon gut. Ich will es nicht mehr!
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Einer von uns wurde get�tet. Wir finden den Schuldigen ...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Du st�rst meine Studien!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//Du hattest Probleme, hab' ich geh�rt!
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Du hast einen Erzbaron umgehauen. Er war beeindruckt!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Du hast einen der Gurus besiegt. Respekt.
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Einen Magier zu besiegen ...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Du wei�t, dass die Novizen unter meinem Schutz stehen. Und trotzdem vergreifst du dich an ihnen?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Wenn du dich an Buddlern vergreifst, vergreifst du dich an meiner Kasse!
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Du solltest dich nicht mit meinen Freunden anlegen.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Vergreif dich noch einmal an unseren Jungs und es wird dir Leid tun.
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Einen meiner Sch�tzlinge anzugreifen kann dich den Kopf kosten.
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Du wagst es mir unter die Augen zu treten, dreckiger Dieb?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Du hast einige Sachen, die uns geh�ren. Gib sie besser wieder her.
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Mann! Du hast die Erzbarone beklaut! Die werden toben!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Du hast die Gurus um ein paar Sachen erleichtert.
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Du hast die Magier um ein paar Sachen erleichtert.
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Du hast einen von uns auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Du hast einen Erzbaron umgelegt! Mann, du bist wohl komplett durchgedreht!?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Du hast einen Guru get�tet! Junge, das kann doch nicht wahr sein!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Du hast einen Magier umgebracht! Wie sollen wir das denn erkl�ren?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Jemand aus dem Alten Lager ist verstorben und dein Name wird dabei erw�hnt ...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Das Neue Lager hat einen tragischen Verlust erlitten, und scheinbar hast du damit zu tun!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//Die Bruderschaft ist um einen Anh�nger �rmer und wie es scheint, warst du das!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//Das wieder hinzubiegen wird nicht einfach!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//Du hast mir ganz sch�n aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ... wenn du meinst ...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ... kann schon sein ...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ... war nicht besonders schlau ...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ... ich halt mich da lieber raus ...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ... das ist wirklich nicht mein Problem ...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ... war doch klar, dass das �rger gibt ...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ... aber behalt's f�r dich, muss ja nicht gleich jeder wissen ...
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ... das passiert mir nicht noch mal ...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ... an der Geschichte muss doch wohl was dran sein ...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ... man muss eben aufpassen, was man rumerz�hlt ...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ... solange ich damit nichts zu tun habe ...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ... man darf auch nicht alles glauben, was man h�rt ...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ... immer wieder dieselbe Leier ...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ... manche lernen eben gar nichts dazu ...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ... fr�her w�re das ganz anders gelaufen ...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ... gequatscht wird viel ...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ... ich h�r' nicht mehr auf das Gefasel ...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ... ich glaube kaum, dass sich daran was �ndern wird ...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ... wahrscheinlich hast du Recht ...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ... erst mal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird ...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ... ich dachte, das w�re schon lange gekl�rt ...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ... lass uns lieber �ber was anderes reden ...
	Om							= 	"SVM_14_Om"							;//Ommm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hey du!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Warte mal!

	SectGreetings			=	"SVM_15_SectGreetings"				;//Erwache!
	ALGreetings				=	"SVM_15_ALGreetings"				;//F�r Gomez!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Sei gegr��t!
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Hi!
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargl
	Awake					=	"SVM_15_Awake"						;//
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Funktioniert nicht
	PickBroke				= 	"SVM_15_PickBroke"					;// Hm, abgebrochen.
	NeedKey					= 	"SVM_15_NeedKey"					;// Daf�r brauch' ich den Schl�ssel ...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// Keine Dietriche mehr ...
	InvFull					= 	"SVM_15_InvFull"					;// Mehr kann ich nicht tragen.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Geh schon! Du darfst nicht mit mir reden!
	Help						=	"SVM_16_Help"			;	//
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Aargh
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Aargh
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Aargh
	Dead						=	"SVM_16_Dead"			;	//Aaargl
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverst�ndlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//�ber Stimme 17, sind aber in halbwegsverst�ndlichem orkisch-deutsch
												//Das hier �berall vergebene "SVM_17_OrcSound01" wird noch durch 9 weitere Variationen erg�nzt

// FIXME: mehr Varianten!?
{
	StopMagic					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	ISaidStopMagic				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WeaponDown					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
/*
	ISaidWeaponDown				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	WatchYourAim				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WatchYourAimAngry			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatAreYouDoing				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	LetsForgetOurLittleFight	=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Strange						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	DieMonster					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	DieMortalEnemy				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	NowWait						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	YouStillNotHaveEnough		=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouAskedForIt				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	NowWaitIntruder				= 	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	DirtyThief					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouAttackedMyCharge			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouKilledOneOfUs			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Dead						=	"SVM_17_Dead"				;//Aaaarglll....
	Aargh_1						=	"SVM_17_Aargh_1"			;//Aargh!
	Aargh_2						=	"SVM_17_Aargh_2"			;//Aargh!
	Aargh_3						=	"SVM_17_Aargh_3"			;//Aargh!
	Berzerk						=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YoullBeSorryForThis			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	ShitWhatAMonster			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Help						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WeWillMeetAgain				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	NeverTryThatAgain			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	ITakeYourWeapon				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	ITookYourOre				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	ShitNoOre					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	HandsOff					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	GetOutOfHere				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouViolatedForbiddenTerritory=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatsThisSupposedToBe		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WhyAreYouInHere				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatDidYouInThere			=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	WiseMove					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Alarm						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	IntruderAlert				= 	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	BehindYou					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	CheerFight					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	CheerFriend					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Ooh							=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	HeDefeatedHim				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	HeKilledHim					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Awake						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	FriendlyGreetings			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	HeyYou						=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	NotNow						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WhatDoYouWant				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	ISaidWhatDoYouWant			=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	MakeWay						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	OutOfMyWay					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	YouDeafOrWhat				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	LookingForTroubleAgain		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	GiveItToMe					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouDisturbedMySlumber		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouStoleFromMe				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouStoleFromUs				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouKilledMyFriend			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
*/

};



// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	18;




