
// **************************************************
// Zaubersprüche
// Hier stehen die Definitionen der
// logischen Sprüche
// Autor: Carsten Edenfeld
// **************************************************

// SpellCat
CONST INT SPELL_GOOD		= 	0;
CONST INT SPELL_NEUTRAL		= 	1;
CONST INT SPELL_BAD			= 	2;


CONST INT SPL_DONTINVEST 	= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
CONST INT SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
CONST INT SPL_SENDCAST		= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
CONST INT SPL_SENDSTOP		= 	3;		// Beende Zauber ohne Effekt
CONST INT SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level



// ************************************************************************************************
// zum Casten benötigtes, bzw. bei aufladbaren Spells maximal investierbares Mana
// ************************************************************************************************

const int	SPL_SENDCAST_LIGHT			=	1;
const int	SPL_SENDCAST_FIREBOLT		=	1;
const int	SPL_SENDCAST_FIREBALL		=	5;
const int	SPL_SENDCAST_FIRESTORM		=	10;
const int	SPL_SENDCAST_FIRERAIN		=	15;
const int	SPL_SENDCAST_TELEPORT		=	5;

const int	SPL_SENDCAST_TRF_MEATBUG	=	5;
const int	SPL_SENDCAST_TRF_MOLERAT	=	5;
const int	SPL_SENDCAST_TRF_SCAVENGER	=	5;
const int	SPL_SENDCAST_TRF_BLOODFLY	=	10;
const int	SPL_SENDCAST_TRF_WOLF		=	10;
const int	SPL_SENDCAST_TRF_LURKER		=	15;
const int	SPL_SENDCAST_TRF_WARAN		=	15;
const int	SPL_SENDCAST_TRF_ORCDOG		=	20;
const int	SPL_SENDCAST_TRF_CRAWLER	=	20;
const int	SPL_SENDCAST_TRF_SNAPPER	=	25;
const int	SPL_SENDCAST_TRF_SHADOWBEAST=	25;

const int	SPL_SENDCAST_THUNDERBOLT	=	1;
const int	SPL_SENDCAST_THUNDERBALL	=	5;
const int	SPL_SENDCAST_ICECUBE		=	3;
const int	SPL_SENDCAST_ICEWAVE		=	8;

const int	SPL_SENDCAST_SUMMONDEMON	=	20;
const int	SPL_SENDCAST_SUMMONSKELETON	=	10;
const int	SPL_SENDCAST_SUMMONGOLEM	=	15;
const int	SPL_SENDCAST_ARMYOFDARKNESS	=	25;

const int	SPL_SENDCAST_MASSDEATH		=	10;
const int	SPL_SENDCAST_DESTROYUNDEAD	=	5;
const int	SPL_SENDCAST_WINDFIST		=	3;
const int	SPL_SENDCAST_STORMFIST		=	8;
const int	SPL_SENDCAST_CHARM			=	5;
const int	SPL_SENDCAST_SLEEP			=	3;
const int	SPL_SENDCAST_FEAR			=	5;
const int	SPL_SENDCAST_BERZERK		=	10;
const int	SPL_SENDCAST_BREATHOFDEATH	=	5;
const int	SPL_SENDCAST_NEW1			=	5;		// Spell SPL_NEW1 (URIZIEL-Rune mit speziellen Spieler-BreathOfDeath)
const int	SPL_SENDCAST_SHRINK			=	5;


// ************************************************************************************************
// Schaden der direkten Kampfsprüche
// ************************************************************************************************
const int	SPL_DAMAGE_FIREBOLT			=	30;
const int	SPL_DAMAGE_FIREBALL			=	30;		//pro Level
const int	SPL_DAMAGE_FIRESTORM		=	50;
const int	SPL_DAMAGE_FIRERAIN			=	100;

const int	SPL_DAMAGE_THUNDERBOLT		=	20;
const int	SPL_DAMAGE_THUNDERBALL		=	20;		//pro Level

const int	SPL_DAMAGE_MASSDEATH		=	200;
const int	SPL_DAMAGE_BREATHOFDEATH	=	100;
const int	SPL_DAMAGE_DESTROYUNDEAD	=	9999;	//soll halt wirklich killen!

const int	SPL_DAMAGE_WINDFIST			=	10;
const int	SPL_DAMAGE_STORMFIST		=	15;



// ************************************************************************************************
// HPs, die den Opfern in den Opferzuständen abgezogen werden:
// ************************************************************************************************

const int   SPL_FREEZE_DAMAGE		 	=	50;	// IceCube, IceWave
const int   SPL_ZAPPED_DAMAGE_PER_SEC 	=	25;	// ChainLightning
const int   SPL_PYRO_DAMAGE_PER_SEC		=	20;	// Pyrokinesis

const int	SPL_HEALING_HP_PER_MP		=	10;	// Heal (HP pro Mana)


// ************************************************************************************************
// Zeit, die das Oper im ZS bleibt (in sec.)
// ************************************************************************************************

// Achtung: wenn bei FREEZE (9) und SHORTZAPPED (2) die Werte geändert werden, muß auch die Lebensdauer der PFX angepasst werden
const int	SPL_TIME_SHORTZAPPED		=	2;	// Thunderball
const int	SPL_TIME_FREEZE				=	9;	// IceCube, IceWave
const int   SPL_TIME_SLEEP				=	30;	// Sleep
const int	SPL_TIME_BERZERK			=	30;	// Berzerk


// Ranges für NSC-Magie-Auswahllogik
const int	SPL_RANGE_ICEATTACK			=	300;	
const int	SPL_RANGE_WINDFIST			=	1200;	
const int	SPL_RANGE_STORMFIST			=	1200;	
const int	SPL_RANGE_SLEEP				=	1000;	
const int	SPL_RANGE_CHAINLIGHTNING	=	1000; //Opfer in ZS, dort wird schaden angegeben	




// folgendes array verweist auf den _SpezialEffekt_ Klassennamen nach dem "SPELL_",
const STRING spellFXInstanceNames[MAX_SPELL] =
{
	"Light",
	"Fireball",
	"Transform",
	"Fear",
	"Heal",
	"Lightning",
	"Demon",
	"Skeleton",
	"Forget",
	"WindFist",
	"Telekinesis",
	"Charm",
	"Sleep",
	"Pyrokinesis",
	"MassDeath",
	"Control",
	"DestroyUndead",
	"Firebolt",
	"Firestorm",
	"Firerain",
	"Speed",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Chainlightning",
	"Thunderbolt",
	"Thunderball",
	"Icecube",
	"Icewave",
	"Golem",
	"ArmyOfDarkness",
	"Stormfist",
	"Telekinesis2",
	"BreathOfDeath",
	"Shrink",
	"Undress",
	"Dance",
	"Berzerk",
	"BreathOfDeath",
	"New2",
	"New3",
	"New4",
	"New5"
};


const STRING spellFXAniLetters[MAX_SPELL] =
{
	"SLE",	//	SPL_LIGHT
	"FIB",  //  SPL_FIREBALL
	"TRF",  //  SPL_TRANSFORM
	"FEA",  //  SPL_FEAR
	"HEA",  //  SPL_HEAL
	"XXX",  //  SPL_LIGHTNING
	"SUM",  //  SPL_SUMMONDEMON
	"SUM",  //  SPL_SUMMONSKELETON
	"XXX",  //  SPL_FORGET
	"WND",  //  SPL_WINDFIST
	"TEL",  //  SPL_TELEKINESIS
	"SLE",  //  SPL_CHARM
	"SLE",  //  SPL_SLEEP
	"PYR",  //  SPL_PYROKINESIS
	"FEA",  //  SPL_MASSDEATH
	"CON",  //  SPL_CONTROL
	"FIB",  //  SPL_DESTROYUNDEAD
	"FBT",	//	SPL_FIREBOLT
	"FIB",  //  SPL_FIRESTORM
	"FEA",  //  SPL_FIRERAIN
	"XXX",  //  SPL_SPEED
	"HEA",  //  SPL_TELEPORT1
	"HEA",  //  SPL_TELEPORT2
	"HEA",  //  SPL_TELEPORT3
	"HEA",  //  SPL_TELEPORT4
	"HEA",  //  SPL_TELEPORT5
	"TRF",  //  SPL_TRF_BLOODFLY
	"TRF",  //  SPL_TRF_BLOODHOUND
	"TRF",  //  SPL_TRF_CRAWLER
	"TRF",  //  SPL_TRF_LURKER
	"TRF",  //  SPL_TRF_MEATBUG
	"TRF",  //  SPL_TRF_MOLERAT
	"TRF",  //  SPL_TRF_ORCDOG
	"TRF",  //  SPL_TRF_RAZOR
	"TRF",  //  SPL_TRF_SCAVENGER
	"TRF",  //  SPL_TRF_SCAVENGER2
	"TRF",  //  SPL_TRF_SHADOWBEAS
	"TRF",  //  SPL_TRF_SNAPPER
	"TRF",  //  SPL_TRF_WARAN
	"TRF",  //  SPL_TRF_WOLF
	"LIN",  //  SPL_CHAINLIGHTNING
	"FBT",  //  SPL_THUNDERBOLT
	"FIB",  //  SPL_THUNDERBALL
	"FRZ",  //  SPL_ICECUBE
	"FEA",  //  SPL_ICEWAVE
	"SUM",  //  SPL_SUMMONGOLEM
	"SUM",  //  SPL_ARMYOFDARKNESS
	"WND",  //  SPL_STORMFIST
	"XXX",  //  SPL_TELEKINESIS2
	"FIB",  //  SPL_BREATHOFDEATH
	"SLE",  //  SPL_SHRINK
	"XXX",  //  SPL_UNDRESS
	"XXX",  //  SPL_DANCE
	"SLE",	//	SPL_BERZERK
	"FIB",  //  SPL_NEW1
	"NE2",  //  SPL_NEW2
	"NE3",  //  SPL_NEW3
	"NE4",  //  SPL_NEW4
	"NE5"   //  SPL_NEW5
};


// *****************
// Kreis des Feuers
// *****************

// bei allen Spells, in denen die "targetCollectRange" nicht angegeben ist wird der Wert aus der Focus.d benutzt!
// Dieser Wert ist auch die Obergrenze für die Reichweite der Spells und sollte sinnvollerweise so hoch sein, wie der Wert für Fernkampf

// FIXME: 	Bei allen Spells, bei denen der Schaden im Opfer-Zustand angegeben ist, kann KEIN Schadenstyp angwegeben werden!
//			Der Abzug von HPs erfolgt dann über den ChangeAttribute-Befehl! 

INSTANCE Spell_Light (C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_Firebolt (C_Spell_Proto)		// heißt jetzt "Magic Missile"
{
	time_per_mana			= 500;
	damage_per_level		= SPL_DAMAGE_FIREBOLT;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FIRE;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Fireball (C_Spell_Proto)
{
	time_per_mana			= 750;
	damage_per_level		= SPL_DAMAGE_FIREBALL;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FIRE;
	isMultiEffect			= 0;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Firestorm (C_Spell_Proto)
{
	time_per_mana			= 250;
	damage_per_level		= SPL_DAMAGE_FIRESTORM;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FIRE;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_FireRain (C_Spell_Proto)
{
	time_per_mana			= 250;
	damage_per_level		= SPL_DAMAGE_FIRERAIN; // 2 Level nötig für PFX = 200 Feuerschaden!
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FIRE;
	targetCollectAlgo		= TARGET_COLLECT_ALL_FALLBACK_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt "angezündet"
	targetCollectRange		= 1000;					// 10m
	targetCollectAzi		= 360;
	targetCollectElev		= 60;

};


INSTANCE Spell_Teleport (C_Spell_Proto)
{
	time_per_mana			= 750;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


// *****************
// Kreis des Wassers
// *****************

INSTANCE Spell_Heal (C_Spell_Proto)
{
	time_per_mana			= 250;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_Transform (C_Spell_Proto)
{
	time_per_mana			= 250;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_ChainLightning (C_Spell_Proto)
{
	time_per_mana			= 750;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= 0;					//	Wird nicht benutzt, da Aufrechterhaltungs-Spruch! Damage in zs_Zapped
	damageType				= DAM_MAGIC;
	isMultiEffect			= 1;
	targetCollectAlgo		= TARGET_COLLECT_ALL;
	targetCollectRange		= 1500;					// 15m
//	targetCollectAzi		= 180;
//	targetCollectElev		= 60;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Thunderbolt (C_Spell_Proto)
{
	time_per_mana			= 100;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= SPL_DAMAGE_THUNDERBOLT;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Thunderball (C_Spell_Proto)
{
	time_per_mana			= 250;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= SPL_DAMAGE_THUNDERBALL;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_IceCube (C_Spell_Proto)
{
	time_per_mana			= 250;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= 0;					// Schaden wird im zs_MagicFreeze angegeben!
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectRange		= 1500;					// 15m
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_IceWave (C_Spell_Proto)
{
	time_per_mana			= 125;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= 0;					// Relativer Schaden je nach Opfer wird im zs_MagicFreeze angegeben!
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_ALL_FALLBACK_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt "eingefroren"
	targetCollectRange		= 1000;					// 10m
	targetCollectAzi		= 360;
	targetCollectElev		= 60;
};



// *****************
// Dämonenbeschwörer
// *****************


INSTANCE Spell_Demon	(C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_Skeleton (C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_Golem (C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_ArmyOfDarkness (C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_MassDeath(C_Spell_Proto)
{
	time_per_mana			= 250;
	damage_per_level		= SPL_DAMAGE_MASSDEATH;	
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_ALL_FALLBACK_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt getötet
	targetCollectRange		= 1000;					// 10m
	targetCollectAzi		= 360;
	targetCollectElev		= 60;
};


INSTANCE Spell_DestroyUndead(C_Spell_Proto)
{
	time_per_mana			= 250;
	damage_per_level 		= SPL_DAMAGE_DESTROYUNDEAD;
	spelltype				= SPELL_NEUTRAL;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectRange		= 1500;					// 15m
	targetCollectType		= TARGET_TYPE_UNDEAD;
};



// *****************
//      Psionic
// *****************

INSTANCE Spell_WindFist (C_Spell_Proto)
{
	time_per_mana			= 250;
	damage_per_level		= SPL_DAMAGE_WINDFIST;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FLY;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectRange		= SPL_RANGE_WINDFIST;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_StormFist (C_Spell_Proto)
{
	time_per_mana			= 125;
	damage_per_level		= SPL_DAMAGE_STORMFIST;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FLY;
	//isMultiEffect			= 1;
	targetCollectAlgo		= TARGET_COLLECT_ALL_FALLBACK_NONE;
	targetCollectRange		= SPL_RANGE_STORMFIST;					// 10m
	targetCollectAzi		= 60;
	targetCollectElev		= 60;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Telekinesis (C_Spell_Proto)
{
	time_per_mana			= 5000;
	spelltype				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	canTurnDuringInvest		= FALSE;
	canChangeTargetDuringInvest = FALSE;
};


INSTANCE Spell_Charm (C_Spell_Proto)
{
	time_per_mana			= 250;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_HUMANS;
};


INSTANCE Spell_Sleep(C_Spell_Proto)
{
	time_per_mana			= 250;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_HUMANS;
};


INSTANCE Spell_Pyrokinesis(C_Spell_Proto)
{
	time_per_mana			= 250;
	damage_per_level		= 0;					//	Wird nicht benutzt, da Aufrechterhaltungs-Spruch! Damage-Angabe in zs_Pyro
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Control(C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_HUMANS;
};


INSTANCE Spell_Fear (C_Spell_Proto)
{
	time_per_mana			= 250;
	damage_per_level		= 0;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden in der "spell_fear.d" per "AI_SetNpcsToState(self,ZS_Flee, 1000);" bestimmt
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_Berzerk (C_Spell_Proto)
{
	time_per_mana			= 125;
	spelltype				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_BreathOfDeath(C_Spell_Proto)
{
	time_per_mana			= 100;
	damage_per_level		= SPL_DAMAGE_BREATHOFDEATH;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_New1(C_Spell_Proto)		// Spell SPL_NEW1 (URIZIEL-Rune mit speziellen Spieler-BreathOfDeath)
{
	time_per_mana			= 100;
	damage_per_level		= 150;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Shrink (C_Spell_Proto)
{
	time_per_mana			= 1000;
	spelltype				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 800;					// 8m
	targetCollectType		= TARGET_TYPE_NPCS;
};
