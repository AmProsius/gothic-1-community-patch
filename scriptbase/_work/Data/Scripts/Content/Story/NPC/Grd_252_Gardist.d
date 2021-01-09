instance GRD_252_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	6;
	id 			=	252;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);		        
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_252;
};

FUNC VOID Rtn_start_252 ()
{
	TA_Sleep		(23,00,06,00,"OCC_MERCS_LEFT_ROOM_BED2");
	TA_Smalltalk	(06,00,23,00,"OCR_TO_MAINGATE_INSERT");
};

FUNC VOID Rtn_FMTaken_252 ()
{
	TA_StayNeutral	(07,00,20,00, "OCR_MAINGATE_OUTSIDE");
	TA_StayNeutral	(20,00,07,00, "OCR_MAINGATE_OUTSIDE");
};

FUNC VOID Rtn_FMTaken2_252 ()
{
	TA_Stay			(07,00,20,00, "OCR_MAINGATE_OUTSIDE");
	TA_Stay			(20,00,07,00, "OCR_MAINGATE_OUTSIDE");
};
