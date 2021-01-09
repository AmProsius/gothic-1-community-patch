instance NOV_1343_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_NOV;
	level 		=		9;
	
	voice 		=		5;
	id 			=		1343;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 22,  1, NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Axe_Old_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1343;
};

FUNC VOID Rtn_start_1343 ()
{
	TA_Meditate	(08,00,10,00,"PSI_TEMPLE_COURT_3_MOVEMENT");
	TA_Meditate	(10,00,08,00,"PSI_TEMPLE_COURT_3_MOVEMENT");	
};

FUNC VOID Rtn_Ritual_1343 ()
{
	TA_Stay	(00,00,08,00,"PSI_TEMPLE_NOVIZE_PR");
    TA_Stay	(08,00,24,00,"PSI_TEMPLE_NOVIZE_PR");	
};


