instance NOV_1353_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_NOV;
	level 		=		3;
	flags 		=		0;
	
	voice 		=		3;
	id 			=		1353;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Psionic", 34,  1, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1353;
};

FUNC VOID Rtn_start_1353 ()
{
	TA_Sleep 	(23,00,07,30,"PSI_25_HUT_IN");
    TA_Listen	(07,30,23,00,"PSI_PLATFORM_1");	
};

