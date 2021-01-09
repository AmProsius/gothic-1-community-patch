// Fonttestbuch für Französische und was weiß ich für Zeichen!

INSTANCE Fonttestbook(C_Item)
{	
	name 					=	"zeichenglumpsche_ascii";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseFonttestbook;
};



	FUNC VOID UseFonttestbook()
	{   
		var int nDocID;
		
		nDocID =
		Doc_Create		()			  ;							// DocManager 
		Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
		Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 		); 
		Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0		);
				
		//1.Seite
		Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
		Doc_SetFont 	( nDocID,  0, "font_10_book.tga"); 	// -1 -> all pages
		Doc_PrintLine	( nDocID,  0, "aáàâAÁÀÂ");
		Doc_SetFont 	( nDocID,  0, "font_15_book.tga"); 	// -1 -> all pages 
		Doc_PrintLine	( nDocID,  0, "aáàâAÁÀÂ");
		Doc_SetFont 	( nDocID,  0, "font_15_white.tga"); 	// -1 -> all pages 
		Doc_PrintLine	( nDocID,  0, "aáàâAÁÀÂ");
		Doc_SetFont 	( nDocID,  0, "font_default.tga"); 	// -1 -> all pages 
		Doc_PrintLine	( nDocID,  0, "aáàâAÁÀÂ");
		Doc_SetFont 	( nDocID,  0, "font_old_10_white.tga"); 	// -1 -> all pages 
		Doc_PrintLine	( nDocID,  0, "aáàâAÁÀÂ");
		Doc_SetFont 	( nDocID,  0, "font_old_20_white.tga"); 	// -1 -> all pages 
		Doc_PrintLine	( nDocID,  0, "aáàâAÁÀÂ");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
		Doc_SetFont 	( nDocID,  1, "font_10_book.tga"); 	// -1 -> all pages 
		Doc_PrintLine	( nDocID,  1, "ÝÞßàáâ");
		Doc_PrintLine	( nDocID,  1, "ãäåæçè");
		Doc_PrintLine	( nDocID,  1, "éêëìíî");
		Doc_PrintLine	( nDocID,  1, "ïðñòóô");
		Doc_PrintLine	( nDocID,  1, "õö÷øùú");
		Doc_PrintLine	( nDocID,  1, "ûüýþÿ");

		Doc_Show		( nDocID );
		
		};

//Savegame Bugfixbooks   ****Björn****


INSTANCE Lukor_Bugfixbook(C_Item)
{	
	name 					=	"Zwinge Baal Lukor in den Followmode";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseLukor_Bugfixbook;
};

	FUNC VOID UseLukor_Bugfixbook()
	{   
		var int nDocID;
		
		nDocID =
		Doc_Create		()			  ;							// DocManager 
		Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
		Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 		); 
		Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0		);
		Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 
		
		//1.Seite
		Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
		Doc_PrintLine	( nDocID,  0, "Zwinge Baal Lukor");
		Doc_PrintLine	( nDocID,  0, "in den Followmode");
		Doc_PrintLines	( nDocID,  0, "");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "");
		Doc_PrintLine	( nDocID,  0, "");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLines	( nDocID,  1, "");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLines	( nDocID,  1, "");

		Doc_Show		( nDocID );
		
		var C_NPC bugfix_baallukor; bugfix_baallukor = Hlp_GetNpc(GUR_1211_BaalLukor);
		Npc_ExchangeRoutine	(bugfix_baallukor, "Follow");
		Npc_RemoveInvItem (hero, Lukor_Bugfixbook);
		Wld_RemoveItem(Lukor_Bugfixbook);
	};
INSTANCE Lester_Bugfixbook(C_Item)
{	
	name 					=	"Schicke Lester nach Hause";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseLester_Bugfixbook;
};



	FUNC VOID UseLester_Bugfixbook()
	{   
		var int nDocID;
		
		nDocID =
		Doc_Create		()			  ;							// DocManager 
		Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
		Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 		); 
		Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0		);
		Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 
		
		//1.Seite
		Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
		Doc_PrintLine	( nDocID,  0, "Zwinge Baal Lukor");
		Doc_PrintLine	( nDocID,  0, "in den Followmode");
		Doc_PrintLines	( nDocID,  0, "");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "");
		Doc_PrintLine	( nDocID,  0, "");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLines	( nDocID,  1, "");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLines	( nDocID,  1, "");

		Doc_Show		( nDocID );
		
		var C_NPC bugfix_lester; bugfix_lester = Hlp_GetNpc(PC_PSIONIC);
		Npc_ExchangeRoutine	(bugfix_lester, "start");
		Npc_RemoveInvItem (hero, Lester_Bugfixbook);
		Wld_RemoveItem(Lester_Bugfixbook);
	};
/*
FUNC VOID STARTUP_freeminecamp_37 ()
{
B_InitMonsterAttitudes ();//zum Monster initialisieren

Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);

//----------------------Soeldner-------------------------------

Wld_InsertNpc				( SLD_750_Soeldner, "FMC_ENTRANCE" );//Palisadenwache
Wld_InsertNpc				( SLD_751_Soeldner, "FMC_ENTRANCE" );//Guard (am Eingang)	(evtl Pers)
Wld_InsertNpc				( SLD_752_Soeldner, "FMC_ENTRANCE" );//PalisadenWache
Wld_InsertNpc				( SLD_753_Baloro, "FMC_ENTRANCE" );//PalisadenWache
Wld_InsertNpc				( SLD_754_Soeldner, "FMC_ENTRANCE" );//Guard	(am Eingang)	(evtl Pers)

//Wld_InsertNpc				( SLD_755_Soeldner, "FMC_ENTRANCE" );//GuardPalisade
Wld_InsertNpc				( SLD_756_Soeldner, "FMC_ENTRANCE" );//Guard
//Wld_InsertNpc				( SLD_757_Soeldner, "FMC_ENTRANCE" );//GuardPalisade
//Wld_InsertNpc				( SLD_758_Soeldner, "FMC_ENTRANCE" );//GuardPalisade
Wld_InsertNpc				( SLD_759_Soeldner, "FMC_ENTRANCE" );//Guard(Tür zum Drehradhaus)		(evtl Pers)

Wld_InsertNpc				( SLD_760_Soeldner, "FMC_ENTRANCE" );//Guard(Tür zum Drehradhaus)		(evtl Pers)
Wld_InsertNpc				( SLD_761_Soeldner, "FMC_ENTRANCE" );//Guard(Mineneingang)			(gleiche wie Tor zum OCC)
Wld_InsertNpc				( SLD_762_Soeldner, "FMC_ENTRANCE" );//Guard(Mineneingang				(gleiche wie Tor zum OCC)
Wld_InsertNpc				( SLD_763_Soeldner, "FMC_ENTRANCE" );//Guard
Wld_InsertNpc				( SLD_764_Soeldner, "FMC_ENTRANCE" );//Guard

Wld_InsertNpc				( SLD_765_Soeldner, "FMC_ENTRANCE" );//Guard

//-----------------------Schuerfer-------------------------------


Wld_InsertNpc				( SFB_1030_Schuerfer, "FMC_ENTRANCE" );//Pickore
Wld_InsertNpc				( SFB_1031_Schuerfer, "FMC_ENTRANCE" );//PickOre
Wld_InsertNpc				( SFB_1032_Schuerfer, "FMC_ENTRANCE" );//Pickore
Wld_InsertNpc				( SFB_1033_Schuerfer, "FMC_ENTRANCE" );//Pickore
Wld_InsertNpc				( SFB_1034_Schuerfer, "FMC_ENTRANCE" );//Pickore

Wld_InsertNpc				( SFB_1035_Schuerfer, "FMC_ENTRANCE" );//Pickore
Wld_InsertNpc				( SFB_1036_Schuerfer, "FMC_ENTRANCE" );//Pickore
Wld_InsertNpc				( SFB_1037_Swiney, "FMC_ENTRANCE" );//PickOre
Wld_InsertNpc				( SFB_1038_Schuerfer, "FMC_ENTRANCE" );//PickOre
Wld_InsertNpc				( SFB_1039_Schuerfer, "FMC_ENTRANCE" );//PickOre

Wld_InsertNpc				( SFB_1040_Schuerfer, "FMC_ENTRANCE" );//SitAround
Wld_InsertNpc				( SFB_1041_Schuerfer, "FMC_ENTRANCE" );//SitAround
Wld_InsertNpc				( SFB_1042_Schuerfer, "FMC_ENTRANCE" );//StandAround
Wld_InsertNpc				( SFB_1043_Schuerfer, "FMC_ENTRANCE" );//StandAround
Wld_InsertNpc				( SFB_1044_Schuerfer, "FMC_ENTRANCE" );//StandAround

//Wld_InsertNpc				( SFB_1045_Schuerfer, "FMC_ENTRANCE" );//noch frei

//--------------------------Organisatoren--------------------------

Wld_InsertNpc				( ORG_890_Organisator, "FMC_ENTRANCE" );//SitAround
Wld_InsertNpc				( ORG_891_Organisator, "FMC_ENTRANCE" );//SitAround
Wld_InsertNpc				( ORG_892_Organisator, "FMC_ENTRANCE" );//StandAround
//Wld_InsertNpc				( ORG_893_Organisator, "FMC_ENTRANCE" );//noch frei
//Wld_InsertNpc				( ORG_894_Organisator, "FMC_ENTRANCE" );//Noch frei

//Wld_InsertNpc				( ORG_895_Organisator, "FMC_ENTRANCE" );//noch frei



};
*/
instance STT_Test_Schatten (Npc_TestDefault)
{
	//-------- primary data --------
	name 		=	"Testschatten";
	
	guild			=	GIL_STT;
	level 		=	13;
	
	voice		=	12;
	
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	196;
	attribute[ATR_HITPOINTS] 		=	196;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 55,  1, STT_ARMOR_M);
        
        B_Scale (self);
        Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill( self, NPC_TALENT_1H,2 );			
	Npc_SetTalentSkill		(self,NPC_TALENT_SNEAK,	1);			
	Npc_SetTalentSkill		(self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 		
	Npc_SetTalentSkill		(self,NPC_TALENT_PICKLOCK,	1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 		
	Npc_SetTalentSkill(self, NPC_TALENT_BOW,1);	
	//-------- inventory --------
	
	CreateInvItem	(self, ItMw_1H_Sword_01 );
	CreateInvItem	(self, ItRw_Bow_Small_02 );
	CreateInvItems	(self, ItAmArrow, 10);
	CreateInvItems	(self, ItFo_Potion_Water_01,4);
	CreateInvItems	(self, ItFoApple,5);
	CreateInvItems	(self, ItFoBeer, 3);
	CreateInvItems  (self, ItFo_Potion_Health_01,4); 
	
	//-------------Daily Routine-------------
	start_aistate =  ZS_TestHangAround;
};

instance GRD_Test_Gardist (Npc_TestDefault)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	7;
	
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 15;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	CreateInvItem	(self, ItMw_1H_Sword_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);		        
	
	//-------------Daily Routine-------------
	start_aistate =  ZS_TestHangAround;
};

instance VLK_Test_Buddler (Npc_TestDefault)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							2;
	
	
	voice =							1;
	


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,0,"Hum_Head_FatBald", 0,  1, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	////Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	CreateInvItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);

	//-------------Daily Routine-------------
	start_aistate =  ZS_TestHangAround;
};

instance SLD_Test_Soeldner (Npc_TestDefault)
{
	//-------- primary data --------
	
	name 		=	NAME_Soeldner;
	npctype		= 	npctype_guard;
	guild 		=	GIL_SLD;
	level 		=	10;
	voice 		=	7;
	
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 15;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, SLD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	CreateInvItem	(self, ItMw_1H_Sword_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);		        
	
	//-------------Daily Routine-------------
	start_aistate =  ZS_Guard;
};

instance SFB_Test_Schuerfer (Npc_TestDefault)
{
	//-------- primary data --------
	
	name =							Name_Schuerfer;
	npctype =						npctype_ambient;
	guild =							GIL_SFB;      
	level =							2;
	
	
	voice =							1;
	


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,0,"Hum_Head_FatBald", 0,  1, SFB_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	////Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	CreateInvItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);

	//-------------Daily Routine-------------
	start_aistate =  ZS_PickOre;
};



