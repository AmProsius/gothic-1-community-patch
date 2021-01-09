instance NOV_1358_Harlok (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Harlok";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_NONE;
	level 		=		3;
	 	
	voice 		=		1;
	id 			=		1358;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	7;
	attribute[ATR_MANA] 			=	7;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 28,  1, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_1358;
};

FUNC VOID Rtn_PreStart_1358 ()
{
	TA_Smoke	(08,00,20,00,"PSI_31_HUT_EX");
    TA_Smoke	(20,00,08,00,"PSI_31_HUT_EX");
};

FUNC VOID Rtn_Start_1358 ()
{
	TA_HerbAlchemy 	(06,55,23,55,"PSI_HERB_PLACE_1");
	TA_HerbAlchemy 	(23,55,06,55,"PSI_HERB_PLACE_1");
};