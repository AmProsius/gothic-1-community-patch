instance NOV_1311_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_NOV;
	level 		=		9;
	
	voice 		=		3;
	id 			=		1311;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX]	 	=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 25 ,  2, NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
	//-------- inventory --------

	//EquipItem (self, ItMw1hClub01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
 
	
	//------------- //MISSIONs-------------	
	////// //MISSION[0] = Mis_1_Psi_RecruitBuddler;
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1311;
};

FUNC VOID Rtn_start_1311 ()
{
	TA_Sleep		(00,00,08,00,"PSI_10_HUT_IN");
    TA_SmallTalk	(08,00,24,00,"PSI_TALK_AT_11_HUT");	
};


