instance NOV_1339_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Novize;
	Npctype 		=		NPCTYPE_AMBIENT;
	guild 		=		GIL_NOV;
	level 		=		14;

	
	voice 		=		3;
	id 			=		1339;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	19;
	attribute[ATR_MANA] 			=	19;
	attribute[ATR_HITPOINTS_MAX] 	=	208;
	attribute[ATR_HITPOINTS] 		=	208;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_FatBald", 27 ,  1, NOV_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;
	

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Mace_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
 
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1339;
};

FUNC VOID Rtn_start_1339 ()
{
	TA_Meditate	(08,00,10,00,"PSI_TEMPLE_NOVIZE_PR4_MOVEMENT");
	TA_Meditate	(10,00,08,00,"PSI_TEMPLE_NOVIZE_PR4_MOVEMENT");	
};

FUNC VOID Rtn_Ritual_1339 ()
{
	TA_Stay	(00,00,08,00,"PSI_TEMPLE_NOVIZE_PR");
    TA_Stay	(08,00,24,00,"PSI_TEMPLE_NOVIZE_PR");	
};



