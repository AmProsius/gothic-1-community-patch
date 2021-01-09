instance GUR_1209_BaalOrun (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Orun";
	Npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_GUR;
	level 		=		28;
	
	voice 		=		12;
	id 			=		1209;
		
	///-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	60;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	376;
	attribute[ATR_HITPOINTS] 		=	376;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 20,  1, GUR_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);

	//-------- Talente --------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);

	//-------- inventory --------
	
	EquipItem (self, Oruns_Keule);
	////CreateInvItems (self, ItMiJoint, 5);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1209;
	fight_tactic	=	FAI_HUMAN_MAGE;
};

FUNC VOID Rtn_start_1209 ()
{
    TA_Boss			(07,00,00,00,"PSI_PATH_2_6");
    TA_Sleep		(00,00,07,00,"PSI_TREE_IN");
};
