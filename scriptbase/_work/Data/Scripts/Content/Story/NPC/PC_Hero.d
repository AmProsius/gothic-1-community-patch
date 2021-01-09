
INSTANCE PC_Hero(NPC_DEFAULT)

{
	//-------- primary data --------		
	name 			= "Me";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE;
	level			= 0;
	voice			= 15;
	id				= 0;
	
	//------------------------------
	exp				= 0;
	exp_next		= 500;
	lp				= 0;
	//------------------------------
	
	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	10;     
	attribute[ATR_DEXTERITY] 	=	10;     
	attribute[ATR_MANA_MAX] 	=	5;
	attribute[ATR_MANA] 		=	5;
	attribute[ATR_HITPOINTS_MAX]=	40;    
	attribute[ATR_HITPOINTS] 	=	40;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			-1);
	
	//-------------------------
	CreateInvItem 	(self, ItWr_Fire_Letter_01);
};



// ***************************************************************************
// PlayerInstanz ANFANG LEVEL2!!! Mit Buddlerrüstung +10, Waffe +13, Waffe +20
// ***************************************************************************

INSTANCE PC_Hero_L2(NPC_DEFAULT)

{
	//-------- primary data --------
	name 			= "Me";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE;
	level			= 2;
	voice			= 15;
	id				= 0;
	
	//------------------------------
	exp				= 1500;
	exp_next		= 3000;
	lp				= 0;
	//------------------------------
	
	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	13;     
	attribute[ATR_DEXTERITY] 	=	10;     
	attribute[ATR_MANA_MAX] 	=	5;
	attribute[ATR_MANA] 		=	5;
	attribute[ATR_HITPOINTS_MAX]=	64;    
	attribute[ATR_HITPOINTS] 	=	64;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			VLK_ARMOR_L);

	//-------- talents --------
	//Npc_SetTalentSkill		( self, NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	//Npc_SetTalentSkill		( self, NPC_TALENT_SNEAK,	1);	
	//Npc_SetTalentSkill		( self, NPC_TALENT_PICKLOCK,	1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	//Npc_SetTalentSkill	(self, NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_BOW,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
    EquipItem	(self, HeroSword20);
	CreateInvItems  (self, ItAmArrow, 50);
	EquipItem 		(self, HeroSword13);
	EquipItem		(self, HeroBow13);
};



// ***************************************************************************
// PlayerInstanz ANFANG LEVEL 5 (Ende Kap 1) 
// ***************************************************************************

INSTANCE PC_Hero_L5(NPC_DEFAULT)

{
	//-------- primary data --------
	name 			= "Me";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE; //
	level			= 5;
	voice			= 15;
	id				= 0;

	//------------------------------
	exp				= 7500;
	exp_next		= 10500;
	lp				= 0;
		//------------------------------

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	25;     
	attribute[ATR_DEXTERITY] 	=	10;     
	attribute[ATR_MANA_MAX] 	=	5;
	attribute[ATR_MANA] 		=	5;
	attribute[ATR_HITPOINTS_MAX]=	100;    
	attribute[ATR_HITPOINTS] 	=	100;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			-1);

	//-------- talents --------
	//Npc_SetTalentSkill		( self, NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	//Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK,	1);	
	//Npc_SetTalentSkill		( self, NPC_TALENT_PICKLOCK,	1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	//Npc_SetTalentSkill	(self, NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_BOW,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
	EquipItem	(self, HeroSword25);
	EquipItem	(self, HeroBow13);
	CreateInvItems  (self, ItAmArrow, 50);
};

// ***************************************************************************
// PlayerInstanz LEVEL 7 (Anfang Kapitel 2) 
// ***************************************************************************
INSTANCE PC_Hero_L7(NPC_DEFAULT)
{
	//-------- primary data --------
	name 			= "Me";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_ORG; //
	level			= 7;
	voice			= 15;
	id				= 0;

	//------------------------------
	exp				= 14000;
	exp_next		= 18000;
	lp				= 0;
		//------------------------------

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	45;     
	attribute[ATR_DEXTERITY] 	=	35;     
	attribute[ATR_MANA_MAX] 	=	20;
	attribute[ATR_MANA] 		=	20;
	attribute[ATR_HITPOINTS_MAX]=	160;    
	attribute[ATR_HITPOINTS] 	=	160;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			ORG_ARMOR_H);

	//-------- talents --------
	//Npc_SetTalentSkill		( self, NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	//Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK,	1);	
	Npc_SetTalentSkill		( self, NPC_TALENT_PICKLOCK,	1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	Npc_SetTalentSkill	(self, NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_BOW,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
	EquipItem		(self,	ItMw_1H_Sword_05);
	EquipItem		(self,	ItRw_Bow_Small_04);
	CreateInvItems  (self,	ItAmArrow, 100);
	CreateInvItems  (self,	ItMiNugget, 50);
	CreateInvItem	(self,	ItWrWorldmap);
	CreateInvItems  (self,	ItKeLockpick, 30);
	CreateInvItems  (self,	ItLsTorch, 20);
	CreateInvItems	(self,	ItFo_Potion_Health_03,	20);
	CreateInvItems	(self,	ItFo_Potion_Mana_03,	20);
};

// ***************************************************************************
// PlayerInstanz LEVEL 11 (Anfang Kapitel 3) 
// ***************************************************************************
INSTANCE PC_Hero_L11(NPC_DEFAULT)
{
	//-------- primary data --------
	name 			= "Me";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_SLD; //
	level			= 11;
	voice			= 15;
	id				= 0;

	//------------------------------
	exp				= 33000;
	exp_next		= 39000;
	lp				= 0;
		//------------------------------

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	60;     
	attribute[ATR_DEXTERITY] 	=	45;     
	attribute[ATR_MANA_MAX] 	=	50;
	attribute[ATR_MANA] 		=	50;
	attribute[ATR_HITPOINTS_MAX]=	220;    
	attribute[ATR_HITPOINTS] 	=	220;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			SLD_ARMOR_H);

	//-------- talents --------
	//Npc_SetTalentSkill		( self, NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	//Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK,	1);	
	Npc_SetTalentSkill		( self, NPC_TALENT_PICKLOCK,	1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	Npc_SetTalentSkill	(self, NPC_TALENT_1H,2);
	//Npc_SetTalentSkill	(self, NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill	(self, NPC_TALENT_BOW,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
	EquipItem		(self, ItMw_1H_Sword_Long_05);
	EquipItem		(self, ItRw_Bow_Long_02);
	CreateInvItems  (self, ItAmArrow, 100);
	CreateInvItems  (self, ItMiNugget, 400);
	CreateInvItems  (self, ItKeLockpick, 30);
	CreateInvItems  (self, ItLsTorch, 20);
};

// ***************************************************************************
// PlayerInstanz LEVEL 13 (Mitte Kapitel 3) 
// ***************************************************************************
INSTANCE PC_Hero_L13(NPC_DEFAULT)
{
	//-------- primary data --------
	name 			= "Me";
	Npctype			= Npctype_Main;
	guild			= GIL_SLD; //
	level			= 13;
	voice			= 15;
	id				= 0;

	//------------------------------
	exp				= 45500;
	exp_next		= 52500;
	lp				= 0;
		//------------------------------

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	65;     
	attribute[ATR_DEXTERITY] 	=	50;     
	attribute[ATR_MANA_MAX] 	=	50;
	attribute[ATR_MANA] 		=	50;
	attribute[ATR_HITPOINTS_MAX]=	250;    
	attribute[ATR_HITPOINTS] 	=	250;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			SLD_ARMOR_H);

	//-------- talents --------
	Npc_SetTalentSkill		( self, NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK,	1);	
	Npc_SetTalentSkill		( self, NPC_TALENT_PICKLOCK,	1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	Npc_SetTalentSkill	(self, NPC_TALENT_1H,2);
	//Npc_SetTalentSkill	(self, NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill	(self, NPC_TALENT_BOW,1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
	EquipItem		(self, ItMw_1H_Sword_Broad_01);
	EquipItem		(self, ItRw_Bow_Long_04);
	CreateInvItems  (self, ItAmArrow, 100);
	CreateInvItems  (self, ItMiNugget, 400);
	CreateInvItems  (self, ItKeLockpick, 50);
	CreateInvItems  (self, ItLsTorch, 20);
};

// ***************************************************************************
// Testwaffen
// ***************************************************************************

instance HeroSword13 (C_Item)
{	
	name 				=	"Worn-out sword";//Rostiges Schwert

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	27;

	damage 				= 	13;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		
	
	visual 				=	"ItMw1hSwordold01.3DS";
};

INSTANCE HeroSword20 (C_Item)
{	
	name 				=	"Sword";//Schwert

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	31;

	damage 				= 	20;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		
	
	visual 				=	"ItMw1hSword01.3DS";
};

INSTANCE HeroSword25 (C_Item)
{	
	name 				=	"Sword";//Schwert

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	31;

	damage 				= 	25;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		
	
	visual 				=	"ItMw1hSword01.3DS";
};

INSTANCE HeroBow13 (C_Item)
{	
	name 					=	"Longbow";//Langbogen

	mainflag 				=	ITEM_KAT_FF;
	flags 					=	ITEM_BOW;	
	material 				=	MAT_WOOD;

	value 					=	35;

	damage 					=	13;
	damagetype				=	DAM_POINT;
	munition				=	ItAmArrow;
	
	visual 					=	"ItRwLongbow.mms";
};






// *********** NICHT LÖSCHEN - SONST STERBEN **************


INSTANCE XP_Map(C_Item)
{	
	name 					=	"XP Map";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	1000;

	visual 					=	"ItWr_Map_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_XP_Map;
};

FUNC VOID Use_XP_Map()
{
	CreateInvItems(self,ItMiNugget,1000);
	hero.lp = hero.lp + 20;
	
	PrintScreen	("+1000 Erz", -1,40,"font_10_book.tga",10);
};
