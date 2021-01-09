
// **************************************************
// Zaubersprüche
// Hier stehen die Deklarationen/Definitionen der 
// logischen Sprüche
// Autor: Carsten Edenfeld
// **************************************************

CONST INT TARGET_COLLECT_NONE 					= 0;				// target will be set by effect (range, azi, elev)
CONST INT TARGET_COLLECT_CASTER					= 1;				// target is the caster
CONST INT TARGET_COLLECT_FOCUS 					= 2;				// target is the focus vob
CONST INT TARGET_COLLECT_ALL 					= 3;				// all targets in range will be assembled
CONST INT TARGET_COLLECT_FOCUS_FALLBACK_NONE	= 4;				// target is the focus vob, if the focus vob is not valid, the trajectory will be set by the effect
CONST INT TARGET_COLLECT_FOCUS_FALLBACK_CASTER	= 5;				// target is the focus vob, if the focus vob is not valid, the target is the caster
CONST INT TARGET_COLLECT_ALL_FALLBACK_NONE		= 6;				// all targets in range will be assembled, if there are no valid targets, the trajectory will be set by the effect
CONST INT TARGET_COLLECT_ALL_FALLBACK_CASTER	= 7;				// all targets in range will be assembled, if there are no valid targets, the target is the caster

CONST INT TARGET_TYPE_ALL						= 1;
CONST INT TARGET_TYPE_ITEMS						= 2;
CONST INT TARGET_TYPE_NPCS						= 4;
CONST INT TARGET_TYPE_ORCS						= 8;
CONST INT TARGET_TYPE_HUMANS					= 16;
CONST INT TARGET_TYPE_UNDEAD					= 32;


CONST INT MAX_SPELL			= 	59;


// Magie-Sprüche
const int SPL_LIGHT			=	0;
const int SPL_FIREBALL		=	1;
const int SPL_TRANSFORM		=	2;
const int SPL_FEAR			=	3;
const int SPL_HEAL			=	4;
const int SPL_LIGHTNING		=	5;
const int SPL_SUMMONDEMON	=	6;
const int SPL_SUMMONSKELETON=	7;

// Psi-Sekte
const int SPL_FORGET		=	8;
const int SPL_WINDFIST		=	9;
const int SPL_TELEKINESIS	=	10;
const int SPL_CHARM			=	11;
const int SPL_SLEEP			=	12;
const int SPL_PYROKINESIS	=	13;
const int SPL_MASSDEATH		=	14;
const int SPL_CONTROL		=	15;
const int SPL_DESTROYUNDEAD	=	16;
const int SPL_FIREBOLT		=   17;
const int SPL_FIRESTORM		=	18;
const int SPL_FIRERAIN		=	19;
const int SPL_SPEED			=	20;
const int SPL_TELEPORT1		=	21;
const int SPL_TELEPORT2		=	22;
const int SPL_TELEPORT3		=	23;
const int SPL_TELEPORT4		=	24;
const int SPL_TELEPORT5		=	25;
const int SPL_TRF_BLOODFLY	=	26;
const int SPL_TRF_BLOODHOUND=	27;
const int SPL_TRF_CRAWLER	=	28;
const int SPL_TRF_LURKER	=	29;
const int SPL_TRF_MEATBUG	=	30;
const int SPL_TRF_MOLERAT	=	31;
const int SPL_TRF_ORCDOG	=	32;
const int SPL_TRF_RAZOR		=	33;
const int SPL_TRF_SCAVENGER	=	34;
const int SPL_TRF_SCAVENGER2=	35;
const int SPL_TRF_SHADOWBEAST=	36;
const int SPL_TRF_SNAPPER	=	37;
const int SPL_TRF_WARAN		=	38;
const int SPL_TRF_WOLF		=	39;
const int SPL_CHAINLIGHTNING=	40;
const int SPL_THUNDERBOLT	=	41;
const int SPL_THUNDERBALL	=	42;
const int SPL_ICECUBE		=	43;
const int SPL_ICEWAVE		=	44;
const int SPL_SUMMONGOLEM	=	45;
const int SPL_ARMYOFDARKNESS=	46;
const int SPL_STORMFIST		=	47;
const int SPL_TELEKINESIS2	=	48;
const int SPL_BREATHOFDEATH	=	49;
const int SPL_SHRINK		=	50;
const int SPL_UNDRESS		=	51;
const int SPL_DANCE			=	52;
const int SPL_BERZERK		= 	53;
const int SPL_NEW1			=	54;
const int SPL_NEW2			=	55;
const int SPL_NEW3			=	56;
const int SPL_NEW4			=	57;
const int SPL_NEW5			=	58;


CLASS C_Spell {
	VAR FLOAT	time_per_mana;			// Zeit pro investierten Manapunkt (ms)
	VAR INT		damage_per_level;		// Schaden pro Level
	VAR INT		damageType;				// CAN BE ONLY ONE DAMAGE TYPE
	VAR INT		spellType;				// Good, Neutral or Bad
	VAR INT		canTurnDuringInvest;
	VAR INT		canChangeTargetDuringInvest;
	VAR INT		isMultiEffect;			// Effect Class is oCVisFX_MultiTarget if set to 1 (e.g. the effect can have multiple trajectorys (massdeath)
	VAR INT		targetCollectAlgo;
	VAR INT		targetCollectType;
	VAR INT		targetCollectRange;		
	VAR INT		targetCollectAzi;
	VAR INT		targetCollectElev;
};

PROTOTYPE C_Spell_Proto(C_Spell) {
	time_per_mana		=	500;			// Zeit pro investierten Manapunkt (ms)
	damage_per_level	=	1;				// Schaden pro Level
	damageType			=	DAM_BLUNT;		// CAN BE ONLY ONE DAMAGE TYPE
	spellType			=	SPELL_BAD;				// Good, Neutral or Bad
	canTurnDuringInvest	=	1;
	canChangeTargetDuringInvest	=	1;
	isMultiEffect		=	0;			// Effect Class is oCVisFX_MultiTarget if set to 1 (e.g. the effect can have multiple trajectorys (massdeath)
	targetCollectAlgo	=	TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType	=	TARGET_TYPE_ALL;
	targetCollectRange	=	10000;		
	targetCollectAzi	=	60;
	targetCollectElev	=	60;
};


