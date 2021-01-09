/*************************************************************************
**																		**
**		TESTMODELLE_ROMAN.D												**
**		===================												**
**																		**
**		Enthält 														**
**		- Allround-Testmodell											**
**																		**
*************************************************************************/

//########################################################################
//##
//##				ITEMs
//##
//########################################################################        

//########################################################################
//##
//##	ITEM: Level Map
//##
//########################################################################
INSTANCE ItWrLevelMap(C_Item)
{	
	name 					=	"Map of Test Level";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	15;

	visual 					=	"ItWrMap.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseLevelMap;
};

	FUNC VOID UseLevelMap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         
					Doc_SetPage 	( nDocID,  0, "Map_X.TGA"    	, 1 	);  //  1 -> DO NOT SCALE 
		//			Doc_SetPage 	( nDocID,  0, "BOOK_LEFT.TGA"  	, 0 	);  //  0 -> DO NOT SCALE 
		//			Doc_SetPage 	( nDocID,  1, "BOOK_RIGHT.TGA" 	, 0 	);
  					Doc_SetFont 	( nDocID, -1, "FONT_OLD_20_WHITE.TGA"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 10, 10, 10, 10, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID, -1, "Level Map"				);
					Doc_Show		( nDocID );
	};

//########################################################################
//##
//##	ITEM: Book
//##
//########################################################################
INSTANCE ItWrBookOfTales(C_Item)
{	
	name 					=	"Book of Tales";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	15;

	visual 					=	"ItWrMap.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseBookOfTales;
};

	FUNC VOID UseBookOfTales()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "BOOK_LEFT.TGA"  , 0 		);  //  0 -> DO NOT SCALE 
					Doc_SetPage 	( nDocID,  1, "BOOK_RIGHT.TGA" , 0 		);
  					Doc_SetFont 	( nDocID, -1, "FONT_OLD_10_WHITE.TGA"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 10, 10, 10, 10, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID, -1, "HEADER"					);
					Doc_PrintLine	( nDocID, -1, ""						);
					Doc_PrintLines	( nDocID,  0, "One line on the left"	);
					Doc_PrintLines	( nDocID,  1, "One line on the right"	);  
					Doc_Show		( nDocID );
	};


//########################################################################
//##
//##	ITEM: Legendary Burning Short Sword 
//##
//########################################################################
INSTANCE ItMw1hSwordBurning (C_Item)
{	
	//----------------------------------------------------------------	
	//---------------------------------------------------- DESCRIPTION
	//----------------------------------------------------------------	
	NAME 				=	"Legendary short sword of burning";

	//----------------------------------------------------------------	
	//----------------------------------------------------- APPEARANCE	
	//----------------------------------------------------------------	
	VISUAL 				=	"ItMw1hSword01.3DS";
	MAINFLAG 			=	ITEM_KAT_NF;
	FLAGS 				=	ITEM_SWD;	
	MATERIAL 			=	MAT_METAL;
	
	//----------------------------------------------------------------	
	//----------------------------------------------------- ATTRIBUTES	
	//----------------------------------------------------------------	
	DAMAGETYPE			=	DAM_EDGE | DAM_FIRE | DAM_MAGIC;
	DAMAGETOTAL  		= 	191;
	VALUE 				=	20000;

	DAMAGE[ DAM_INDEX_EDGE ] = 1  ;
	DAMAGE[ DAM_INDEX_FIRE ] = 120;
	DAMAGE[ DAM_INDEX_MAGIC] = 70 ;
	
	//----------------------------------------------------------------	
	//---------------------------------------------------- DESCRIPTION	
	//----------------------------------------------------------------	
	DESCRIPTION			= 	"Legendary Short Sword of Burning"  	;
	TEXT	[1]			=	"This is a fucking good sword for"   	;
	TEXT	[2]			=	"killing all fucking creatures who"   	;
	TEXT	[3]			=	"trying to fuck with you!"              ;
	TEXT	[5]			=	"Damage";
	COUNT	[5]			=	DAMAGETOTAL;
};

//########################################################################
//##
//##	ITEM: Legendary Burning Sword (2h)
//##
//########################################################################
INSTANCE ItMw2hSwordBurning (C_Item)
{	
	//----------------------------------------------------------------	
	//---------------------------------------------------- DESCRIPTION
	//----------------------------------------------------------------	
	NAME 				=	"Legendary heavy sword of burning";

	//----------------------------------------------------------------	
	//----------------------------------------------------- APPEARANCE	
	//----------------------------------------------------------------	
	VISUAL 				=	"ItMw2hSword01.3DS";
	MAINFLAG 			=	ITEM_KAT_NF;
	FLAGS 				=	ITEM_2HD_SWD;	
	MATERIAL 			=	MAT_METAL;
	
	//----------------------------------------------------------------	
	//----------------------------------------------------- ATTRIBUTES	
	//----------------------------------------------------------------	
	DAMAGETYPE			=	DAM_FIRE;
	DAMAGETOTAL			= 	250;
	VALUE 				=	30000;

	//----------------------------------------------------------------	
	//---------------------------------------------------- DESCRIPTION	
	//----------------------------------------------------------------	
	DESCRIPTION			= 	"Legendary Heavy Sword of Burning"  	;
	TEXT	[1]			=	"Nothing restists the burning touch"   	;
	TEXT	[2]			=	"of this legendary shword that was"   	;
	TEXT	[3]			=	"already believe to be lost forever"    ;
	TEXT	[5]			=	"Damage";
	COUNT	[5]			=	DAMAGETOTAL;
};

//########################################################################
//##
//##	ITEM: Legendary Burning War Bow
//##
//########################################################################
INSTANCE ItRwWarBowBurning (C_Item)
{	
	//----------------------------------------------------------------	
	//---------------------------------------------------- DESCRIPTION
	//----------------------------------------------------------------	
	NAME 				=	"Legendary bow of burning";

	//----------------------------------------------------------------	
	//----------------------------------------------------- APPEARANCE	
	//----------------------------------------------------------------	
	VISUAL 				=	"ItRw_Bow_War_01.mms";
	MAINFLAG 			=	ITEM_KAT_FF;
	FLAGS 				=	ITEM_BOW;	
	MATERIAL 			=	MAT_WOOD;
	
	//----------------------------------------------------------------	
	//----------------------------------------------------- ATTRIBUTES	
	//----------------------------------------------------------------	
	DAMAGETYPE			=	DAM_FIRE | DAM_POINT | DAM_FLY;
	DAMAGETOTAL			= 	200;
	VALUE 				=	30000;

	DAMAGE[ DAM_INDEX_POINT] = 75;
	DAMAGE[ DAM_INDEX_FIRE ] = 75;
	DAMAGE[ DAM_INDEX_FLY  ] = 50;

	//----------------------------------------------------------------	
	//---------------------------------------------------- DESCRIPTION	
	//----------------------------------------------------------------	
	DESCRIPTION			= 	"Legendary War Bow of Burning"  		;
	TEXT	[1]			=	"Carved in the ancient times before"   	;
	TEXT	[2]			=	"the creation of mankind, this bow is" 	;
	TEXT	[3]			=	"the mightiest ranged weapon ever"    	;
	TEXT	[5]			=	"Damage";
	COUNT	[5]			=	DAMAGETOTAL;
};

//########################################################################
//##
//##	ITEM: Legendary Mithril Robe
//##
//########################################################################
INSTANCE ItArRobeMithril (C_Item)
{	
	name 						=	"Ledengary mithril robe";

	mainflag 					=	ITEM_KAT_ARMOR;
	flags 						=	0;	
	
	value 						=	1098;

	protection [PROT_EDGE] 		= 	20;		
	protection [PROT_BLUNT] 	= 	20;	
	protection [PROT_POINT] 	= 	20;
	protection [PROT_FIRE] 		= 	20;		
	protection [PROT_MAGIC] 	= 	20;

	wear 						=	WEAR_TORSO;

    ownerGuild 					= 	GIL_NONE; 
    disguiseGuild 				= 	GIL_NONE; 
	
	visual 						=	"dmbm.3ds";
	visual_change 				=	"Hum_DMBM_ARMOR.asc";
	visual_skin 				=	0;
	material 					=	MAT_METAL;
};


//########################################################################
//##
//##				NPCs
//##
//########################################################################

//########################################################################
//##
//##	MODEL: PC_Roman				
//##
//########################################################################

instance PC_Roman (NPC_DEFAULT)
{
	//----------------------------------------------------------------	
	//------------------------------------------------- IDENTIFIACTION
	//----------------------------------------------------------------	
	
	NAME  	= "Roman der Romulaner";
	ID    	= 9995;
	GUILD 	= GIL_NONE;
	VOICE 	= 11;
	
	//----------------------------------------------------------------	
	//----------------------------------------------------- ATTRIBUTES	
	//----------------------------------------------------------------	

	//------------------------------------- MAXIMA
	ATTRIBUTE[ ATR_HITPOINTS_MAX] = 50;
	ATTRIBUTE[ ATR_MANA_MAX		] = 50;
//	ATTRIBUTE[ ATR_WILL_MAX		] = 50;
	
	//-------------------------------------- ACTUA
	ATTRIBUTE[ ATR_HITPOINTS	] = 25;
	ATTRIBUTE[ ATR_MANA			] = 50;
//	ATTRIBUTE[ ATR_WILL			] = 50;
	
	ATTRIBUTE[ ATR_STRENGTH		] = 50;
	ATTRIBUTE[ ATR_DEXTERITY	] = 50;
	
	LEVEL = 50;
	
	//----------------------------------------------------------------	
	//----------------------------------------------------- APPEARANCE	
	//----------------------------------------------------------------	
	
	Mdl_SetVisual		( self, "HUMANS.MDS" 		);
	Mdl_SetVisualBody 	( self, "HUM_BODY_NAKED0", 
								0, 
								0,
								"Hum_Head_Fighter", 
								1,  
								2, 
								ItArRobeMithril		);

	//----------------------------------------------------------------	
	//------------------------------------------------------ ABITILIES	
	//----------------------------------------------------------------	

/*	Npc_LearnFightTalent 	( self, TAL_1H_AXE3 	);
	Npc_LearnFightTalent 	( self, TAL_2H_AXE3 	);
	Npc_LearnFightTalent 	( self, TAL_1H_SWORD3 	);
	Npc_LearnFightTalent 	( self, TAL_2H_SWORD3 	);
	Npc_LearnFightTalent 	( self, TAL_BOW3 		);
	Npc_LearnFightTalent 	( self, TAL_CROSSBOW3 	);
*/
// 	FLAGS			= 	NPC_FLAG_IMMORTAL;
// 	FIGHT_TACTIC	=	FAI_Strong;
    
	//----------------------------------------------------------------	
	//------------------------------------------------------ INVENTORY
	//----------------------------------------------------------------	

	//------------------------------------------- WEAPONS
	EquipItem		( self, ItRwWarBowBurning		   			);
	EquipItem		( self, ItMw1hSwordBurning 					);
	EquipItem		( self, ItMw2hSwordBurning 					);
	
	//---------------------------------------------- AMMO
	//CreateInvItems	( self, ItAmArrow, 50 	);
	
	//--------------------------------------------- ARMOR
	//CreateInvItem		( self, ItArRobeMithril	);
	
	//--------------------------------------------- FOOD
	//CreateInvItems 	( self, ItFoApple , 10	);
	//CreateInvItems 	( self, ItFoCheese, 10 	);
	//CreateInvItems 	( self, ItFoLoaf  , 10	);
	//CreateInvItems 	( self, ItFoBeer  , 100	);
	//CreateInvItems 	( self, ItFoWine  , 10 	);

	//--------------------------------------------- MISC
	//CreateInvItems 	( self, ItMiNugget, 50	);
	CreateInvItem		( self, ItWrLevelMap 	);
	
	//----------------------------------------------------------------	
	//------------------------------------------------------------- AI
	//----------------------------------------------------------------	

	//--------------------------------------- HABBITS
};

//########################################################################
//##
//##	MODEL: Allround_Testmodell				
//##
//########################################################################

instance Allround_Testmodell (NPC_DEFAULT)
{
	//----------------------------------------------------------------	
	//------------------------------------------------- IDENTIFIACTION
	//----------------------------------------------------------------	
	
	NAME  	= "Allrounder";
	ID    	= 9999;
	GUILD 	= GIL_NONE;	//GIL_NONE;
	VOICE 	= 11;
	
	//----------------------------------------------------------------	
	//----------------------------------------------------- ATTRIBUTES	
	//----------------------------------------------------------------	

	//------------------------------------- MAXIMA
	ATTRIBUTE[ ATR_HITPOINTS_MAX] = 250;
	ATTRIBUTE[ ATR_MANA_MAX		] = 250;
	
	//-------------------------------------- ACTUA
	ATTRIBUTE[ ATR_HITPOINTS	] = 250;
	ATTRIBUTE[ ATR_MANA			] = 250;
	
	ATTRIBUTE[ ATR_STRENGTH		] = 250;
	ATTRIBUTE[ ATR_DEXTERITY	] = 250;
	
	LEVEL 						  = 250;
	
	//----------------------------------------------------------------	
	//----------------------------------------------------- APPEARANCE	
	//----------------------------------------------------------------	
	
	Mdl_SetVisual		( self, "HUMANS.MDS" 		);
	Mdl_SetVisualBody 	( self, "HUM_BODY_NAKED0", 
								0, 
								0,
								"Hum_Head_Fighter", 
								1,  
								2, 
								GRD_ARMOR_H 		);

	//----------------------------------------------------------------	
	//------------------------------------------------------ ABITILIES	
	//----------------------------------------------------------------	
	
	Npc_SetTalentSkill	( self, NPC_TALENT_ACROBAT	 , 3 );	Npc_SetTalentValue( self, NPC_TALENT_ACROBAT	, 100 ); 
	Npc_SetTalentSkill	( self, NPC_TALENT_PICKLOCK	 , 3 );	Npc_SetTalentValue( self, NPC_TALENT_PICKLOCK   ,   0 ); 
	Npc_SetTalentSkill	( self, NPC_TALENT_PICKPOCKET, 3 );	Npc_SetTalentValue( self, NPC_TALENT_PICKPOCKET ,   0 ); 
	Npc_SetTalentSkill	( self, NPC_TALENT_SNEAK	 , 3 );	
	Npc_SetTalentSkill	( self, NPC_TALENT_1H		 , 3 );
	Npc_SetTalentSkill	( self, NPC_TALENT_2H		 , 3 );
	Npc_SetTalentSkill	( self, NPC_TALENT_BOW		 , 3 );
	Npc_SetTalentSkill	( self, NPC_TALENT_CROSSBOW	 , 3 );
	Npc_SetTalentSkill	( self, NPC_TALENT_MAGE	 	 , 8 );
	Npc_SetTalentSkill	( self, NPC_TALENT_FIREMASTER, 3 );
	
	FLAGS			= 	NPC_FLAG_IMMORTAL;
  	FIGHT_TACTIC	=	FAI_HUMAN_STRONG;
    
	//----------------------------------------------------------------	
	//------------------------------------------------------ INVENTORY
	//----------------------------------------------------------------	

	//---------------------------------------------------------------- ARMOR
	CreateInvItem	( self, ItArRobeMithril						);
	
	//---------------------------------------------------------------- WEAPONS
	//EquipItem		( self, ItRwWarBowBurning		   			);
	//EquipItem		( self, ItMw1hSwordBurning 					);
	//EquipItem		( self, ItMw2hSwordBurning 					);
	EquipItem		( self, ItMw_2H_Sword_Heavy_01				);
	
	//---------------------------------------------------------------- AMMO
	CreateInvItems	( self, ItAmArrow					, 50 	);
	
	//---------------------------------------------------------------- MAGIC
	CreateInvItem	( self, ItArRuneLight	 					);
	CreateInvItem	( self, ItArRuneFirebolt	 				);
	CreateInvItem	( self, ItArRuneFireball	 				);
	CreateInvItem	( self, ItArRuneFirestorm		 			);
	CreateInvItem	( self, ItArRuneFireRain		 			);
	CreateInvItem	( self, ItArRuneTeleport1	 				);
	CreateInvItem	( self, ItArRuneTeleport2					);
	CreateInvItem	( self, ItArRuneTeleport3					);
	CreateInvItem	( self, ItArRuneTeleport5					);
	CreateInvItem	( self, ItArRuneHeal						);
	CreateInvItem	( self, ItArRuneChainLightning				);
	CreateInvItem	( self, ItArRuneThunderbolt					);
	CreateInvItem	( self, ItArRuneThunderball					);
	CreateInvItem	( self, ItArRuneIceCube						);
	CreateInvItem	( self, ItArRuneIceWave						);
	CreateInvItem	( self, ItArRuneDestroyUndead				);
	CreateInvItem	( self, ItArRuneWindfist					);
	CreateInvItem	( self, ItArRuneStormfist					);
	CreateInvItem	( self, ItArRuneTelekinesis					);
	CreateInvItem	( self, ItArRuneCharm						);
	CreateInvItem	( self, ItArRuneSleep						);
	CreateInvItem	( self, ItArRunePyrokinesis					);
	CreateInvItem	( self, ItArRuneControl						);

	CreateInvItem	( self, ItArScrollLight	 					);
	CreateInvItem	( self, ItArScrollFirebolt	 				);
	CreateInvItem	( self, ItArScrollFireball 					);
	CreateInvItem	( self, ItArScrollFirestorm	 				);
	CreateInvItem	( self, ItArScrollFireRain		 			);
	CreateInvItem	( self, ItArScrollTeleport1	 				);
	CreateInvItem	( self, ItArScrollTeleport2					);
	CreateInvItem	( self, ItArScrollTeleport3					);
	CreateInvItem	( self, ItArScrollTeleport4					);
	CreateInvItem	( self, ItArScrollTeleport5					);
	CreateInvItem	( self, ItArScrollHeal						);
	CreateInvItem	( self, ItArScrollTrfBloodfly				);
	CreateInvItem	( self, ItArScrollTrfCrawler				);
	CreateInvItem	( self, ItArScrollTrfLurker					);
	CreateInvItem	( self, ItArScrollTrfMeatbug				);
	CreateInvItem	( self, ItArScrollTrfMolerat				);
	CreateInvItem	( self, ItArScrollTrfOrcdog					);
	CreateInvItem	( self, ItArScrollTrfScavenger				);
	CreateInvItem	( self, ItArScrollTrfShadowbeast			);
	CreateInvItem	( self, ItArScrollTrfSnapper				);
	CreateInvItem	( self, ItArScrollTrfWaran					);
	CreateInvItem	( self, ItArScrollTrfWolf					);
	CreateInvItem	( self, ItArScrollChainLightning			);
	CreateInvItem	( self, ItArScrollThunderbolt				);
	CreateInvItem	( self, ItArScrollThunderball				);
	CreateInvItem	( self, ItArScrollIceCube					);
	CreateInvItem	( self, ItArScrollIceWave					);
	CreateInvItem	( self, ItArScrollSummonDemon				);
	CreateInvItem	( self, ItArScrollSummonSkeletons			);
	CreateInvItem	( self, ItArScrollSummonGolem				);
	CreateInvItem	( self, ItArScrollArmyOfDarkness			);
	CreateInvItem	( self, ItArScrollDestroyUndead				);
	CreateInvItem	( self, ItArScrollWindfist					);
	CreateInvItem	( self, ItArScrollStormfist					);
	CreateInvItem	( self, ItArScrollTelekinesis				);
	CreateInvItem	( self, ItArScrollCharm						);
	CreateInvItem	( self, ItArScrollSleep						);
	CreateInvItem	( self, ItArScrollPyrokinesis				);
	CreateInvItem	( self, ItArScrollControl					);
	CreateInvItem	( self, ItArScrollFear 						);
	CreateInvItem	( self, ItArScrollBerzerk					);
	CreateInvItem	( self, ItArScrollShrink					);
	
	//---------------------------------------------------------------- FOOD
	CreateInvItems	( self, ItFoApple 					, 10	);
	CreateInvItems	( self, ItFoCheese					, 10 	);
	CreateInvItems	( self, ItFoLoaf  					, 10	);
	CreateInvItems	( self, ItFoBeer  					, 10	);
	CreateInvItems	( self, ItFoWine  					, 10 	);
	                                              
	//---------------------------------------------------------------- DOCS
	CreateInvItem 	( self, ItWrLevelMap						);
	CreateInvItem 	( self, ItWrBookOfTales						);
	                                              
	//----------------------------------------------------------------	
	//------------------------------------------------------------- AI
	//----------------------------------------------------------------	

	//--------------------------------------- HABBITS
	Npc_SetPermAttitude	( self, ATT_HOSTILE );
	Npc_SetAttitude		( self, ATT_HOSTILE );
	
	START_AISTATE 	= 	ZS_TestEmpty;
//	DAILY_ROUTINE 	=	DailyRoute_Test_Empty;
	
	//-------------------------------------- MISSIONS
//	MISSION[0]	=	Mission_Test_Empty;
//	MISSION[1]	=	Mission_Test_Default;
};

//########################################################################
//##
//##			      FUNCTIONS
//##
//########################################################################

//########################################################################
//##
//##	FN: B_SetCutScenePerceptions
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY	
	//----------------------------------------------------------------	
/*func void B_SetCutScenePerceptions()
{ 
	PrintScreen( "B_SetCutScenePerceptions ...", -1, 50, "FONT_OLD_20_WHITE.TGA", 10 );
};
*/

//########################################################################
//##
//##			      ZUSTAENDE
//##
//########################################################################

//########################################################################
//##
//##	ZS: ZS_TestEmpty
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY	
	//----------------------------------------------------------------	
func void ZS_TestEmpty ()
{
//	Npc_PercEnable  ( self, PERC_ASSESSTALK	    , B_AssessTalk 		 );		
//	Npc_PercEnable  ( self, PERC_ASSESSGIVENITEM, ZS_AssessGivenItem );		
	Npc_PercEnable  ( self, PERC_ASSESSTALK	    , ZS_TestFinishMove	 );		
	
	//
	//	LOOK AT PLAYER
	//
	PrintScreen( "Looking at player ..."	, -1, 50, "FONT_OLD_20_WHITE.TGA", 2 );
	    
	AI_LookAtNpc( self, hero );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP	
	//----------------------------------------------------------------	
func void ZS_TestEmpty_Loop ()
{
//	AI_QuickLook( self, hero );
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT	
	//----------------------------------------------------------------	
func void ZS_TestEmpty_End ()
{
};
     
//########################################################################
//##
//##	ZS: ZS_TestSmoke
//##
//########################################################################
                                      
	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestSmoke()
{                 
	B_ChooseJoint		( self );
	AI_UseMob			( self,	"SMOKE", 1 );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestSmoke_Loop ()
{
	AI_Wait				( self,	1 );
	
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestSmoke_End ()
{
	AI_UseMob			( self,	"SMOKE",	 -1);						
	AI_UseItemToState	( self, ItMiJoint_1, -1); 
};

//########################################################################
//##
//##	ZS: ZS_TestGuild
//##
//########################################################################
                                      
var int m_nGuild;                                     
	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestGuild()
{                 
	if 		( m_nGuild == 0 	   )	{ m_nGuild = GIL_NONE; }
	else if ( m_nGuild == GIL_NONE )	{ m_nGuild = GIL_GRD ; }
	else if ( m_nGuild == GIL_GRD  )	{ m_nGuild = GIL_VLK ; }
	else if ( m_nGuild == GIL_VLK  )	{ m_nGuild = GIL_NONE; };
	
	Npc_SetTrueGuild( hero, m_nGuild );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestGuild_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestGuild_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestInfos
//##
//########################################################################
                                      
	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestInfos()
{                 
	AI_ProcessInfos( self );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestInfos_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestInfos_End ()
{
};

/* 
//########################################################################
//##
//##	ZS: ZS_TestTimedMDS
//##
//########################################################################
                                      
	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestTimedMDS ()
{                 
	PrintScreen( "Applying druken overlay for 5000 ticks ...", -1, -1, "FONT_OLD_20_WHITE.TGA", 3 );
	
	Mdl_ApplyOverlayMDSTimed( self, "HUMANS_DRUNKEN.MDS", 5000 );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestTimedMDS_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestTimedMDS_End ()
{
};
*/

//########################################################################
//##
//##	ZS: ZS_TestSpell
//##
//########################################################################
                                      
var int g_nMana;                                     

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestSpell ()
{          
	//
	//	ACTIVATE SPELL
	//           
	PrintScreen( "Increasing Mana ...", -1, 50, "FONT_OLD_20_WHITE.TGA", 3 );
	
	g_nMana = g_nMana + 1;
	
	if ( g_nMana > 50 )
	{
		g_nMana = 25;
	};
	
	if ( g_nMana < 25 )
	{
		g_nMana = 25;
	};
	
	//
	//	ACTIVATE SPELL
	//           
	if ( Npc_HasSpell( self, g_nSpell ) )
	{
		PrintScreen( "Readying spell ...", -1, 40, "FONT_OLD_20_WHITE.TGA", 3 );
		AI_ReadySpell( self, SPL_FIREBALL, g_nMana ); 
	};
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestSpell_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestSpell_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestMagic
//##
//########################################################################
                                      
var int g_nSpell;                                     

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestMagic ()
{            
	//
	//	ACTIVATE SPELL
	//           
	PrintScreen( "Unreadying spell ...", -1, 30, "FONT_OLD_20_WHITE.TGA", 3 );
	AI_UnreadySpell	( self );    
	
	if ( Npc_HasSpell( self, g_nSpell ) )
	{
		PrintScreen( "Readying spell ...", -1, 40, "FONT_OLD_20_WHITE.TGA", 3 );
		AI_ReadySpell( self, g_nSpell, 50 ); 
	}
	else
	{
		PrintScreen( "Spell unavailable ...", -1, 60, "FONT_OLD_20_WHITE.TGA", 3 );
	};

	//
	//	NEXT SPELL
	//	
	g_nSpell = g_nSpell + 1;

	if ( g_nSpell > SPL_DESTROYUNDEAD ) 
	{
		g_nSpell = SPL_LIGHT;
	};
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestMagic_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestMagic_End ()
{
};

/*
//########################################################################
//##
//##	ZS: ZS_TestDefend
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestDefend ()
{                       
	PrintScreen( "Readying weapon ...", -1, 30, "FONT_OLD_20_WHITE.TGA", 3 );

	AI_StandUp				( self );
	AI_EquipBestMeleeWeapon	( self );     
	AI_ReadyMeleeWeapon 	( self );    
	
	PrintScreen( "Defending self ...", -1, 40, "FONT_OLD_20_WHITE.TGA", 3 );
	AI_Defend			( self );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestDefend_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestDefend_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestDamage
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestDamage ()
{                       
	PrintScreen( "Got damage ...", -1, 30, "FONT_OLD_20_WHITE.TGA", 3 );            
	
	AI_StartState( self, ZS_TestDefend, 0, "  " );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestDamage_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestDamage_End ()
{
};
*/

//########################################################################
//##
//##	ZS: ZS_TestPatrol
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestPatrol ()
{                                       
	//
	//	MOVEMOB WAHRNEHMUNG ABFANGEN
	//
	Npc_PercEnable(	self, PERC_MOVEMOB, ZS_TestMoveMob  );
	
	//
	//	VOR DIE TUER TELEPORTIEREN
	//
//	AI_Teleport( self, "WP_RUNNER_8" );	
	
	//
	//	UND DURCHGEHEN
	//
	AI_GotoWP( self, "WP_OUT" );         
	AI_AlignToFP( self );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func void ZS_TestPatrol_Loop ()
{
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestPatrol_End ()
{
};
            
//########################################################################
//##
//##	ZS: ZS_TestMoveMob
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestMoveMob ()
{                      
	PrintScreen( "Stopping ...", -1, 30, "FONT_OLD_20_WHITE.TGA", 3 );
	
	//
	//	ANHALTEN
	//          
	Npc_ClearAIQueue( self );       
	AI_StandUp		( self );

};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func void ZS_TestMoveMob_Loop ()
{            
	//
	//	TUER OFFEN ?
	//
	if ( ! Npc_IsWayBlocked( self ) )
	{              
			
		PrintScreen( "Way is free now ...", -1, 40, "FONT_OLD_20_WHITE.TGA", 3 );
		
		//
		//	DANN MAL LOS
		//              
		AI_StartState( self, ZS_TestPatrol, 0, "  " );
	};
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestMoveMob_End ()
{
};

/*
//########################################################################
//##
//##	ZS: ZS_TestTeleport
//##
//########################################################################
                     
var int 	g_nWaypoint;
var string  g_strWaypoint;
                
	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestTeleport ()
{                         
	//
	//	STOP ANY ACTIVE WALK SEQUENCE
	//                          
	Npc_ClearAIQueue( self );
	    
	//
	//	CHOOSE NEXT WAYPOINT
	//
	g_nWaypoint = g_nWaypoint + 1; 
	if ( g_nWaypoint > 15 ) { g_nWaypoint = 0; };
	
	//
	//	COMPOSE WAYPOINT STRING
	//                         
	g_strWaypoint = "WP_INDOOR_";
	g_strWaypoint = ConcatStrings( g_strWaypoint, IntToString( g_nWaypoint ) );
	
	//
	//	GIVE SOME INFO
	//           
	var string strWaypoint;
	strWaypoint = "Beaming to Waypoint ";
	strWaypoint = ConcatStrings( strWaypoint, g_strWaypoint );
	strWaypoint = ConcatStrings( strWaypoint, " ..." );
	
	PrintScreen( strWaypoint, -1, -1, "FONT_OLD_20_WHITE.TGA", 3 );
	
	//
	//	ACTUALLY GO THERE
	//           
//	AI_GotoWP( self, g_strWaypoint );
	AI_Teleport( self, g_strWaypoint );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestTeleport_Loop ()
{        
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestTeleport_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestAttitude
//##
//########################################################################

	var string strMessage;
	
	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestAttitude ()
{
	var c_npc npcOther;
	npcOther = Hlp_GetNpc( Allround_Testmodell );

	strMessage = "";	
	strMessage = ConcatStrings( strMessage, self.name 		);
	strMessage = ConcatStrings( strMessage, " -> " 			);
	strMessage = ConcatStrings( strMessage, npcOther.name 	);
	strMessage = ConcatStrings( strMessage, " = " 			);

	var int nAttitude;
	nAttitude = Wld_GetGuildAttitude( self.guild, npcOther.guild );
	
	if 		( nAttitude == ATT_FRIENDLY ) 	{ ConcatStrings( strMessage, "FRIENDLY"	); }
	else if ( nAttitude == ATT_HOSTILE  ) 	{ ConcatStrings( strMessage, "HOSTILE"	); }
	else if ( nAttitude == ATT_NEUTRAL  ) 	{ ConcatStrings( strMessage, "NEUTRAL"	); }
	else if ( nAttitude == ATT_ANGRY  	) 	{ ConcatStrings( strMessage, "ANGRY"	); }
	else 									{ ConcatStrings( strMessage, "INVALID"	); };
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func void ZS_TestAttitude_Loop ()
{
	PrintScreen( strMessage, -1, -1, "FONT_OLD_20_WHITE.TGA", 1 );
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestAttitude_End ()
{
};
*/

//########################################################################
//##
//##	ZS: ZS_TestDraw
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestDraw()
{
	//
	//	ARM	RANGED WEAPON
	//
	PrintScreen( "Arming ranged weapon ...", -1, 50, "FONT_OLD_20_WHITE.TGA", 2 );

	AI_StandUp				( self );
	AI_EquipBestRangedWeapon( self );
	AI_ReadyRangedWeapon	( self );    
	
	//
	//	AIM AT PLAYER
	//
	PrintScreen( "Aiming at player ...", -1, 60, "FONT_OLD_20_WHITE.TGA", 2 );
	
	AI_AimAt( self, hero );	

	//
	//	... NEXT TIME SOMEONE TALKS TO ME, I WILL SHOOT ...
	//
	PrintScreen( "Next time I will shoot ...", -1, 70, "FONT_OLD_20_WHITE.TGA", 2 );
	
	Npc_PercEnable  ( self, PERC_ASSESSTALK, ZS_TestShoot );		
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func void ZS_TestDraw_Loop ()
{
	//	Waiting for shot
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestDraw_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestShoot
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestShoot()
{
	//
	//	SHOOT
	//
	PrintScreen( "Shooting at player ...", -1, 50, "FONT_OLD_20_WHITE.TGA", 2 );
	
	AI_ShootAt( self, hero );	
	
	//
	//	STAND UP
	//	
	PrintScreen( "Standing up ...", -1, 60, "FONT_OLD_20_WHITE.TGA", 2 );
	
	AI_StandUp	 ( self );
	
	//
	//	UNREADY WEAPON
	//
	PrintScreen( "Removing weapon ...", -1, 70, "FONT_OLD_20_WHITE.TGA", 2 );
	
	AI_RemoveWeapon( self );
	
	//
	//	RE-START ORIGINAL STATE
	//
	AI_StartState( self, ZS_TestEmpty, 0, "  " );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestShoot_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestShoot_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestFinishMove
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestFinishMove()
{
	//	INFO
	PrintScreen( "Arming weapon ...", -1, 20, "FONT_OLD_20_WHITE.TGA", 2 );

	//	ARM
	AI_StandUp				( self );
	AI_EquipBestMeleeWeapon	( self );
	AI_ReadyMeleeWeapon		( self );
	Npc_SetAttitude			( self, ATT_HOSTILE );
	
	//
	//	SET TARGET
	//
	Npc_SetTarget( self, hero );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func void ZS_TestFinishMove_Loop ()
{
	//
	// ATTACK
	//
	PrintScreen( "Attacking hero ...", -1, 25, "FONT_OLD_20_WHITE.TGA", 2 );
	
	AI_Attack( self );
	
	if ( Npc_IsInState( hero, ZS_UNCONSCIOUS ) )
	{
		//
		// FINISH MOVE		
		//
		PrintScreen( "Finishing hero ...", -1, 30, "FONT_OLD_20_WHITE.TGA", 2 );

		AI_FinishingMove( self, hero );
		
		//
		//	STAND UP 
		//
		AI_StandUp		( self );
		AI_RemoveWeapon	( self );
		Npc_SetAttitude	( self, ATT_NEUTRAL );
		
		//
		//	START FORMER STATE
		//
		AI_StartState	( self, ZS_TestEmpty, 0, "  " );		
	};
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestFinishMove_End ()
{
};
          
/*          
//########################################################################
//##
//##	ZS: ZS_TestUse
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestUse()
{
	//	SPIELER WAHRNEHMEN
	//	
	Npc_PerceiveAll( self )	;
	if ( ! Wld_DetectPlayer( self ) ) { return; };
	
	//
	//	GEH ZUM BETT
	//
	AI_GotoWP( self, "WP_INDOOR_14" ); 
	AI_UseMob( self, "BEDHIGH", 1 );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestUse_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestUse_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestTalk
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestTalk()
{
	//	SPIELER WAHRNEHMEN
	//	
	Npc_PerceiveAll( self )	;
	if ( ! Wld_DetectPlayer( self ) ) { return; };
	
	//
	//	LABER
	//
	AI_Output( self ,other,"Sit_1_OW_Diego_Gamestart_11_00"); //Ich bin Diego. Ich kümmere mich um die Neuen.                                                                                                                                                   
	AI_Output( other,self ,"Sit_1_OW_Diego_Gamestart_20_01"); //Wo sind all die anderen?                                                                                                                                                                        
	
	//
	//	SCREEN OUTPUT
	//

	//	X-CENTERED
	PrintScreen( "There is urest in the forest"	  	, -1, 10, "FONT_OLD_10_WHITE.TGA", 5 );
	PrintScreen( "There is trouble with the trees"	, -1, 15, "FONT_OLD_10_WHITE.TGA", 6 );
	PrintScreen( "For the maples want more sunlight", -1, 20, "FONT_OLD_10_WHITE.TGA", 7 );
	PrintScreen( "And the oaks ignore their please"	, -1, 25, "FONT_OLD_10_WHITE.TGA", 8 );
	
	//	Y-CENTERED
	PrintScreen( "10%", 10, -1, "FONT_OLD_10_WHITE.TGA", 5 );
	PrintScreen( "20%", 20, -1, "FONT_OLD_10_WHITE.TGA", 6 );
	PrintScreen( "30%", 30, -1, "FONT_OLD_10_WHITE.TGA", 7 );
	PrintScreen( "40%", 40, -1, "FONT_OLD_10_WHITE.TGA", 8 );
	PrintScreen( "50%", 50, -1, "FONT_OLD_10_WHITE.TGA", 9 );
	PrintScreen( "60%", 60, -1, "FONT_OLD_10_WHITE.TGA", 8 );
	PrintScreen( "70%", 70, -1, "FONT_OLD_10_WHITE.TGA", 7 );
	PrintScreen( "80%", 80, -1, "FONT_OLD_10_WHITE.TGA", 6 );
	PrintScreen( "90%", 90, -1, "FONT_OLD_10_WHITE.TGA", 5 );
	
	//	X/Y-CENTERED
	PrintScreen( "THE   TREES"	, -1, -1, "FONT_OLD_20_WHITE.TGA", 10 );
	
	//
	//	KOTZ-SCENE
	//
	AI_PlayCutscene( self, "GeneralG" );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestTalk_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestTalk_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestFlee
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestFlee ()
{
	//
	//	SPIELER WAHRNEHMEN
	//	
	Npc_PerceiveAll( self )	;
	if ( ! Wld_DetectPlayer( self ) ) { return; };
	
	//
	//	SPIELER IST GEGNER
	//
	Npc_SetTarget( self, other );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestFlee_Loop ()
{
	//
	//	VOR SPIELER FLUECHTEN
	//
	AI_Flee( self );
	
	return ( Npc_GetDistToNpc( self, other ) > 500 );
	
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestFlee_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestPlunder
//##
//########################################################################

func void MoveItem( var int nAmount, var int nSlot )
{
	//
	//	GIBT ES WAS ZU TRANSFERIEREN ?
	//
	if ( nAmount ) 
	{ 
		//
		//	LOKALE HILFS-VARIABLEN
		//
		var int 	nItem	 ;
		var string 	strAmount; 
	
		//
		//	ON-SCREEN FEEDBACK 
		//
		strAmount = ConcatStrings( "Weapon Slot ", IntToString( nSlot   ) );
		strAmount = ConcatStrings( strAmount	 , ": "					  );  
		strAmount = ConcatStrings( strAmount	 , IntToString( nAmount ) );  
		Print( strAmount ); 		
		
		//
		//	EIGENTLICHER TRANSFER
		//
		nItem = Hlp_GetInstanceID( item ); 
		Npc_RemoveInvItems( self , nItem, nAmount ); 
		//CreateInvItems	  ( other, nItem, nAmount );
	};
};

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestPlunder ()
{
	//
	//	SPIELER WAHRNEHMEN
	//	
	Npc_PerceiveAll( self )	;
	if ( ! Wld_DetectPlayer( self ) ) { return; };

	//
	//	SICH SELBST "DURCHSUCHEN"
	//	
	var int nSlot  ;

	nSlot = 1; 	MoveItem( Npc_GetInvItemBySlot( self, INV_WEAPON, nSlot ), nSlot );		
	nSlot = 2; 	MoveItem( Npc_GetInvItemBySlot( self, INV_WEAPON, nSlot ), nSlot );		
	nSlot = 3; 	MoveItem( Npc_GetInvItemBySlot( self, INV_WEAPON, nSlot ), nSlot );		
	nSlot = 4; 	MoveItem( Npc_GetInvItemBySlot( self, INV_WEAPON, nSlot ), nSlot );		
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func void ZS_TestPlunder_Loop ()
{
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestPlunder_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestGoto
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestGoto ()
{
	AI_GotoFP( self, "FP" );
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func void ZS_TestGoto_Loop ()
{
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestGoto_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestEatApple
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestEatApple ()
{
//	B_ChooseApple( self );

	self.aivar[AIV_ITEMSTATUS] = TA_IT_APPLE;
	
	if (!Npc_HasItems (self,ItFoApple))
	{
		//CreateInvItem (self,ItFoApple);
	};
	AI_UseItemToState	( self, ItFoApple,  0 );
	AI_UseItemToState	( self, ItFoApple,  1 );
	AI_UseItemToState	( self, ItFoApple,  2 );
	AI_UseItemToState	( self, ItFoApple,  3 );
	AI_UseItemToState	( self, ItFoApple,  4 );
	AI_UseItemToState	( self, ItFoApple,  5 );
	AI_UseItemToState	( self, ItFoApple, -1 );
	
	self.aivar[AIV_ITEMFREQ]=1;		
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestEatApple_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestEatApple_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestShootAt
//##
//########################################################################

var int nTargetShoot;

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestShootAt ()
{
	//
	//	SELECT ENEMY
	//
	var c_npc npcEnemy;
	
	if 	( nTargetShoot == 0 )
	{
	    Print( "Shooting @: ROCKEFELLER" );
	    npcEnemy = Hlp_GetNpc( PC_Rockefeller );
	}
	else if ( nTargetShoot == 1 )
	{
	    Print( "Shooting @: SLD1_Testmodell" );
	    npcEnemy = Hlp_GetNpc( SLD1_Testmodell );
	}
	else if ( nTargetShoot == 2 )
	{
	    Print( "Shooting @: Nobody" );
	};
	
	AI_ShootAt( self, npcEnemy );				
	AI_ShootAt( self, 0 );				
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestShootAt_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestShootAt_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestAimAt
//##
//########################################################################

var int nTargetAim;

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestAimAt ()
{
	//
	//	SELECT ENEMY
	//
	var c_npc npcEnemy;
	
	if 	( nTargetAim == 0 )
	{
	    Print( "Aiming @: ROCKEFELLER" );
	    npcEnemy = Hlp_GetNpc( PC_Rockefeller );
	    
	    nTargetAim 	 = 1;
	    nTargetShoot = 0;
	}
	else if ( nTargetAim == 1 )
	{
	    Print( "Aiming @: SLD1_Testmodell" );
	    npcEnemy = Hlp_GetNpc( SLD1_Testmodell );
	    
	    nTargetAim 	 = 2;	
	    nTargetShoot = 1;
	}
	else if ( nTargetAim == 2 )
	{
	    Print( "Aiming @: Nobody" );
	    
	    nTargetAim   = 0;	
	    nTargetShoot = 2;
	};
	
	//
	//	BEGIN AIMING AT ENEMY ... THIS IS AN OVERLAY ACTION !!!
	//				  IT WILL NOT STOP UNTIL EITHER:
	//				  A) TARGET IS LOST
	//				  B) AI_ShootAt() IS CALLED
	//				  C) AI_AimStop() IS CALLED
	//				  D) AI_AimAt()   IS CALLED again
	//
	
	AI_ReadyRangedWeapon( self );
//	AI_AimAt( self, npcEnemy );	
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestAimAt_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestAimAt_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestSwitchArmor
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestSwitchArmor ()
{
	//
	//	WHAT DO I WEAR ?
	//
	var c_item itArmor;
	itArmor = Npc_GetEquippedArmor	( self );
	
	//
	//	WE AIN'T GOIN' OUT LIKE THIS ...
	//
	if ( ! Hlp_IsValidItem( itArmor ) )	
	{
		AI_EquipArmor	( self, GRD_ARMOR_H	);			// put on guard's armor :-(
	};	
	if ( Hlp_GetInstanceID( itArmor ) == Hlp_GetInstanceID( GRD_ARMOR_H ) )	
	{
		AI_EquipArmor	( self, ItArRobeMithril );		// put on the legendary mithril robe :-)
	};
	if ( Hlp_GetInstanceID( itArmor ) == Hlp_GetInstanceID( ItArRobeMithril ) )	
	{
		AI_UnequipArmor	( self );						// i don't need that stuff	
	};
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestSwitchArmor_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestSwitchArmor_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestBestArmor
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestBestArmor ()
{
	AI_UnequipArmor		( self );				
	AI_EquipBestArmor	( self );				
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func int ZS_TestBestArmor_Loop ()
{
	return 1;
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestBestArmor_End ()
{
};

//########################################################################
//##
//##	ZS: ZS_TestObstacle
//##
//########################################################################

	//----------------------------------------------------------------	
	//---------------------------------------------------------- ENTRY
	//----------------------------------------------------------------	
func void ZS_TestObstacle ()
{
	Npc_PercEnable  ( self, PERC_ASSESSCALL	, ZS_TestObstacle_Call );		
	Npc_PercEnable  ( self, PERC_MOVENPC	, ZS_TestObstacle_Talk );		
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP
	//----------------------------------------------------------------	
func void ZS_TestObstacle_Loop ()
{
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT
	//----------------------------------------------------------------	
func void ZS_TestObstacle_End ()
{
};

	//////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////
	
	
		//----------------------------------------------------------------	
		//---------------------------------------------------------- ENTRY
		//----------------------------------------------------------------	
	func void ZS_TestObstacle_Call()
	{
		Print( "I AM BEING CALLED" );
		
		AI_SetWalkmode	( self, NPC_WALK );
		AI_GotoNpc	( self, other );
	};	
	
		//----------------------------------------------------------------	
		//----------------------------------------------------------- LOOP
		//----------------------------------------------------------------	
	func int ZS_TestObstacle_Call_Loop ()
	{
		return 1;
	};
	
		//----------------------------------------------------------------	
		//----------------------------------------------------------- EXIT
		//----------------------------------------------------------------	
	func void ZS_TestObstacle_Call_End ()
	{
	};
	
	//////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////
	
		//----------------------------------------------------------------	
		//---------------------------------------------------------- ENTRY
		//----------------------------------------------------------------	
	func void ZS_TestObstacle_Talk()
	{
		Print( "THERE'S AN OBSTACLE IN MY WAY" );

		AI_StandUp	( self );													 
	};	
	
		//----------------------------------------------------------------	
		//----------------------------------------------------------- LOOP
		//----------------------------------------------------------------	
	func int ZS_TestObstacle_Talk_Loop()
	{
		return 1;
	};
	
		//----------------------------------------------------------------	
		//----------------------------------------------------------- EXIT
		//----------------------------------------------------------------	
	func void ZS_TestObstacle_Talk_End()
	{
	};

*/

//########################################################################
//##
//##			    TAGESABLAEUFE
//##
//########################################################################

//########################################################################
//##
//##	ROUTE: DailyRoute_Test_Empty
//##
//########################################################################

func void DailyRoute_Test_Empty ()
{
};

//########################################################################
//##
//##			     MISSIONEN
//##
//########################################################################

//########################################################################
//##
//##	MISSION: Mission_Test_Empty
//##
//########################################################################

instance Mission_Test_Empty (C_MISSION)
{
	//----------------------------------------------------------------	
	//---------------------------------------------------- DESCRIPTION	
	//----------------------------------------------------------------	
	Name	 		= "Mission_Test_Empty";
	Description		= "Mission_Test_Empty";
	Important		= 1;

	//----------------------------------------------------------------	
	//----------------------------------------------------- CONDITIONS	
	//----------------------------------------------------------------	
	OfferConditions		= Mis_Con_Off_TE;
	SuccessConditions	= Mis_Con_Suc_TE;
	FailureConditions	= Mis_Con_Fai_TE;
	ObsoleteConditions	= Mis_Con_Obs_TE;
	
	//----------------------------------------------------------------	
	//---------------------------------------------------- ACTIVATIONS
	//----------------------------------------------------------------	
	Offer			= Mis_Off_TE;
	Success			= Mis_Suc_TE;
	Failure			= Mis_Fai_TE;
	Obsolete		= Mis_Obs_TE;
	
	//----------------------------------------------------------------	
	//--------------------------------------------------- RUNNING LOOP
	//----------------------------------------------------------------		
	Running			= Mis_Run_TE;
	
};

	//----------------------------------------------------------------	
	//----------------------------------------------------- CONDITIONS	
	//----------------------------------------------------------------	
	
func int Mis_Con_Off_TE()
{
	return 1;
};

func int Mis_Con_Suc_TE()
{
	return 1;
};

func int Mis_Con_Fai_TE()
{
	return 0;
};

func int Mis_Con_Obs_TE()
{
	return 0;
};

	//----------------------------------------------------------------	
	//---------------------------------------------------- ACTIVATIONS
	//----------------------------------------------------------------	

func void Mis_Off_TE()
{
	AI_AskText( self, NOFUNC, NOFUNC, "Yes", "No" );
//	Mis_SetStatus( Mission_Test_Empty, MIS_RUNNING );
};

func void Mis_Suc_TE()
{
	Print( "Empty Mission succeeded" );
//	Mis_SetStatus( Mission_Test_Empty, MIS_SUCCESS );
};

func void Mis_Fai_TE()
{
	Print( "Empty Mission failed" );
//	Mis_SetStatus( Mission_Test_Empty, MIS_FAILED );
};

func void Mis_Obs_TE()
{
	Print( "Empty Mission became obsolete" );
//	Mis_SetStatus( Mission_Test_Empty, MIS_FAILED );
};
	//----------------------------------------------------------------	
	//--------------------------------------------------- RUNNING LOOP
	//----------------------------------------------------------------		

func void Mis_Run_TE()
{
	Print( "Empty Mission is running" );
};

//########################################################################
//##
//##	MISSION: Mission_Test_Default
//##
//########################################################################

instance Mission_Test_Default (C_MISSION)
{
	//----------------------------------------------------------------	
	//---------------------------------------------------- DESCRIPTION	
	//----------------------------------------------------------------	
	Name	 		= "Mission_Test_Default";
	Description		= "Mission_Test_Default";
	Important		= 1;

	//----------------------------------------------------------------	
	//----------------------------------------------------- CONDITIONS	
	//----------------------------------------------------------------	
	OfferConditions		= Mis_Con_Off_TD;
	SuccessConditions	= Mis_Con_Suc_TD;
	FailureConditions	= Mis_Con_Fai_TD;
	ObsoleteConditions	= Mis_Con_Obs_TD;
	
	//----------------------------------------------------------------	
	//---------------------------------------------------- ACTIVATIONS
	//----------------------------------------------------------------	
	Offer			= Mis_Off_TD;
	Success			= Mis_Suc_TD;
	Failure			= Mis_Fai_TD;
	Obsolete		= Mis_Obs_TD;
	
	//----------------------------------------------------------------	
	//--------------------------------------------------- RUNNING LOOP
	//----------------------------------------------------------------		
	Running			= Mis_Run_TD;
	
};

	//----------------------------------------------------------------	
	//----------------------------------------------------- CONDITIONS	
	//----------------------------------------------------------------	
	
func int Mis_Con_Off_TD()
{
	return 1;
};

func int Mis_Con_Suc_TD()
{
	return 1;
};

func int Mis_Con_Fai_TD()
{
	return 0;
};

func int Mis_Con_Obs_TD()
{
	return 0;
};

	//----------------------------------------------------------------	
	//---------------------------------------------------- ACTIVATIONS
	//----------------------------------------------------------------	

func void Mis_Off_TD()
{
	AI_AskText( self, NOFUNC, NOFUNC, "Yep", "Nope" );
// 	Mis_SetStatus( Mission_Test_Default, MIS_RUNNING );
};

func void Mis_Suc_TD()
{
	Print( "Default Mission succeeded" );
//	Mis_SetStatus( Mission_Test_Default, MIS_SUCCESS );
};

func void Mis_Fai_TD()
{
	Print( "Default Mission failed" );
//	Mis_SetStatus( Mission_Test_Default, MIS_FAILED );
};

func void Mis_Obs_TD()
{
	Print( "Default Mission became obsolete" );
//	Mis_SetStatus( Mission_Test_Default, MIS_FAILED );
};
	//----------------------------------------------------------------	
	//--------------------------------------------------- RUNNING LOOP
	//----------------------------------------------------------------		

func void Mis_Run_TD()
{
	Print( "Default Mission is running" );
};

//########################################################################
//##
//##	TRADE: Trade_Test
//##
//########################################################################

INSTANCE Trade_Test (C_ITEMREACT)
{
	npc				= Allround_Testmodell;
	trade_item		= ItFoApple;
	trade_amount	= 10;		
	requested_item	= ItFoBeer;	
	requested_amount= 2;		
	reaction		= Trade_Test_Check;
};

FUNC INT Trade_Test_Check ()
{   
	var string strTradeAmount;
	strTradeAmount = "Trade amount : ";
	strTradeAmount = ConcatStrings( strTradeAmount, IntToString( Trade_Test.trade_amount ) );
	
	var string strTradeItem;
	strTradeItem = "Trade item : ";
	strTradeItem = ConcatStrings( strTradeItem, IntToString( Trade_Test.trade_item ) );
	
	var string strRequestedAmount;
	strRequestedAmount = "Requested amount : ";
	strRequestedAmount = ConcatStrings( strRequestedAmount, IntToString( Trade_Test.requested_amount ) );
    
	var string strRequestedItem;
	strRequestedItem = "Requested item : ";
	strRequestedItem = ConcatStrings( strRequestedItem, IntToString( Trade_Test.requested_item ) );
	
	PrintScreen( strTradeAmount		, 10, 20, "FONT_OLD_20_WHITE.TGA", 3 );
	PrintScreen( strTradeItem		, 10, 30, "FONT_OLD_20_WHITE.TGA", 3 );
	PrintScreen( strRequestedAmount	, 10, 40, "FONT_OLD_20_WHITE.TGA", 3 );
	PrintScreen( strRequestedItem	, 10, 50, "FONT_OLD_20_WHITE.TGA", 3 );
	
	if ( Trade_Test.requested_amount == 2 ) {	return 1; 	};
	
	return 0; 
};

//########################################################################
//##
//##	INFO: Info_Test_Trade
//##
//########################################################################
                  
INSTANCE Info_Test_Trade (C_INFO)
{
	npc			= Allround_Testmodell;
	nr			= 666;
	condition	= Info_Test_Trade_Success;
	information	= Info_Test_Trade_Procedure;
	important	= 0;	
	description = "Allrounder's Trade"; 
	trade		= 1;
};                       

FUNC INT Info_Test_Trade_Success()
{
	return 1;
};

FUNC VOID Info_Test_Trade_Procedure()
{
	PrintScreen( "Info_Test_Trade_Procedure()", -1, 50, "FONT_OLD_20_WHITE.TGA", 10 );                            
};

//########################################################################
//##
//##	INFO: Info_Test_Trade_Permanent
//##
//########################################################################
                  
INSTANCE Info_Test_Trade_Permanent (C_INFO)
{
	npc			= Allround_Testmodell;
	nr			= 666;
	condition	= Info_Test_Trade_Permanent_Success;
	information	= Info_Test_Trade_Permanent_Procedure;
	important	= 0;	
	description = "Allrounder's Permanent Trade"; 
	permanent	= 1;
	trade		= 1;
};                       

FUNC INT Info_Test_Trade_Permanent_Success()
{
	return 1;
};

FUNC VOID Info_Test_Trade_Permanent_Procedure()
{
	PrintScreen( "Info_Test_Trade_Permanent_Procedure()", -1, 50, "FONT_OLD_20_WHITE.TGA", 10 );                            
};

//########################################################################
//##
//##	INFO: Info_Test_Permanent
//##
//########################################################################
                  
INSTANCE Info_Test_Permanent (C_INFO)
{
	npc			= Allround_Testmodell;
	nr			= 666;
	condition	= Info_Test_Permanent_Success;
	information	= Info_Test_Permanent_Procedure;
	important	= 0;	
	permanent	= 1;
	description = "Allrounder's Permanent Info"; 
};                       

FUNC INT Info_Test_Permanent_Success()
{
	return 1;
};

FUNC VOID Info_Test_Permanent_Procedure()
{
	PrintScreen( "Info_Test_Permanent_Procedure()", -1, 50, "FONT_OLD_20_WHITE.TGA", 10 );                            
};
	
//########################################################################
//##
//##	INFO: Info_Test_Important
//##
//########################################################################
                  
INSTANCE Info_Test_Important (C_INFO)
{
	npc			= Allround_Testmodell;
	nr			= 666;
	condition	= Info_Test_Important_Success;
	information	= Info_Test_Important_Procedure;
	important	= 1;	
	permanent	= 0;
	description = "Allrounder's Important Info"; 
};                       

FUNC INT Info_Test_Important_Success()
{
	return 1;
};

FUNC VOID Info_Test_Important_Procedure()
{
	PrintScreen( "Info_Test_Important_Procedure()", -1, 50, "FONT_OLD_20_WHITE.TGA", 10 );                            
};

//########################################################################
//##
//##	INFO: Info_Test_Important_Permanent
//##
//########################################################################
                  
INSTANCE Info_Test_Important_Permanent (C_INFO)
{
	npc			= Allround_Testmodell;
	nr			= 666;
	condition	= Info_Test_Important_Permanent_Success;
	information	= Info_Test_Important_Permanent_Procedure;
	important	= 1;	
	permanent	= 1;
	description = "Allrounder's Important Permanent Info"; 
};                       

FUNC INT Info_Test_Important_Permanent_Success()
{
	return 1;
};

FUNC VOID Info_Test_Important_Permanent_Procedure()
{
	PrintScreen( "Info_Test_Important_Permanent_Procedure()", -1, 50, "FONT_OLD_20_WHITE.TGA", 10 );                            
};

//########################################################################
//##
//##	INFO: Info_Test_Normal
//##
//########################################################################
                  
INSTANCE Info_Test_Normal (C_INFO)
{
	npc			= Allround_Testmodell;
	nr			= 666;
	condition	= Info_Test_Success_Normal;
	information	= Info_Test_Procedure_Normal;
	important	= 0;	
	description = "Allrounder's Normal Info";
};                       

FUNC INT Info_Test_Success_Normal()
{
	return 1;
};

FUNC VOID Info_Test_Procedure_Normal()
{
	PrintScreen( "Info_Test_Procedure_Normal()", -1, 50, "FONT_OLD_20_WHITE.TGA", 10 );                            
};

//########################################################################
//##
//##	INFO: Info_Test_Choice
//##
//########################################################################
                  
INSTANCE Info_Test_Choice (C_INFO)
{
	npc			= Allround_Testmodell;
	nr			= 666;
	condition	= Info_Test_Success_Choice;
	information	= Info_Test_Procedure_Choice;
	important	= 0;	
	permanent	= 0;
	description = "Allrounder's Choice Info";
};                       

FUNC INT Info_Test_Success_Choice()
{
	return 1;
};

FUNC VOID Info_Test_Procedure_Choice()
{
	PrintScreen( "Info_Test_Procedure_Choice()", -1, 50, "FONT_OLD_20_WHITE.TGA", 10 );                            
	
	Info_ClearChoices	( Info_Test_Choice );
	Info_AddChoice		( Info_Test_Choice, "Yes"		, Info_Test_Procedure_Choice_Yes 	);
	Info_AddChoice		( Info_Test_Choice, "No"		, Info_Test_Procedure_Choice_No 	);
	Info_AddChoice		( Info_Test_Choice, "Don't know", Info_Test_Procedure_Choice_Unsure );	
	Info_AddChoice		( Info_Test_Choice, "Exit"		, Info_Test_Procedure_Choice_Exit	);	
};

FUNC VOID Info_Test_Procedure_Choice_Yes()
{
	Info_ClearChoices	( Info_Test_Choice );
};

FUNC VOID Info_Test_Procedure_Choice_No()
{
	Info_ClearChoices	( Info_Test_Choice );
};                                     

FUNC VOID Info_Test_Procedure_Choice_Unsure()
{
	Info_ClearChoices	( Info_Test_Choice );
	Info_AddChoice		( Info_Test_Choice, "Yes"		, Info_Test_Procedure_Choice_Yes 	);
	Info_AddChoice		( Info_Test_Choice, "No"		, Info_Test_Procedure_Choice_No 	);
	Info_AddChoice		( Info_Test_Choice, "Exit"		, Info_Test_Procedure_Choice_Exit	);	
};

FUNC VOID Info_Test_Procedure_Choice_Exit()
{
	Info_ClearChoices	( Info_Test_Choice );
};

//########################################################################
//##
//##	INFO: Info_Test_Permanent_Choice
//##
//########################################################################
                  
INSTANCE Info_Test_Permanent_Choice (C_INFO)
{
	npc			= Allround_Testmodell;
	nr			= 666;
	condition	= Info_Test_Success_Permanent_Choice;
	information	= Info_Test_Procedure_Permanent_Choice;
	important	= 0;	
	permanent	= 1;
	description = "Allrounder's Permanent Choice Info";
};                       

FUNC INT Info_Test_Success_Permanent_Choice()
{
	return 1;
};

FUNC VOID Info_Test_Procedure_Permanent_Choice()
{
	PrintScreen( "Info_Test_Procedure_Permanent_Choice()", -1, 50, "FONT_OLD_20_WHITE.TGA", 10 );                            
	
	Info_ClearChoices	( Info_Test_Permanent_Choice );
	Info_AddChoice		( Info_Test_Permanent_Choice, "Ok"			, Info_Test_Procedure_Permanent_Choice_Yes 		);
	Info_AddChoice		( Info_Test_Permanent_Choice, "Fuck you"	, Info_Test_Procedure_Permanent_Choice_No 		);
	Info_AddChoice		( Info_Test_Permanent_Choice, "Hmm..."		, Info_Test_Procedure_Permanent_Choice_Unsure 	);	
	Info_AddChoice		( Info_Test_Permanent_Choice, "(Leave)"		, Info_Test_Procedure_Permanent_Choice_Exit		);	
};

FUNC VOID Info_Test_Procedure_Permanent_Choice_Yes()
{
	Info_ClearChoices	( Info_Test_Permanent_Choice );
};

FUNC VOID Info_Test_Procedure_Permanent_Choice_No()
{
	Info_ClearChoices	( Info_Test_Permanent_Choice );
};                                     

FUNC VOID Info_Test_Procedure_Permanent_Choice_Unsure()
{
};

FUNC VOID Info_Test_Procedure_Permanent_Choice_Exit()
{
	Info_ClearChoices	( Info_Test_Permanent_Choice );
	AI_StopProcessInfos	( self );
};

//########################################################################
//##
//##	INFO: Info_Test_Permanent_Important_Choice
//##
//########################################################################
                  
INSTANCE Info_Test_Permanent_Important_Choice (C_INFO)
{
	npc			= Allround_Testmodell;
	nr			= 666;
	condition	= Info_Test_Success_Permanent_Important_Choice;
	information	= Info_Test_Procedure_Permanent_Important_Choice;
	important	= 1;	
	permanent	= 1;
	description = "Allrounder's Permanent Important Choice Info";
};                       

func INT Info_Test_Success_Permanent_Important_Choice()
{
	return 1;
};

FUNC VOID Info_Test_Procedure_Permanent_Important_Choice()
{
	PrintScreen( "Info_Test_Procedure_Permanent_Important_Choice()", -1, 50, "FONT_OLD_20_WHITE.TGA", 10 );                            
	
	Info_ClearChoices	( Info_Test_Permanent_Important_Choice );
	Info_AddChoice		( Info_Test_Permanent_Important_Choice, "Yes"			, Info_Test_Procedure_Permanent_Important_Choice_Yes 		);
	Info_AddChoice		( Info_Test_Permanent_Important_Choice, "No"			, Info_Test_Procedure_Permanent_Important_Choice_No 		);
	Info_AddChoice		( Info_Test_Permanent_Important_Choice, "Don't know"	, Info_Test_Procedure_Permanent_Important_Choice_Unsure 	);	
	Info_AddChoice		( Info_Test_Permanent_Important_Choice, "Bye"			, Info_Test_Procedure_Permanent_Important_Choice_Exit		);	
};

FUNC VOID Info_Test_Procedure_Permanent_Important_Choice_Yes()
{
	Info_ClearChoices	( Info_Test_Permanent_Important_Choice );
};

FUNC VOID Info_Test_Procedure_Permanent_Important_Choice_No()
{
	Info_ClearChoices	( Info_Test_Permanent_Important_Choice );
};                                     

FUNC VOID Info_Test_Procedure_Permanent_Important_Choice_Unsure()
{
};

FUNC VOID Info_Test_Procedure_Permanent_Important_Choice_Exit()
{
	Info_ClearChoices	( Info_Test_Permanent_Important_Choice );
	AI_StopProcessInfos	( self );
};
