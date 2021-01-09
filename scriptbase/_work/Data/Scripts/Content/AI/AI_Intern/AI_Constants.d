//#############################################################################################
//
//	AI-Custom-Konstanten
//	-----------------------------
//	Allerlei selbst definierte Konstanten, um Zahlen in den Skripten weitgehend zu vermeiden
//
//#############################################################################################
//#############################################################################################


//-------- Kennungen der AI-Variablen -------- 
const int 	AIV_WANTEDITEM				 	= 0;
const int 	AIV_PCISSTRONGER				= 1;
const int 	AIV_BEENATTACKED				= 2; 
const int 	AIV_HIGHWAYMEN					= 3;
const int	AIV_HAS_ERPRESSED				= 4; // MH: 0 = Nein, 1 = SC hat gezahlt, 2 = SC wollte sich nicht erpressen lassen, es kam zum Kampf
const int 	AIV_BEGGAR						= 5;
const int	AIV_OBSERVEINTRUDER				= 6;
const int	AIV_FINDABLE					= 7; // MH: Für Info_FindNPC
const int 	AIV_PLUNDERED					= 8;	// wird gesetzt sobald der Körper geplündert wurde und gelöscht, wenn der NSC ohnmächtig/tot wird
const int	AIV_WARNTARGET					= 9;
const int	AIV_LASTHITBYRANGEDWEAPON		= 10; // SN: Merkt sich, ob der letzte erlittene Schaden durch eine Fernkampfwaffe/Magie verursacht wurde. Wird für einen intelligenten Abbruch des ZS_Attack benötigt.
const int	AIV_HASBEENDEFEATEDINPORTALROOM	= 11;
const int 	AIV_HANGAROUNDSTATUS			= 12;
const int 	AIV_TRIGGER3  					= 13;
const int	AIV_GUARDMEMORY					= 14;
const int 	AIV_GUARDITERATOR				= 15;
const int	AIV_FIGHTSPEACHFLAG				= 16;
const int   AIV_ITEMSTATUS  				= 17;
const int   AIV_ITEMFREQ  					= 18;
const int   AIV_WASDEFEATEDBYSC				= 19;
const int   AIV_HASDEFEATEDSC				= 20;
const int   AIV_ISLOOKING					= 21;
const int   AIV_IMPORTANT					= 22;
const int   AIV_MOVINGMOB					= 23;

//-------- Missionen --------
const int	AIV_MISSION1					= 24;
const int	AIV_MISSION2					= 25;
const int	AIV_MISSION3					= 26;

//-------- Durchgangswachen --------
const int	AIV_GUARDPASSAGE_STATUS			= 27;	// Enthält den Status einer Durchgangswache
const int		AIV_GPS_BEGIN			= 0;		// ...Anfang; SC noch nicht in der Nähe
const int		AIV_GPS_FIRSTWARN		= 1;		// ...nach der ersten Warnung an den SC
const int 		AIV_GPS_LASTWARN		= 2;		// ...nach der zweiten Warnung an den SC 
const int		AIV_GPS_PUNISH			= 3;		// ...SC kam zum dritten Mal zu nahe -> Wache greift an!
const int	AIV_LASTDISTTOWP				= 28;	// enthält die Distanz zu einem Referenzpunkt hinter der Wache, die bei der letzten Verwarnung ermittelt wurde
const int   AIV_PASSGATE					= 29;   // für Durchgangswachen 0 = Wache hält SC auf, 1 = Wache lässt SC durch

const int 	AIV_DIDWAITTOCLEARROOM			= 30;	
const int	AIV_FOUNDPERSON					= 31;	// In einigen TAs wird mit Npc_PerceiveAll nach bestimmten Personen gesucht. Damit dies nicht ständig gemacht werden muß, wird hier gemerkt, ob diese Person schon gefunden wurde

const int   AIV_LOCATION					= 32; // MH: für Aufenthaltsort - wichtig für Dialoge (kann LOC_OLDCAMP, LOC_NEWCAMP, etc. sein)
const int   AIV_INVINCIBLE					= 33; // MH: ist TRUE für beide Teilnehmer eines Dialogs (s. ZS_Talk)
const int 	AIV_DONTUSEMOB					= 34; // Sonst wird immer wieder der komplette StartBlock durchlaufen

const int	AIV_ATTACKREASON				= 35;	// SN: Grund des Angriffs
const int		AIV_AR_NONE				= 0;
const int		AIV_AR_INTRUDER			= 1;

const int	AIV_PARTYMEMBER					= 36;	//SN: (begleitet den Spieler - für XP-Vergabe)
const int	AIV_SPECIALCOMBATDAMAGEREACTION	= 37;	//SN: verzweigt bei erlittenen Treffern in ein spezielles Reaktionsmodul
const int	AIV_RESPAWN						= 38;	//MH: im NSC-Script angegeben: Soll der Typ respawnt werden (immer DIREKT)
const int	AIV_LASTTARGET					= 39;	//SN: wird in ZS_Attack benötigt um das letzte Ziel zu merken
const int	AIV_TALKBEFOREATTACK			= 40;	//SN: ist dieses Flag gesetzt, so wird beim B_AssessEnemy auf eine Importantinfo abgefragt!
const int	AIV_DEALDAY						= 41;	//SN: wird für Ambient NSCs benutzt, um sich den Tag des letzten Deals zu merken (z.B.:Sumpfkraut für ORG oder Wasser für BAU)

const int 	AIV_ITEMSCHWEIN					= 42;   //MH: NSCs, die dieses Flag auf TRUE haben, gehen IMMER, wenn im FreeLos der HERO ein Item nimmt (assessTheft-Wn) von DIEBSTAHL aus (--> ZS_CatchThief)

/********************************************************************
**					NPC-Typ											*
********************************************************************/
//!!!! die folgenden 3 Konstanten stehen zur Zeit (v0.93) noch in der
//!!!! CONSTANTS.D, müssen aber im nächsten Release (v0.94) hier 
//!!!! aktiviert werden.
//---------------------------------------
const int NPCTYPE_AMBIENT		= 0;	//Amient-Nscs In Den Lagern
const int NPCTYPE_MAIN			= 1;
const int NPCTYPE_GUARD			= 2;
const int NPCTYPE_FRIEND		= 3;
const int NPCTYPE_MINE_AMBIENT  = 4;
const int NPCTYPE_MINE_GUARD	= 5;
const int NPCTYPE_OW_AMBIENT	= 6;
const int NPCTYPE_OW_GUARD		= 7;
const int NPCTYPE_ROGUE			= 8;	//Npcs im Banditenlager

/********************************************************************
**					Fight AI-Constanten								*
********************************************************************/

const int 	FAI_MONSTER_MASTER 	=	1;
const int	FAI_HUMAN_COWARD	=	2;
const int	FAI_HUMAN_STRONG	=	3;
const int	FAI_HUMAN_MASTER	=	4;
const int	FAI_MINECRAWLER		=	5;
const int	FAI_DEMON			=	6;
const int	FAI_GOBBO			=	7;
const int	FAI_GOLEM			=	8;
const int	FAI_LURKER			=	9;
const int	FAI_MONSTER_COWARD	=	10;		// Monster, die man auch als Newbie kleinkriegt
const int	FAI_MOLERAT			=	11;
const int	FAI_ORC				=	12;
const int	FAI_ORCDOG			=	13;
const int	FAI_ORCUNDEAD 		=	14;
const int	FAI_SCAVENGER 		=	15;
const int	FAI_SHADOWBEAST 	=	16;
const int	FAI_SKELETON		=	17;
const int	FAI_SNAPPER			=	18;
const int	FAI_SWAMPSHARK		=	19;
const int	FAI_TROLL			=	20;
const int	FAI_WARAN			=	21;
const int	FAI_WOLF			=	22;
const int	FAI_ZOMBIE			=	23;
const int	FAI_BLOODFLY		=	24;
const int 	FAI_HUMAN_MAGE		=	25;
const int	FAI_MONSTER_STRONG	=	26;
const int	FAI_MINECRAWLERQUEEN=	27;
const int	FAI_SLEEPER			=	28;
const int	FAI_HUMAN_RANGED	=	29;


/********************************************************************
**					Gesichts-Texturen								*
********************************************************************/
CONST INT DEFAULT =				0;

CONST INT FACE_NORMAL =			0;
CONST INT FACE_MAGE =			1;
CONST INT FACE_FIGHTER =		2;
CONST INT FACE_THIEF =			3;
CONST INT FACE_GURU =			4;
CONST INT FACE_NOVICE =			5;


/********************************************************************
**					Zeit-Konstanten									*
********************************************************************/
CONST INT NPC_ANGRY_TIME = 120;			// Spielsekunden
//CONST INT NEWS_SPAWN_TIME = ?;


/********************************************************************
**					ZS_RÜCKABEWERTE 							   **
********************************************************************/

CONST INT START_LOOP 	= 1;
CONST INT START_NOLOOP  = 0;
CONST INT LOOP_CONTINUE = 0;
CONST INT LOOP_END		= 1;

/********************************************************************
**					Allgemeine Konstanten						   **
********************************************************************/
const int TRUE				=	1;
const int FALSE				=	0;

/********************************************************************
**					Konstanten für Distanzen					   **
**					    der Menschen-AI							   **
********************************************************************/
const int	HAI_DIST_MELEE					= 600;							// 1. Drunter wählen menschliche NSCs Nahkampf, drüber Fernkampf (B_SelectWeapon)
																			// 2. Innerhalb dieser Distanz fühlen sich NSCs von gezogenen Waffen bedroht (B_AssessFighter)
const int	HAI_DIST_RANGED					= 3000;							// 1. Innerhalb dieser Distanz fühlen sich NSCs von gezogenen Fernkampfwaffen/Kampfzaubern bedroht (B_AssessFighter)

const int	HAI_DIST_ABORT_MELEE 			= HAI_DIST_MELEE+400;			// NSC bricht einen Nahkampf ab, wenn die Distanz zum Ziel diesen Wert erreicht. '+X00' fungiert als Hysterese, damit nicht ständig der Kampf beginnt und wieder endet	
const int	HAI_DIST_ABORT_RANGED 			= HAI_DIST_RANGED+500;			// NSC bricht einen Fernkampf ab, wenn die Distanz zum Ziel diesen Wert erreicht. '+X00' fungiert als Hysterese, damit nicht ständig der Kampf beginnt und wieder endet	
const int	HAI_DIST_ABORT_FLEE				= 3000;

const int	HAI_DIST_ASSESSCASTER			= 2000;							// Ab dieser Entfernung reagieren NSCs auf das Zaubern eines SCs
const int	HAI_DIST_HELPATTACKEDCHARGES	= 2000;							// Wach-NSCs reagieren auf Angriffe auf beschützte NSCs innerhalb dieser Reichweite (gemessen am Opfer!)

const int	HAI_DIST_ASSESS_MONSTER			= 1000;							// Ab dieser Distanz zu einem herannahenden Monster reagiert der NSC darauf !
const int	HAI_DIST_ABORT_ASSESS_MONSTER	= HAI_DIST_ASSESS_MONSTER+200;	// Ab dieser Distanz beendet ein NSC die Abwartende Haltung gegenüber einem sich entfernenden Monster!
const int	HAI_DIST_ATTACK_MONSTER			= 1000;							// Ab dieser Distanz greift ein abwartender NSC ein herannahendes Monster an!

const int	HAI_DIST_CATCHTHIEF				= 150;							// Ab dieser Distanz ist es möglich dem Nsc in die Tasche zu greifen
const int	HAI_DIST_ASSESSTHEFT			= 800;							// Auf diese Distanz stellen Nsc´s einen Diebstahl fest
const int	HAI_DIST_ABORTPURSUIT			= 1000;							// Auf diese Distanz brechen Durchgangswachen die Verfolgung ab

const int 	HAI_DIST_ACTIONRANGE			= 1500;							// technische Reichweite von PERC_ASSESSENTERROOM
const int	HAI_DIST_CLEARROOM				= 700;							// innerhalb dieser Distanz reagieren nicht-Wachen auf das Betreten von unerlaubten Räumen (PERC_ASSESSENTERROOM)
const int	HAI_DIST_HEARROOMINTRUDER		= 700;							// innerhalb dieser Distanz wird der SC beim Betreten von unerlaubten Räumen auch entdeckt (gehört), wenn die Beobachter ihm den Rücken zudrehen (aber schleichen hilft wieder!)

const int	HAI_DIST_SMALLTALK				= 500;
const int	HAI_DIST_OBSERVEINTRUDER		= 50;
const int	HAI_DIST_GUARDPASSAGE_RESET		= 1500;							// Durchgangswachen beruhigen sich wieder, wenn der SC diese Entfernung erreicht hat
const int	HAI_DIST_GUARDPASSAGE_ATTENTION	= 1200;							// innerhalb dieser Distanz drehen sich Durchgangswachen immer zum Spieler

const int	HAI_DIST_FOLLOWPC				= 500;							// NSC im TA-Zustand ZS_FollowPC entfernt sich höchstens bis zu dieser Distanz. Bei Überschreiten schließt er wieder auf
const int	HAI_DIST_ASSESSTOLERATEDENEMY	= 1000;							// Distanz innerhalb der auf einen geduldeten Feind reagiert wird (Fall 1)

const int	HAI_DIST_WATCH					= 1500;							// Innerhalb dieser Reichweite drehen sich Palisadenwachen zum SC (falls er nicht schleicht)
const int	HAI_DIST_DETECTUSEMOB			= 1500;							// Innerhalb dieser Reichweite wird die Benutzung von Objekten durch den SC entdeckt

/********************************************************************
**					Konstanten für Zeiten						   **
**					    der Menschen-AI							   **
********************************************************************/
const int	HAI_TIME_PURSUIT				= 20;							// Zeit in Sekunden, nach der eine Verfolgung abgebrochen wird (ZS_ProclaimAndPunish)
const int	HAI_TIME_FOLLOW					= 10;							// Anzahl der 3s-Abschnitte die sich das Opfer des NSCs maximal in BS_RUN befinden darf, um noch weiter verfolgt zu werden
const int	HAI_TIME_UNCONSCIOUS			= 20;							// Zeit in Sekunden, die der SC und NSCs bewußtlos bleiben
const int	HAI_TIME_TURNAWAY				= 20;							// Zeit in Sekunden, die sich der feige Wach-NSC vor dem siegreichen SC (der gerade was anstellt) abdreht und ihn ignoriert


