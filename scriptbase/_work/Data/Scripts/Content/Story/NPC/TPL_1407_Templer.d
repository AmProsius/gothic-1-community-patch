instance TPL_1407_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_GUARD;
	guild =							GIL_TPL;
	level =							17;
	flags =							0;
	
	voice =							13;
	id =							1407;
		
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
	
	
	//------------- //MISSIONs-------------

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1407;
};

FUNC VOID Rtn_start_1407 () //Horst, trifft sich mit 1425
{
	TA_Smalltalk(06,00,07,00,"PSI_SWAMP_6");
	TA_Guard	(07,00,08,00,"PSI_PATH_9_12");
	TA_Smalltalk(08,00,09,00,"PSI_SWAMP_6");
	TA_Guard	(09,00,10,00,"PSI_PATH_9_12");
	
	TA_Smalltalk(10,00,11,00,"PSI_SWAMP_6");
	TA_Guard	(11,00,12,00,"PSI_PATH_9_12");
	TA_Smalltalk(12,00,13,00,"PSI_SWAMP_6");
	TA_Guard	(13,00,14,00,"PSI_PATH_9_12");
	
	TA_Smalltalk(14,00,15,00,"PSI_SWAMP_6");
	TA_Guard	(15,00,16,00,"PSI_PATH_9_12");
	TA_Smalltalk(16,00,17,00,"PSI_SWAMP_6");
	TA_Guard	(17,00,18,00,"PSI_PATH_9_12");
	
	TA_Smalltalk(18,00,19,00,"PSI_SWAMP_6");
	TA_Guard	(19,00,20,00,"PSI_PATH_9_12");
	TA_Smalltalk(20,00,21,00,"PSI_SWAMP_6");
	TA_Guard	(21,00,22,00,"PSI_PATH_9_12");
	
	TA_Smalltalk(22,00,23,00,"PSI_SWAMP_6");
	TA_Guard	(23,00,00,00,"PSI_PATH_9_12");
	TA_Smalltalk(00,00,01,00,"PSI_SWAMP_6");
	TA_Guard	(01,00,02,00,"PSI_PATH_9_12");
	
	TA_Smalltalk(02,00,03,00,"PSI_SWAMP_6");
	TA_Guard	(03,00,04,00,"PSI_PATH_9_12");
	TA_Smalltalk(04,00,05,00,"PSI_SWAMP_6");
	TA_Guard	(05,00,06,00,"PSI_PATH_9_12");
};
