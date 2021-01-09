instance TPL_1463_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_GUARD;
	guild =							GIL_TPL;
	level =							17;
	flags =							0;
	
	voice =							13;
	id =							1463;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		55;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	5;
	attribute[ATR_HITPOINTS] =		5;

	//-------- visuals --------
	// 							animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,	"Humans_Mage.mds");
	//							body_mesh     		bdytex	skin	head_mesh     		headtex		teethtex	ruestung	
	Mdl_SetVisualBody	(self,	"hum_body_Naked0",	1, 		1,		"Hum_Head_Bald",	64,  		4,			TPL_ARMOR_L);

	B_Scale				(self);
	Mdl_SetModelFatness	(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	EquipItem 		(self, ItMw_1H_Sword_02);
	CreateInvItem	(self, ItFoSoup);
	CreateInvItem	(self, ItMiJoint_1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1463;
};

FUNC VOID Rtn_start_1463 ()
{
    TA_SittingDuck	(00,00,12,00,"OW_PATH_198_ORCGRAVEYARD8");	
	TA_SittingDuck	(12,00,24,00,"OW_PATH_198_ORCGRAVEYARD8");	
};

