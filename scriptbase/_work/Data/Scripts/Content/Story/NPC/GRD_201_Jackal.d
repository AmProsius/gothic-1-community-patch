instance GRD_201_Jackal (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Jackal";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		= 	50;		// wegen XP!
	voice 		=	7;
	id 			=	201;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 300;
	attribute[ATR_HITPOINTS] 	= 300;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2,"Hum_Head_Fighter", 4,  1, GRD_ARMOR_H);
         
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	EquipItem		(self, ItMw_1H_Axe_03);
	EquipItem		(self, ItRw_Crossbow_03);
	CreateInvItems	(self, ItAmBolt, 15);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_201;
};

FUNC VOID Rtn_start_201 () //MarktplatzPatrouille
{
	TA_Guard	(06,00,07,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(07,00,08,00,"OCR_OUTSIDE_HUT_42");
	TA_Guard	(08,00,09,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(09,00,10,00,"OCR_NORTHGATE_RAMP_BELOW");
	
	TA_Guard	(10,00,11,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(11,00,12,00,"OCR_OUTSIDE_HUT_42");
	TA_Guard	(12,00,13,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(13,00,14,00,"OCR_NORTHGATE_RAMP_BELOW");
	
	TA_Guard	(14,00,15,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(15,00,16,00,"OCR_OUTSIDE_HUT_42");
	TA_Guard	(16,00,17,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(17,00,18,00,"OCR_NORTHGATE_RAMP_BELOW");
	
	TA_Guard	(18,00,19,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(19,00,20,00,"OCR_OUTSIDE_HUT_42");
	TA_Guard	(20,00,21,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(21,00,22,00,"OCR_NORTHGATE_RAMP_BELOW");
	
	TA_Guard	(22,00,23,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(23,00,00,00,"OCR_OUTSIDE_HUT_42");
	TA_Guard	(00,00,01,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(01,00,02,00,"OCR_NORTHGATE_RAMP_BELOW");
	
	TA_Guard	(02,00,03,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(03,00,04,00,"OCR_OUTSIDE_HUT_42");
	TA_Guard	(04,00,05,00,"OCR_CAMPFIRE_F_1");
	TA_Guard	(05,00,06,00,"OCR_NORTHGATE_RAMP_BELOW");
};

FUNC VOID Rtn_FMTaken_201 () //Wache vor FM
{
	TA_StayNeutral	(02,00,03,00,"FMC_FM_ENTRANCE");
	TA_StayNeutral	(03,00,02,00,"FMC_FM_ENTRANCE");
};

FUNC VOID Rtn_FMTaken2_201 () //Wache vor FM
{
	TA_Stay			(02,00,03,00,"FMC_FM_ENTRANCE");
	TA_Stay			(03,00,02,00,"FMC_FM_ENTRANCE");
};
