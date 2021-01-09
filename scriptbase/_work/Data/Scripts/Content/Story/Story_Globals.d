// *************************
// Globalvariablen für Story
// *************************

const int ZivilAnquatschDist = 300;

const int DurstigeBauern = 10;

var int SLF_FIRE;

var int Kapitel;
var int Play_Lute;
var int Firstjoint;
var int Secondjoint;
var int Thirdjoint;
var int Wissen_Almanach;

var int Points_OC;
var int Points_NC;
var int Points_ST;

var int Knows_GetTeeth;
var int Knows_GetClaws;
var int Knows_GetFur;
var int Knows_GetHide;
var int Knows_GetTongue;
var int Knows_GetMCMandibles;
var int Knows_GetMCPlates;
var int Knows_GetBFSting;
var int Knows_GetUluMulu;

var int LesterGuide;

var int Bloodwyn_ProtectionPaid;
var int Bloodwyn_PayDay;
var int Herek_ProtectionBully;
var int Grim_ProtectionBully;
var int Jesse_PayForMe;



var int NC_Joints_verteilt;

var int Cronos_Messenger;
var int Thorus_MordragMageMessenger;

// **************************************************
//					Whistlers Schwert
// **************************************************
	var int Fisk_SCknows110;
	var int Fisk_ForgetSword;
	var int Fisk_SwordSold;
// **************************************************
// **************************************************
//					GotoNewcamp Mordrag
// **************************************************
	var int Mordrag_GotoNC_Day;
// **************************************************

var int	EnteredOldMine;
var int Kalom_TalkedTo;
var int KALOM_KRAUTBOTE; 
var int Kalom_DeliveredWeed;
var int Lefty_WorkDay;
var int Lefty_Mission;
var int Ricelord_AskedForWater;
var int An_Bauern_verteilt;

var int Lares_InformMordrag;

// Sumpflager
var int Psi_Walk;
var int Ghorim_KickHarlok;
var int Joru_JoinPsi;
var int Joru_Tips_Mage;
var int BaalNamib_Ansprechbar;
var int BaalNamib_Sakrileg;
var int BaalOrun_FetchWeed;
var INT Kalom_DrugMonopol;
var int Stooges_Fled;
var int idiots_deal;

//---------------------------------------------------------------------
//	KAPITEL 2
//---------------------------------------------------------------------
var int InExtremoPlaying;
var int Aaron_lock;
var int Snipes_deal;
var int Ian_gearwheel;
var int CorKalom_BringBook;
var int CorKalom_BringMCQBalls;
var int YBerion_BringFocus; 
var int PresseTourJanuar2001; 
var int Corristo_KDFAufnahme;
var int Saturas_KDWAufnahme;

//---------------------------------------------------------------------
//	KAPITEL 3
//---------------------------------------------------------------------
var int CorAngar_GotoOGY;	//TRUE oder FALSE
var int CorAngar_FindHerb; 
var int	Fortuno_HasYBerionHerbs;	// TRUE oder FALSE
var int Yberion_dead;
var int BaalLukor_BringParchment;
		// 0:	keine Hälfte gefunden
		// 1:	die erste Hälfte gefunden
		// 2:	die zweite Hälfte gefunden
		// 3:	beide Hälften gefunden
		// 4:	Kampf gegen BaalLukor
var int CorAngar_SendToNC;
		// FALSE oder TRUE
var int	Saturas_BringFoci;
		// 0:	Auftrag nicht vergeben
		// 1:	Auftrag vergeben, Almanach und 1 Fokus abgeliefert
		// 2:	2 Fokus abgeliefert
		// 3:	3 Foki abgeliefert
		// 4:	4 Foki abgeliefert
		// 5:	5 Foki abgeliefert
var int MonasteryRuin_GateOpen;
		// TRUE oder FALSE
		
var int Troll_Wheel;
		//für Wheel in der Trollschlucht		
		// 0:	Auftrag nicht vergeben
		// 1:	1x vom Spieler angepackt
		// 2:	Winde von Diego repariert
		// 3:	Winde geöffnet
//---------------------------------------------------------------------
//	KAPITEL 4
//---------------------------------------------------------------------

var int warned_gorn_or_lester; 			//TRUE oder FALSE			
var int oldHeroGuild;		
var int FMTaken;
var int Lee_freeminereport;
var int FindXardas;
var int FindGolemHearts;
	// 0: Auftrag nicht vergeben
	// 1: Auftrag vergeben
	// 2: ein Herz abgeliefert
	// 3: zwei Herzen abgeliefert
	// 4: drei Herzen abgeliefert
var int FindOrcShaman;					//LOG_RUNNING oder LOG_SUCCESS
var int UrShak_SpokeOfUluMulu;			//TRUE oder FALSE
var int FriendOfUrShak;					//TRUE oder FALSE
var int Gorn_JoinedForFM;				//TRUE oder FALSE
var int Gorn_GotoWolf;					//TRUE oder FALSE
var int	EnteredFreeMine;				//TRUE oder FALSE
var int	FreemineOrc_SuchePotion;		//LOG_RUNNING oder LOG_SUCCESS
var int	FreemineOrc_LookingUlumulu;		//LOG_RUNNING oder LOG_SUCCESS
var int MCPlatesDelivered;				//TRUE oder FALSE

//---------------------------------------------------------------------
//	KAPITEL 5
//---------------------------------------------------------------------
var int	OrcCity_Sanctum_OuterGateOpen;
var int OrcCity_Sanctum_OuterGateTried;	//TRUE oder FALSE
var int EnteredTemple;					//TRUE oder FALSE
const int HighPriest_MaxHit = 3;		//Anzahl der Schläge auf den fünften Ork-Priester, bis der "SC-hats-kapiert-Dialog" kommt
var int	EncounteredHighPriest;			//TRUE oder FALSE
var int ExploreSunkenTower;				//TRUE oder FALSE
var int LoadSword;						//TRUE oder FALSE
var int	StartChaptersSix;				//TRUE oder FALSE
var int KnowStone;						//TRUE oder FALSE



//#####################################################################
//##
//##
//##					Erfahrungspunkte
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	KAPITEL 1
//---------------------------------------------------------------------
// Altes LagerAufnahme
const int	XP_DiegoBringlist   =  750;
const int	XP_Fingerstrain		=  100;
const int   XP_Whistlerssword	=  200;
const int	XP_kirgovictory		=  150;
const int	XP_Kharimlost		=   50;
const int	XP_kharimvictory	=  200;
const int	XP_Snafcook			=  100;
const int	XP_Slysearchfornek	=  250;
const int	XP_Thorusmordragko	=  250;	
const int	XP_Thorusmordragdead=  300;
const int	XP_fiskdealer		=  300;
const int	XP_BecomeShadow		= 1000;
const int	XP_DexterKalom		=  350;

const int  	XP_GilbertFound		= 100;
const int 	XP_XardasLetter		= 200;
const int 	XP_XardasLetterOPEN = 100;

// Sumpflager-Aufnahme
const int	XP_ArrivedAtPsiCamp			= 200;
const int	XP_WeedForJoru				= 50;
const int	XP_ImpressBaalCadar			= 250;
const int	XP_ImpressBaalNamib			= 250;
const int	XP_DustyJoined				= 250;
const int	XP_BribedDustyGuard			= 250;
const int	XP_DeliveredDusty			= 500;
const int	XP_SentHarlok				= 300;
const int	XP_BaalOrunTalks			= 100;
const int	XP_WeedFromBalor			= 100;
const int	XP_BalorNamedCipher			= 50;
const int	XP_WeedFromViran			= 500;
const int	XP_DeliveredWeedHarvest		= 100;
const int	XP_ReportToBaalOrun			= 200;
const int	XP_ImpressedBaalOrun		= 250;
const int	XP_ImpressedBaalTyon		= 200;
const int	XP_BecomeNovice				= 750;
const int	XP_WeedShipmentDelivered	= 200;
const int	XP_WeedShipmentReported		= 200;
const int 	XP_JackoRetired				= 500;
const int 	XP_DrugMonopol				= 750;

// Aufnahme Neues Lager
const int	XP_ArrivedWithMordrag		= 200;
const int	XP_LeftyCarriedWater		= 100;
const int	XP_LeftyConfronted			= 300;
const int	XP_KickedShrike				= 200;
const int	XP_ReportedKickedShrike		= 100;
const int	XP_ReportDeadDamLurker		= 300;
const int 	XP_CronosLetter				= 200;

const int	XP_CheatedIntoLaresHut		= 250;
const int	XP_GiveRingToLares			= 250;
const int	XP_GiveListToLares			= 250;
const int	XP_ReportListDeliveryToLares= 750;

const int	XP_DistributedWeedForKagan	= 200;
const int	XP_BaalIsidroSpendDrink		= 100;
const int	XP_BaalIsidroTellPlans		= 200;
const int	XP_BaalIsidroPayShare		= 500;
const int	XP_BaalIsidroPayLares		= 500;

const int	XP_BecomeBandit				= 1000;

const int	XP_AssistMordrag			= 250;

//---------------------------------------------------------------------
//	KAPITEL 2
//---------------------------------------------------------------------
const int	XP_BringFocusToYBerion		=	750;
const int	XP_BringFocusToCorKalom		=	250;
const int	XP_LureAaronAway			=	75;
const int	XP_SellKeyToAaron			=	75;
const int	XP_LureUlbertAway			=	75;
const int	XP_BringGearWheel			=	750;
const int	XP_HireGorNaKosh			=	250;
const int	XP_HireGorNaBar				=	250;
const int	XP_HireGorNaVid				=	250;
const int	XP_OpenAsghansGate			=	1500;
const int	XP_BringMCEggs				=	2500;
const int	XP_BringBook				=	2500;

const int	XP_ReportToMordrag			= 500;
const int 	XP_ReportToRaven			= 500;

//---------------------------------------------------------------------
//	KAPITEL 3
//---------------------------------------------------------------------
const int	XP_SaveBaalLukor			=	750;		//22.01.01: Ork-Graveyard enthält 4620 XP
const int	XP_ReportToCorAngar			=	2000;
const int	XP_FindHerbs				=	1500;
const int	XP_GetCronosPermission		=	250;
const int	XP_SayCorrectParole			=	250;
const int	XP_DeliverFocusToSaturas	=	500;
const int	XP_DeliverBookToSaturas		=	500;
const int	XP_DeliverSecondFocus		=	3500;
const int	XP_DeliverThirdFocus		=	3500;
const int	XP_DeliverFourthFocus		=	3500;
const int	XP_DeliverFifthFocus		=	4000;


//---------------------------------------------------------------------
//	KAPITEL 4
//---------------------------------------------------------------------
const int	XP_MessageForGorn			=	1000;
const int	XP_ReportToSaturas			=	1000; // Feuermagier tot!
const int	XP_DeliveredGolemhearts		=	2000;
const int	XP_FoundOrcShaman			=	1000;
const int	XP_ReturnedFromUrShak		=	1000;
const int	XP_GornJoins				=	1000;
const int	XP_FoundOrcSlave			=	2000;
const int	XP_CuredOrcSlave			=	2000;
const int	XP_DeliveredMCPlates		=	2000;
const int	XP_GotUluMulu				=	10000;
const int	XP_GorMCPlateArmor			=	1000;

//---------------------------------------------------------------------
//	KAPITEL 5
//---------------------------------------------------------------------
const int	XP_RetreatFromLastPriest	=	1000;
const int	XP_ShowUrizielToXardas		=	1000;
const int	XP_ReturnedFromSunkenTower	=	2000;
const int	XP_LoadedUriziel			=	5000;


//---------------------------------------------------------------------
//	KAPITEL 6
//---------------------------------------------------------------------








//#####################################################################
//##
//##
//##					Lernkosten
//##
//##
//#####################################################################

const int	LPCOST_ATTRIBUTE_STRENGTH	=	1;	
const int	LPCOST_ATTRIBUTE_DEXTERITY	=	1;	
const int	LPCOST_ATTRIBUTE_MANA		=	1;	

const int	LPCOST_TALENT_MAGE_1		=	10;	
const int	LPCOST_TALENT_MAGE_2		=	15;	
const int	LPCOST_TALENT_MAGE_3		=	20;	
const int	LPCOST_TALENT_MAGE_4		=	25;	
const int	LPCOST_TALENT_MAGE_5		=	30;	
const int	LPCOST_TALENT_MAGE_6		=	40;	

const int	LPCOST_TALENT_1H_1			=	10;	
const int	LPCOST_TALENT_1H_2			=	20;	
const int	LPCOST_TALENT_2H_1			=	30;	
const int	LPCOST_TALENT_2H_2			=	40;	

const int	LPCOST_TALENT_BOW_1			=	10;	
const int	LPCOST_TALENT_BOW_2			=	20;	
const int	LPCOST_TALENT_CROSSBOW_1	=	10;	
const int	LPCOST_TALENT_CROSSBOW_2	=	20;	

const int	LPCOST_TALENT_ACROBAT		=	10;	
const int	LPCOST_TALENT_SNEAK			=	10;	
const int	LPCOST_TALENT_PICKLOCK_1	=	10;	
const int	LPCOST_TALENT_PICKLOCK_2	=	20;	
const int	LPCOST_TALENT_PICKPOCKET_1	=	10;	
const int	LPCOST_TALENT_PICKPOCKET_2	=	20;	
/*-------------------------------------------------------------------------

						LOG EINTRAGS VARIABLEN
( da die Logeinträge nicht einfach so in permanenten Infos stehen dürfen!) 

--------------------------------------------------------------------------*/
var int log_gornatothfight;
var int log_gornatothtrain;
var int log_wolftrain;
var int log_baalcadarsell;
var int log_baalcadartrain;
var int log_diegotrain;
var int log_scorpiocrossbow;
var int log_thorustrain;
var int log_thorusfight;
var int log_wedgelearn;
var int log_scattytrain;
var int log_cavalorntrain;

var int Dexter_Traded;
var int Scorpio_Exile;

//------------------------------------------------------------------------
//	Allgemeine Hilfsvariablen
//------------------------------------------------------------------------

var int LeftyDead;