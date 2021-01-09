instance GRD_255_Fletcher (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Fletcher";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	6;
	id 			=	255;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Thief", 1,  2, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_255;
};

FUNC VOID Rtn_Start_255 ()
{
	TA_Guard	(06,00,07,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(07,00,08,00,"OCR_LADDER_TOP_01");
	TA_Guard	(08,00,09,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(09,00,10,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(10,00,11,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(11,00,12,00,"OCR_LADDER_TOP_01");
	TA_Guard	(12,00,13,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(13,00,14,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(14,00,15,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(15,00,16,00,"OCR_LADDER_TOP_01");
	TA_Guard	(16,00,17,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(17,00,18,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(18,00,19,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(19,00,20,00,"OCR_LADDER_TOP_01");
	TA_Guard	(20,00,21,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(21,00,22,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(22,00,23,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(23,00,00,00,"OCR_LADDER_TOP_01");
	TA_Guard	(00,00,01,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(01,00,02,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(02,00,03,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(03,00,04,00,"OCR_LADDER_TOP_01");
	TA_Guard	(04,00,05,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(05,00,06,00,"OCR_BEHIND_HUT_17");
};

FUNC VOID Rtn_FMTaken_255 ()
{
	TA_StayNeutral	(07,00,20,00, "OC1");
	TA_StayNeutral	(20,00,07,00, "OC1");
};

FUNC VOID Rtn_FMTaken2_255 ()
{
	TA_Stay			(07,00,20,00, "OC1");
	TA_Stay			(20,00,07,00, "OC1");
};



