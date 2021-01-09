instance GUR_1210_BaalTyon (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Tyon";
	Npctype 	=		NPCTYPE_FRIEND;
	guild 		=		GIL_GUR;
	level 		=		28;
	flags 		=		NPC_FLAG_IMMORTAL;
	
	voice 		=		11;
	id 			=		1210;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	35;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	376;
	attribute[ATR_HITPOINTS] 		=	376;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1,1 ,"Hum_Head_Psionic", 24,  2, GUR_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);

	//-------- inventory --------
	CreateInvItem(self, ItArRuneWindfist);

	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1210;
	fight_tactic	=	FAI_HUMAN_MAGE;
};

FUNC VOID Rtn_start_1210 ()
{
	TA_Teaching	(16,00,23,00,"PSI_TEMPLE_COURT_GURU");
	TA_Teaching	(23,00,16,00,"PSI_TEMPLE_COURT_GURU");	
};

FUNC VOID Rtn_PrepareRitual_1210 ()
{
	TA_SitAround	(16,00,23,00,"PSI_TEMPLE_IN_05");
    TA_SitAround	(23,00,16,00,"PSI_TEMPLE_IN_05");	
};

FUNC VOID Rtn_OMFull_1210 ()
{
	 TA_SitAround	(16,00,23,00,"PSI_TEMPLE_IN_05");
    TA_SitAround	(23,00,16,00,"PSI_TEMPLE_IN_05");	
};

FUNC VOID Rtn_FMTaken_1210 ()
{
	 TA_SitAround	(16,00,23,00,"PSI_TEMPLE_IN_05");
    TA_SitAround	(23,00,16,00,"PSI_TEMPLE_IN_05");	
};

FUNC VOID Rtn_OrcAssault_1210 ()
{
	 TA_SitAround	(16,00,23,00,"PSI_TEMPLE_IN_05");
    TA_SitAround	(23,00,16,00,"PSI_TEMPLE_IN_05");	
};
