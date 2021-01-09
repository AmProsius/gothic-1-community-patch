// *************************************************
// BodyStates
// *************************************************

// Interruptable Flags
const int BS_FLAG_INTERRUPTABLE		=  	32768;
const int BS_FLAG_FREEHANDS			=  	65536;

// ******************************************
// BodyStates / Overlays and Flags
// ******************************************
const int BS_STAND					=	0	|	BS_FLAG_INTERRUPTABLE	|	BS_FLAG_FREEHANDS;
const int BS_WALK					=	1	|	BS_FLAG_INTERRUPTABLE;								// PointAt nicht möglich
const int BS_SNEAK					=	2	|	BS_FLAG_INTERRUPTABLE;
const int BS_RUN					=	3;									// PointAt nicht möglich
const int BS_SPRINT					=	4;									// PointAt nicht möglich
const int BS_SWIM					=	5;
const int BS_CRAWL					=	6;
const int BS_DIVE					=	7;
const int BS_JUMP					=	8;
const int BS_CLIMB					=	9 	|	BS_FLAG_INTERRUPTABLE;		// GEÄNDERT!
const int BS_FALL					=  	10;
const int BS_SIT					=  	11	| 	BS_FLAG_FREEHANDS;
const int BS_LIE					=  	12;	
const int BS_INVENTORY				=  	13;
const int BS_ITEMINTERACT			=  	14	|	BS_FLAG_INTERRUPTABLE;
const int BS_MOBINTERACT			=  	15;
const int BS_MOBINTERACT_INTERRUPT	=  	16	|	BS_FLAG_INTERRUPTABLE;

const int BS_TAKEITEM				= 	17;
const int BS_DROPITEM				=  	18;
const int BS_THROWITEM				=  	19;
const int BS_PICKPOCKET				=  	20	|	BS_FLAG_INTERRUPTABLE;

const int BS_STUMBLE				=  	21;
const int BS_UNCONSCIOUS			=	22;
const int BS_DEAD					=  	23;

const int BS_AIMNEAR				=  	24;			// wird z.Zt nicht benutzt
const int BS_AIMFAR					=  	25;			// d.h. Bogenschütze kann weiterschießen, auch wenn er geschlagen wird
const int BS_HIT					=  	26		|	BS_FLAG_INTERRUPTABLE;
const int BS_PARADE					=  	27;

// Magic
const int BS_CASTING				=  	28		|	BS_FLAG_INTERRUPTABLE;
const int BS_PETRIFIED				=	29;
const int BS_CONTROLLING			=  	30		|	BS_FLAG_INTERRUPTABLE;

const int BS_MAX					=  	31;

// Modifier / Overlays
const int BS_MOD_HIDDEN				=   128;
const int BS_MOD_DRUNK				=	256;
const int BS_MOD_NUTS				=	512;
const int BS_MOD_BURNING			=   1024;
const int BS_MOD_CONTROLLED			=   2048;
const int BS_MOD_TRANSFORMED		=	4096;

// Mobsi-Schema-Namen, hier möglichen BodyState zugeordnet
CONST STRING MOB_SIT					=	"BENCH,CHAIR,GROUND,THRONE";
CONST STRING MOB_LIE					=	"BED,BEDHIGH,BEDLOW";
CONST STRING MOB_CLIMB					=	"CLIMB,LADDER,RANKE";
CONST STRING MOB_NOTINTERRUPTABLE		=	"BARRELO,DOOR,HERB,IDOL,LEVER,LOVEBED,PAN,SECRETDOOR,SMOKE,TOUCHPLATE,TURNSWITCH,VWHEEL";
// alle Mobs, die hier nicht sind, sind interruptable: Backpack, Bellow, Book, Bsanvil, Bscool, Bsfire, Bssharp, Cauldron,Chestbig,Chestsmall,Drum,Fireplace, Grave,LAB, 
// Ore, Pillar, Priestgrave, Repair, Ropeway, Sportal,STOMPER,STONEMILL
