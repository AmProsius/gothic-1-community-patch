// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Box";
CONST STRING MOBNAME_CHEST			= "Chest";
CONST STRING MOBNAME_BED			= "Bed";
CONST STRING MOBNAME_DOOR			= "Door";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Anvil";
CONST STRING MOBNAME_BUCKET			= "Water Bucket";
CONST STRING MOBNAME_FORGE			= "Smith's Fire";
CONST STRING MOBNAME_GRINDSTONE		= "Grindstone";
CONST STRING MOBNAME_WHEEL			= "Winch";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "Kettle";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "Pan";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Water Pipe";
CONST STRING MOBNAME_LADDER			= "Ladder";
CONST STRING MOBNAME_SWITCH			= "Switch";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Ore Nugget";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "Bellows";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "Mummy";
CONST STRING MOBNAME_PILLAR			= "Column";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "n/a";
CONST STRING MOBNAME_HERB_PSI		= "Weed Masher";
CONST STRING MOBNAME_IDOL			= "Figurine";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "Target";
CONST STRING MOBNAME_SHRINE			= "Heart Shrine of the Orcs";
CONST STRING MOBNAME_SWORDSTONE		= "Strange Shrine";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	"(none)",
	"Ore Baron",
	"Guard",
	"Shadow",
	"Magician of Fire",
	"Digger",
	"Magician of Water",
	"Mercenary",
	"Rogue",
	"Peasant",
	"Scraper",			// 10
	"Guru",
	"Novice",
	"Templar",
	"Necromancer",
	"Babe",
	"",
	"Lizard",			// 17
	"Sleeper",
	"Goblin",
	"Troll",
	"Snapper",
	"Minecrawler",
	"Meatbug",
	"Scavenger",
	"Demon",
	"Wolf",
	"Shadowbeast",
	"Bloodfly",
	"Swampshark",			// 30
	"Zombie",
	"Zombie Orc",
	"Skeleton",
	"Orc Dog",
	"Molerat",
	"Golem",
	"Lurker",
	"",				// 38
	"Orc Shaman",
	"Orc Warrior",
	"Orc Scout",
	"Orc Slave"
};


// *****************************************************************************************
// Attribut-Beschreibungen
// *****************************************************************************************
/* SN: wird laut Bert nicht mehr benötigt. Ich kommentier es erst mal eine Version lang aus
const string TXT_ATTRIBUTE_DESC	[ATR_INDEX_MAX]	= {

	"HitpointDesc",
	"",
	"ManaDesc",
	"",
	"StrengthDesc",
	"DexterityDesc",
	"",
	""
};

"TXT_ATTRIBUTE_DESC" - Beschreibung	der	Attribute für CharScreen.
"TXT_FIGHT_TALENTS"	- Namen	der	Kampftalente
"TXT_FIGHT_TALENTS_DESC" - Beschreibung	der	Kampftalente für CharScreen.
"TXT_TALENTS" -	Namen der sonstigen	Talente
"TXT_TALENTS_DESC" - Beschreibung der Talente für CharScreen
"TXT_SPELLS_DESC" -	Beschreibung der Spells	für	CharScreen

Die	Reihenfolge	der	jeweiligen Texte könnt ihr der Konstantenreihenfolge aus
der	"constants.d" entnehmen, die hier auch mit dranhaengt und fuer
fehlerfreies (Test-)parsen benötigt	wird.
*/

// *****************************************************************************************
// Zauberspruchnamen
// *****************************************************************************************

CONST STRING TXT_SPELLS	[MAX_SPELL]	= {
	"Light",					// SPL_LIGHT		=	0;
	"Fireball",				// SPL_FIREBALL		=	1;
	"n/a",						// SPL_TRANSFORM	=	2;
	"Fear",					// SPL_FEAR			=	3;
	"Healing",					// SPL_HEAL			=	4;
	"n/a",						// SPL_LIGHTNING	=	5;
	"Summon Demon",			// SPL_SUMMONDEMON	=	6;
	"Summon Skeletons",		// SPL_SUMMONSKELETON=	7;
	"n/a",						// SPL_FORGET		=	8;
	"Fist of Wind",				// SPL_WINDFIST		=	9;
	"Telekinesis",				// SPL_TELEKINESIS	=	10;
	"Charm",					// SPL_CHARM		=	11;
	"Sleep",					// SPL_SLEEP		=	12;
	"Pyrokinesis",				// SPL_PYROKINESIS	=	13;
	"Ring of Death",				// SPL_MASSDEATH	=	14;
	"Control",				// SPL_CONTROL		=	15;
	"Death to the Undead",		// SPL_DESTROYUNDEAD=	16;
	"Fire Bolt",				// SPL_FIREBOLT		=	17;
	"Storm of Fire",				// SPL_FIRESTORM	=	18;
	"Rain of Fire",				// SPL_FIRERAIN		=	19;
	"n/a",						// SPL_SPEED		=	20;
	"Teleport Magician of Fire",		// SPL_TELEPORT1	=	21;
	"Teleport Magician of Water",	// SPL_TELEPORT2	=	22;
	"Teleport Necromancer",	// SPL_TELEPORT3	=	23;
	"Orc Teleport",		// SPL_TELEPORT4	=	24;
	"Teleport Swamp Camp",		// SPL_TELEPORT5	=	25;
	"Transform into Bloodfly",	// SPL_TRF_BLOODFLY	=	26;
	"n/a",						// SPL_TRF_BLOODHOUND=	27;
	"Transform into Minecrawler",	// SPL_TRF_CRAWLER	=	28;
	"Transform into Lurker",		// SPL_TRF_LURKER	=	29;
	"Transform into Meatbug",	// SPL_TRF_MEATBUG	=	30;
	"Transform into Molerat",		// SPL_TRF_MOLERAT	=	31;
	"Transform into Orc Dog",		// SPL_TRF_ORCDOG	=	32;
	"n/a",						// SPL_TRF_RAZOR	=	33;
	"Transform into Scavenger",	// SPL_TRF_SCAVENGER=	34;
	"n/a",						// SPL_TRF_SCAVENGER2=	35;
	"Transform into Shadowbeast",	// SPL_TRF_SHADOWBEAST=	36;
	"Transform into Snapper",		// SPL_TRF_SNAPPER	=	37;
	"Transform into Lizard",		// SPL_TRF_WARAN	=	38;
	"Transform into Wolf",			// SPL_TRF_WOLF		=	39;
	"Chain Lightning",					// SPL_CHAINLIGHTNING=	40;
	"Ice Bolt",					// SPL_THUNDERBOLT	=	41;
	"Ball Lightning",				// SPL_THUNDERBALL	=	42;
	"Ice Block",					// SPL_ICECUBE		=	43;
	"Wave of Ice",					// SPL_ICEWAVE		=	44;
	"Summon Golem",			// SPL_SUMMONGOLEM	=	45;
	"Army of Darkness",		// SPL_ARMYOFDARKNESS=	46;
	"Storm Fist",				// SPL_STORMFIST	=	47;
	"n/a",						// SPL_TELEKINESIS2	=	48;
	"Breath of Death",				// SPL_BREATHOFDEATH=	49;
	"Shrink Monster",				// SPL_SHRINK		=	50;
	"n/a",						// SPL_UNDRESS		=	51;
	"n/a",						// SPL_DANCE		=	52;
	"Berserk",					// SPL_BERZERK		=	53;
	"URIZIEL's wrath",			// SPL_NEW1			=	17;
	"New2",						// SPL_NEW2			=	18;
	"New3",						// SPL_NEW3			=	19;
	"New4",						// SPL_NEW4			=	20;
	"New5"						// SPL_NEW5			=	21;
 };

/* SN: wird laut Bert nicht mehr benötigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_SPELLS_DESC [MAX_SPELL] = {
// FIXME: wo werden die benutzt?
	"LichtDescr",						// SPL_LIGHT		=	0;
	"FeuerballDescr",					// SPL_FIREBALL		=	1;
	"VerwandelnDescr",					// SPL_TRANSFORM	=	2;
	"FearDescr",						// SPL_FEAR			=	3;
	"HeilenDescr",						// SPL_HEAL			=	4;
	"BlitzDescr",						// SPL_LIGHTNING	=	5;
	"Dämon beschw.Descr",				// SPL_SUMMONDEMON	=	6;
	"Skelette beschw.Descr",			// SPL_SUMMONSKELETON=	7;
	"VergessenDescr",					// SPL_FORGET		=	8;
	"WindfaustDescr",					// SPL_WINDFIST		=	9;
	"TelekineseDescr",					// SPL_TELEKINESIS	=	10;
	"CharmDescr",						// SPL_CHARM		=	11;
	"SleepDescr",						// SPL_SLEEP		=	12;
	"PyrokinesisDescr",					// SPL_PYROKINESIS	=	13;
	"MassdeathDescr",					// SPL_MASSDEATH	=	14;
	"KontrolleDescr",					// SPL_CONTROL		=	15;
	"Untote	bannenDescr",				// SPL_DESTROYUNDEAD=	16;
	"FireboltDescr",					// SPL_FIREBOLT		=	17;
	"FireStormDescr",				// SPL_FIRESTORM	=	18;
	"FireRainDescr",					// SPL_FIRERAIN		=	19;
	"SpeedDescr",					// SPL_SPEED		=	20;
	"Teleport1Descr",				// SPL_TELEPORT1	=	21;
	"Teleport2Descr",				// SPL_TELEPORT2	=	22;
	"Teleport3Descr",				// SPL_TELEPORT3	=	23;
	"Teleport4Descr",				// SPL_TELEPORT4	=	24;
	"Teleport5Descr",				// SPL_TELEPORT5	=	25;
	"Transform BloodflyDescr",		// SPL_TRF_BLOODFLY	=	26;
	"Transform BloodhoundDescr",		// SPL_TRF_BLOODHOUND=	27;
	"Transform CrawlerDescr",		// SPL_TRF_CRAWLER	=	28;
	"Transform LurkerDescr",			// SPL_TRF_LURKER	=	29;
	"Transform MeatbugDescr",		// SPL_TRF_MEATBUG	=	30;
	"Transform MoleratDescr",		// SPL_TRF_MOLERAT	=	31;
	"Transform OrcDogDescr",			// SPL_TRF_ORCDOG	=	32;
	"Transform RazorDescr",			// SPL_TRF_RAZOR	=	33;
	"Transform ScavengerDescr",		// SPL_TRF_SCAVENGER=	34;
	"Transform Scavenger2Descr",		// SPL_TRF_SCAVENGER2=	35;
	"Transform ShadowbeastDescr",		// SPL_TRF_SHADOWBEAST=	36;
	"Transform SnapperDescr",		// SPL_TRF_SNAPPER	=	37;
	"Transform WaranDescr",			// SPL_TRF_WARAN	=	38;
	"Transform WolfDescr",			// SPL_TRF_WOLF		=	39;
	"ChainlightningDescr",			// SPL_CHAINLIGHTNING=	40;
	"TunderboltDescr",				// SPL_THUNDERBOLT	=	41;
	"ThunderballDescr",				// SPL_THUNDERBALL	=	42;
	"Ice CubeDescr",					// SPL_ICECUBE		=	43;
	"Ice WaveDescr",					// SPL_ICEWAVE		=	44;
	"Summon	GolemDescr",				// SPL_SUMMONGOLEM	=	45;
	"Army of DarknessDescr",			// SPL_ARMYOFDARKNESS=	46;
	"StormFistDescr",					// SPL_STORMFIST	=	47;
	"n/a",								// SPL_TELEKINESIS2	=	48;
	"Breath	of DeathDescr",				// SPL_BREATHOFDEATH=	49;
	"ShrinkDescr",						// SPL_SHRINK		=	50;
	"n/a",								// SPL_UNDRESS		=	51;
	"n/a",								// SPL_DANCE		=	52;
	"BerzerkDescr",						// SPL_BERZERK		=	53;
	"New1Descr",						// SPL_NEW1			=	17;
	"New2Descr",						// SPL_NEW2			=	18;
	"New3Descr",						// SPL_NEW3			=	19;
	"New4Descr",						// SPL_NEW4			=	20;
	"New5Descr"							// SPL_NEW5			=	21;
};
*/

								
// *****************************************************************************************
// Kampf-Talente
// *****************************************************************************************

CONST STRING TXT_TALENTS [NPC_TALENT_MAX] =	
{
	"",	
	"One-handed Sword",
	"Two-handed Sword",
	"Bow",
	"Crossbow",
	"Open locks",
	"Pickpocketing",
	"Magic",
	"Sneaking",
	"Regeneration",
	"Master of Fire",
	"Acrobatics"
};

/* SN: wird laut Bert nicht mehr benötigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_TALENTS_DESC [NPC_TALENT_MAX] = 
// FIXME: wo werden die benutzt?
{
	"",	
	"NPC_TALENT_1H",
	"NPC_TALENT_2H",
	"NPC_TALENT_BOW",
	"NPC_TALENT_CROSSBOW",
	"NPC_TALENT_PICKLOCK",
	"NPC_TALENT_PICKPOCKET",
	"NPC_TALENT_MAGE",
	"NPC_TALENT_SNEAK",
	"NPC_TALENT_REGENERATE",
	"NPC_TALENT_FIREMASTER",
	"NPC_TALENT_ACROBAT"
};
*/

CONST STRING TXT_TALENTS_SKILLS [NPC_TALENT_MAX] = 
{
	"",	
	"unskilled|trained|master",						//NPC_TALENT_1H          
	"unskilled|trained|master",                       //NPC_TALENT_2H           
	"unskilled|trained|master",                       //NPC_TALENT_BOW         
	"unskilled|trained|master",                       //NPC_TALENT_CROSSBOW    
	"unskilled|trained|master",                       //NPC_TALENT_PICKLOCK   
	"unskilled|trained|master",                       //NPC_TALENT_PICKPOCKET
	"no|Circle 1|Circle 2|Circle 3|Circle 4|Circle 5|Circle 6", //NPC_TALENT_MAGE         
	"No|Yes",                                              //NPC_TALENT_SNEAK       
	"|",                                      		        //NPC_TALENT_REGENERATE 
	"|",                                          		    //NPC_TALENT_FIREMASTER   
	"No|Yes"                                               //NPC_TALENT_ACROBAT      
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"",
	"Weapons",
	"Armor",
	"Magic",
	"Artifacts",
	"Food",
	"Potions",
	"Writings",
	"Miscellaneous"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Digger";
CONST STRING NAME_Schatten		= "Shadow";
CONST STRING NAME_ConvoiTraeger	= "Convoy Carrier";
CONST STRING NAME_ConvoiWache	= "Convoy Guard";
CONST STRING NAME_Torwache		= "Gate Guard";
CONST STRING NAME_Brueckenwache	= "Bridge Guard";
CONST STRING NAME_Gardist		= "Guard";
CONST STRING NAME_Bauer			= "Peasant";
CONST STRING NAME_Schlaeger		= "Thug";
CONST STRING NAME_Schuerfer		= "Scraper";
CONST STRING NAME_Organisator	= "Rogue";
CONST STRING NAME_Soeldner		= "Mercenary";
CONST STRING NAME_Novize		= "Novice";
CONST STRING NAME_Templer		= "Templar";
CONST STRING NAME_Raeuber		= "Thug";
CONST STRING NAME_Tuersteher	= "Bouncer";

const string NAME_MadNovice		=	"Obsessed Novice";
const string NAME_MadTemplar	=	"Fanatic Templar";
const string NAME_MadTemplar2	=	"Apocalyptic Templar";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "END";
CONST STRING DIALOG_BACK		= "BACK";
const string DIALOG_TRADE		= "(Trade)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Ring";
const string NAME_Amulett		= "Amulet";
const string NAME_Trank			= "Potion";
const string NAME_Rune			= "Rune";
const string NAME_Spruchrolle	= "Spell Scroll";


// *************************************************************
// TEXTE FÜR ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Value:";

const string NAME_Mag_Circle	= "Circle:";
const string NAME_Manakosten	= "Mana costs:";
const string NAME_ManakostenMax	= "Mana costs (max.):";
const string NAME_ManaPerSec	= "Mana per sec.";
const string NAME_Duration		= "Duration (minutes)";

const string NAME_Mana_needed	= "Required mana:";
const string NAME_Str_needed	= "Required strength:";
const string NAME_Dex_needed	= "Required dexterity:";

const string NAME_Spell_Load	= "Chargeable Spell";
const string NAME_Spell_Invest	= "Investment Spell";

const string NAME_Dam_Edge		= "Weapon Damage";
const string NAME_Dam_Point		= "Arrow Damage";
const string NAME_Dam_Fire		= "Fire Damage";
const string NAME_Dam_Magic		= "Magic Damage";
const string NAME_Dam_Fly		= "Storm Damage";

const string NAME_Damage		= "Damage";
const string NAME_PerMana		= " (per mana)";
const string NAME_DamagePerSec	= "Damage per sec.";

const string NAME_Prot_Edge		= "Protection against weapons:";
const string NAME_Prot_Point	= "Protection against arrows:";
const string NAME_Prot_Fire		= "Protection against fire:";
const string NAME_Prot_Magic	= "Protection against magic:";

const string NAME_Bonus_HP		= "Life bonus:";
const string NAME_Bonus_Mana	= "Mana bonus:";

const string NAME_Bonus_HpMax	= "Bonus for maximum life:";
const string NAME_Bonus_ManaMax	= "Bonus for maximum mana:";

const string NAME_Bonus_Dex		= "Dexterity bonus:";
const string NAME_Bonus_Str		= "Strength bonus:";

const string NAME_OneHanded		= "One-handed Weapon";
const string NAME_TwoHanded		= "Two-handed Weapon";

//----------------- MH: zusätzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Healing per Mana"; 

const string NAME_BuyAttributeSTR = "Strength +";
const string NAME_BuyAttributeDEX = "Dexterity +";
const string NAME_BuyAttributeMAN = "Mana +";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Experience +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "Level Up!";				// beim Stufenaufstieg

const string NAME_NewLogEntry		= "New Journal Entry";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Unknown)-"								;

const string _STR_ATTRIBUTE_HITPOINTS		= "Life"									;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "Maximum Life"							;
const string _STR_ATTRIBUTE_MANA			= "Mana"									;
const string _STR_ATTRIBUTE_MANA_MAX		= "Maximum Mana"							;
const string _STR_ATTRIBUTE_STRENGTH		= "Strength"								;
const string _STR_ATTRIBUTE_DEXTERITY		= "Dexterity"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "Magic Spell"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, für die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "You're short of "						;
const string _STR_CANNOTUSE_POINTS			= " points"									;
const string _STR_CANNOTUSE_LEVELS		    = " levels"									;
const string _STR_CANNOTUSE_POST			= " to use this item."						;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, für das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") are missing "									;

// Bidschrimausgabe zum Thema Schloß öffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "No picklock or key.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "That sounds good.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "The lock has been opened.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Shit... and all over again.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "The picklock has broken.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "The lever doesn't move at all."			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "The statuette moves the lever."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "The winch is jammed."					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " Item given!"							;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEMS_GIVEN		= " Items given!"							;
const string _STR_MESSAGE_ORE_GIVEN			= " Ore given!"								;
const string _STR_MESSAGE_ITEM_TAKEN		= " Item received!"							;
const string _STR_MESSAGE_ITEMS_TAKEN		= " Items received!"						;
const string _STR_MESSAGE_ORE_TAKEN			= " Ore received!"							;

// Bidschrimausgabe fürs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "The value of your goods is not high enough."	;

// GILDENAUFNAHMEBEDINGUNG (für die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Condition for admission: Level "; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"Cannot be stolen from.";

// ***************************************************************************************
// Relative Y-Koordinaten für die Bildschirmausgabe (in % der aktuellen Bildhöhe)
// ***************************************************************************************
const int	_YPOS_MESSAGE_GIVEN				=	37;
const int	_YPOS_MESSAGE_TAKEN				=	40;
const int	_YPOS_MESSAGE_LOGENTRY			=	45;
const int	_YPOS_MESSAGE_XPGAINED			=	50;
const int	_YPOS_MESSAGE_LEVELUP			=	55;
const int 	_YPOS_MESSAGE_Joincamp			=	50;
const int	_YPOS_MESSAGE_PICKLOCK_SUCCESS	=	6;
const int	_YPOS_MESSAGE_PICKLOCK_UNLOCK	=	9;
const int	_YPOS_MESSAGE_PICKLOCK_FAILURE	=	12;
const int 	_YPOS_MESSAGE_PICKLOCK_BROKEN	=	15;
const int	_YPOS_MESSAGE_CANNOTSTEAL		=	6;


// ***************************************************************************************
// Zeitdauer der Bildschirmausgabe (in Sekunden)
// ***************************************************************************************
const int	_TIME_MESSAGE_GIVEN				=	4;
const int	_TIME_MESSAGE_TAKEN				=	4;
const int	_TIME_MESSAGE_LOGENTRY			=	4;
const int	_TIME_MESSAGE_XPGAINED			=	3;
const int	_TIME_MESSAGE_LEVELUP			=	5;
const int	_TIME_MESSAGE_RAISEATTRIBUTE	=	4;
const int	_TIME_MESSAGE_Joincamp			=	5;
const int	_TIME_MESSAGE_PICKLOCK			=	3;
const int	_TIME_MESSAGE_CANNOTSTEAL		=	2;


// ***************************************************************************************
// Zusammenbauen von Info_AddChoice()-Strings beim Kaufen/Lernen
// ***************************************************************************************
const string NAME_BuyArmorPrefix	=	" (";	
const string NAME_BuyArmorPostfix	=	" ore)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" ore, ";
const string NAME_LearnPostfixS		=	"skill point)";	
const string NAME_LearnPostfixP		=	"skill points)";	

const string NAME_LearnStrength_1	=	"Strength +1";
const string NAME_LearnStrength_5	=	"Strength +5";
const string NAME_LearnStrength_10	=	"Strength +10";
const string NAME_LearnStrength_20	=	"Strength +20";

const string NAME_LearnDexterity_1	=	"Dexterity +1";
const string NAME_LearnDexterity_5	=	"Dexterity +5";
const string NAME_LearnDexterity_10	=	"Dexterity +10";
const string NAME_LearnDexterity_20	=	"Dexterity +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"One-handed Sword Level 1";
const string NAME_Learn1h_2			=	"One-handed Sword Level 2";
const string NAME_Learn2h_1			=	"Two-handed Sword Level 1";
const string NAME_Learn2h_2			=	"Two-handed Sword Level 2";

const string NAME_LearnBow_1		=	"Bow Level 1";
const string NAME_LearnBow_2		=	"Bow Level 2";
const string NAME_LearnCrossbow_1	=	"Crossbow Level 1";
const string NAME_LearnCrossbow_2	=	"Crossbow Level 2";

const string NAME_LearnMage_1		=	"1st Circle of Magic";
const string NAME_LearnMage_2		=	"2nd Circle of Magic";
const string NAME_LearnMage_3		=	"3rd Circle of Magic";
const string NAME_LearnMage_4		=	"4th Circle of Magic";
const string NAME_LearnMage_5		=	"5th Circle of Magic";
const string NAME_LearnMage_6		=	"6th Circle of Magic";

const string NAME_LearnPickpocket_1	=	"Pickpocketing Level 1";
const string NAME_LearnPickpocket_2	=	"Pickpocketing Level 2";
const string NAME_LearnPicklock_1	=	"Open Locks Level 1";
const string NAME_LearnPicklock_2	=	"Open Locks Level 2";

const string NAME_LearnAcrobat		=	"Acrobatics";
const string NAME_LearnSneak		=	"Sneaking";

const string NAME_RaiseStrength		=	"Strength +";
const string NAME_RaiseDexterity	=	"Dexterity +";
const string NAME_RaiseStrDex		=	"Strength and Dexterity +";
const string NAME_RaiseManaMax		=	"Maximum Mana +";
const string NAME_RaiseHealthMax	=	"Maximum Life +";

//---------------- MH: für B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Master, I'd like to wear the High Robe of Fire.";
const string NAME_SaturasHighRobe	= 	"High Robe";
const string NAME_DiegoHeavyShadows	=	"Heavy Shadow's Armor. Protection: Weapons 40, Arrows 5, Fire 20";
const string NAME_StoneHeavyGuards	= 	"Heavy Guard's Armor. Protection: Weapons 70, Arrows 10, Fire 35";
const string NAME_StoneGuards		= 	"Guard's Armor. Protection: Weapons 55, Arrows 10, Fire 25";
const string NAME_WolfBandits		= 	"Bandit's Armor. Protection: Weapons 35, Arrows 5, Fire 15"; 
const string NAME_WolfHeavyBandits	= 	"Heavy Bandit's Armor. Protection: Weapons 40, Arrows 5, Fire 20";
const string NAME_LeeMercs			= 	"Mercenary's Armor. Protection: Weapons 55, Arrows 10, Fire 25";
const string NAME_LeeHeavyMercs		= 	"Heavy Mercenary's Armor. Protection: Weapons 70, Arrows 10, Fire 35";
const string NAME_FiskLightDiggers	= 	"Light Digger's Trousers. Protection: Weapons 10, Fire 5";
const string NAME_FiskDiggers		= 	"Digger's Trousers. Protection: Weapons 15, Fire 5";
const string NAME_GorNaTothHeavyTpl = 	"Heavy Templar's Armor. Protection: Weapons 70, Arrows 10, Fire 35";
const string NAME_GorNaTothTpl 		=	"Templar's Armor. Protection: Weapons 55, Arrows 10, Fire 25";
const string NAME_TorwachenPsiRock	=	"Loincloth. Protection: Weapons 15, Fire 10";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Some readjustments will only be activated after a reboot.";


//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Accept"			;
const string STR_INFO_TRADE_RESET						= "Refuse"			;
const string STR_INFO_TRADE_EXIT						= "BACK"			;