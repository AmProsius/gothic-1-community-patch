instance GRD_233_Bloodwyn (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Bloodwyn";
	npctype 	=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	8;
	id 			=	233;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 18,  1, GRD_ARMOR_M);
        
        B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_04);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_233;
};

FUNC VOID Rtn_start_233 ()
{
	TA_Guard	(06,00,07,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(07,00,08,00,"OCR_OUTSIDE_HUT_63");
	TA_Guard	(08,00,09,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(09,00,10,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Guard	(10,00,11,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(11,00,12,00,"OCR_OUTSIDE_HUT_63");
	TA_Guard	(12,00,13,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(13,00,14,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Guard	(14,00,15,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(15,00,16,00,"OCR_OUTSIDE_HUT_63");
	TA_Guard	(16,00,17,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(17,00,18,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Guard	(18,00,19,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(19,00,20,00,"OCR_OUTSIDE_HUT_63");
	TA_Guard	(20,00,21,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(21,00,22,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Guard	(22,00,23,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(23,00,00,00,"OCR_OUTSIDE_HUT_63");
	TA_Guard	(00,00,01,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(01,00,02,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Guard	(02,00,03,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(03,00,04,00,"OCR_OUTSIDE_HUT_63");
	TA_Guard	(04,00,05,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard	(05,00,06,00,"OCR_OUTSIDE_HUT_63");
};

FUNC VOID Rtn_FMTaken_233 ()
{
	TA_StayNeutral	(07,00,20,00, "OCR_NORTHGATE_LEFT_GUARD_CHANGE");
	TA_StayNeutral	(20,00,07,00, "OCR_NORTHGATE_LEFT_GUARD_CHANGE");
};

FUNC VOID Rtn_FMTaken2_233 ()
{
	TA_Stay		(07,00,20,00, "OCR_NORTHGATE_LEFT_GUARD_CHANGE");
	TA_Stay		(20,00,07,00, "OCR_NORTHGATE_LEFT_GUARD_CHANGE");
};


