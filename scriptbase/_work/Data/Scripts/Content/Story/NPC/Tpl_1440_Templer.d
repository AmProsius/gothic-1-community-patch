instance TPL_1440_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_GUARD;
	guild =							GIL_TPL;
	level =							17;
	flags =							0;
	
	voice =							13;
	id =							1440;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 64 ,  1, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1440;
};

FUNC VOID Rtn_start_1440 () //ST-OM-Pendler (MC-Jäger)
{
    TA_Smalltalk	(06,00,14,00,"PSI_SWAMP_MOVEMENT");
    TA_Smalltalk	(14,00,06,00,"OW_OM_ENTRANCE02");
};

func void Rtn_FMTaken_1440 () //OM ist vollgelaufen
{
	TA_Smalltalk	(06,00,14,00,"PSI_SWAMP_MOVEMENT");
    TA_Smalltalk	(14,00,06,00,"PSI_SWAMP_MOVEMENT");
};