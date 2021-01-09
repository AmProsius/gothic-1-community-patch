instance TPL_1422_GorHanis (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Hanis";
	npctype =						npctype_main;
	guild =							GIL_NONE;
	level =							12;
	
	
	voice =							8;
	id =							1422;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		25;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184;
	attribute[ATR_HITPOINTS] =		184;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 66,  1, TPL_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_1H_Sword_01);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1422;
};

FUNC VOID Rtn_start_1422 ()
{
	TA_Sleep		(23,45,07,45,"OCR_HUT_32");
	TA_StandAround  (07,45,10,05,"OCR_CAMPFIRE_I_1");
	TA_Smalltalk	(10,05,16,00,"OCR_SMALLTALK_A_OC_ARENA");
	TA_PracticeSword(16,00,17,15,"OCR_ARENABATTLE");
	TA_SitCampfire	(17,15,23,45,"OCR_CAMPFIRE_I_1");
};

