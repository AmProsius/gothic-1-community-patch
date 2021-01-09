// ************************************************************************************************
// Heilwirkung und Kosten von Nahrung
// ************************************************************************************************

const int	Value_Bugmeat		=	 2;		const int	HP_Bugmeat			=	4;
const int	Value_Apfel			=	 4;		const int	HP_Apfel			=	8;
const int	Value_Weintrauben	=	 6;		const int	HP_Weintrauben		=	8;

const int	Value_Wasser		=	 3;		const int	HP_Wasser			=	5;
const int	Value_Bier			=	10;		const int	HP_Bier				=	3;
const int	Value_Wein			=	13;		const int	HP_Wein				=	3;
const int	Value_Reisschnaps	=	15;		const int	HP_Reisschnaps		=	3;

const int	Value_Reis			=	 5;		const int	HP_Reis				=	10;
const int	Value_Wurzelsuppe	=	 3;		const int	HP_Wurzelsuppe		=	 7;
const int	Value_Ragout		=	 4;		const int	HP_Ragout			=	 9;
const int	Value_CrawlerSuppe	=	10;		const int	HP_CrawlerSuppe		=	15;

const int	Value_FleischRoh	=	 5;		const int	HP_FleischRoh		=	10;
const int	Value_Brot			=	 8;		const int	HP_Brot				=	12;
const int	Value_Käse			=	10;		const int	HP_Käse				=	15;
const int	Value_Fleisch		=	 8;		const int	HP_Fleisch			=	15; // Rohes Fleisch mit Pfanne benutzt
const int	Value_Schinken		=	12;		const int	HP_Schinken			=	18;

const int	Value_Waldbeeren	=	5;		const int	HP_Waldbeeren		=	10;
const int	Value_Flammendorn	=	6;		const int	HP_Flammendorn		=	12;
const int	Value_Seraphis		=	7;		const int	HP_Seraphis			=	14;
const int	Value_Velayis		=	8;		const int	HP_Velayis			=	16;
const int	Value_Bergmoos		=	9;		const int	HP_Bergmoos			=	18;
const int	Value_Grabmoos		=	10;		const int	HP_Grabmoos			=	20;
const int	Value_Nachtschatten	=	11;		const int	HP_Nachtschatten	=	22;
const int	Value_Mondschatten	=	12;		const int	HP_Mondschatten		=	24;
const int	Value_Orkblatt		=	13;		const int	HP_Orkblatt			=	26;
const int	Value_Eichenblatt	=	14;		const int	HP_Eichenblatt		=	28;

const int	Value_Höllenpilz	=	 3;		const int	HP_Höllenpilz		=	 6;
const int	Value_Sklavenbrot	=	 9;		const int	HP_Sklavenbrot		=	15;

const int	Value_Heilkräuter1	=	14;		const int	HP_Heilkräuter1		=	30;
const int	Value_Heilkräuter2	=	19;		const int	HP_Heilkräuter2		=	39;
const int	Value_Heilkräuter3	=	24;		const int	HP_Heilkräuter3		=	49;

// Fixme: Trollkirsche als Handelsware mit Wert?
const int	Value_Trollkirsche	=	15;		const int	HP_Trollkirsche		=	-20;

// Mana
const int	Value_Blutbuche		=	3;		const int	Mana_Blutbuche		=	5;
const int	Value_Turmeiche		=	8;		const int	Mana_Turmeiche		=	10;
const int	Value_Rabenkraut	=	12;		const int	Mana_Rabenkraut		=	15;
const int	Value_Dunkelkraut	=	17;		const int	Mana_Dunkelkraut	=	20;
const int	Value_Steimwurzel	=	20;		const int	Mana_Steinwurzel	=	25;
const int	Value_Drachenwurzel	=	23;		const int	Mana_Drachenwurzel	=	30;


/*******************************************************************************************
**	Essbares				                                          					**
*******************************************************************************************/

INSTANCE ItAt_Meatbug_01 (C_Item)
{	
	name 				=	"Bugmeat";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bugmeat;
	
	visual 				=	"ItAt_Meatbug_01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	UseBugmeat;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Bugmeat;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Bugmeat;

};

	FUNC VOID UseBugmeat()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bugmeat);
	};

/******************************************************************************************/
INSTANCE ItFoApple(C_Item)
{	
	name 				=	"Apple";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Apfel;

	visual 				=	"ItFo_Apple_01.3ds"; 
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	UseApple;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Apfel;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Apfel;
};

	FUNC VOID UseApple()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Apfel);
	};

/******************************************************************************************/
INSTANCE ItFo_wineberrys_01(C_Item)
{	
	name 				=	"Grapes";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weintrauben;

	visual 				=	"ItFo_wineberrys_01.3ds";
	on_state[0]         = 	Usewineberrys;  
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Weintrauben;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Weintrauben;
};

	func void Usewineberrys () 
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Weintrauben);
	};

/******************************************************************************************/
INSTANCE ItFoLoaf(C_Item)
{	
	name 				=	"Bread";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Brot;

	visual 				=	"ItFo_Loaf_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseLoaf;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Brot;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Brot;

};

	FUNC VOID UseLoaf()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Brot);
	};

/******************************************************************************************/
INSTANCE ItFoMutton (C_Item)
{	
	name 				=	"Grilled meat";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Fleisch;

	visual 				=	"ItFo_CookedMutton_01.3ds";
	scemeName			=	"MEAT";
	on_state[0]			=	UseMutton;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Fleisch;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Fleisch;
};

	FUNC VOID UseMutton()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Fleisch);
	};

/******************************************************************************************/
INSTANCE ItFoMuttonRaw (C_Item)
{	
	name 				=	"Raw Meat";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_FleischRoh;

	visual 				=	"ItFo_RawMutton_01.3ds";
	scemeName			=	"MEAT";
	on_state[0]			=	UseMuttonRaw;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_FleischRoh;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_FleischRoh;
};

	FUNC VOID UseMuttonRaw()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_FleischRoh);
	};

/******************************************************************************************/
INSTANCE ItFo_mutton_01 (C_Item)
{	
	name 				=	"Ham";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Schinken;

	visual 				=	"ItFo_mutton_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseMutton1;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Schinken;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Schinken;

};

	FUNC VOID UseMutton1()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Schinken);
	};

/******************************************************************************************/
INSTANCE ItFoCheese(C_Item)
{	
	name 				=	"Cheese";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Käse;

	visual 				=	"ItFo_Cheese_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseCheese;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Käse;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Käse;
};

	FUNC VOID UseCheese()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Käse);
	};

/******************************************************************************************/
INSTANCE ItFoRice(C_Item)
{	
	name 				=	"Rice";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Reis;

	visual 				=	"ItFo_Rice_01.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	UseRice;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Reis;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Reis;
};

	FUNC VOID UseRice()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Reis);
	};

/******************************************************************************************/
INSTANCE ItFoSoup(C_Item)
{	
	name 				=	"Root Soup";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wurzelsuppe;

	visual 				=	"ItFo_Soup_01.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	UseSoup;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Wurzelsuppe;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Wurzelsuppe;
};

	FUNC VOID UseSoup()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Wurzelsuppe);
	};

/******************************************************************************************/
INSTANCE ItFoMeatbugragout(C_Item)
{	
	name 				=	"Meatbug Ragout";
	
	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Ragout;

	visual 				=	"ItFo_Meatbugragout_01.3ds"; 
	material 			=	MAT_LEATHER;
	scemeName			=	"RICE";
	on_state[0]			=	UseMeatbugragout;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Ragout;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Ragout;
};

	FUNC VOID UseMeatbugragout()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Ragout);
	};

/******************************************************************************************/
INSTANCE ItFoCrawlersoup(C_Item)                                          
{	                                                                
	name 				=	"Minecrawler Soup";
	                                                            
	mainflag 			=	ITEM_KAT_FOOD;  
	flags 				=	ITEM_MULTI;
                                                                    
	value 				=	Value_CrawlerSuppe;              
                                                                    
	visual 				=	"ItFo_Crawlersoup_01.3ds";    
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseCrawlersoup;   
	scemeName			=	"RICE";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_CrawlerSuppe;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_CrawlerSuppe;                                                    
};

	FUNC VOID UseCrawlersoup()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_CrawlerSuppe);
	};


/*******************************************************************************************
**	Trinkbares				                                        					  **
*******************************************************************************************/

/******************************************************************************************/
INSTANCE ItFo_Potion_Water_01(C_Item)
{
	name 			=	"Water";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Wasser;	

	visual 			=	"ItFo_Potion_Water_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseWaterPotion;
	scemeName		=	"POTION";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Wasser;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Wasser;
};

	func VOID UseWaterPotion()
	{	
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Wasser);
	};


// FIXME: zs_Drunk für SC oder nicht? 
INSTANCE ItFoBeer(C_Item)
{
	name 				=	"Beer";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bier;	

	visual 				=	"ItFo_Beer_01.3ds";
	material 			=	MAT_GLAS;
	on_state[0]			=	UseBeer;
	scemeName			=	"POTION";

	description			= name;
	//TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Bier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Bier;
};

	FUNC VOID UseBeer()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bier);
	};

/******************************************************************************************/

INSTANCE ItFoWine(C_Item)
{	
	name 				=	"Wine";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wein;

	visual	 			=	"ItFo_Wine_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseWine;
	scemeName			=	"POTION";

	description			= name;
	//TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Wein;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Wein;
};

	FUNC VOID UseWine()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Wein);
	};

/******************************************************************************************/

INSTANCE ItFoBooze(C_Item)
{	
	name 				=	"Rice Schnapps";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Reisschnaps;

	visual 				=	"ItFo_Booze_01.3ds";
	material 			=	MAT_GLAS;
	on_state[0]			=	UseBooze;
	scemeName			=	"POTION";

	description			= name;
	//TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Reisschnaps;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Reisschnaps;
};

	FUNC VOID UseBooze()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Reisschnaps);
	};



//**************************************************************************************/
//						PFLANZEN  PFLANZEN PFLANZEN
/******************************************************************************************/ 
INSTANCE ItFo_Plants_Berrys_01(C_Item)
{	
	name 				=	"Blueberries";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Waldbeeren;

	visual 				=	"ItFo_Plants_Berrys_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   UseBerrys;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Waldbeeren;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Waldbeeren;
};

		func void UseBerrys ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Waldbeeren);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Beeren");
		};

/******************************************************************************************/
INSTANCE ItFo_Plants_Flameberry_01(C_Item)
{	
	name 				=	"Flame Thorn";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Flammendorn;

	visual 				=	"ItFo_Plants_Flameberry_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   Useflame;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Flammendorn;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Flammendorn;
};

		func void Useflame ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Flammendorn);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Flammendorn");
		};
		
/******************************************************************************************/
INSTANCE ItFo_Plants_Seraphis_01(C_Item)
{	
	name 				=	"Seraphis";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Seraphis;

	visual 				=	"ItFo_Plants_Seraphis_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Useseraphis;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Seraphis;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Seraphis;
};

		func void Useseraphis ()
		{			
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Seraphis);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Seraphis");
		};
		
/******************************************************************************************/
// Steigerung von Seraphis

INSTANCE ItFo_Plants_Velayis_01(C_Item)
{	
	name 				=	"Velayis";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Velayis;

	visual 				=	"ItFo_Plants_Seraphis_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= UseVelayis;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Velayis;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Velayis;
};

		func void UseVelayis ()
		{			
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Velayis);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Velayis");
		};

/******************************************************************************************/
INSTANCE ItFo_Plants_mountainmoos_01(C_Item)
{	
	name 				=	"Mountain Moss";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Bergmoos;

	visual 				=	"ItFo_Plants_mountainmoos_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   Usemoos;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Bergmoos;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Bergmoos;
};

		func void Usemoos ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bergmoos);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Moos");
		};
		
/******************************************************************************************/
INSTANCE ItFo_Plants_mountainmoos_02(C_Item)
{	
	name 				=	"Grave Moss";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Grabmoos;

	visual 				=	"ItFo_Plants_mountainmoos_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   Usemoos2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Grabmoos;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Grabmoos;
};

		func void Usemoos2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Grabmoos);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse GrabMoos");
		};

/******************************************************************************************/
INSTANCE ItFo_Plants_Nightshadow_01(C_Item)
{	
	name 				=	"Solanaceae";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Nachtschatten;

	visual 				=	"ItFo_Plants_Nightshadow_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]         = Usenight;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Nachtschatten;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Nachtschatten;
};

		func void Usenight ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Nachtschatten);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Nachtschatten");
		};
		
/******************************************************************************************/
INSTANCE ItFo_Plants_Nightshadow_02(C_Item)
{	
	name 				=	"Lunanaceae";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mondschatten;

	visual 				=	"ItFo_Plants_Nightshadow_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]         = Usemoon;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Mondschatten;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Mondschatten;
};

		func void Usemoon ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Mondschatten);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Mondschatten");
		};
		
/******************************************************************************************/
INSTANCE ItFo_Plants_OrcHerb_01(C_Item)
{	
	name 				=	"Orc Leaf";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Orkblatt;

	visual 				=	"ItFo_Plants_OrcHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	Useorc;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Orkblatt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Orkblatt;
};

		func void Useorc ()
		{	
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Orkblatt);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse orkblatt");
		};
		
/******************************************************************************************/
INSTANCE ItFo_Plants_OrcHerb_02(C_Item)
{	
	name 				=	"Oak Leaf";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Eichenblatt;

	visual 				=	"ItFo_Plants_OrcHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Useorc2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Eichenblatt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Eichenblatt;
};

		func void Useorc2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Eichenblatt);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Eichenblatt");
		};
		
/*****************************************************************************************/
//								PILZE
/*****************************************************************************************/
INSTANCE ItFo_Plants_mushroom_01(C_Item)
{	
	name 				=	"Hell Mushrooms";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Höllenpilz;

	visual 				=	"ItFo_Plants_mushroom_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Usemush;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Höllenpilz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Höllenpilz;
};

		func void Usemush ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Höllenpilz);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Höllenpilz");
		};

/*****************************************************************************************/
INSTANCE ItFo_Plants_mushroom_02(C_Item)
{	
	name 				=	"Slave's Bread";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Sklavenbrot;

	visual 				=	"ItFo_Plants_mushroom_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	Usemush2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Sklavenbrot;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Sklavenbrot;
};

		func void Usemush2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Sklavenbrot);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Sklavenbrot");
		};


/*****************************************************************************************/
//								HEILKRÄUTER
/*****************************************************************************************/
INSTANCE ItFo_Plants_Herb_01(C_Item)
{	
	name 				=	"Healing Herbs";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Heilkräuter1;

	visual 				=	"ItFo_Plants_Herb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlants1;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Heilkräuter1;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Heilkräuter1;
};

	func void UsePlants1 ()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Heilkräuter1);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilkräuter");
	};

/******************************************************************************************/
INSTANCE ItFo_Plants_Herb_02(C_Item)
{	
	name 				=	"Healing Herbs";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Heilkräuter2;

	visual 				=	"ItFo_Plants_Herb_02.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlants2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Heilkräuter2;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Heilkräuter2;
};

		func void UsePlants2 ()
		{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Heilkräuter2);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilpflanzen");
	};

/******************************************************************************************/
INSTANCE ItFo_Plants_Herb_03(C_Item)
{	
	name 				=	"Healing Herbs";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Heilkräuter3;

	visual 				=	"ItFo_Plants_Herb_03.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlants3;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Heilkräuter3;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Heilkräuter3;
};

	func void UsePlants3 ()
	{			
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Heilkräuter3);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilpflanzen");
	};

/*****************************************************************************************/
//							MANAREG. PFLANZEN
/*****************************************************************************************/
instance ItFo_Plants_Bloodwood_01 (C_ITEM)
{	
	name 					=	"Copper Beech Seed";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	Value_Blutbuche;

	visual 					=	"ItFo_Plants_Bloodwood_01.3ds";
	material 				=	MAT_WOOD;
	on_state[0]				=  Useblood;
	scemeName				=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Blutbuche;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Blutbuche;                          	
};
                                       
		func void Useblood ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Blutbuche);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Blutbuchensamen");
		};   
		                                  
/******************************************************************************************/
instance ItFo_Plants_Towerwood_01 (C_ITEM)
{	
	name 					=	"Tower Oak Seed";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	Value_Turmeiche;

	visual 					=	"ItFo_Plants_Bloodwood_01.3ds";
	material 				=	MAT_WOOD;
	on_state[0]				=  Useblood2;
	scemeName				=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Turmeiche;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Turmeiche;                    	
};                                        

		func void Useblood2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Turmeiche);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Turmeichensamen");
		};
		                 
/******************************************************************************************/
INSTANCE ItFo_Plants_RavenHerb_01(C_Item)
{	
	name 				=	"Raven Herbs";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Rabenkraut;

	visual 				=	"ItFo_Plants_RavenHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Useraven;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Rabenkraut;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Rabenkraut;
};

		func void Useraven ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Rabenkraut);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Rabenkraut");
		}; 
		  
/******************************************************************************************/
INSTANCE ItFo_Plants_RavenHerb_02(C_Item)
{	
	name 				=	"Dark Herbs";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Dunkelkraut;

	visual 				=	"ItFo_Plants_RavenHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   Useraven2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Dunkelkraut;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Dunkelkraut;
};

		func void Useraven2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Dunkelkraut);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Dunkelkraut");
		}; 
		 
/******************************************************************************************/ 
INSTANCE ItFo_Plants_Stoneroot_01(C_Item)
{	
	name 				=	"Stoneroot";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Steimwurzel;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   Useroot;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Steinwurzel;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Steimwurzel;
};

		func void Useroot ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Steinwurzel);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Steinwurzel");
		}; 
		
/******************************************************************************************/  
INSTANCE ItFo_Plants_Stoneroot_02(C_Item)
{	
	name 				=	"Dragonroot";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Drachenwurzel;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   Useroot2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Drachenwurzel;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Drachenwurzel;
};

		func void Useroot2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Drachenwurzel);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Drachenwurzel");
		}; 
		  
/******************************************************************************************/
//								GIFTPFLANZEN
/******************************************************************************************/
INSTANCE ItFo_Plants_Trollberrys_01(C_Item)
{	
	name 					=	"Troll Nightshade";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	Value_Trollkirsche;

	visual 					=	"ItFo_Plants_Trollberrys_01.3ds";
	material 				=	MAT_WOOD;
	on_state [0]			=   UseTrollberrys;
	scemeName				=	"FOOD";

	description			= name;
//	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Trollkirsche;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Trollkirsche;
};

		func void UseTrollberrys ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Trollkirsche);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Trollkirschen");
		};
