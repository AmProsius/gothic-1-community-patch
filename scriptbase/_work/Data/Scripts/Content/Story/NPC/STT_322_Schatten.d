instance Stt_322_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 	=		NPCTYPE_AMBIENT;
	guild 		=		GIL_STT;
	level 		=		7;
	
	voice	 	=		12;
	id 			=		322;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	124;
	attribute[ATR_HITPOINTS] 		=	124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 57,  1, STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Short_04);
	EquipItem	(self, ItRw_Bow_Small_02);
	CreateInvItems	(self, ItAmArrow, 15);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_322;
};

FUNC VOID Rtn_start_322 ()
{
	TA_Sleep		(23,02,06,45,"OCR_HUT_3");
	TA_StandAround	(06,45,10,00,"OCR_CAMPFIRE_A_MOVEMENT3");
	TA_WashSelf		(10,00,10,30,"OCR_LAKE_1");
	TA_StandAround	(10,30,12,30,"OCR_CAMPFIRE_A_MOVEMENT2");
	TA_Smalltalk	(12,30,15,30,"OCR_CAMPFIRE_A_MOVEMENT3"); //mit Grim
	TA_SitAround	(15,30,16,00,"OCR_HUT_3");
	TA_Smalltalk	(16,00,18,01,"OCR_CAMPFIRE_A_MOVEMENT3"); //mit Diego
	TA_SitCampfire	(18,01,23,02,"OCR_CAMPFIRE_A_MOVEMENT3");	
};

FUNC VOID Rtn_OMFull_322 ()
{
	TA_Sleep			(23,00,07,00,"OCR_HUT_3");	
	TA_StandAround	(07,00,23,00,"OCR_TO_MAINGATE");
};

FUNC VOID Rtn_FMTaken_322 ()
{
	TA_PickOre	(08,00,13,00,"FMC_FM_ENTRANCE");
//	//TA_ExchangeOre  (13,00,14,00,"FMC_FM_ENTRANCE");
	TA_WashSelf	(14,00,15,00,"OCR_WASH_5");
//	TA_Highwaymen	(15,00,18,00,"OC2");
	TA_Smoke	(18,00,23,00,"OCR_OUTSIDE_HUT_54");
	TA_Sleep	(23,00,08,00,"OCR_HUT_3");
};

FUNC VOID Rtn_OrcAssault_322 ()
{
};
