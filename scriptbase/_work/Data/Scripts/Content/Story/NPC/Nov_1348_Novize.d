instance NOV_1348_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_NOV;
	level 		=		3;
	
	voice 		=		5;
	id 			=		1348;
		
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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 26,  4, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1348;
};

FUNC VOID Rtn_start_1348 ()
{
	TA_Smalltalk	(08,00,23,00,"PSI_TEMPLE_STAIRS_3");
	TA_Smalltalk	(23,00,08,00,"PSI_TEMPLE_STAIRS_3");
};

FUNC VOID Rtn_Ritual_1348 ()
{
	TA_Meditate	(00,00,08,00,"PSI_TEMPLE_NOVIZE_PR");
    TA_Meditate	(08,00,24,00,"PSI_TEMPLE_NOVIZE_PR");	
};