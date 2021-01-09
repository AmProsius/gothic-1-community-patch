instance TPL_1432_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_GUARD;
	guild =							GIL_TPL;
	level =							17;
	
	
	voice =							8;
	id =							1432;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		85;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	244;
	attribute[ATR_HITPOINTS] =		244;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 59 ,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1432;
};

FUNC VOID Rtn_start_1432 ()
{
    TA_GuardPassage	(21,00,08,00,"PSI_TEMPLE_GUARD_04");
    TA_GuardPassage	(08,00,21,00,"PSI_TEMPLE_GUARD_04");  
};

FUNC VOID Rtn_PrepareRitual_1432 ()
{
	 TA_GuardPassage	(21,00,08,00,"PSI_TEMPLE_GUARD_04");
    TA_GuardPassage	(08,00,21,00,"PSI_TEMPLE_GUARD_04");
};

FUNC VOID Rtn_OMFull_1432 ()
{
	 TA_GuardPassage	(21,00,08,00,"PSI_TEMPLE_GUARD_04");
    TA_GuardPassage	(08,00,21,00,"PSI_TEMPLE_GUARD_04");
};

FUNC VOID Rtn_FMTaken_1432 ()
{
	 TA_GuardPassage	(21,00,08,00,"PSI_TEMPLE_GUARD_04");
    TA_GuardPassage	(08,00,21,00,"PSI_TEMPLE_GUARD_04");
};

FUNC VOID Rtn_OrcAssault_1432 ()
{
	 TA_GuardPassage	(21,00,08,00,"PSI_TEMPLE_GUARD_04");
    TA_GuardPassage	(08,00,21,00,"PSI_TEMPLE_GUARD_04");
};
