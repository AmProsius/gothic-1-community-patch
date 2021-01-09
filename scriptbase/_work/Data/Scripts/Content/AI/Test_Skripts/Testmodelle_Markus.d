/**********************************************************
* Overlay Testmodell									  
**********************************************************/  
instance PC_Mini (C_NPC)
{   
	//-------- primary data --------
	
	name =							"Mini";
	guild =							GIL_NONE;      
	level =							10;
	voice =							11;//4
	id =							3001;
	


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		10;
	attribute[ATR_MANA] =			10;
	attribute[ATR_HITPOINTS_MAX] =	18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						body mesh     ,		bdytex,	skin,	head mesh     ,		headtex,	teethtex,	ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",	3,		1,		"Hum_Head_Pony", 	77,  		DEFAULT,	-1);
	
	//-------- inventory --------                                    
	//Npc_LearnTalent		( self, TAL_SNEAK);
		
	// FAI
	
	fight_tactic = FAI_HUMAN_COWARD;
	
	//-------------Daily Routine-------------
//	daily_routine = Rtn_start_3001;
};

instance OverlayTestmodell (C_NPC)
{   
	//-------- primary data --------
	
	name =							"ATestmodell";
	guild =							GIL_BAU;      
	level =							10;
	voice =							11;//4
	id =							3001;
	


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =		18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT,  DEFAULT,-1);
	
	Mdl_ApplyOverlayMds (self,"Humans_1hST1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_1hST2.mds");
	
	Mdl_ApplyOverlayMds (self,"Humans_2hST1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_2hST2.mds");
	
	Mdl_ApplyOverlayMds (self,"Humans_BowT1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_BowT2.mds");

	Mdl_ApplyOverlayMds (self,"Humans_CBowT1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_CBowT2.mds");

	Mdl_ApplyOverlayMds (self,"Humans_Acrobatic.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Arrogance.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Tired.mds");

	Mdl_ApplyOverlayMds (self,"Humans_drunken.mds");

	Mdl_ApplyOverlayMds (self,"Humans_Swim.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Sprint.mds");

	B_Scale (self);
	
	
	//-------- inventory --------                                    

		
	// FAI
	
	fight_tactic = FAI_HUMAN_COWARD;
	
	//-------------Daily Routine-------------
//	daily_routine = Rtn_start_3001;
};

/**********************************************************
* Bade Babe
**********************************************************/  
instance Bathbabe (C_NPC)
{
	//-------- primary data -----n
	name =					"Badenixe";
	guild =					GIL_EBR;      
	level =					3;
	voice =					11;//18;// Babe 1;
	id =					3009;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		7;
	attribute[ATR_DEXTERITY] =		11;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =		13;
	attribute[ATR_HITPOINTS] =		13;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"BABE.MDS");
	//						body mesh     ,		bdytex,	skin,	head mesh     ,		headtex,	teethtex,	ruestung	
	Mdl_SetVisualBody (self,"Bab_body_Naked0",	DEFAULT, 	1 ,	"Bab_Head_Hair1", 	3 ,  		DEFAULT, 	-1);
	
	//-------- inventory --------                                    
	//CreateInvItems(self, ItFoWine, 4);
	//CreateInvItem (self, ItMiBrush);

	//-------------Daily Routine-------------
	start_aistate	=	ZS_Bathing_Babe;

};


