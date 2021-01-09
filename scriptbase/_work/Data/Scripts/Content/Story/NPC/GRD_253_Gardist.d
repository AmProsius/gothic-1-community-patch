instance GRD_253_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	7;
	id 			=	253;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 14,  1, GRD_ARMOR_L);
        
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
	daily_routine = Rtn_start_253;
};

FUNC VOID Rtn_start_253 ()
{
	TA_Smalltalk	(00,00,08,00,"OCR_AT_HUT_3");
	TA_Smalltalk	(08,00,00,00,"OCR_AT_HUT_3");	
};

FUNC VOID Rtn_FMTaken_253 ()
{
	TA_StayNeutral	(07,00,20,00, "OCR_MAINGATE_OUTSIDE");
	TA_StayNeutral	(20,00,07,00, "OCR_MAINGATE_OUTSIDE");
};

FUNC VOID Rtn_FMTaken2_253 ()
{
	TA_Stay			(07,00,20,00, "OCR_MAINGATE_OUTSIDE");
	TA_Stay			(20,00,07,00, "OCR_MAINGATE_OUTSIDE");
};
