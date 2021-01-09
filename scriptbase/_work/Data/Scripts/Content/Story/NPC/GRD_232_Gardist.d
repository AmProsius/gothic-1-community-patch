instance GRD_232_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	13;
	id 			=	232;
	
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
	daily_routine = Rtn_start_232;
};

FUNC VOID Rtn_start_232 ()
{
	TA_Sleep		(23,00,07,00,"OCC_MERCS_LEFT_ROOM_BED1");
	TA_Smalltalk	(07,00,23,00,"OCR_TO_MAINGATE_INSERT");
};

FUNC VOID Rtn_FMTaken_232 ()
{
	TA_StayNeutral	(07,00,20,00, "OCR_NORTHGATE_RIGHT_GUARD_CHANGE");
	TA_StayNeutral	(20,00,07,00, "OCR_NORTHGATE_RIGHT_GUARD_CHANGE");
};

FUNC VOID Rtn_FMTaken2_232 ()
{
	TA_Stay			(07,00,20,00, "OCR_NORTHGATE_RIGHT_GUARD_CHANGE");
	TA_Stay			(20,00,07,00, "OCR_NORTHGATE_RIGHT_GUARD_CHANGE");
};
