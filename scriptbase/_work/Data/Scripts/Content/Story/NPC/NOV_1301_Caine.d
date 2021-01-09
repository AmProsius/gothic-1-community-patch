instance NOV_1301_Caine (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Caine";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_NOV;
	level 		=		9;
	
	voice 		=		13;
	id 			=		1301;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1 ,"Hum_Head_Psionic", 21,  1, NOV_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Axe_Old_01);
	CreateInvItems	(self, ItMiNugget,	5);
	CreateInvItems	(self, ItFoRice,	2);
	CreateInvItems	(self, ItFoBooze,	6);
	
        
	//-------- inventory --------
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1301;
};

FUNC VOID Rtn_start_1301 ()
{
	TA_Sleep		(23,00,08,00,"PSI_21_HUT_IN");
	TA_PotionAlchemy(08,00,09,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke		(09,00,10,00,"PSI_21_HUT_EX");
	TA_PotionAlchemy(10,00,11,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke		(11,00,12,00,"PSI_21_HUT_EX");
	TA_PotionAlchemy(12,00,13,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke		(13,00,14,00,"PSI_21_HUT_EX");
	TA_PotionAlchemy(14,00,15,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke		(15,00,16,00,"PSI_21_HUT_EX");
	TA_PotionAlchemy(16,00,17,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke		(17,00,18,00,"PSI_21_HUT_EX");
	TA_PotionAlchemy(18,00,19,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke		(19,00,20,00,"PSI_21_HUT_EX");
	TA_PotionAlchemy(20,00,21,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke		(21,00,22,00,"PSI_21_HUT_EX");
	TA_PotionAlchemy(22,00,23,00,"PSI_LABOR_BASEMENT_1");
};

