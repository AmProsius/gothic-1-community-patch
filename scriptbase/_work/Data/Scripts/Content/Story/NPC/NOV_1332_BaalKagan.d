instance NOV_1332_BaalKagan (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Kagan";
	Npctype	 	=		Npctype_Main;
	guild 		=		GIL_NOV;
	level 		=		9;
	
	voice 		=		13;
	id 			=		1332;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 29,  1, NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Axe_Old_01);
	CreateInvItems (self, ItMiJoint_1, 10);
	CreateInvItems (self, ItMiJoint_2, 20);
 	CreateInvItems (self, ItMiJoint_3, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1332;
};

FUNC VOID Rtn_start_1332 ()
{
	TA_Standaround	(00,00,07,30,"NC_PATH_PEASANT_OUTSIDE11");
	TA_Smalltalk	(07,30,00,00,"NC_PLACE06");
};

