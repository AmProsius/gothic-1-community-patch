instance TPL_1403_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	Npctype =						NpcType_Guard;
	guild =							GIL_TPL;
	level =							17;
	flags =							0;
	
	voice =							8;
	id =							1403;
		
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
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1 ,"Hum_Head_FatBald", 60 , 1, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	EquipItem	(self, ItRw_Crossbow_01);//### Palisadenwache
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1403;
};

FUNC VOID Rtn_start_1403 ()
{

    TA_GuardPalisade	(00,00,22,00,"PSI_GUARD2");
    TA_GuardPalisade	(22,00,24,00,"PSI_GUARD2");	
};

FUNC VOID Rtn_PrepareRitual_1403 ()
{
	TA_GuardPalisade	(00,00,22,00,"PSI_GUARD2");
    TA_GuardPalisade	(22,00,24,00,"PSI_GUARD2");	
};

FUNC VOID Rtn_OMFull_1403 ()
{
	TA_GuardPalisade	(00,00,22,00,"PSI_GUARD2");
    TA_GuardPalisade	(22,00,24,00,"PSI_GUARD2");	
};

FUNC VOID Rtn_FMTaken_1403 ()
{
	TA_GuardPalisade	(00,00,22,00,"PSI_GUARD2");
    TA_GuardPalisade	(22,00,24,00,"PSI_GUARD2");	
};


FUNC VOID Rtn_OrcAssault_1403 () 
{
	TA_GuardPalisade	(00,00,22,00,"PSI_GUARD2");
    TA_GuardPalisade	(22,00,24,00,"PSI_GUARD2");	
};

