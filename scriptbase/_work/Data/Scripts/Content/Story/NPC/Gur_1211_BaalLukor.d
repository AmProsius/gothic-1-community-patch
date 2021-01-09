instance GUR_1211_BaalLukor (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Lukor";
	Npctype 	=		NPCTYPE_FRIEND;
	flags		=		NPC_FLAG_IMMORTAL;
	guild 		=		GIL_GUR;
	level 		=		50;
	
	voice 		=		13;
	id 			=		1211;
		
	///-------- abilities --------
	attribute[ATR_STRENGTH]	 		=	20;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	100;
	attribute[ATR_MANA] 			=	100;
	attribute[ATR_HITPOINTS_MAX] 	=	388;
	attribute[ATR_HITPOINTS] 		=	388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,	"Humans_Mage.mds");
	//							body mesh,			bdytex,	skin,	head mesh,			headtex,	teethtex,	ruestung	
	Mdl_SetVisualBody	(self,	"hum_body_Naked0",	1,		1,		"Hum_Head_Psionic",	20,			1,			GUR_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness	(self,	-1);

	//-------- Talente -------
	Npc_SetTalentSkill	(self,	NPC_TALENT_MAGE,		6);

	//-------- inventory --------
	EquipItem			(self,	ItMw_1H_Sword_02);
	
	//------------- AI -------------
	daily_routine	=	Rtn_start_1211;
	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_Start_1211 ()
{
    TA_Guard	(23,00,16,00,"GRYD_025");
	TA_Guard	(16,00,23,00,"GRYD_025");
};

FUNC VOID Rtn_Follow_1211 ()
{
    TA_FollowPC	(23,00,16,00,"GRYD_025");
	TA_FollowPC	(16,00,23,00,"GRYD_025");
};

FUNC VOID Rtn_WaitInSideTunnelOne_1211 ()
{
    TA_Stay		(23,00,16,00,"GRYD_040");
	TA_Stay		(16,00,23,00,"GRYD_040");
};

FUNC VOID Rtn_WaitInSideTunnelTwo_1211 ()
{
    TA_Stay		(23,00,16,00,"GRYD_047");
	TA_Stay		(16,00,23,00,"GRYD_047");
};

FUNC VOID Rtn_Door_1211 ()
{
    TA_Stay		(23,00,16,00,"GRYD_060");
	TA_Stay		(16,00,23,00,"GRYD_060");
};

FUNC VOID Rtn_Teleport_1211 ()
{
    TA_FollowPC	(23,00,16,00,"GRYD_060");
	TA_FollowPC	(16,00,23,00,"GRYD_060");
};

FUNC VOID Rtn_Meditate_1211 ()
{
    TA_Meditate	(23,00,16,00,"GRYD_082");
	TA_Meditate	(16,00,23,00,"GRYD_082");
};

