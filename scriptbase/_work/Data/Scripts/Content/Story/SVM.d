// **********************************************
// Standard	Voice Module
// **********************************************

// Diese Klasse	kann beliebig von den Skriptern	erweitert um
// "VAR	STRING xxxx" erweitert werden, diese können	dann in	den
// einzelnen SVM - Instanzen initialisiert werden.


CLASS C_SVM
{
// SC hat Waffe oder Magie gezogen oder zielt auf NSC
	VAR	STRING	StopMagic;					// NSC  sieht wie in seiner Nähe gezaubert wird -> er fordert auf, damit aufzuhören!
	VAR	STRING	ISaidStopMagic;				// NSC hat bereits mit $StopMagic gewarnt und greift nun an	(nachdem er	diesen Satz	gesagt hat;	WICHTIG: dies ist KEINE	letzte Warnung,	sonder sofort Angriff!)

	var string	WeaponDown				;	//ZS_AssessFighter: SC steht mit gezogener Waffe vor NSC -> NSC ist NEUTRAL zu SC	-> (herausfordernd,	bei	Pünten-Stimme etwas	unsicher, trotzdem kernig)
	var string	ISaidWeaponDown			;	//Kommt nachdem der SC $WeaponDown ignoriert hat!

	VAR	STRING	WatchYourAim;				// ein FRIENDLY-SC zielt mit einer Fernkampfwaffe auf den NSC .	'Paß auf! Ziel woanders	hin!' B_Orc_AssessThreat hat das auch noch
	var string	WatchYourAimAngry		;	// SC zielt mit einer Fernkampfwaffe auf den Angry-NSC. (genervte Auffordern, damit	aufzuhören)
	VAR	STRING	WhatAreYouDoing;			// NSC wird von einem FRIENDLY-SC/NSC geschlagen

// SC hat Waffe weggesteckt, NSC beendet Kampf
	VAR	STRING	LetsForgetOurLittleFight;	//Friede, kann direkt kommen ( Wenn freundliche kämpfen und der Spieler die Waffe wegsteckt) oder als Reaction über das news-Gedächtnis, sollte daher Zeitneutral sein (--> nicht wie jetzt lass uns den Streit von letztens vergessen

// NSC hat Gegner aus den Augen verloren
	VAR	STRING	Strange			;			// 1. NSC wird attackiert -> rennt mit gezogener Waffe zum Angreifer ->	kann ihn plötzlich nicht mehr entdecken	-> (muttering to himself)
											// 2. NSC sieht	einen Mord -> rennt	mit	gezogener Waffe	zum	Mörder -> kann ihn plötzlich nicht mehr	entdecken

// NSC greift an!
	var string	DieMonster				;	// NSC greift Monster an -> "Aus dir mach ich Gulasch, Drecksvieh!"
	var string	DieMOrtalEnemy;				// Der Nsc greift an, da er durch die Story permanent Hostile ist, d.h. die Lager sind in Blutfehde

	VAR	STRING	NowWait;					// NSC hat den SC früher noch NICHT besiegt -> SC greift den NSC an -> "Na warte!"
	VAR	STRING	YouStillNotHaveEnough	;	// NSC hat den SC früher besiegt ->	SC greift den NSC an -> "Hast du immer noch nicht genug?!"

	var	string	YouAskedForIt			;	// 1. SC hat eine Aufforderung ignoriert: den Raum zu verlassen, ein Item zurückzugeben, seine Waffe wegzustecken -> "Wer nicht hören will muß fühlen..."
	var string	NowWaitIntruder			;	// SC hat einen bewachten Durchgang durchbrochen...

	var	string	IWillTeachYouRespectForForeignProperty;	// 1. SC benutzt ein Besitz-Mob(Tür,Fallgitter-Drehkreuz,Kiste,...) und	wird ohne Vorwarnung attackiert
											// 2. SC trägt Waffe des NSCs -> NSC ist stärker und holt sie sich mit Gewalt wieder ->	vorher dieser Spruch

	VAR	STRING	DirtyThief;					// 1. NSC ertappt den (schwächeren)	SC mit den Fingern in den eigenen Taschen
											// 2. NSC sieht	wie	der	(schwächere) SC	etwas nimmt, daß ihm gehört	(z.B. Waffe	auf	den	Tisch)
											// 3. NSC sieht	feindlichen, schwächeren SC, der ihn vorher	mal	beklaut	hat	und	sagt ihm diesen	Spruch,	bevor er angreift "Da hab ich Dich also	wieder,	Du dreckiger Dieb"
											// 4. Nsc ist in einen Raum eingedrungen

	var string	YouAttackedMyCharge		;	// SC/NSC greift einen Schützling einer NSC-Wache an -> Wache attackiert den Angreifer danach
	var string	YouKilledOneOfUs;			// NSC erblickt feindlichen SC, der einen Freund des NSCs getötet hat -> Angriff!

// im Kampf
	VAR	STRING	Dead			;			// Tödlich verletzt
	VAR	STRING	Aargh_1			;			// Treffer kassiert im Kampf
	VAR	STRING	Aargh_2			;			// Treffer kassiert im Kampf
	VAR	STRING	Aargh_3			;			// Treffer kassiert im Kampf

	var string	Berzerk			;			// Wahnsinnsschrei im Zustand der Raserei!

// SC hat NSC niedergeschlagen oder bedroht
	VAR	STRING	YoullBeSorryForThis;		// NSC wurde durch SC/aNSC besiegt und wacht aus der Ohnmacht wieder auf: 'Das wird	Dir	noch leidtun!'

	VAR	STRING	YesYes			;			// 1. NSC wurde	im Kampf besiegt ->	erwacht	wieder ist aber	schächer als sein Kontrahent
											// 2. SC zieht Waffe oder nähert sich mit Waffe und NSC ist schwächer als SC
// NSC flieht
	var string	ShitWhatAMonster		;	// NSC flieht vor zu starkem Monster -> "Scheiße, was ein Höllenvieh. Nichts wie weg!"
	VAR	STRING	Help;						// NSC flieht vor Gegner, Babe Nsc flieht vor Spieler, Orcs haben das auch
	var	STRING	WeWillMeetAgain;			// NSC flieht vor Gegner, ist aber eigentlich Stärker als er, ist aber trotzdem besiegt worden

// SC wurde von NSC besiegt und wird geplündert
	VAR	STRING	NeverTryThatAgain	;		// NSC hat Gegner besiegt -> ("Versuch das NIE wieder!!")
	var string	ITakeYourWeapon;			// NSC plündert bewußtlosen SC/aNSC. Während er sich bückt, um nach der vom Besiegten fallengelassenen Waffe zu greifen sagt er diesen Spruch.
	VAR	STRING	ITookYourOre	;			// NSC plündert bewußtlosen SC/aNSC. Nachdem er sich einen Teil des Erzes genommen hat, sagt er diesen Spruch.
	var string	ShitNoOre		;			// NSC ärgert sich darüber, daß er beim Durchsuchen eines bewußtlosen/toten Körpers kein Erz gefunden hat!

// NSC verwarnt SC
	VAR	STRING	HandsOff;					// SC manipuliert ein MOB (Drehkreuz, Truhe, Tür) und ein befreundeter bzw. gildengleicher NSC sieht das...
	VAR	STRING	GetOutOfHere		;		// NSC erwischt	schwächeren	SC in seiner Hütte -> ("Raus hier")	(SC	soll aus Raum gehen)
	var	string	YouViolatedForbiddenTerritory		;	// SC wird beim Betreten eines verbotenen Portalraums erwischt -> Warnung!

	var	STRING	YouWannaFoolMe;				// SC schnappt NSC ein Item vor der Nase weg und wird mit $GiveItToMe aufgefordert es zurückzugeben -> SC gibt ein falsches Item an den NSC -> 'Willst Du mich verarschen'

	VAR	STRING	WhatsThisSupposedToBe	;	// 1. SC schleicht vor den Augen des NSCs -> "Was schleichst Du	hier rum?" (besser als "Was	soll das denn werden", weil	besseres Feedback!)
											// 2. SC bewegt	sich hinter	einer Wache	-> diese dreht sich	um und sagt	dann
	var string	WhyAreYouInHere			;	//im ZS_ClearRoom / SC steht in verbotenem Portalraum	-> schwächerer NSC fragt
	var string	WhatDidYouInThere		;	// Wache sieht Sc aus einer Hütte rauskommen und verwarnt ihn, ohne das ein Angriff folgt

	VAR	STRING	WiseMove;					// 1. NSC wurde	gewarnt, seine Waffe wegzustecken ($RemoveYourWeapon) -> SC	befolgt	dies und steckt	die	Waffe weg
											// 2. SC steht in verbotenem Raum und wird mit $GetOutOfHere aufgefordert, rauszugehen -> SC befolgt die Aufforderung
											// 3. SC hat NSC ein Item vor der Nase weggeschnappt und wurde mit $GiveItToMe aufgefordert	es zurückzugeben ->	SC gehorcht

// NSC alarmiert/warnt andere NSCs vor SC
	VAR	STRING	Alarm;						// Wache alarmiert die Sichtung	eines permanent	HOSTILE	SC/aNSC	"Alaaaaaaarm!!!!!"
											// Nicht Wache sieht wie ein Portalraum betreten wird, der einer Gilde zugeordnet ist und ruft die Wachen
											// Gemüse (NpcWorker) ruft Wachen nach einem Diebstahl/beobachteten Diebstahl etc.
	var string	IntruderAlert;				// SC hat einen bewachten Durchgang durchbrochen und die Wache alarmiert alle umstehenden
	VAR	STRING	BehindYou;					// NSC sieht, wie ein anderer NSC vom SC bestohlen wird	und	warnt das Opfer

// NSC beobachtet Kampf
	var	string	TheresAFight	;			// NSC entdeckt	einen Kampf	und	will zuschauen (ZS_WatchFight) -> vorher ein Spruch	wie	"Hey da	drüben gibt's einen	Kampf"
	VAR	STRING	HeyHeyHey;					// Hintergrund anfeuern	beim Beobachten	eines Kampfes: 'Hau	ihm	aufs Maul!'	(kommt alle	paar Sekunden!)
	VAR	STRING	CheerFight;					// NSC ist im Zustand WatchFight: Neutraler	Kämpfer	schlägt irgendeinen Typen. '5 Erz auf den Dicken'
	VAR	STRING	CheerFriend;				// NSC ist im Zustand WatchFight: Freund landet	einen Treffer. 'Immer in die Fresse!'
	VAR	STRING	Ooh;						// NSC ist im Zustand WatchFight: Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var	STRING	YeahWellDone;				// NSC sieht, wie SC/aNSC, zu dem er ANGRY/HOSTILE ist getötet wird. 'Gut gemacht, das hat sie Sau verdient.'

// NSC-Gegner flieht
	VAR	STRING	RunCoward;					// 1. Der NSC befindet sich	im Zustand WatchFight -> einer der Kämpfer haut	ab
											// 2. Der Gegner des NSCs flieht
	var	string	HeDefeatedHim	;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC besiegt 	(WICHTIG: dies ist der normale Ausgang!)
	var	string	HeDeservedIt	;			// NSC sieht wie ein SC/aNSC, zu dem er	ANGRY/HOSTILE steht, besiegt wird -> ("DAS hat er verdient!")
	var	string	HeKilledHim		;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC tötet	(WICHTIG: dies ist ein Skandal, niemand wird normalerweise	in einer "Schlägerei" getötet)
	var	string	ItWasAGoodFight	;			// NSC sieht wie ein FRIENDLY/NEUTRAL-SC/aNSC einen	anderen	besiegt

	VAR	STRING	Awake			;			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, räkeln)

// Grüße
	VAR	STRING	FriendlyGreetings;			// 1. Am Anfang	eines Dialoges, wenn NSC FRIENDLY/NEUTRAL zum SC,  2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	ALGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC aus Altem Lager und FRIENDLY/NEUTRAL ('Für Gomez'), 2. Wenn sie sich unterwegs begegnen.
	var	STRING	MageGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC beide Magier und FRIENDLY/NEUTRAL, 2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	SectGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC aus Psi-Camp und FRIENDLY/NEUTRAL	zum	SC ('Erwache. Der Schläfer erwache.') 2. Wenn sie sich unterwegs begegnen.

	var string	ThereHeIs;					// NSC zeigt SC wo ein anderer NSC steht nach dem der SC gefragt hat: "Da drüben ist er"

// Lehrer-Kommentare
	var string	NoLearnNoPoints			;	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string	NoLearnOverMax			;	// NSC-Lehrer verbietet Attribut-Steigerung über 100
	var string	NoLearnYouAlreadyKnow	;	// Du mußt erst Fortgeschritten sein, bevor du ein Meister werden kannst!
	var string	NoLearnYoureBetter		;	// Du bist jetzt schon besser!

// NSC spricht SC an
	VAR	STRING	HeyYou;						// z.B. Wache, die den SC im Räumen erwischt, wo er nicht hin darf sagt HeyYou, und geht dann zum SC

// NSC will nicht reden
	VAR	STRING	NotNow;						// NSC / Babe wird vom SC angesprochen,	lehnt aber ein Gespräch	ab.

// SC zu nah
	VAR	STRING	WhatDoYouWant;				// SC rückt NSC zu dicht auf die Pelle -> "Kann ich was für Dich tun?"
	VAR	STRING	ISaidWhatDoYouWant;			// NSC hat $WhatDoYouWant gesagt, aber der SC hat nicht reagiert -> "Was willst Du?"
// SC im Weg
	VAR	STRING	MakeWay;					// SC steht	schwächerem NSC im Weg	-> Aufforderung, Platz zu	machen
	VAR	STRING	OutOfMyWay;					// SC steht stärkerem NSC (Magier, Erzbaron) im Weg -> aggressive Aufforderung, Platz zu machen
	VAR	STRING	YouDeafOrWhat;				// SC folgt	nicht der Aufforderung des stärkeren NSCs	-> letzte Warnung, danach Angriff

// SC spricht NSC an, der ihn besiegt hat
	VAR	STRING	LookingForTroubleAgain;		//Erster Satz eines Dialoges, nachdem der NSC und der SC gekämpft haben (entweder wurde der SC besiegt oder es gab keinen klaren Ausgang des Kampfes)

// NSC ist schwächer...
	var string	LookAway;					// Eingeschüchterter NSC guckt weg bei bedrohlichen Situationen
	VAR	STRING	OkayKeepIt;					// SC trägt	Waffe des schächeren NSCs -> NSCs verlangt die Waffe zurück	($GiveItToMe) -> SC	bedroht	NSC	-> ("Okay, okay, du	kannst das Ding	behalten..." zurückweichen)
	VAR	STRING	WhatsThat;					// Verwandelter SC wird vor den Augen des NSCs wieder zum Menschen (Erschreckter Ausruf) Nsc wird aus dem MagicSleep wieder wach und wundert sich...

	VAR	STRING	ThatsMyWeapon;				// SC trägt	eine Waffe,	die	dem	NSC	gehört -> Folge: ZS_GetBackBelongings
	VAR	STRING	GiveItToMe;					// 1. SC trägt Waffe des NSCs -> NSC ist schwächer (also kein Kampf) ->	"Gib sie mir wieder"
	VAR	STRING	YouCanKeeptheCrap;			// 1. SC trägt Waffe des schwächeren NSCs ->	NSCs verlangt die Waffe	zurück ($GiveItToMe) ->	SC geht	einfach	weg	-> ("Behalt	das	Scheiß-Ding	doch!)
											// 2. NSC will ein Item	aufheben und wird von einem	stärkeren NSC gewarnt, der das auch	tun	will ->	unser NSC weicht zurück

	VAR	STRING	TheyKilledMyFriend;			// NSC Täter - NSC zu Opfer freundlich, zu Täter freundlich oder neutral

	var	string	YouDisturbedMySlumber;		// NSC wurde vom SC	mittelsanft	aus	dem	Schlaf gerissen	(z.B. durch	Ansprechen)

// Angry NSCs kommentieren SC-Aktionen
	VAR	STRING	SuckerGotSome;				// Angry NSC hat gehört, daß der SC umgehauen wurde. "Das Dich jemand umgehauen hat, geschieht Dir Recht!"

	VAR	STRING	SuckerDefeatedEBr;			// Du hast einen	EBR	besiegt. Er war wirklich beeindruckt!
	VAR	STRING	SuckerDefeatedGur;			// Du hast einen	GUR	niedergeschlagen,	Du bist	ein	toter Mann
	VAR	STRING	SuckerDefeatedMage;			// (News) - im Stil von SuckerDefeatedXY

	var string	SuckerDefeatedNOV_Guard;	// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist ANGRY zu Spieler
	var string	SuckerDefeatedVLK_Guard;	// Der Spieler hat einen Schützling der Wache niedergeschlagen
	var string	YouDefeatedMyComrade;		// Wache stellt fest, das sie gesehen/gehört hat, daß ich eine andere Wache umgehauen habe
	var string	YouDefeatedNOV_Guard;		// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist NEUTRAL/FRIENDLY zu Spieler
	var string	YouDefeatedVLK_Guard;		// Der Spieler hat einen Buddler umgehauen, Wache spricht den Spieler an, Wache ist NEUTRAL/FRIENDLY zu Spieler
	VAR	STRING	YouStoleFromMe;				// Du Sau hast mich beklaut

//Wichtige Person (Lehrer, Auftraggeber?), hat davon gehört, daß Du Mist gebaut hat...
// FIXME: damit das so benutzt werden kann müssen noch Anpassungen in der B_ReactToMemory.d gemacht werden
	VAR	STRING	YouStoleFromUs;				// eigene oder befreundete Gilde beklaut.
	VAR	STRING	YouStoleFromEBr;			// Erzbarone beklaut.
	VAR	STRING	YouStoleFromGur;			// Gurus beklaut.
	VAR	STRING	StoleFromMage;				// Magier beklaut.

	VAR	STRING	YouKilledMyFriend;			// jemand aus eigener oder befreundeter Gilde getötet
	var	STRING	YouKilledEBr;				// Erzbaron getötet
	VAR	STRING	YouKilledGur;				// Guru getötet
	VAR	STRING	YouKilledMage;				// Guru getötet

	VAR	STRING	YouKilledOCfolk;			// Gardist, Schatten oder Buddler getötet.
	VAR	STRING	YouKilledNCfolk;			// Söldner, Organisator, Schürfer oder Bauer getötet
	VAR	STRING	YouKilledPSIfolk;			// Templer oder Novize getötet

	VAR	STRING	GetThingsRight;				//SC hat Mist gebaut. NSC sagt, "Das wieder hinzubiegen wird nicht einfach!"

	VAR	STRING	YouDefeatedMeWell;			//Zu SC	freundlich/neutral:	Du hast	mich ganz schön	geplättet

// Ambient-Unterhaltungen zwischen zwei NSCs (gemurmelte Wortfetzen, die zufällig zu "Dialogen" zusammengewürfelt werden...
	VAR	STRING	Smalltalk01;				// ...wenn Du meinst...
	VAR	STRING	Smalltalk02;				// ...kann schon sein...
	VAR	STRING	Smalltalk03;				// ...war nicht besonders schlau....
	VAR	STRING	Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	STRING	Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	STRING	Smalltalk06;				// ...war doch klar, daß das Ärger gibt...
	VAR	STRING	Smalltalk07;				// ...aber behalt's für Dich, muß nicht gleich jeder wissen...
	VAR	STRING	Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	STRING	Smalltalk09;				// ...an der Gechichte muß wohl doch was dran sein...
	VAR	STRING	Smalltalk10;				// ...man muß eben aufpassen was man rumerzählt...
	VAR	STRING	Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	STRING	Smalltalk12;				// ...man darf auch nicht alles glauben, was man hört...
	VAR	STRING	Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	STRING	Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	STRING	Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	STRING	Smalltalk16;				// ...früher wäre das ganz anders gelaufen...
	VAR	STRING	Smalltalk17;				// ...gequatscht wird viel...
	VAR	STRING	Smalltalk18;				// ...ich hör nicht mehr auf das Gefasel...
	VAR	STRING	Smalltalk19;				// ...verlaß Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	STRING	Smalltalk20;				// ...ich glaube kaum, daß sich daran was ändern wird...
	VAR	STRING	Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	STRING	Smalltalk22;				// ...erstmal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird...
	VAR	STRING	Smalltalk23;				// ...ich dachte, das wäre schon lange geklärt, aber das ist wohl nicht so...
	VAR	STRING	Smalltalk24;				// ...laß uns lieber über was anderes reden...
	VAR	STRING	Om;							// Ommm (Meditation)

// SC Dialog
	var string	SC_HeyTurnAround;			//SC: Hey du! (Nsc ansprechen, steht mit Rücken zu dir)
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
// 		Die SVM-Instanzen		(ToDo: News noch überarbeiten wie in Prototypen)
// ********************************

// Die einzelnen Instanzen der SVMs
// Diese müssen	immer "SVM_x" heissen, wobei x die VoiceNummer ist.

instance SVM_1 (C_SVM)	//Malocher (Volk, Schürfer)	Nörgler, Alkoholiker, schimpft über	alles - zieht Kraft aus seinem Hass

{
	StopMagic					=	"SVM_1_StopMagic"					;//Stop that sorcery!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Do you want a beating? Stop it at once!!!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Put the weapon down!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Put that bloody weapon away now!!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Put it down!!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//If you want one on your gob just aim at me some more!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Watch out! Try that again and I'll wipe your mug for you.
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Let's forget about that little argument, okay?
	Strange						=	"SVM_1_Strange"						;//Get out, you bastard!
	DieMonster					=	"SVM_1_DieMonster"					;//Damned son of a bitch!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Now you're done for!
	NowWait						=	"SVM_1_NowWait"						;//Now you'll get one in your mug ...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Looks like you want some in your mug!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//You were asking for it!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Now I'll make sure they'll have to carry you away in pieces.
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//I've warned you before to keep your hands off my stuff!
	DirtyThief					=	"SVM_1_DirtyThief"					;//I'll finish you off, you thief!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Nobody messes with my pals!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//You have knocked down one of us. Now I'll knock YOU down!
	Dead						=	"SVM_1_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//You'll be sorry for that!
	YesYes						=	"SVM_1_YesYes"						;//Don't panic! You've won!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//Shit! Run as fast as you can!
	Help						=	"SVM_1_Help"						;//Damn!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//We'll meet again!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Try that again and you'll regret it.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Nice weapon! Give it to me!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Thanks for the ore, you hero!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//You poor jerk, you don't even have ore on you!
	HandsOff					=	"SVM_1_HandsOff"					;//Hey, hands off!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Make yourself scarce!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Hey! How did you get in here?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//You think I'm stupid?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hey, you! What are you creeping around here for?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Out of my hut or I'll call the guards!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//You got no business in there! Beat it!
	WiseMove					=	"SVM_1_WiseMove"					;//Clever boy!
	Alarm						=	"SVM_1_Alarm"						;//Guards! Over here!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//ALERT!!! INTRUDER!!!
	BehindYou					=	"SVM_1_BehindYou"					;//Behind you!
	TheresAFight				=	"SVM_1_TheresAFight"				;//Ah, a fight!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Harder!
	CheerFight					=	"SVM_1_CheerFight"					;//You're fighthing like women!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Finish him off!!
	Ooh							=	"SVM_1_Ooh"							;//Just strike back!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Give it to him!
	RunCoward					=	"SVM_1_RunCoward"					;//Come back, you pussy!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//He's had enough!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Serves him right!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Why did you kill him? You're as good as dead!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Nice fighting!
	Awake						=	"SVM_1_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Hello
	ALGreetings					=	"SVM_1_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_1_MageGreetings"				;//For the honor of magic!
	SectGreetings				=	"SVM_1_SectGreetings"				;//Awaken!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//He's over there.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Come back as soon as you have more experience.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//You're already better now!
	HeyYou						=	"SVM_1_HeyYou"						;//Hey, you!
	NotNow						=	"SVM_1_NotNow"						;//Not now!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//What do you want?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Can I do anything for you?!
	MakeWay						=	"SVM_1_MakeWay"						;//Let me pass!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Get out of the way, man!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Are you deaf? MOVE IT!!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Looking for trouble again?
	LookAway					=	"SVM_1_LookAway"					;//Uhhhhh! I haven't seen anything!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Okay, okay! Just keep it!
	WhatsThat					=	"SVM_1_WhatsThat"					;//What was that?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//You're running around with MY weapon!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Give me that thing!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Just keep it then! I don't need it anyway!
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//They got one of our guys. If I get that swine ...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Damn, why did you wake me up?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Did you get a thrashing? Serves you right!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//You've knocked down an Ore Baron! He's really mad at you!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//You've knocked down a Guru. Somehow you seem to attract trouble like a magnet!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//To win against a magician is a really rotten idea!
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//You can't run around here beating up the novices!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Leave my guys alone!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//You've knocked down my mate ...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//You making trouble here won't be tolerated!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//If you beat up somebody under my protection there'll be repercussions!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//You've stolen from me, you arsehole! Don't try that again!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//We want our things back! Give us 'em!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//You've stolen from the Ore Barons! What the hell was that for?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//You stole from the Gurus? What a pity they found you out.
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//You have stolen from the magicians! What a really stupid idea!
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//One of our people has died and you had something to do with it! Make the slightest mistake and you are done with!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//You've killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name was mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//The brotherhood counts one believer less, and you got him on your conscience!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//It was a fair fight! You really polished my gob, man!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ... the worst shit ...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ... maybe, but who cares? ...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ... totally idiotic ...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ... it was obvious that there would be trouble ahead ...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ... why does that happen over and over again? ...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ... don't blather so much, yeah, yeah, yeah ...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ... you shouldn't believe everything ...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ... I'm not listening to all the blathering any more ...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ... you rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ... hang on. Better not to go rushing into anything ...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ... I thought that had been cleared up ages ago ...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_1_Om"							;//Ommm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einschüchterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//No sorcery!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//HEY! I said no magic!
	WeaponDown					=	"SVM_2_WeaponDown"					;//Come on, put that thing away!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Put that weapon down!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Watch out where you're aiming!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//If you carry on aiming at me I'll take it personally!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Hey, what was that for??
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Let's forget about it, okay?
	Strange						=	"SVM_2_Strange"						;//Strange! Where did he go?!
	DieMonster					=	"SVM_2_DieMonster"					;//Another one!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//I fear I need to eliminate you!
	NowWait						=	"SVM_2_NowWait"						;//That's your own fault!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Haven't you had enough yet?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//If that's what you really want!
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//You know you have absolutely no business here!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Why do you fiddle about with things that aren't yours?!
	DirtyThief					=	"SVM_2_DirtyThief"					;//You've stolen from me! I won't forget that!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Nobody messes with my guys!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//You've killed one of us! You'll have to pay for that!
	Dead						=	"SVM_2_Dead"						;//Aaargl
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//You'll be sorry for that!
	YesYes						=	"SVM_2_YesYes"						;//Slowly, slowly, you've won!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//I - ehm - just getting help!
	Help						=	"SVM_2_Help"						;//I have no time, got things to do!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//I'm sure we'll meet again!
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//Don't try that again!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//I'll take that weapon!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//You don't need that much ore anyway!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//You don't have any ore? Doesn't seem to be your lucky day today!
	HandsOff					=	"SVM_2_HandsOff"					;//Hands off!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Get out of here!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Hey! How did you get in here?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//It's not very smart of you to take me for a fool!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//What are you creeping around there for?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Out of my hut or I'll call the guards!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Keep out of the huts!
	WiseMove					=	"SVM_2_WiseMove"					;//The right decision!
	Alarm						=	"SVM_2_Alarm"						;//Guards! Over here!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//ALERT!!
	BehindYou					=	"SVM_2_BehindYou"					;//Behind you!
	TheresAFight				=	"SVM_2_TheresAFight"				;//Ah, a fight!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//Is that all!
	CheerFight					=	"SVM_2_CheerFight"					;//Wake up, slowpoke!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Good hit!
	Ooh							=	"SVM_2_Ooh"							;//That hurt!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//He's still moving.
	RunCoward					=	"SVM_2_RunCoward"					;//Stay here, you pussy!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//He's had enough!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//He deserved it!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//You've killed him! Was that necessary?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Was a good fight, just too short!
	Awake						=	"SVM_2_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Hello.
	ALGreetings					=	"SVM_2_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_2_MageGreetings"				;//For the honor of magic!
	SectGreetings				=	"SVM_2_SectGreetings"				;//Awaken!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Over there.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//I can't teach you anything. You don't have enough experience.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//You're already better now!
	HeyYou						=	"SVM_2_HeyYou"						;//Hey, you!
	NotNow						=	"SVM_2_NotNow"						;//Not now.
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//What do you want?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Can I do anything for you?
	MakeWay						=	"SVM_2_MakeWay"						;//Let me pass!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//Get out of the way!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Make yourself scarce or I'll run over you!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//You looking for trouble with me again?
	LookAway					=	"SVM_2_LookAway"					;//I didn't see ANYTHING! NO problem!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Okay! It's yours!
	WhatsThat					=	"SVM_2_WhatsThat"					;//Hey? What?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//That looks like my weapon you're carrying there!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//Come on, give it to me!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//I won't need it anyway!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Somebody has killed one of us! If we get him he's for it!
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Why have you woken me up?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//You've been knocked down! I must admit, I like that!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//You defeated an Ore Baron!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Knocking down a Guru! I'm not sure if that's brave or mad!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//To win against a magician ... you must be a brave man!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//I make sure there's order here!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Doesn't matter what it was about! If you hit a digger, you're in trouble!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//You've knocked down a friend of mine!
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Leave the novices alone!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//No beating up my guys! Understood?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Why did you rob me?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//You got something there which is ours. We'd like to have it back!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Man! You've stolen from the Ore Barons! They'll be raging!
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//You've stolen from the Gurus! You're lucky you didn't get caught!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//The magicians don't like people rummaging around in their stuff!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//You've got one of our men on your conscience. Another little mistake and it'll be your turn!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//You've killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name has been mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//The brotherhood counts one believer less, and you've got him on your conscience!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Do you have a clue how hard it is to straighten that out again?!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Yes, you beat me. It was a good fight! But now it's over!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ... it was obvious that there would be trouble ahead ...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ... but keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ... I'm not listening to all that blathering any more ...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ... hang on. Better not go rushing into anything ...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ... I thought that had been cleared up ages ago ...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_2_Om"							;// Ommm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gemüse. "Ich schau noch´n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//Stop that magic!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Stop that magic now.
	WeaponDown					=	"SVM_3_WeaponDown"					;//Put the weapon down!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//I'll be in a bad mood if you keep fiddling around with that weapon!!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Why are you aiming at me?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Put the weapon down or I'll get ugly!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Heeeeeey! What's that for??
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//Okay then, let's consider our argument a misunderstanding.
	Strange						=	"SVM_3_Strange"						;//He's gone, just disappeared?!
	DieMonster					=	"SVM_3_DieMonster"					;//You rotten beast. You won't disturb me any longer!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//You'll soon be through it!
	NowWait						=	"SVM_3_NowWait"						;//Seems I must become even more clear!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Looks like you haven't had enough yet!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//You wanted that!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//You've no business being in here! Now I'll need to knock you over!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Suppose I'll have to smack your fingers for you, that's obviously the only language you understand!
	DirtyThief					=	"SVM_3_DirtyThief"					;//You're stealing from me! I don't believe it!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//You can't just smack everyone you meet here!
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//You've killed one of us! That was your last mistake!
	Dead						=	"SVM_3_Dead"						;//Aaargl
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//You'll be sorry for that!
	YesYes						=	"SVM_3_YesYes"						;//You've won! Okay!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//Shit! Run as fast as you can!
	Help						=	"SVM_3_Help"						;//I need to go!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//We'll meet again!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Don't ever try anything like that again!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Thanks for the weapon!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//I'll just take some more of your ore!
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//No ore? That's sad, man, real sad!
	HandsOff					=	"SVM_3_HandsOff"					;//Hands off!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Beat it!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Hey! Where did you come from?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//I'm not as stupid as you think!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Stop creeping about here!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Disappear from my hut or I'll call the guards!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//What are you doing? If I get you, you're done for!
	WiseMove					=	"SVM_3_WiseMove"					;//So you do know what's good for you!
	Alarm						=	"SVM_3_Alarm"						;//Guards! Over here!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//ALERT!!
	BehindYou					=	"SVM_3_BehindYou"					;//Watch out!
	TheresAFight				=	"SVM_3_TheresAFight"				;//A fight!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Smack him!
	CheerFight					=	"SVM_3_CheerFight"					;//What are you trying to do?
	CheerFriend					=	"SVM_3_CheerFriend"					;//Good hit!
	Ooh							=	"SVM_3_Ooh"							;//Ooooh!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Yes! Well done!
	RunCoward					=	"SVM_3_RunCoward"					;//He's just running off!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//He's finished him off!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//That's been due for some time now!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//He won't move any more. You've killed him.
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Nothing but fights ...
	Awake						=	"SVM_3_Awake"						;//A new day and nothing has changed ...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Hey, man.
	ALGreetings					=	"SVM_3_ALGreetings"					;//For Gomez, yeah, yeah.
	MageGreetings				=	"SVM_3_MageGreetings"				;//For the honor of magic!
	SectGreetings				=	"SVM_3_SectGreetings"				;//Awaken!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//He's over there.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//You don't have enough experience. I can't teach you that!
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//You're already better now!
	HeyYou						=	"SVM_3_HeyYou"						;//Hey, you!
	NotNow						=	"SVM_3_NotNow"						;//Not now!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Was there something you wanted?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Can I do anything for you?
	MakeWay						=	"SVM_3_MakeWay"						;//Let me pass!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Get out of the way, man!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//How many more times? Let me pass!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//You looking for trouble with me again?
	LookAway					=	"SVM_3_LookAway"					;//I didn't see ANYTHING! I'm not even here!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Okay, okay, keep it!
	WhatsThat					=	"SVM_3_WhatsThat"					;//What was that?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//You got my weapon on you!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Give it to me!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Whatever you say! I don't need it anyway.
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//They've killed another one of us. None of us will get out of here alive ...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//Why have you torn me from my dreams?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Serves you right that you got a beating!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//You defeated an Ore Baron! You are longing for trouble, aren't you!
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//You defeated one of the Gurus. They're really holding that against you!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//To win against a magician will mean great trouble!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//Next time you'd better leave the novices alone!
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//If you beat up a digger, I'll need to do the same to you!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//You've knocked down one of my pals!
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//The novices are under my protection! Leave them alone!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//The diggers pay me so that they don't have any trouble! I'll make sure it stays that way!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//You've stolen from me, you dirty thief!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//You got some stuff that belongs to us. You better give it back.
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Man! You've stolen from the Ore Barons! They'll be raging!
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//You've stolen from the Gurus! What a pity they've found you out.
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//You should be quicker when you try to steal from the magicians!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//You got one of our men on your conscience. One more little mistake and it'll be your turn!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//You have killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name is mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//The brotherhood counts one believer less, and you got him on your conscience!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//It was a fair fight! Never mind your knocking me out!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ... it was obvious that there would be trouble ahead ...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ... but keep it to yourself, people don't need to know.
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ... I'm not listening to all the blathering any more ...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ... hang on. Better not to go rushing into anything ...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ... I thought that had been cleared ages ago ...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_3_Om"							;// Ommm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Grünschnäbeln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//Stop the magic!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//You better listen to my advice and stop your sorcery!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Put the weapon away if you don't want any trouble!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//Now put that weapon down!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//You should watch where you're pointing that!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//If you don't stop that I'll take your toy away!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Hey there! Just watch it!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Let's forget our little argument!
	Strange						=	"SVM_4_Strange"						;//Come out! Show yourself!
	DieMonster					=	"SVM_4_DieMonster"					;//It doesn't matter how many you kill, they just keep coming!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//You won't get any older!
	NowWait						=	"SVM_4_NowWait"						;//I'll teach you not to get into trouble with me ...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Haven't you had enough yet?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//You asked for it!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//It was very stupid of you to intrude in here!!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//You can't just fiddle about here unpunished!
	DirtyThief					=	"SVM_4_DirtyThief"					;//You dared to steal from me!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Getting in trouble with us will not do you any good.
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//You've killed one of us! An eye for an eye!
	Dead						=	"SVM_4_Dead"						;//Aaargl
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//You'll regret that!
	YesYes						=	"SVM_4_YesYes"						;//No sweat, you've won!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Let's get away from here fast!
	Help						=	"SVM_4_Help"						;//I'm getting too old for this!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//I won't forget that in a hurry!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Now don't you try that again!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//I'd better take that weapon with me!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//I'll take better care of your ore than you've done!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Not even some measly little ore nuggets
	HandsOff					=	"SVM_4_HandsOff"					;//Hands off!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Make yourself scarce!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//You've no business being in here!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//I'm not in the mood for jokes like that!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Hey, you! What are you creeping about here for?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Get out or else I'll call the guards!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//What have you been doing in there?
	WiseMove					=	"SVM_4_WiseMove"					;//You've been lucky there.
	Alarm						=	"SVM_4_Alarm"						;//Guards! Over here!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//INTRUDER!!!
	BehindYou					=	"SVM_4_BehindYou"					;//Behind you!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Yet another fight.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Harder!
	CheerFight					=	"SVM_4_CheerFight"					;//Is that all you can do?!
	CheerFriend					=	"SVM_4_CheerFriend"					;//Give it to him!
	Ooh							=	"SVM_4_Ooh"							;//Strike back!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Well done!
	RunCoward					=	"SVM_4_RunCoward"					;//That coward's running off!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//When I was young, men were tough!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//It's your own fault!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//You've killed him! That was a big mistake!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//In the olden days, the fights were better.
	Awake						=	"SVM_4_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Greetings.
	ALGreetings					=	"SVM_4_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_4_MageGreetings"				;//For the honor of magic!
	SectGreetings				=	"SVM_4_SectGreetings"				;//Awaken!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//You'll find him over there!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//I can't teach you anything. You don't have enough experience.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//You're better than that already!
	HeyYou						=	"SVM_4_HeyYou"						;//Hey there!
	NotNow						=	"SVM_4_NotNow"						;//Not now.
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//What do you want?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Was there something you wanted?
	MakeWay						=	"SVM_4_MakeWay"						;//Let me pass.
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Get out of the way now!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Out of my way or you'll be sorry!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//You looking for trouble with me again?
	LookAway					=	"SVM_4_LookAway"					;//See no evil, hear no evil, speak no evil ...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Just keep it!
	WhatsThat					=	"SVM_4_WhatsThat"					;//What was that?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//Just be a good boy and give me my weapon back!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//Come on, give it to me!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//So don't! I'm happy that I'm rid of it!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//If I find out who killed one of us ...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//You're disturbing my rest!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//You've been knocked down! You needed some thrashing anyway!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//You defeated an Ore Baron!
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//You defeated one of the Gurus. I'm impressed. But don't even think of trying it again.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//To win against a magician ... you must be a brave man!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//You must be mad just to knock out a novice like that.
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//What did you think you were doing, beating up a digger?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//You got into trouble with a friend of mine! That's very risky!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Lay your hands on a novice again and you'll be sorry!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//You're too brave, touching one of the protégés could be very dangerous for you.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Just keep your hands off my stuff, understood?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//You got something which is ours. Give it back to us!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Man! You've stolen from the Ore Barons! They'll be raging!
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//You've stolen from the Gurus! You might at least not have had yourself caught!
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//The magicians don't like people rummaging around in their stuff!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//You got one of our men on your conscience. Another little mistake and it'll be your turn!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//You've killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name is mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//There's another hut free in the New Camp, and it seems you're somehow involved in it!
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//The brotherhood counts one believer less, and you've got him on your conscience!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//You've given me a fair threshing, man. T'was a good fight. But now it's over!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ... it was obvious that there would be trouble ahead ...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ... but keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ... I'm not listening to all the blathering any more ...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ... hang on. Better not go rushing into anything ...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ... I thought that had been cleared ages ago ...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_4_Om"							;//Ommm
};


instance SVM_5 (C_SVM)				//Lebenskünstler, offen, Fröhlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewußt, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//You better stop that magic!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//When I say 'stop the magic', I mean it!
	WeaponDown					=	"SVM_5_WeaponDown"					;//What do you intend to do with the weapon, man!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Come on, put that thing away!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//You're aiming at me, you clown!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//If you don't stop this, I'll practice on you as well!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hey, are you blind or what?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Let's forget about that little argument, okay?
	Strange						=	"SVM_5_Strange"						;//But he was here a moment ago!? Strange!
	DieMonster					=	"SVM_5_DieMonster"					;//It's your turn now, bastard!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//It's payday!
	NowWait						=	"SVM_5_NowWait"						;//You're asking for an urgent beating!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//You still haven't had enough?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Okay, you've asked for it!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//They'll have to carry you out!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//I warned you. If you touch my stuff, you're in trouble!
	DirtyThief					=	"SVM_5_DirtyThief"					;//You thief! I'll teach you manners!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Nobody messes with my guys without feeling very sorry after!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//You've killed one of my men. Now I will kill YOU!
	Dead						=	"SVM_5_Dead"					;//Aaargl
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//You'll be sorry for that!
	YesYes						=	"SVM_5_YesYes"						;//Keep cool! You've won.
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//This one's too big for me!
	Help						=	"SVM_5_Help"						;//Damn!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//Next time things'll look different!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//Don't try that again!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//I like that weapon!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//I'll make sure your ore is well invested!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//Bad luck! No ore!
	HandsOff					=	"SVM_5_HandsOff"					;//Hands off!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Get out of here!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Hey! Where did you come from?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Good joke!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//What are you creeping around here for?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Get out of here or I'll call the guards!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//You've no business in there!
	WiseMove					=	"SVM_5_WiseMove"					;//You're learning fast!
	Alarm						=	"SVM_5_Alarm"						;//Guards! Over here!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//ALERT!!!!
	BehindYou					=	"SVM_5_BehindYou"					;//Hey, watch it!
	TheresAFight				=	"SVM_5_TheresAFight"				;//A fight!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Smack it!
	CheerFight					=	"SVM_5_CheerFight"					;//Good!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Smack him over now!
	Ooh							=	"SVM_5_Ooh"							;//Just watch out!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//It was about time!
	RunCoward					=	"SVM_5_RunCoward"					;//That guy's sneaking off!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Clear winner, I'd say!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//He deserved it!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//You just go killing people. You'll really be in trouble now!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//What a fight!
	Awake						=	"SVM_5_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Hello, friend!
	ALGreetings					=	"SVM_5_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_5_MageGreetings"				;//For the honor of magic!
	SectGreetings				=	"SVM_5_SectGreetings"				;//Awaken!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Over there.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//I can't teach you anything because you're so inexperienced.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//You're already better now!
	HeyYou						=	"SVM_5_HeyYou"						;//Hey, you!
	NotNow						=	"SVM_5_NotNow"						;//Not now.
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Can I help you?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//What do you want?
	MakeWay						=	"SVM_5_MakeWay"						;//Let me pass.
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//Come on, I want to pass!
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Are you deaf or are you looking for trouble?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//You looking for trouble with me again?
	LookAway					=	"SVM_5_LookAway"					;//I didn't see ANYTHING ... Why, what happened?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Okay, just keep it!
	WhatsThat					=	"SVM_5_WhatsThat"					;//What was that?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//I'd rather have my weapon back!
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Just give it to me!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Hm, it's not that bad! I got more!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//They got one of our guys. If I get that swine ...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Hey, what's that for? Why have you woken me up?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//Eh? Got your mug polished? Serves you right!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//You knocked down an Ore Baron. He was impressed!
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//You defeated one of the Gurus. I'm impressed. But don't even think of trying it again.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//To win against a magician ... you must be a brave man!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//You must be mad just to knock out a novice like that.
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//What did you think you were doing, beating up a digger?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//You've knocked down my mate, what was that for?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Lay your hands on a novice again and you'll be sorry!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//You're too brave, touching one of my protégés could be very dangerous for you.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//You dare to turn up here, dirty thief?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//You got some stuff that belongs to us. You better give it back.
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Man! You've stolen from the Ore Barons! They'll be raging!
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//You've stolen from the Gurus! You might at least not have got yourself caught!
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//The magicians don't like people rummaging around in their stuff!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//You got one of our men on your conscience. Another little mistake and it'll be your turn!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//You have killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name was mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//The brotherhood counts one believer less, and you got him on your conscience!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//You've given me a fair threshing, man. T'was a good fight. But now it's over!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ... that's not really my problem ...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ... it was obvious that there would be trouble ahead ...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ... but keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ... I'm not listening to all the blathering any more ...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ... hang on. Better not to go rushing into anything ...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ... I thought that had been cleared up ages ago ...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_5_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Grölt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//Stop that sorcery!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Stop that magic! At once!!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Put the damn weapon away!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Do you want me to mess you up? Put that thing away!!!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Put that thing down or something will happen!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Just carry on aiming at me if you want your gob polished!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Hey! Watch it!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Hey, man! Let's forget about this little argument, okay?
	Strange						=	"SVM_6_Strange"						;//Come out! Show yourself!
	DieMonster					=	"SVM_6_DieMonster"					;//I'll make mincemeat of you, swine!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//Now you're done for!
	NowWait						=	"SVM_6_NowWait"						;//Now you'll get one in your mug ...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Looks like you want some in your mug!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//That's the way you wanted it!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Now I'll mince you!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//I warned you. If you touch my stuff, you're in trouble!
	DirtyThief					=	"SVM_6_DirtyThief"					;//You thief! I'll finish you off!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Nobody messes with my guys!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//You've killed one of my men. Now I will kill YOU!
	Dead						=	"SVM_6_Dead"						;//Aaargl
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//You'll be sorry for that!
	YesYes						=	"SVM_6_YesYes"						;//Yes, yes! Don't panic! You've won.
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//Damn, what a beast! Clear out as fast as you can!
	Help						=	"SVM_6_Help"						;//Damn!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//You'll get to know me!!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Try that again and you'll regret it.
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//That weapon looks quite handy!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Thanks for the ore, I'll drink to you!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Shit, he hasn't even got any ore on him ...
	HandsOff					=	"SVM_6_HandsOff"					;//Hands off!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Get out of here!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Hey! Where did you come from?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Yeah, do you think I'm stupid?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Hey! What's that creeping all about?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Get out or I'll call the guards!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//What have you been doing in there?
	WiseMove					=	"SVM_6_WiseMove"					;//That was lucky!
	Alarm						=	"SVM_6_Alarm"						;//Guards! Over here!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//ALERT!!! INTRUDER!!!
	BehindYou					=	"SVM_6_BehindYou"					;//Behind you!
	TheresAFight				=	"SVM_6_TheresAFight"				;//Ah, a fight!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Harder!
	CheerFight					=	"SVM_6_CheerFight"					;//You're fighthing like a woman!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Finish him off!!
	Ooh							=	"SVM_6_Ooh"							;//Don't put up with it! Give him one in the gob!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Now give it to him. Yes, he's still moving!
	RunCoward					=	"SVM_6_RunCoward"					;//Coward, come back!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//He's had enough!
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Serves him right!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//You're as good as dead! That'll teach you to just go killing people.
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ha ha ha! Well, you sure showed him!
	Awake						=	"SVM_6_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Hello.
	ALGreetings					=	"SVM_6_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_6_MageGreetings"				;//For the honor of magic!
	SectGreetings				=	"SVM_6_SectGreetings"				;//Awaken!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//He's over there.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//I can't teach you anything. You don't have enough experience.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//You're already better now!
	HeyYou						=	"SVM_6_HeyYou"						;//Hey, you!
	NotNow						=	"SVM_6_NotNow"						;//Not now.
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//What do you want?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//Was there something you wanted?
	MakeWay						=	"SVM_6_MakeWay"						;//Let me pass!
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//Come on, step aside!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Clear off! Or do you want me to beat it into your brain?
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//You're looking for trouble again?
	LookAway					=	"SVM_6_LookAway"					;//I didn't see anything! I really didn't!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Okay, okay, keep the stuff!
	WhatsThat					=	"SVM_6_WhatsThat"					;//What was that?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Just give me my weapon back, you joker!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Just give it to me, man!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Doesn't matter! I won't be needing it any more anyway!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//They got one of our guys. If I get that swine ...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Damn, why did you wake me up?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Did you get a good thrashing? Serves you right!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//You've knocked down an Ore Baron! He's really mad at you!
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//You've knocked down a Guru. Somehow you seem to attract trouble like a magnet!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//To win against a magician is a really rotten idea, man!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//You can't run around here beating up on the novices!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Leave my guys alone!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//You've knocked down a friend of mine ...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//You making trouble here won't be tolerated!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//If you beat up somebody under my protection there'll be repercussions!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//You bastard, you've stolen from me! Don't try that again!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//We want our things back! Give 'em to me!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//You've stolen from the Ore Barons! What the hell was that for?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//You stole from the Gurus? What a pity they found you out.
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//You've stolen from the magicians! A really lousy idea!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//One of our people has died and you have something to do with it! One tiny mistake and you are done with!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//You have killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name is mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//The brotherhood counts one believer less, and you got him on your conscience!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//You've given me a fair thrashing, man. T'was a good fight. But now it's over!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ... it was obvious that there would be trouble ahead ...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ... but keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ... don't listen to all the blathering ...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ... hang on. Better not go rushing into anything ...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ... I thought that had been cleared up ages ago ...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_6_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Put it away! Put it away!!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//Put that magic away, put it away!!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Put the weapon away, put it away!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//I'm serious! Away with that!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//Are you aiming at me? Watch out!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//You think you can intimidate me? Think again!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//I'll remember that! Watch out!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//You'll forget about that argument, okay?
	Strange						=	"SVM_7_Strange"						;//Where did he go? This can't be! It's impossible!!
	DieMonster					=	"SVM_7_DieMonster"					;//I'll chop you, you beast!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//I'll take you apart! It's your turn now! No mercy!
	NowWait						=	"SVM_7_NowWait"						;//Finally you give me a reason!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//You don't wanna try it again, do you?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Blood! Your blood!!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//I'll cut you in strips!
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//I should cut off your fingers!
	DirtyThief					=	"SVM_7_DirtyThief"					;//You dirty thief! I wanna see you suffer!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Nobody beats up anybody else around here except me!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//You've killed one of us!
	Dead						=	"SVM_7_Dead"						;//Aaargl
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//You won't have much time to be sorry for it!
	YesYes						=	"SVM_7_YesYes"						;//Okay, okay!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//I don't have the right weapon. We'll meet again ...
	Help						=	"SVM_7_Help"						;//Damn!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//I'll be seeing you!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Never do that again!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//I'll keep that weaon!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//I'd rather kill you, but the ore is not bad either!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//No ore? You useless bum!
	HandsOff					=	"SVM_7_HandsOff"					;//Keep your hands off!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Buzz off! Get out of here!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//How did you get in here?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//You really like taking advantage of me, don't you?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Hey, you! What are you creeping around here for?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Make yourself scarce or I'll call the guards!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//You've no business in there!
	WiseMove					=	"SVM_7_WiseMove"					;//Lucky for you! But I would have enjoyed polishing your mug!
	Alarm						=	"SVM_7_Alarm"						;//Guards, come here!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//ALERT!!
	BehindYou					=	"SVM_7_BehindYou"					;//Behind you!
	TheresAFight				=	"SVM_7_TheresAFight"				;//A fight!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Harder!
	CheerFight					=	"SVM_7_CheerFight"					;//I wanna see blood!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Turn him over!!
	Ooh							=	"SVM_7_Ooh"							;//Strike back, you idiot!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Yeaah!!!
	RunCoward					=	"SVM_7_RunCoward"					;//Run back to your mummy!!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//He's had enough!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//It's your own fault!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//It's suicide killing somebody in front of witnesses.
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Nice fight!
	Awake						=	"SVM_7_Awake"						;//Time to get up again!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Hello
	ALGreetings					=	"SVM_7_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_7_MageGreetings"				;//For the honor of magic!
	SectGreetings				=	"SVM_7_SectGreetings"				;//Awaken!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Are you blind? Over there!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//I can't teach you anything. You don't have enough experience.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//You're already better now!
	HeyYou						=	"SVM_7_HeyYou"						;//Hey, you!
	NotNow						=	"SVM_7_NotNow"						;//Not now!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//What do you want from me?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Can I do anything for you?!
	MakeWay						=	"SVM_7_MakeWay"						;//Let me pass.
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Get out of the way!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Looking for trouble? Get out of here!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//You looking for trouble with me again?
	LookAway					=	"SVM_7_LookAway"					;//I didn't see ANYTHING!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Okay, okay! Just keep it!
	WhatsThat					=	"SVM_7_WhatsThat"					;//What was that?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Give me my weapon back!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Give it to me!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//Okay! Keep it! I'll find another solution!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//One of us has died! That calls for revenge!
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Why have you woken me up?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Serves you right that you got a beating!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//You've knocked down an Ore Baron! He's really mad at you!
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//You knocked down a Guru. Somehow you seem to attract trouble like a magnet!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//To win against a magician is really a rotten idea!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//So you're the one who beats up the novices!
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Leave my guys alone!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//You've knocked out the wrong one! We stick together here!
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//You making trouble here won't be tolerated!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//If you beat up somebody under my protection there'll be repercussions!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//You arsehole, you've stolen from me! Don't try that again!
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//We want our things back! Give us 'em!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//You've stolen from the Ore Barons! What the hell was that for?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//You stole from the Gurus? What a pity they found you out.
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//You have stolen from the magicians! A really lousy idea!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//One of our people has died and you have something to do with it! One tiny mistake and you are done with!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//You killed an Ore Baron! Man, you are completely nuts!
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//You've killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name was mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//The brotherhood counts one believer less, and you got him on your conscience!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//You've given me a fair thrashing, man. T'was a good fight. But now it's over!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ... that's not really my problem ...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ... it was obvious there would be trouble ahead ...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ... but keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ... I'm not listening to all that blathering any more ...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ... you're probably right ...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ... well, hang on. Better not to go rushing into anything ...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ... I thought that had been cleared up ages ago ...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_7_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, nüchtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Don't try any sorcery around me!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Stop, I say! At once!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Put the weapon down!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Put that thing away or you're done for!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Put the weapon down, idiot!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//You worm dare to aim at me?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Just watch out!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Okay, let's forget about our little argument.
	Strange						=	"SVM_8_Strange"						;//Come out! I know you can hear me!
	DieMonster					=	"SVM_8_DieMonster"					;//Damn creatures!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Now you'll die. Don't take it personally!
	NowWait						=	"SVM_8_NowWait"						;//You worm are attacking ME! Just you wait ...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Didn't I knock you into the dust once? Here we go again ...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//If you don't listen, you'll have to feel some!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//You dare to run around HERE? Wait a second!
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Suppose I'll have to smack your fingers for you!
	DirtyThief					=	"SVM_8_DirtyThief"					;//You shouldn't have stolen that!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Nobody messes with my guys without feeling very sorry after!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Killing one of us has been your last mistake!
	Dead						=	"SVM_8_Dead"						;//Aaargl
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//You'll be very sorry for that!
	YesYes						=	"SVM_8_YesYes"						;//Easy. Everything's alright!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//I'd rather have a look at this beast from a distance!
	Help						=	"SVM_8_Help"						;//Quickly, out of here!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//We'll meet again!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Try that again and you're dead!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//I like that weapon!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//I think you haven't paid any ore taxes to me yet!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//Of course a loser like you wouldn't have any ore!
	HandsOff					=	"SVM_8_HandsOff"					;//Hands off!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Get out of here!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Hey, how did YOU get in here?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//You're a real smart arse, aren't you?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Hey, you! What are you creeping about here for?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Make yourself scarce or I'll call the guards!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//What have you been doing in there?
	WiseMove					=	"SVM_8_WiseMove"					;//You've been lucky there.
	Alarm						=	"SVM_8_Alarm"						;//Guards! Over here!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//ALERT!!! INTRUDER!!!
	BehindYou					=	"SVM_8_BehindYou"					;//Behind you!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Let's see who's fighting there!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Harder!
	CheerFight					=	"SVM_8_CheerFight"					;//Yes! Come on, come on!
	CheerFriend					=	"SVM_8_CheerFriend"					;//Good! Don't ease up!
	Ooh							=	"SVM_8_Ooh"							;//Don't put up with it! Give him one on the gob!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Yes, give it to him. He's still moving!
	RunCoward					=	"SVM_8_RunCoward"					;//Never show your face here again!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Boring fight!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Serves him right!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//That was unnecessary. You'll have to take the consequences.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//It was a good fight!
	Awake						=	"SVM_8_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Hello.
	ALGreetings					=	"SVM_8_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_8_MageGreetings"				;//For the honor of magic!
	SectGreetings				=	"SVM_8_SectGreetings"				;//Awaken!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//He's over there.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//I can't teach you anything. You don't have enough experience.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//You're already better now!
	HeyYou						=	"SVM_8_HeyYou"						;//Hey, you!
	NotNow						=	"SVM_8_NotNow"						;//Not now.
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//What do you want?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Can I do anything for you?
	MakeWay						=	"SVM_8_MakeWay"						;//May I pass through here?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//Step aside!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Do you want me to beat it into your brain? Get out of here!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//You looking for trouble with me again?
	LookAway					=	"SVM_8_LookAway"					;//Ahem ... A really nice view!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Good! It's yours.
	WhatsThat					=	"SVM_8_WhatsThat"					;//Hey? What was that?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//You're carrying my weapon ...?
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Give it to me! At once!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Keep it, I don't need it anyway.
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//They got one of our guys. If I get that swine ...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//What's up?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//Eh? Got your mug polished? Serves you right!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//You knocked down an Ore Baron. He was impressed!
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//You defeated one of the Gurus. I'm impressed. But don't even think about trying it again.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//To win against a magician ... you must be a brave man!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//You know that the novices are under my protection. And nevertheless you still touch them?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//If you touch the diggers, you're laying hands on my income!
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//You shouldn't get in trouble with my friends.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Lay your hands on a novice again and you'll be sorry!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//If you attack one of my protégés, it might cost you your head.
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//You dare to turn up here, dirty thief?
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//You got some stuff that belongs to us. You better give it back.
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Man! You've stolen from the Ore Barons! Boy, they'll be raging!
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//You relieved the Gurus of a few things, didn't you?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//You relieved the magicians of a couple of things, didn't you?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//You got one of our men on your conscience. Another little mistake and it'll be your turn!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//You have killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name was mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//The brotherhood counts one believer less, and you've got him on your conscience!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//You've given me a fair threshing, man. T'was a good fight. But now it's over!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ... it was obvious that there would be trouble ...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ... keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ... I'm not listening to all the blathering any more ...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ... hang on. Better not to go rushing into anything ...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ... Ah, I thought that would have been clarified a long time ago ...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_8_Om"							;//Ommm
};


instance SVM_9 (C_SVM)				// brummig		   gemütlicher Hüne, Besonnen, Brummiger Bär, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//I don't want any magic near me!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Stop, I say! At once!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Are you planning to attack me?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Do you want me to polish your gob or will you put that thing away?
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Watch out where you're aiming!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Put that thing away!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Hey! Watch it!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//I wouldn't mind forgetting about this little argument ...
	Strange						=	"SVM_9_Strange"						;//Show yourself. I know you can hear me!
	DieMonster					=	"SVM_9_DieMonster"					;//These beasts are really as thick as mud!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//Now you're done for!
	NowWait						=	"SVM_9_NowWait"						;//Now you'll get to know me!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//You're damn persistent!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//If you don't listen, you'll have to feel some!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Now I'll get you, intruder!
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//I've warned you. Touching my stuff means trouble!
	DirtyThief					=	"SVM_9_DirtyThief"					;//You thief! I'll finish you off!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Nobody messes with my guys!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//You've killed one of my men. Now I will kill YOU!
	Dead						=	"SVM_9_Dead"						;//Aargh, aargh
	Aargh_1						=	"SVM_9_Aargh_1"						;//Oaargh, aargh, oorgh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh, oorgh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Oorgh, aargh
	Berzerk						=	"SVM_9_Berzerk"						;//AAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//You're already dead, you just don't know it.
	YesYes						=	"SVM_9_YesYes"						;//Easy. Everything's alright!
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Shit, what a beast!
	Help						=	"SVM_9_Help"						;//Quickly, out of here!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//You always meet twice.
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//Next time I'll kill you!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//This weapon is now mine!
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Ore! Well, that's better than nothing!
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//He doesn't even have ore on him!
	HandsOff					=	"SVM_9_HandsOff"					;//Hands off, pal!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Get out of here!
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//What are you doing here?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Are you planning to make a fool out of me, man?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Hey, you! What are you creeping around here for?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Get out or I'll call the guards!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//What have you been doing in there?
	WiseMove					=	"SVM_9_WiseMove"					;//Smart ass!
	Alarm						=	"SVM_9_Alarm"						;//Guards! Over here!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//ALERT!!! INTRUDER!!!
	BehindYou					=	"SVM_9_BehindYou"					;//Behind you!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Let's see how good they are ...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Keep it up!
	CheerFight					=	"SVM_9_CheerFight"					;//Yes! Come on, come on!
	CheerFriend					=	"SVM_9_CheerFriend"					;//Good!
	Ooh							=	"SVM_9_Ooh"							;//Oh, that struck the right place!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Wonderful control, boy!
	RunCoward					=	"SVM_9_RunCoward"					;//Never show your face here again!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//The fight's been decided.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//It's your own fault!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//That was unnecessary. You'll have to take the consequences.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//It was a good fight!
	Awake						=	"SVM_9_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Hello.
	ALGreetings					=	"SVM_9_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_9_MageGreetings"				;//For the honor of magic!
	SectGreetings				=	"SVM_9_SectGreetings"				;//Awaken!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Are you blind? Over there!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//I can't teach you anything. You don't have enough experience.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//You're already better now!
	HeyYou						=	"SVM_9_HeyYou"						;//Hey, you!
	NotNow						=	"SVM_9_NotNow"						;//Not now.
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//What do you want?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//Can I help you?
	MakeWay						=	"SVM_9_MakeWay"						;//Let me pass!
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Step aside!
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//Come on, get out of the way!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Looking for trouble again? Why do you always pick on me?
	LookAway					=	"SVM_9_LookAway"					;//Oh yeah! Nice weather today!
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Good! It's yours.
	WhatsThat					=	"SVM_9_WhatsThat"					;//What was that?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//I'll count till three, then I'll have my weapon back.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Give it to me! At once!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Keep it, I don't need it anyway.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//They got one of our guys. If I get that swine ...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//What's up?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//Eh? Got your mug polished? Serves you right!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//You knocked down an Ore Baron. He was impressed!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//You defeated one of the Gurus. I'm impressed. But don't even think of trying it again.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//To win against a magician ... you must be a brave man!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//You must be out of your mind to knock a novice down.
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//What did you think you were doing, beating up a digger?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//You've knocked down my pal, what was that for?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Lay your hands on a novice again and you'll be sorry!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//You're too brave, touching one of my protégés could be very dangerous for you.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//You dare to turn up here, you dirty thief?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//To steal from our folks is the worst thing ever! You'll be sorry for it!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Man! You've stolen from the Ore Barons! They'll be raging!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//You relieved the Gurus of a few things, didn't you?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//You relieved the magicians of a couple of things, didn't you?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//You got one of our men on your conscience. Another little mistake and it'll be your turn!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//You've killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name was mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//The brotherhood counts one believer less, and you've got him on your conscience!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//A good fight. Your training was worthwhile.
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ... yes, if you think so ...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ... it was obvious that there would be trouble ahead ...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ... but keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ... I'm not listening to all this blathering any more ...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ... yeah, you're probably right ...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ... hang on. Better not to go rushing into anything ...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ... I thought that had been cleared up ages ago ...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_9_Om"							;// Ommm
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//Stop that sorcery!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Stop it at once!!!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Put the weapon down!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//What d'you think you're doing? You want trouble with me?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Put that thing down or I'll do it for you!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//If you want trouble, just keep on aiming at me!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Hey! Watch it! Once more and you'll get it!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Hey, man! Let's forget about that little argument we had, okay?
	Strange						=	"SVM_10_Strange"						;//Come out! Show yourself!
	DieMonster					=	"SVM_10_DieMonster"						;//Dirty beasts!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Now you're done for!
	NowWait						=	"SVM_10_NowWait"						;//It's payday!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Looks like you want some in your face!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//You were asking for it!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Now I'll get you, intruder!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//I warned you. If you touch my stuff, you're in trouble!
	DirtyThief					=	"SVM_10_DirtyThief"						;//You thief! I'll finish you off!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Nobody messes with my guys!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//You've killed one of my men. Now I will kill YOU!
	Dead						=	"SVM_10_Dead"							;//Aaargl
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//You'll feel that! Bastard!
	YesYes						=	"SVM_10_YesYes"							;//Yeah, yeah! Don't panic! You've won.
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//What a monster, run as fast as you can!
	Help						=	"SVM_10_Help"							;//Retreat!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//You'll get to know me!!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Try that again and you'll regret it.
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//This weapon is now mine!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//I'll just take some of your ore!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//No ore, damn it!
	HandsOff					=	"SVM_10_HandsOff"						;//You rat! Hands off!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Get out of here!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Hey! Where did you come from?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//You must really think I'm stupid!
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Hey, you! What are you creeping around here for?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Get out or I'll call the guards!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//What have you been doing in there?
	WiseMove					=	"SVM_10_WiseMove"						;//You've been lucky there.
	Alarm						=	"SVM_10_Alarm"							;//Guards! Over here!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//ALERT!!! INTRUDER!!!
	BehindYou					=	"SVM_10_BehindYou"						;//Behind you!
	TheresAFight				=	"SVM_10_TheresAFight"					;//Ah, a fight!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Harder!
	CheerFight					=	"SVM_10_CheerFight"						;//No mercy!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Finish him off!!
	Ooh							=	"SVM_10_Ooh"							;//Don't put up with it!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Smack him in the mug!
	RunCoward					=	"SVM_10_RunCoward"						;//Coward, come back!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//A little gust of wind and he would've fallen over by himself.
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Serves him right!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//You're as good as dead! That'll teach you to just go killing people.
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//You've taught him a lesson!
	Awake						=	"SVM_10_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Hello.
	ALGreetings					=	"SVM_10_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_10_MageGreetings"					;//For the honor of magic!
	SectGreetings				=	"SVM_10_SectGreetings"					;//Awaken!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//He's over there.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//I can't teach you anything. You don't have enough experience.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//You're already better now!
	HeyYou						=	"SVM_10_HeyYou"							;//Hey, you!
	NotNow						=	"SVM_10_NotNow"							;//Not now.
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//What do you want?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Can I help you?
	MakeWay						=	"SVM_10_MakeWay"						;//Let me pass.
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Get out of my way!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Do you want me to beat it into your brain? Get out of here!
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//You looking for trouble with me again?
	LookAway					=	"SVM_10_LookAway"						;//I'm not really here ...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Just keep the stuff!
	WhatsThat					=	"SVM_10_WhatsThat"						;//What was that?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Give me my weapon back!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Give it to me!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Take it. I don't need it anyway.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//They got one of our guys. I'm really angry about that!
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//Why have you woken me up?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//Eh? Got your mug polished? Serves you right!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//You've knocked down an Ore Baron!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//You defeated one of the Gurus.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//To win against a magician ...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//You should find out who you're annoying, before beating up novices!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//I need to maintain order here! Leave my people alone!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//You've knocked down my friend.
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Lay your hands on a novice again and you'll be sorry!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Touching one of my protégés will cost you dearly.
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//Don't try that again, thief!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//You got some stuff that belongs to us. You better give it back.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Man! You've stolen from the Ore Barons! They'll be furious!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//You have relieved the Gurus of a few things. It wasn't very clever though to get caught doing it!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//You relieved the magicians of a couple of things, didn't you?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//You've got one of our men on your conscience. Another little mistake and it'll be your turn!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//You have killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name is mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//The brotherhood counts one believer less, and you got him on your conscience!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Congratulations! You've won. It was a good fight.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ... it was obvious that there would be trouble ahead ...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ... but keep it to yourself, people don't need to know about it.
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ... You've got to watch what you tell people ...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ... I'm not listening to your blathering any more ...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ... you're probably right ...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ... hang on. Better not to go rushing into anything ...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ... I thought that had been cleared up ages ago ...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_10_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vernünftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Don't try any sorcery around me!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Stop, I say! At once!
	WeaponDown					=	"SVM_11_WeaponDown"						;//If you're looking for trouble just come here!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Put that thing away or you're done for!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Put that thing down!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//So you want trouble with me? Are you sure?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//What are you doing! Stop it!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Okay, let's forget about our little argument.
	Strange						=	"SVM_11_Strange"						;//Mmh! Damn! Where did he get to?
	DieMonster					=	"SVM_11_DieMonster"						;//They'll die out if they keep crossing my path!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//If you make enemies you need to be able to handle them. Die.
	NowWait						=	"SVM_11_NowWait"						;//You shouldn't have done that!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Didn't I knock you into the dust once? Here we go again ...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//If you don't listen, you gonna come to grief!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//Hey intruder. Now your lesson is coming!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Suppose I'll have to smack your fingers for you!
	DirtyThief					=	"SVM_11_DirtyThief"						;//Theft is not worthwhile!
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//You are unsettling my area! Now I need to finish you off!
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Killing one of us has been your last mistake!
	Dead						=	"SVM_11_Dead"							;//Aaargl
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//You shouldn't have done that!
	YesYes						=	"SVM_11_YesYes"							;//Okay, okay! You win!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//This one's too big for me!
	Help						=	"SVM_11_Help"							;//Retreat!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//That'll have consequences, pal!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//Don't try that again!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//I'll take better care of your weapon than you have done!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//Nice of you to leave me some of your ore!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Nothing, no ore!
	HandsOff					=	"SVM_11_HandsOff"						;//Get your dirty hands off!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Out of here or I'll make you run!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Hey, how did YOU get in here?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Not with me, mate!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//What's that supposed to be?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//The hut's mine. Out or I'll call the guards!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//What were you doing in there? Beat it before I beat you!
	WiseMove					=	"SVM_11_WiseMove"						;//Good! Don't do that again!
	Alarm						=	"SVM_11_Alarm"							;//Guards! Over here!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//ALERT!!! INTRUDER!!!
	BehindYou					=	"SVM_11_BehindYou"						;//Behind you!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Let's see who's winning this time!
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//Come on, do it!
	CheerFight					=	"SVM_11_CheerFight"						;//Stop playing with him!
	CheerFriend					=	"SVM_11_CheerFriend"					;//Oh come on, you can handle him, can't you?
	Ooh							=	"SVM_11_Ooh"							;//Ouh! Not so good!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Mmh! Not bad.
	RunCoward					=	"SVM_11_RunCoward"						;//Never show your face here again!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//That was good hit!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Doesn't matter! He deserved it!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//You've killed him! That spells big trouble!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Well done! A neat performance!
	Awake						=	"SVM_11_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Hello.
	ALGreetings					=	"SVM_11_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_11_MageGreetings"					;//For the honor of magic!
	SectGreetings				=	"SVM_11_SectGreetings"					;//Awaken!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Are you blind? Over there!
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//I can't teach you anything. You don't have enough experience.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//You're better than that already!
	HeyYou						=	"SVM_11_HeyYou"							;//Heh, you!
	NotNow						=	"SVM_11_NotNow"							;//Not now.
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//What do you want?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Can I do anything for you?
	MakeWay						=	"SVM_11_MakeWay"						;//May I pass through here?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Step aside!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Do you want me to beat it into your brain? Get out of here!
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//You looking for trouble with me again?
	LookAway					=	"SVM_11_LookAway"						;//I'm not gonna get involved in this!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Good! It's yours.
	WhatsThat					=	"SVM_11_WhatsThat"						;//What was that?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//You're carrying my weapon ... ?
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//Come on, give it to me!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Keep it, I don't need it anyway.
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//They got one of our guys. If I get that swine ...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//What's up, anyway?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Did you get a thrashing? Serves you right!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//You defeated one of the Ore Barons. That was impressive, but stupid. Very stupid indeed.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//You defeated one of the Gurus.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//To win against a magician ... is not exactly clever!
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//I protect the guys here, you have knocked one of them out ...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//If you touch the diggers, you're laying hands on my income!
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Whoever hurts my pals is hurting me.
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Lay your hands on a novice again and you'll be sorry!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Attacking my protégés can cost you your head.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//You dare to turn up here, dirty thief?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//You got some stuff that belongs to us. You'd better give it back.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Man! You've stolen from the Ore Barons! Boy, they'll be raging!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//You relieved the Gurus of a few things, didn't you?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//You relieved the magicians of a couple of things, didn't you?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//You have broken rule no. 1! No killing!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//You have killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name is mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//The brotherhood counts one believer less, and you got him on your conscience!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//That was a good fight. I'll still feel the pain for days. But now it's over!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ... it was obvious that there would be trouble ahead ...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ... but keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ... there must be something about that story after all because...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ... as long as I'm not involved …I
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ... I wouldn't like to be in his shoes though because he
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ... it's the same story every time …I
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ... well, there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ... I'm not listening to all the blathering any more ...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ... hang on. Better not to go rushing into anything ...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ... I thought that had been cleared up ages ago ...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_11_Om"								;//Ommm
};


instance SVM_12	(C_SVM)		//Bazaar-Händler		Nach außen freundlich,jovial,Innen hinterhältig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//Stop that magic!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//When I say 'stop the magic', I mean it!
	WeaponDown					=	"SVM_12_WeaponDown"						;//What do you intend to do with the weapon, man!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Put that thing down!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//You're aiming at me!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//If you don't stop doing that you'll be in trouble!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Hey, are you blind or what?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Let's forget about that little argument, okay?
	Strange						=	"SVM_12_Strange"						;//But he was here just a moment ago!? Strange!
	DieMonster					=	"SVM_12_DieMonster"						;//Your time has come, bastard!!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//It's payday!
	NowWait						=	"SVM_12_NowWait"						;//You're asking for a real beating!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//You still haven't had enough?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//Okay, you asked for it!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//They'll have to carry you out!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//I warned you. If you touch my stuff, you're in trouble!
	DirtyThief					=	"SVM_12_DirtyThief"						;//You thief! I'll teach you manners!
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Nobody messes with my guys without feeling very sorry after!
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//You've killed one of my men. Now I will kill YOU!
	Dead						=	"SVM_12_Dead"							;//Aaargl
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//You'll be sorry for that!
	YesYes						=	"SVM_12_YesYes"							;//Keep cool! You've won.
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//That one's too big for me, I'm off!
	Help						=	"SVM_12_Help"							;//Damn!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//Next time things'll look different!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//Don't try that again!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//I like that weapon!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//I'll make sure your ore is well invested!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//Damn! No ore!
	HandsOff					=	"SVM_12_HandsOff"						;//Hands off!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Get out of here!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Hey! Where did you come from?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Do you think I'm that stupid?!
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//What are you creeping about here for?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Get out of here or I'll call the guards!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//You've no business in there!
	WiseMove					=	"SVM_12_WiseMove"						;//You're learning fast!
	Alarm						=	"SVM_12_Alarm"							;//Guards! Over here!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//ALERT!!!!
	BehindYou					=	"SVM_12_BehindYou"						;//Watch it!
	TheresAFight				=	"SVM_12_TheresAFight"					;//A fight!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Smack it!
	CheerFight					=	"SVM_12_CheerFight"						;//Good!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Smack him over now!
	Ooh							=	"SVM_12_Ooh"							;//Just watch out!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//It was about time!
	RunCoward					=	"SVM_12_RunCoward"						;//That guy's sneaking off!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Clear winner, I'd say!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//He deserved it!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//You just go killing people. You'll really be in trouble now!
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//What a fight!
	Awake						=	"SVM_12_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Hello, friend!
	ALGreetings					=	"SVM_12_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_12_MageGreetings"					;//For the honor of magic!
	SectGreetings				=	"SVM_12_SectGreetings"					;//Awaken!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Over there.
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//I can't teach you anything because you're so inexperienced.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//You're already better now!
	HeyYou						=	"SVM_12_HeyYou"							;//Hey, you!
	NotNow						=	"SVM_12_NotNow"							;//Not now.
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//Can I help you?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//What do you want?
	MakeWay						=	"SVM_12_MakeWay"						;//Let me pass.
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//Come on, let me pass!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Are you deaf or are you looking for trouble?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//You looking for trouble with me again?
	LookAway					=	"SVM_12_LookAway"						;//Did something happen? I didn't see a THING ...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Okay, just keep it!
	WhatsThat					=	"SVM_12_WhatsThat"						;//What was that?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//I'd really want my weapon back!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Just give it to me!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//Hm, it's not that bad! I got more!
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//They got one of our guys. If I get that swine ...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hm, what is it? Why are you waking me up?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//Eh? Got your mug polished? Serves you right!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//You knocked down an Ore Baron. He was impressed!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//You defeated one of the Gurus. I'm impressed. But don't even think of trying it again.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//To win against a magician ... you must be a brave man!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//You must be mad just to knock out a novice like that.
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//What did you think you were doing, beating up a digger?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//You've knocked down my pal, what was that for?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Lay your hands on a novice again and you'll be sorry!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//You're too brave, touching one of my protégés could be very dangerous for you.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//You dare turn up here, dirty thief?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//You got some stuff that belongs to us. You better give it back.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Man! You've stolen from the Ore Barons! They'll be raging!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//You've stolen from the Gurus? You might at least not have got yourself caught!
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//The magicians don't like people rummaging around in their stuff!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//You've got one of our men on your conscience. Another little mistake and it'll be your turn!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//You killed an Ore Baron? Man, are you completely nuts!?
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//You killed a Guru? Boy, I don't believe it!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//You have killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name was mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//The brotherhood counts one believer less, and you got him on your conscience!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//You've given me a fair thrashing, man. T'was a good fight. But now it's over!
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ... it was obvious that there would be trouble ahead ...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ... but keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ... there was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ... I'm not listening to all the blathering any more ...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ... hang on. Better not go rushing into anything ...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ... I thought that had been cleared ages ago ...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_12_Om"							;//Ommm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, übereifrig, Ähnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y´berion blind,	Mitläufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//Stop your sorcery!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Take it away, AWAY!!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Put the weapon down!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Put that weapon down!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//Are you aiming at me? Watch out!
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//You're heading straight for your own death. You'd better aim somewhere else!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//What's that in aid of?!
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Let's forget about that argument, okay?
	Strange						=	"SVM_13_Strange"						;//Where did he go? This can't be!
	DieMonster					=	"SVM_13_DieMonster"						;//Tonight we'll have meat!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//It's your turn now! No mercy!
	NowWait						=	"SVM_13_NowWait"						;//That'll mean a good hiding ...
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//You don't want to try it again, do you?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//You asked for that!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Now you're done for, intruder!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//I should cut off your fingers!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Dirty thief! I'll break your hands ...
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//Nobody beats up anybody else here except me!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//You've killed one of us!
	Dead						=	"SVM_13_Dead"							;//Aaargl
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//You won't have much time to be sorry for it!
	YesYes						=	"SVM_13_YesYes"							;//No problem, there's no problem!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//I don't have the right weapon. We'll meet again ...
	Help						=	"SVM_13_Help"							;//Woooooaaahhh! Clear off!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//I'll bee seeing you!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//Next time I'll kill you!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//Nice weapon! Is it yours? No? Okay!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//I suppose you don't have nothing against me keeping some ore.
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//You don't even have any ore in your pockets!
	HandsOff					=	"SVM_13_HandsOff"						;//You rat! Hands off! I'll give it to you!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Buzz off! Get out of here!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//What are you doing here anyway?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//You're really trying to make a fool out of me!
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Hey, you! What are you creeping around here for?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//What are you doing here? Scoot, or I'll call the guards!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//You've no business in there!
	WiseMove					=	"SVM_13_WiseMove"						;//Lucky for you! But I would have enjoyed polishing your mug!
	Alarm						=	"SVM_13_Alarm"							;//Guards, come here!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//ALERT!!
	BehindYou					=	"SVM_13_BehindYou"						;//Behind you!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Let's see who's gonna swallow dust soon.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Yeah, again!
	CheerFight					=	"SVM_13_CheerFight"						;//I want to see blood!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Turn him over!!
	Ooh							=	"SVM_13_Ooh"							;//Strike back, you idiot!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Yeaah!!!
	RunCoward					=	"SVM_13_RunCoward"						;//Yeah, buzz off!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//Sad performance! A tiny gust of wind and he would have toppled over anyway.
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Pah, serves him right!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//It's suicide killing somebody in front of witnesses.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Nice fight!
	Awake						=	"SVM_13_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Everything alright with you?
	ALGreetings					=	"SVM_13_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_13_MageGreetings"					;//For the honor of magic!
	SectGreetings				=	"SVM_13_SectGreetings"					;//Awaken!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Are you blind? Over there!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//I can't teach you anything. You don't have enough experience.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//You need to become advanced before you can become a master!
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//You're already better now!
	HeyYou						=	"SVM_13_HeyYou"							;//Hey, you!
	NotNow						=	"SVM_13_NotNow"							;//Not now!
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//What do you want from me?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Can I do anything for you?!
	MakeWay						=	"SVM_13_MakeWay"						;//Let me pass.
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Get out of the way!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//You looking for trouble? Get out of here!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//You looking for trouble with me again?
	LookAway					=	"SVM_13_LookAway"						;//I didn't see ANYTHING!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Easy. That thing is yours.
	WhatsThat					=	"SVM_13_WhatsThat"						;//What was that?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Give me my weapon back!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Give it to me!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//Okay! Keep it! I'll find another solution!
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//One of us has died! That calls for revenge!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Why have you woken me up?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Serves you right that you got a beating!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//You've knocked down an Ore Baron! He's really mad at you!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//You've knocked down a Guru. Somehow you seem to attract trouble like a magnet!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//To win against a magician is a really rotten idea!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//So you're the one who beats up the novices!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Leave my guys alone!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//It's not a good idea to go near my pals.
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//You making trouble here won't be tolerated!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//If you beat up somebody under my protection there'll be repercussions!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//You've stolen from me! Don't try that again!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//We want our things back! Give us 'em!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//You've stolen from the Ore Barons! What the hell was that for?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//You stole from the Gurus? What a pity they found you out.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//You've stolen from the magicians! A really lousy idea!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//One of our people has died and you have something to do with it! One tiny mistake and you are done for!
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//You've killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name was mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//The brotherhood counts one believer less, and you got him on your conscience!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//You've given me a fair threshing, man. T'was a good fight. But now it's over!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ... it was obvious that there'd be trouble ahead ...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ... but keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ... that was a time when things would have gone very differently ...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ... I'm not listening to all the blathering any more ...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ... I doubt that's ever likely to change ...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ... hang on. Better not to go rushing into anything ...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ... I thought that had been cleared up ages ago ...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_13_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erzähler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Stop your magic!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//You heard me: Stop your sorcery!
	WeaponDown					=	"SVM_14_WeaponDown"						;//What do you want with that weapon?
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Put the weapon down!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//You're aiming at me!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Would you stop aiming at me?!
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Just watch out!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Let's forget our little difference of opinion!
	Strange						=	"SVM_14_Strange"						;//A good trick, he's just disappeared!
	DieMonster					=	"SVM_14_DieMonster"						;//A nuisance of a creature.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//I have to kill you ... It's nothing personal, you understand!
	NowWait						=	"SVM_14_NowWait"						;//That's enough for now!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//You don't want trouble again, do you?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//That's the way you wanted it!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//You haven't been invited!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//My property is not for you!
	DirtyThief					=	"SVM_14_DirtyThief"						;//You've borrowed something from me! Now you'll have to pay for it!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//You need to learn to stick to the rules!
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//You've killed somebody!
	Dead						=	"SVM_14_Dead"							;//Aaargl
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//You'll regret that!
	YesYes						=	"SVM_14_YesYes"							;//Okay, okay!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//I don't want to take this challenge right now!
	Help						=	"SVM_14_Help"							;//I need to get back to my studies!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//I'm sure we'll meet again!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//You'd better not do that again!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//I'll take that weapon!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//The ore is useful for sure!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//You don't have any ore!
	HandsOff					=	"SVM_14_HandsOff"						;//Hands off!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Get out of here!
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//How did you get in here?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//You must be joking!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//What are you sneaking around for?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Just leave before I call the guards!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//You've no business in there! Understood?
	WiseMove					=	"SVM_14_WiseMove"						;//Smart decision!
	Alarm						=	"SVM_14_Alarm"							;//Guards, here, here!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//INTRUDER!!!
	BehindYou					=	"SVM_14_BehindYou"						;//Behind you!
	TheresAFight				=	"SVM_14_TheresAFight"					;//A fight!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Hm.
	CheerFight					=	"SVM_14_CheerFight"						;//How ineffective!
	CheerFriend					=	"SVM_14_CheerFriend"					;//Looks quite strenuous!
	Ooh							=	"SVM_14_Ooh"							;//That was painful!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//That's one way of doing it ...
	RunCoward					=	"SVM_14_RunCoward"						;//He has learned something!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//That was it then.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Serves him right!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//It was unnecessary to kill him, you'll be in great trouble for that!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//These fights bore me!
	Awake						=	"SVM_14_Awake"							;//Was I asleep?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Greetings.
	ALGreetings					=	"SVM_14_ALGreetings"					;//For Gomez!
	MageGreetings				=	"SVM_14_MageGreetings"					;//For the honor of magic!
	SectGreetings				=	"SVM_14_SectGreetings"					;//Awaken!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//He's over there.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//I can't teach you anything. You don't have enough experience.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//You're at the end of your possibilities. You should learn something different.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//You need to become advanced before you become a master!
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//You're already better now!
	HeyYou						=	"SVM_14_HeyYou"							;//Hey, you!
	NotNow						=	"SVM_14_NotNow"							;//Not now.
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//What can I do for you?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Can I help you?
	MakeWay						=	"SVM_14_MakeWay"						;//Step aside!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Let me pass.
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Now make yourself scarce!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//You looking for trouble with me again?
	LookAway					=	"SVM_14_LookAway"						;//I'm not interested in what you're up to!
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Keep it!
	WhatsThat					=	"SVM_14_WhatsThat"						;//What was that?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Give me my weapon back!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Give it to me!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//Okay. I don't want her any more!
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//One of us has been killed. We'll find the culprit ...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//You're disturbing my studies!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//You had problems, so I heard!
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//You knocked down an Ore Baron. He was impressed!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//You defeated one of the Gurus. I'm impressed.
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//To win against a magician ...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//You know that the novices are under my protection. And nevertheless you still touch them?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//If you touch the diggers, you're laying hands on my income!
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//You shouldn't get in trouble with my friends.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Lay your hands on a novice again and you'll be sorry!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//If you attack one of my protégés, it might cost you your head.
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//How dare you turn up here, dirty thief?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//You've got some stuff that belongs to us. You better give it back.
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Man! You've stolen from the Ore Barons! They'll be raging!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//You relieved the Gurus of a few things.
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//You relieved the magicians of a couple of things.
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//You've killed one of us. Another little mistake and your number will be up!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//You killed an Ore Baron! Man, are you completely nuts!?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//You killed a Guru! Boy, I don't believe it!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//You've killed a magician! How do you ever plan to justify that?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//A member of the Old Camp is dead, and your name was mentioned in connection with his death ...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//The New Camp has suffered a tragic loss, and it appears you're involved!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//The brotherhood counts one believer less, and you got him on your conscience!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//It won't be easy to straighten that out!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//You've given me a fair thrashing, man. T'was a good fight. But now it's over!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ... if you think ...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ... maybe ...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ... that wasn't very clever ...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ... I'd better keep out of it ...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ... that's really not my problem ...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ... it was obvious that there'd be trouble ahead ...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ... but keep it to yourself, people don't need to know it.
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ... that won't happen again ...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ... there must be something about that story after all ...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ... you have to watch what you tell people ...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ... as long as I'm not involved ...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ... you shouldn't believe everything you hear ...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ... I wouldn't like to be in his shoes though ...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ... same old story every time ...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ... some people never learn ...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ... there was a time when things could have gone very differently ...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ... people always talk ...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ... I'm not listening to all the blathering any more ...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ... rely on somebody and you're in trouble, that's how it goes ...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ... I doubt that it's ever likely to change ...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ... you're very probably right ...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ... hang on. Better not go rushing into anything ...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ... I'd thought that had been cleared ages ago ...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ... let's talk about something else instead ...
	Om							= 	"SVM_14_Om"							;//Ommm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hey, you!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Just wait!

	SectGreetings			=	"SVM_15_SectGreetings"				;//Awaken!
	ALGreetings				=	"SVM_15_ALGreetings"				;//For Gomez!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Greetings!
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Hi!
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargl
	Awake					=	"SVM_15_Awake"						;//Yawn!
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Doesn't work.
	PickBroke				= 	"SVM_15_PickBroke"					;// Hm, broken.
	NeedKey					= 	"SVM_15_NeedKey"					;// I need a key for that ...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// No more skeleton keys ...
	InvFull					= 	"SVM_15_InvFull"					;// I can't carry any more than that.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Just go! You're not supposed to talk to me!
	Help						=	"SVM_16_Help"			;	//Scream!
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Aargh
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Aargh
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Aargh
	Dead						=	"SVM_16_Dead"			;	//Aaargl
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverständlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//über Stimme 17, sind aber in halbwegsverständlichem orkisch-deutsch
												//Das hier überall vergebene "SVM_17_OrcSound01" wird noch durch 9 weitere Variationen ergänzt

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




