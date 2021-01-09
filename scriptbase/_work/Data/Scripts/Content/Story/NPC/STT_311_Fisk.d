instance STT_311_Fisk (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Fisk";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		7;
		
	voice 		=		12;
	id 			=		311;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Bald", 10,  2, STT_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente -------- 
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);	
		
	//-------- inventory --------
	B_Give_FiskChapter1Weapons ();
		
	//EquipItem	(self, ItMw_1H_Sword_Short_04);
	CreateInvItems (self, ItKeLockpick,10);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_311;
};

FUNC VOID Rtn_start_311 () //Händler
{
	TA_Sleep		(22,30,07,30,"OCR_HUT_49");
	TA_SitAround	(07,30,22,30,"OCR_OUTSIDE_HUT_49");
};


