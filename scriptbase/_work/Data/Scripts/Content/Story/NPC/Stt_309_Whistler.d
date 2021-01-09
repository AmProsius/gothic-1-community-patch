instance Stt_309_Whistler (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Whistler";
	npctype 		=		NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		5;
	
	
	voice 		=		11;
	id 			=		309;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	20;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX]	=	100;
	attribute[ATR_HITPOINTS] 		=	100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     57,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic",97 ,  1, STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Short_02);
	EquipItem	(self, ItRw_Bow_Small_02);
	CreateInvItems	(self, ItAmArrow, 10);
	CreateInvItems	(self, ItKeLockpick,2);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_309;

	// //MISSION[0] = Mis_1_OC_Whistler_StealAxe;
};

FUNC VOID Rtn_start_309 ()
{
	TA_Sleep		(23,30,08,00,"OCR_HUT_65");
	TA_SitAround	(08,00,11,30,"OCR_OUTSIDE_HUT_65");
	TA_RepairHut	(11,30,13,00,"OCR_OUTSIDE_HUT_65");
	TA_SitAround	(13,00,23,30,"OCR_OUTSIDE_HUT_65");
};


