// *********************
//      Constants    	
//    Phoenix V0.67		
// *********************

//														                     	 
//	NPC ATTRIBUTES																 
//														                         
const int ATR_HITPOINTS				=  0;	// Lebenspunkte
const int ATR_HITPOINTS_MAX			=  1;	// Max. Lbenspunkte
const int ATR_MANA					=  2;	// Mana Mana
const int ATR_MANA_MAX				=  3;	// Mana Max

const int ATR_STRENGTH				=  4;	// Stärke
const int ATR_DEXTERITY				=  5;	// Geschick
const int ATR_REGENERATEHP			=  6;	// Regenerierung von HP alle x sekunden
const int ATR_REGENERATEMANA		=  7;   // Regenerierung von Mana alle x sekunden

const int ATR_INDEX_MAX				=  8;
																				
//																				 
//	NPC FLAGS																	 
//																				 
CONST INT NPC_FLAG_FRIEND								=  1 << 0				;
CONST INT NPC_FLAG_IMMORTAL								=  1 << 1				;
																				
//																				 
//	NPC TYPES																	 
//																				 
//CONST INT NPCTYPE_AMBIENT								=  0					;
//CONST INT NPCTYPE_MAIN								=  1					;
//CONST INT NPCTYPE_GUARD								=  2					;
																				
//																				 
//	FIGHT MODES																	 
//																				 
CONST INT FMODE_NONE									=  0					;
CONST INT FMODE_FIST									=  1					;
CONST INT FMODE_MELEE									=  2					;
CONST INT FMODE_FAR										=  5					;
CONST INT FMODE_MAGIC									=  7					;
																				
//																				 
//	WALK MODES																	 
//																				 
CONST INT NPC_RUN										=  0					;
CONST INT NPC_WALK										=  1					;
CONST INT NPC_SNEAK										=  2					;
CONST INT NPC_RUN_WEAPON								=  0 + 128				;
CONST INT NPC_WALK_WEAPON								=  1 + 128				;
CONST INT NPC_SNEAK_WEAPON								=  2 + 128				;
																				
//																				 
//	ARMOR FLAGS												       				 
//						 														 
CONST INT WEAR_TORSO									=  1					;		//	Oberkoerper	( Brustpanzer )
CONST INT WEAR_HEAD										=  2					;		//	Kopf		( Helm )
																				
//																				 
//	INVENTORY CATEGORIES														 
//																				 
CONST INT INV_WEAPON									=  1					;
CONST INT INV_ARMOR										=  2					;
CONST INT INV_RUNE										=  3					;
CONST INT INV_MAGIC										=  4					;
CONST INT INV_FOOD										=  5					;
CONST INT INV_POTION									=  6					;
CONST INT INV_DOC										=  7					;
CONST INT INV_MISC										=  8					;
CONST INT INV_CAT_MAX									=  9					;

//																				 
//	INVENTORY CAPACITIES														 
//																				 
CONST INT INV_MAX_WEAPONS								=    6					;	
CONST INT INV_MAX_ARMORS 								=    2					;
CONST INT INV_MAX_RUNES									= 1000					;		//	virtually infinite
CONST INT INV_MAX_FOOD									=   15					;			
CONST INT INV_MAX_DOCS									= 1000					;		//	virtually infinite
CONST INT INV_MAX_POTIONS								= 1000					;		//	virtually infinite
CONST INT INV_MAX_MAGIC									= 1000					;		//	virtually infinite
CONST INT INV_MAX_MISC									= 1000					;
																				
//																				 
//	ITEM TEXTS																	 
//																				 
CONST INT ITM_TEXT_MAX									=  6					;

//																				 
//	ITEM CATEGORIES																 
//																				 
CONST INT ITEM_KAT_NONE									= 1 <<  0				;		//	Sonstiges
CONST INT ITEM_KAT_NF									= 1 <<  1				;		//	Alle Nahkampfwaffen
CONST INT ITEM_KAT_FF									= 1 <<  2				;		//	Alle Fernkampfwaffen
CONST INT ITEM_KAT_MUN									= 1 <<  3				;		//	Jede Art von Munition (->MultiSlot)
CONST INT ITEM_KAT_ARMOR								= 1 <<  4				;		//	Rüstungen und Helme
CONST INT ITEM_KAT_FOOD									= 1 <<  5				;		//	Alle Nahrungsmittel (->MultiSlot)
CONST INT ITEM_KAT_DOCS									= 1 <<  6				;		//	Alle Dokumente
CONST INT ITEM_KAT_POTIONS								= 1 <<  7				;		//	Traenke
CONST INT ITEM_KAT_LIGHT								= 1 <<  8				;		//	Alle Lichtquellen
CONST INT ITEM_KAT_RUNE									= 1 <<  9				;		//	Runen und Scrolls
CONST INT ITEM_KAT_MAGIC								= 1 << 31				;		//	Ringe und Amulette
CONST INT ITEM_KAT_KEYS									= ITEM_KAT_NONE			;
																				
//																				 
//	ITEM FLAGS																	 
//																				 
CONST INT ITEM_BURN 									= 1 << 10				;		//	Brennbar				
CONST INT ITEM_MISSION 									= 1 << 12				;		//	Missionsgegenstand
CONST INT ITEM_MULTI									= 1 << 21				;			
CONST INT ITEM_TORCH									= 1 << 28				;		//	Wie eine Fackel behandeln
CONST INT ITEM_THROW									= 1 << 29				;		//	Gegenstand kann geworfen werden
																						
//																				 
//	ITEM WEAPON FLAGS															 
//																				 
CONST INT ITEM_SWD										= 1 << 14				;		//	Waffe wird wie ein Schwert behandelt
CONST INT ITEM_AXE										= 1 << 15				;		//	Waffe wird wie eine Axt behandelt
CONST INT ITEM_2HD_SWD									= 1 << 16				;		//	Waffe wird wie ein Zweihänder behandelt
CONST INT ITEM_2HD_AXE									= 1 << 17				;		//	Waffe wird wie eine Streitaxt behandelt
CONST INT ITEM_BOW										= 1 << 19				;		//	Waffe wird wie ein Bogen behandelt
CONST INT ITEM_CROSSBOW									= 1 << 20				;		//	Waffe wird wie eine Armbrust behandelt
CONST INT ITEM_AMULET									= 1 << 22				;
CONST INT ITEM_RING										= 1 << 11				;

//																				 
//	DAMAGE TYPES v2.0															 
//																				 
CONST INT DAM_INVALID									= 0						;       //	  0 - 0x00 - nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden ) 
CONST INT DAM_BARRIER									= 1						;  		//	  1 - 0x01 - nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden ) 
CONST INT DAM_BLUNT										= DAM_BARRIER	<< 1	;  		//	  2 - 0x02 - blunt ist das bit links von barrier  	
CONST INT DAM_EDGE										= DAM_BLUNT		<< 1	;		//	  4 - 0x04 - edge 	ist das bit links von blunt 	
CONST INT DAM_FIRE										= DAM_EDGE		<< 1	;  		//	  8 - 0x08 - fire 	ist das bit links von edge 		
CONST INT DAM_FLY										= DAM_FIRE		<< 1	;		//	 16 - 0x10 - fly 	ist das bit links von fire 		
CONST INT DAM_MAGIC										= DAM_FLY		<< 1	;  		//	 32 - 0x20 - magic	ist das bit links von fly 		
CONST INT DAM_POINT										= DAM_MAGIC		<< 1	;  		//	 64 - 0x40 - point	ist das bit links von magic 	
CONST INT DAM_FALL										= DAM_POINT		<< 1	;  		//	128 - 0x80 - nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden ) 
														
//																			     
//	DAMAGE TYPE ARRAY INDICES	( !!! DAM_XXX = 1 << DAM_INDEX_XXX !!! )		 
//																			     
CONST INT DAM_INDEX_BARRIER								= 0						;  		//				 nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden ) 
CONST INT DAM_INDEX_BLUNT								= DAM_INDEX_BARRIER + 1	;  		
CONST INT DAM_INDEX_EDGE								= DAM_INDEX_BLUNT	+ 1	;  		
CONST INT DAM_INDEX_FIRE								= DAM_INDEX_EDGE	+ 1	;  		
CONST INT DAM_INDEX_FLY									= DAM_INDEX_FIRE	+ 1	;  		
CONST INT DAM_INDEX_MAGIC								= DAM_INDEX_FLY		+ 1	;  		
CONST INT DAM_INDEX_POINT								= DAM_INDEX_MAGIC	+ 1	;  		
CONST INT DAM_INDEX_FALL								= DAM_INDEX_POINT	+ 1	;  		//				 nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden ) 
CONST INT DAM_INDEX_MAX									= DAM_INDEX_FALL	+ 1 ;

//																				 
//	OTHER DAMAGE CONSTANTS														 
//																				 
CONST INT NPC_ATTACK_FINISH_DISTANCE					= 180					;
CONST INT NPC_BURN_TICKS_PER_DAMAGE_POINT				= 100					;		
CONST INT DAM_CRITICAL_MULTIPLIER						= 2						;

CONST INT BLOOD_SIZE_DIVISOR							= 1000					;
CONST INT BLOOD_DAMAGE_MAX								= 200	                ;

CONST INT DAMAGE_FLY_CM_MAX								= 2000  				;
CONST INT DAMAGE_FLY_CM_MIN	                            = 300   				;
const INT DAMAGE_FLY_CM_PER_POINT						= 5					;

const int NPC_DAM_DIVE_TIME								= 100					;

//																				 
//	PROTECTION TYPES v2.0														 
//																				 
CONST INT PROT_BARRIER									= DAM_INDEX_BARRIER		; 
CONST INT PROT_BLUNT									= DAM_INDEX_BLUNT		; 
CONST INT PROT_EDGE										= DAM_INDEX_EDGE		; 
CONST INT PROT_FIRE										= DAM_INDEX_FIRE		; 
CONST INT PROT_FLY										= DAM_INDEX_FLY			; 
CONST INT PROT_MAGIC									= DAM_INDEX_MAGIC		; 
CONST INT PROT_POINT									= DAM_INDEX_POINT		; 
CONST INT PROT_FALL										= DAM_INDEX_FALL		; 
CONST INT PROT_INDEX_MAX								= DAM_INDEX_MAX			;

//
// Talents
//

const int NPC_TALENT_UNKNOWN		= 0;
// Skilled Talents
const int NPC_TALENT_1H				= 1;
const int NPC_TALENT_2H				= 2;
const int NPC_TALENT_BOW			= 3;
const int NPC_TALENT_CROSSBOW		= 4;
const int NPC_TALENT_PICKLOCK		= 5;
const int NPC_TALENT_PICKPOCKET		= 6;
const int NPC_TALENT_MAGE			= 7;
// Special-Talents
const int NPC_TALENT_SNEAK			= 8;
const int NPC_TALENT_REGENERATE		= 9;
const int NPC_TALENT_FIREMASTER		= 10;
const int NPC_TALENT_ACROBAT		= 11;

const int NPC_TALENT_MAX			= 12;
	
/*
Tal_Configure(NPC_TALENT_1H,			1);
Tal_Configure(NPC_TALENT_2H,			1);
Tal_Configure(NPC_TALENT_BOW,			1);
Tal_Configure(NPC_TALENT_CROSSBOW,		true);
Tal_Configure(NPC_TALENT_PICKLOCK,		1);
Tal_Configure(NPC_TALENT_PICKPOCKET		1);
Tal_Configure(NPC_TALENT_MAGE,			0);
Tal_Configure(NPC_TALENT_SNEAK,			0);
Tal_Configure(NPC_TALENT_REGENERATE,	false);
Tal_Configure(NPC_TALENT_FIREMASTER,	0);
Tal_Configure(NPC_TALENT_ACROBAT,		0);
*/
																				
//																				 
//	PERCEPTIONS	( ACTIVE )														 
//																				 
CONST INT PERC_ASSESSPLAYER								=	1					;	
CONST INT PERC_ASSESSENEMY								=	2					;	
CONST INT PERC_ASSESSFIGHTER							=	3					;	
CONST INT PERC_ASSESSBODY								=	4					;	
CONST INT PERC_ASSESSITEM								=	5					;	
																				
//																				 
//	SENSES																		 
//																				 
CONST INT SENSE_SEE										= 1 << 0				;
CONST INT SENSE_HEAR									= 1 << 1				;
CONST INT SENSE_SMELL									= 1 << 2				;
																				
//																				 
//	PERCEPTIONS	( PASSIVE )														 
//																				 
CONST INT PERC_ASSESSMURDER								=	6					;	
CONST INT PERC_ASSESSDEFEAT								=	7					;
CONST INT PERC_ASSESSDAMAGE								=	8					;
CONST INT PERC_ASSESSOTHERSDAMAGE						=	9					;
CONST INT PERC_ASSESSTHREAT								=  10					;
CONST INT PERC_ASSESSREMOVEWEAPON						=  11					;
CONST INT PERC_OBSERVEINTRUDER							=  12					;
CONST INT PERC_ASSESSFIGHTSOUND							=  13					;
CONST INT PERC_ASSESSQUIETSOUND							=  14					;
CONST INT PERC_ASSESSWARN								=  15					;
CONST INT PERC_CATCHTHIEF								=  16					;
CONST INT PERC_ASSESSTHEFT								=  17					;
CONST INT PERC_ASSESSCALL								=  18					;
CONST INT PERC_ASSESSTALK								=  19					;
CONST INT PERC_ASSESSGIVENITEM							=  20					;
CONST INT PERC_ASSESSFAKEGUILD							=  21					;
CONST INT PERC_MOVEMOB									=  22					;	
CONST INT PERC_MOVENPC									=  23					;	
CONST INT PERC_DRAWWEAPON								=  24					;
CONST INT PERC_OBSERVESUSPECT							=  25					;
CONST INT PERC_NPCCOMMAND								=  26					;
CONST INT PERC_ASSESSMAGIC								=  27					;
CONST INT PERC_ASSESSSTOPMAGIC							=  28					;
CONST INT PERC_ASSESSCASTER								=  29					;
CONST INT PERC_ASSESSSURPRISE							=  30					;
CONST INT PERC_ASSESSENTERROOM							=  31					;
CONST INT PERC_ASSESSUSEMOB								=  32					;
																				
//																				 
//	NEWS SPREAD MODE															 
//																				 
CONST INT NEWS_DONT_SPREAD								= 0						;
const INT NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_VICTIM		= 1						;
CONST INT NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_WITNESS		= 2						;
CONST INT NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_OFFENDER		= 3						;		
CONST INT NEWS_SPREAD_NPC_SAME_GUILD_VICTIM				= 4						;
																				
//																				 
//	NEWS CONSTANTS																 
//																				 
CONST INT IMPORTANT										= 1						;
																				
//																				 
//	INFO STATUS																	 
//																				 
CONST INT INF_TELL										= 0						;			
CONST INT INF_UNKNOWN									= 2						;			
																							
//																				 
//	MISSION STATUS																 
//																				 
//const INT MIS_FREE										= 0						;		//	Mission wurde noch nicht vergeben
//const INT MIS_REFUSED									= 2						;		//	Mission wurde abgelehnt
//const INT MIS_RUNNING									= 3						;		//	Mission läuft gerade
//const INT MIS_SUCCESS									= 4						;		//	Mission erfolgreich beendet
//const INT MIS_FAILED									= 7						;		//	Mission wurde abgebrochen

CONST INT LOG_RUNNING									= 1						;		//	Mission läuft gerade
CONST INT LOG_SUCCESS									= 2						;		//	Mission erfolgreich beendet
CONST INT LOG_FAILED									= 3						;		//	Mission wurde abgebrochen
CONST INT LOG_OBSOLETE									= 4						;		//	Mission ist hinfaellig
																				
//																				 
//	ATTITUDES												       				 
//																				 
CONST INT ATT_FRIENDLY									= 3						;
CONST INT ATT_NEUTRAL									= 2						;
CONST INT ATT_ANGRY										= 1						;
CONST INT ATT_HOSTILE									= 0						;
																				
//																				 
//	HUMAN GUILDS																 
//																				 
CONST INT GIL_NONE										=  0					;		//	gildenlose
CONST INT GIL_HUMAN										=  1					;		//	Special Guild -> Set Constants for all Human Guilds
CONST INT GIL_EBR										=  1					;		//	Erzbarone 6* +3Babes
CONST INT GIL_GRD										=  2					;		//	Söldner
CONST INT GIL_STT										=  3					;		//	Schatten 10
CONST INT GIL_KDF										=  4					;		//	Kreis des Feuers 6
CONST INT GIL_VLK										=  5					;		//	Volk/Buddler 10
CONST INT GIL_KDW										=  6					;		//	Kreis des Wassers 6
CONST INT GIL_SLD										=  7					;		//	Garde 8-9svm
CONST INT GIL_ORG										=  8					;		//	Organisatoren 9-10svm
CONST INT GIL_BAU										=  9					;		//	Bauern 6 svm
CONST INT GIL_SFB										= 10					;		//	Schürferbund 9-10 svm
CONST INT GIL_GUR										= 11					;		//	Gurus 5 svm
CONST INT GIL_NOV										= 12					;		//	Novizen 10- svm
CONST INT GIL_TPL										= 13					;		//	Templer 10 svm
CONST INT GIL_DMB										= 14					;		//	Dämonenbeschwörer 1
CONST INT GIL_BAB										= 15					;		//	Die Meister
CONST INT GIL_SEPERATOR_HUM								= 16					;
CONST INT MAX_GUILDS									= 16					;
																				
//																				 
//	MONSTER GUILDS																 
//																				 
CONST INT GIL_WARAN										= 17					;		//	Waran
CONST INT GIL_SLF										= 18					;		//	Schläfer
CONST INT GIL_GOBBO										= 19					;		//	Gobbo (Höhlen und Oberwelt)
CONST INT GIL_TROLL										= 20					;		//	Troll
CONST INT GIL_SNAPPER									= 21					;		//	Snapper (neu)
CONST INT GIL_MINECRAWLER								= 22					;		//	Minecrawler & Queen
CONST INT GIL_MEATBUG									= 23					;		//	Meatbugs
CONST INT GIL_SCAVENGER									= 24					;		//	Attack Chicken
CONST INT GIL_DEMON										= 25					;		//	der Geflügel(te) Dämon
CONST INT GIL_WOLF										= 26					;		//	Oberwelt Wolf
CONST INT GIL_SHADOWBEAST								= 27					;		//	Unsere Miezekatz'
CONST INT GIL_BLOODFLY									= 28					;		//	Scorpionlibelle
CONST INT GIL_SWAMPSHARK								= 29					;		//	Sumpfhai
CONST INT GIL_ZOMBIE									= 30					;		//	"Menschen" Zombies
CONST INT GIL_UNDEADORC									= 31					;		//	Untote Orcs (Krieger & Hohepriester)
CONST INT GIL_SKELETON									= 32					;		//	"Menschen" Skelette
CONST INT GIL_ORCDOG									= 33					;		//	Orc-Wachhund (Zähne auf Beinen)
CONST INT GIL_MOLERAT									= 34					;		//	Der Nacktmole
CONST INT GIL_GOLEM										= 35					;		//	Lapidor
CONST INT GIL_LURKER									= 36					;			
CONST INT GIL_SEPERATOR_ORC								= 37					;			
CONST INT GIL_ORCSHAMAN									= 38					;			
CONST INT GIL_ORCWARRIOR								= 39					;			
CONST INT GIL_ORCSCOUT									= 40					;			
CONST INT GIL_ORCSLAVE									= 41					;			
CONST INT GIL_MAX										= 42					;			
																				
//																				 
//	GUILDS DESCRIPTION												       		 
//																				 
CLASS C_GILVALUES																
{																				
	VAR INT		WATER_DEPTH_KNEE						[GIL_MAX]				;			
	VAR INT		WATER_DEPTH_CHEST						[GIL_MAX]				;			
	VAR INT		JUMPUP_HEIGHT							[GIL_MAX]				;		//	DEFAULT = 200;		
//	VAR INT		JUMPUP_FORCE							[GIL_MAX]				;
	VAR INT		SWIM_TIME								[GIL_MAX]				;			
	VAR INT		DIVE_TIME								[GIL_MAX]				;			
	VAR INT		STEP_HEIGHT								[GIL_MAX]				;			
	VAR INT		JUMPLOW_HEIGHT							[GIL_MAX]				;			
	VAR INT		JUMPMID_HEIGHT							[GIL_MAX]				;			
	VAR INT		SLIDE_ANGLE								[GIL_MAX]				;			
	VAR INT		SLIDE_ANGLE2							[GIL_MAX]				;			
	VAR INT		DISABLE_AUTOROLL						[GIL_MAX]				;		//	DEFAULT = 0					;  0 = Autoroll  enabled	/ 1 = Autoroll  disabled
	VAR INT		SURFACE_ALIGN							[GIL_MAX]				;		//	DEFAULT = 0					;  0 = Alignment disabled	/ 1 = Alignment enabled
	VAR INT		CLIMB_HEADING_ANGLE						[GIL_MAX]				;			
	VAR INT		CLIMB_HORIZ_ANGLE						[GIL_MAX]				;			
	VAR INT		CLIMB_GROUND_ANGLE						[GIL_MAX]				;			
	VAR INT		FIGHT_RANGE_BASE						[GIL_MAX]				;
	VAR INT		FIGHT_RANGE_FIST						[GIL_MAX]				;			
	VAR INT		FIGHT_RANGE_1HS							[GIL_MAX]				;			
	VAR INT		FIGHT_RANGE_1HA							[GIL_MAX]				;			
	VAR INT		FIGHT_RANGE_2HS							[GIL_MAX]				;			
	VAR INT		FIGHT_RANGE_2HA							[GIL_MAX]				;			
	VAR INT		FALLDOWN_HEIGHT							[GIL_MAX]				;		//									Wie tief Fallen ohne Schaden ?
	VAR INT		FALLDOWN_DAMAGE							[GIL_MAX]				;		//									Schaden für jeden weiteren angefangenen Meter.
	VAR INT		BLOOD_DISABLED							[GIL_MAX]				;		//	DEFAULT = 0					;	Blut ganz ausschalten (z.B. bei Sekletten) ? 
	VAR INT		BLOOD_MAX_DISTANCE						[GIL_MAX]				;		//	DEFAULT = 1000				;	Wie weit spritzt das Blut (in cm) ?
	VAR INT		BLOOD_AMOUNT							[GIL_MAX]				;		//	DEFAULT = 10				;	Wie viel Blut ?
	VAR INT		BLOOD_FLOW								[GIL_MAX]				;		//	DEFAULT = 0					;	Soll es sich langsam ausbreiten ?
	VAR STRING  BLOOD_EMITTER							[GIL_MAX]				;		//	DEFAULT = "PFX_BLOOD"		;	Welcher Partikel-Emitter ?
	VAR STRING  BLOOD_TEXTURE							[GIL_MAX]				;		//	DEFAULT = "ZBLOODSPLAT2.TGA";	Welche Textur ?
	VAR INT 	TURN_SPEED								[GIL_MAX]				;		//	DEFAULT = 150				;	
};																				
																				
//																				 
//	SOUND TYPES												       				 
//																				 
CONST INT NPC_SOUND_DROPTAKE							= 1						;
CONST INT NPC_SOUND_SPEAK								= 3						;
CONST INT NPC_SOUND_STEPS								= 4						;
CONST INT NPC_SOUND_THROWCOLL							= 5						;
CONST INT NPC_SOUND_DRAWWEAPON							= 6						;
CONST INT NPC_SOUND_SCREAM								= 7						;
CONST INT NPC_SOUND_FIGHT								= 8						;
																				
//																				 
//	MATERIAL TYPES												       			 
//																				 
CONST INT MAT_WOOD										= 0						;
CONST INT MAT_STONE										= 1						;
CONST INT MAT_METAL										= 2						;
CONST INT MAT_LEATHER									= 3						;
CONST INT MAT_CLAY										= 4						;
CONST INT MAT_GLAS										= 5						;		// ??
																				
//																				 
//	LOG
//		
CONST INT LOG_MISSION									= 0						;
CONST INT LOG_NOTE										= 1						;
				

//																				 
//	OTHER CONSTANTS												       			 
//																				 
CONST INT TIME_INFINITE									= -1000000 / 1000		;
const int NPC_VOICE_VARIATION_MAX						= 10					;
																				
