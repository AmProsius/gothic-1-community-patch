// ************************************************************************************************
// Wirkung und Kosten von Tränken
// ************************************************************************************************

// Heilung
const int	Value_HpEssenz			=	25;		const int	HP_Essenz			=	50;
const int	Value_HpExtrakt			=	35;		const int	HP_Extrakt			=	70;
const int	Value_HpElixier			=	50;		const int	HP_Elixier			=	100;

// Mana (Magier)
const int	Value_ManaEssenz		=	25;		const int	Mana_Essenz			=	30;
const int	Value_ManaExtrakt		=	45;		const int	Mana_Extrakt		=	50;
const int	Value_ManaElixier		=	65;		const int	Mana_Elixier		=	70;

// Mana (Bruderschaft)
const int	Value_Elixier1			=	95;		const int	Mana_Elixier1		=	100;

// Permanente Attribut-Steigerungen
// FIXME: sind die zu kaufen (müüsen dann teuer sein) oder zu fnden (dann evtl. billiger)
// FIXME: Textanzeige der Attribut-Änderung bei Benutzung möglich?
const int	Value_ElixierEgg		=	1;		const int	ManaMax_ElixierEgg	=	10;	// FIXME: was wenn der SC das selbst benutzt??

const int	Value_StrEssenz			=	300;	const int	STR_Essenz			=	3;
const int	Value_StrExtrakt		=	500;	const int	STR_Extrakt			=	5;
const int	Value_StrElixier		=	800;	const int	STR_Elixier			=	8;

const int	Value_DexEssenz			=	300;	const int	DEX_Essenz			=	3;
const int	Value_DexExtrakt		=	500;	const int	DEX_Extrakt			=	5;
const int	Value_DexElixier		=	800;	const int	DEX_Elixier			=	8;

// Trank der Macht
const int	Value_StrDex_Macht		=	800;	const int	StrDex_Macht		=	4;
// Trank der Herrschaft
const int	Value_StrDex_Herrschaft	=	1200;	const int	StrDex_Herrschaft	=	6;

const int	Value_HpMaxEssenz		=	500;	const int	HPMax_Essenz		=	5;
const int	Value_HpMaxExtrakt		=	1000;	const int	HPMax_Extrakt		=	10;
const int	Value_HpMaxElixier		=	1500;	const int	HPMax_Elixier		=	15;

const int	Value_ManaMaxEssenz		=	500;	const int	ManaMax_Essenz		=	5;
const int	Value_ManaMaxExtrakt	=	1000;	const int	ManaMax_Extrakt		=	10;
const int	Value_ManaMaxElixier	=	1500;	const int	ManaMax_Elixier		=	15;

// Speed-Potions
const int	Value_Haste1			=	100;	const int	Time_Haste1			=	60000;	// 1 min.
const int	Value_Haste2			=	150;	const int	Time_Haste2			=	120000;	// 2 min.
const int	Value_Haste3			=	200;	const int	Time_Haste3			=	300000;	// 5 min.


/******************************************************************************************/
//	MANATRÄNKE																			//
/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaEssenz;	

	visual 			=	"ItFo_Potion_Mana_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseManaPotion;
	scemeName		=	"POTIONFAST";

	description			= "Essence of Magic Energy";
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaEssenz;
};

	FUNC VOID UseManaPotion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseManaPotion");
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Essenz);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaExtrakt;	

	visual 			=	"ItFo_Potion_Mana_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMana2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Extract of Magic Energy";
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaExtrakt;
};

	FUNC VOID UseMana2Potion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseMana2Potion");
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Extrakt);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaElixier;	

	visual 			=	"ItFo_Potion_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMana3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Elixir of Magic Energy";
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaElixier;
};

	FUNC VOID UseMana3Potion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseMana3Potion");
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Elixier);
	};


/******************************************************************************************/	
// MANA ELIXIERE BRUDERSCHAFT//

INSTANCE ItFo_Potion_Elixier(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Elixier1;	

	visual 			=	"ItFo_Potion_Elixier.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseElixier;
	scemeName		=	"POTIONFAST";

	description			= "Elixir";
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Elixier1;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Elixier1;
};

	func void  UseElixier ()
	{
 		PrintDebugNpc		(PD_ITEM_MOBSI, "UseElixier");
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Elixier1);	 
	};



/******************************************************************************************/
//	HEILTRÄNKE																			//
/******************************************************************************************/
INSTANCE ItFo_Potion_Health_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpEssenz;	

	visual 			=	"ItFo_Potion_Health_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealthPotion;
	scemeName		=	"POTIONFAST";

	description			= "Essence of Healing";
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpEssenz;
};

	FUNC VOID UseHealthPotion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Essenz);
	};

/******************************************************************************************/	
INSTANCE ItFo_Potion_Health_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpExtrakt;	

	visual 			=	"ItFo_Potion_Health_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealth2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Extract of Healing";
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpExtrakt;
};

	FUNC VOID UseHealth2Potion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Extrakt);
	};

/******************************************************************************************/	
INSTANCE ItFo_Potion_Health_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpElixier;	

	visual 			=	"ItFo_Potion_Health_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealth3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Elixir of Healing";
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpElixier;
};

	FUNC VOID UseHealth3Potion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Elixier);
	};



/******************************************************************************************/
// TRÄNKE FÜR PERMANENTE ATTRIBUT-ÄNDERUNGEN!
/******************************************************************************************/

/******************************************************************************************/
INSTANCE ItFo_Potion_Elixier_Egg(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ElixierEgg;	

	visual 			=	"ItFo_Potion_Elixier_Egg.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseEggElixier;
	scemeName		=	"POTIONFAST";

	description			= "Crawler Potion";
	TEXT[0]				= "Allows contact to the Sleeper.";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_ElixierEgg;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ElixierEgg;
};

	func void  UseEggElixier ()
	{
 		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_ElixierEgg);
	};
	

/******************************************************************************************/
//STRENGTH

INSTANCE ItFo_Potion_Strength_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrEssenz;	

	visual 			=	"ItFo_Potion_Strength_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrengthPotion;
	scemeName		=	"POTIONFAST";

	description			= "Essence of Strength";
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]	= STR_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrEssenz;
};

	FUNC VOID UseStrengthPotion()
	{ 
 		B_RaiseAttribute	(ATR_STRENGTH,	STR_Essenz);
	};
	
/******************************************************************************************/
INSTANCE ItFo_Potion_Strength_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrExtrakt;	

	visual 			=	"ItFo_Potion_Strength_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrength2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Extract of Strength";
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]	= STR_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrExtrakt;
};

	FUNC VOID UseStrength2Potion()
	{ 
		B_RaiseAttribute	(ATR_STRENGTH,	STR_Extrakt);
	};
		
/******************************************************************************************/
INSTANCE ItFo_Potion_Strength_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrElixier;	

	visual 			=	"ItFo_Potion_Strength_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrength3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Elixir of Strength";
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]	= STR_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrElixier;
};

	FUNC VOID UseStrength3Potion()
	{ 
		B_RaiseAttribute	(ATR_STRENGTH,	STR_Elixier);
	};




/******************************************************************************************/
//	DEXTERITY

INSTANCE ItFo_Potion_Dex_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexEssenz;	

	visual 			=	"ItFo_Potion_Dex_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDexPotion;
	scemeName		=	"POTIONFAST";

	description			= "Essence of Dexterity";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= DEX_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_DexEssenz;
};

	FUNC VOID UseDexPotion()
	{ 
		B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Essenz);
	};
		
/******************************************************************************************/		
INSTANCE ItFo_Potion_Dex_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexExtrakt;	

	visual 			=	"ItFo_Potion_Dex_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDex2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Extract of Dexterity";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= DEX_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_DexExtrakt;
};

	FUNC VOID UseDex2Potion()
	{ 
		B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Extrakt);
	};
		
/******************************************************************************************/		
INSTANCE ItFo_Potion_Dex_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexElixier;	

	visual 			=	"ItFo_Potion_Dex_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDex3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Elixir of Dexterity";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= DEX_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_DexElixier;
};

	FUNC VOID UseDex3Potion()
	{ 
		B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Elixier);
	};


/******************************************************************************************/
// STRENGTH & DEX

INSTANCE ItFo_Potion_Master_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrDex_Macht;	

	visual 			=	"ItFo_Potion_Master_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMasterPotion;
	scemeName		=	"POTIONFAST";

	description			= "Potion of Power";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= StrDex_Macht;
	TEXT[2]				= NAME_Bonus_Str;				COUNT[2]	= StrDex_Macht;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrDex_Macht;
};

	FUNC VOID UseMasterPotion()
	{
		Npc_ChangeAttribute	(self,	ATR_STRENGTH,	StrDex_Macht);
		Npc_ChangeAttribute	(self,	ATR_DEXTERITY,	StrDex_Macht);
		
		var string msg;
		msg = ConcatStrings(NAME_RaiseStrDex , IntToString(StrDex_Macht));
		PrintScreen	(msg, -1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Master_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrDex_Herrschaft;	

	visual 			=	"ItFo_Potion_Master_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMaster2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Potion of Supremacy";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= StrDex_Herrschaft;
	TEXT[2]				= NAME_Bonus_Str;				COUNT[2]	= StrDex_Herrschaft;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrDex_Herrschaft;
};

	FUNC VOID UseMaster2Potion()
	{
		Npc_ChangeAttribute	(self,	ATR_STRENGTH,	StrDex_Herrschaft);
		Npc_ChangeAttribute	(self,	ATR_DEXTERITY,	StrDex_Herrschaft);

		var string msg;
		msg = ConcatStrings(NAME_RaiseStrDex , IntToString(StrDex_Herrschaft));
		PrintScreen	(msg, -1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
	};


/******************************************************************************************/		
// Hitpoints

INSTANCE ItFo_Potion_Health_Perma_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpMaxEssenz;	

	visual 			=	"ItFo_Potion_Health_Perma_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLifePotion;
	scemeName		=	"POTIONFAST";

	description			= "Essence of Life";
	TEXT[1]				= NAME_Bonus_HpMax;				COUNT[1]	= HPMax_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpMaxEssenz;
};

	FUNC VOID UseLifePotion()
	{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	HPMax_Essenz);
	};
		
/******************************************************************************************/
INSTANCE ItFo_Potion_Health_Perma_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpMaxExtrakt;	

	visual 			=	"ItFo_Potion_Health_Perma_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLife2Potion;
	scemeName		=	"POTIONFAST";

	description		= "Extract of Life";
	TEXT[1]				= NAME_Bonus_HpMax;				COUNT[1]	= HPMax_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpMaxExtrakt;
};

	FUNC VOID UseLife2Potion()
	{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	HPMax_Extrakt);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Health_Perma_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpMaxElixier;	

	visual 			=	"ItFo_Potion_Health_Perma_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLife3Potion;
	scemeName		=	"POTIONFAST";

	description		= "Elixir of Life";
	TEXT[1]				= NAME_Bonus_HpMax;				COUNT[1]	= HPMax_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpMaxElixier;
};

	FUNC VOID UseLife3Potion()
	{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	HPMax_Elixier);	
	};


/******************************************************************************************/
// MANA

INSTANCE ItFo_Potion_Mana_Perma_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxEssenz;	

	visual 			=	"ItFo_Potion_Mana_Perma_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectarPotion;
	scemeName		=	"POTIONFAST";

	description			= "Essence of the Spirit";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaMaxEssenz;
};

	FUNC VOID UseNectarPotion()
	{
		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Essenz);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_Perma_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxExtrakt;	

	visual 			=	"ItFo_Potion_Mana_Perma_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectar2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Extract of the Spirit";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaMaxExtrakt;
};

	FUNC VOID UseNectar2Potion()
	{
		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Extrakt);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_Perma_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxElixier;	

	visual 			=	"ItFo_Potion_Mana_Perma_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectar3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Elixir of the Spirit";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaMaxElixier;
};

	FUNC VOID UseNectar3Potion()
	{
		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Elixier);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
	};



/******************************************************************************************/
//	SPEED-POTIONS																	      //
/******************************************************************************************/
INSTANCE ItFo_Potion_Haste_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste1;	

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion;
	scemeName		=	"POTIONFAST";

	description		= "Potion of Swiftness";
	TEXT[1]			= "Enables the player to short term sprints.";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste1/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseHastePotion()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste1);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "jetzt bin ich schnell");	
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Haste_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste1;	

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion2;
	scemeName		=	"POTIONFAST";

	description		= "Potion of Velocity";
	TEXT[1]			= "Allows the player to sprint.";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste2/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseHastePotion2()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste2);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "jetzt bin ich schnell");	
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Haste_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste1;	

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion3;
	scemeName		=	"POTIONFAST";

	description		= "Potion of Haste";
	TEXT[1]			= "Enables the player to sprint longer.";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste3/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseHastePotion3()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste3);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "jetzt bin ich schnell");	
	};
