instance NOV_1305_Joru (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Joru";
	Npctype 		=		Npctype_Main;
	guild	 		=		GIL_NOV;
	level 		=		9;
	flags 		=		0;
	
	voice 		=		7;
	id 			=		1305;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 75 ,  1, NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Axe_Old_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
 
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1305;
	
	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_1305 () //ST: Teach-Platz 1 (Joru-Platz)
{
	TA_Sleep	(23,55,08,05,"PSI_14_HUT_IN");
	TA_Teaching	(08,05,23,55,"PSI_11_HUT_EX");
};


