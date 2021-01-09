instance NOV_1320_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_NOV;
	level 		=		3;
	
	voice 		=		3;
	id 			=		1320;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 26 ,  2, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1320;
};

FUNC VOID Rtn_start_1320 ()
{
	TA_Smalltalk (07,05,23,05,"PSI_PATH_TEMPLE_4");
	TA_Sleep	 (23,05,07,05,"PSI_11_HUT_IN");
};

FUNC VOID Rtn_Ritual_1320 ()
{
	TA_Stay	(00,00,08,00,"PSI_TEMPLE_COURT_3");
    TA_Stay	(08,00,00,00,"PSI_TEMPLE_COURT_3");	
};
