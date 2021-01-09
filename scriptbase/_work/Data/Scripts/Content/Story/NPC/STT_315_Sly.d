instance STT_315_Sly (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Sly";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		5;
	
	
	voice 		=		10;
	id 			=		315;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		20;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		100;
	attribute[ATR_HITPOINTS] 		=		100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 55,  2, STT_ARMOR_M);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,-1);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_Short_02);
	EquipItem	(self, ItRw_Bow_Small_04);
	CreateInvItems	(self, ItAmArrow, 16);
	CreateInvItems	(self, ItKeLockpick,2);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_315;
};

FUNC VOID Rtn_start_315 ()
{
	TA_Sleep		(00,00,07,00,"OCR_HUT_73");
	TA_Boss			(07,00,07,30,"OCR_OUTSIDE_HUT_73");
	TA_Smalltalk	(07,30,12,00,"OCR_OUTSIDE_HUT_73");
	TA_SitAround	(12,00,00,00,"OCR_OUTSIDE_HUT_73");
};

