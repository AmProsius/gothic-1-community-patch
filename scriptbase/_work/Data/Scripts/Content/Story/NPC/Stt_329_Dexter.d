instance STT_329_Dexter (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Dexter";
	npctype 		=		NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		7;
	
	
	voice 		=		10;
	id 			=		329;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	124;
	attribute[ATR_HITPOINTS]	  	=	124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,56headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 58,  1, STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	
		
	EquipItem	( self, ItMw_1H_Sword_Short_04 );
	EquipItem	( self, ItRw_Bow_Small_03 );
	
	CreateInvItems	(self, ItAmArrow, 15);
	
	CreateInvItem	(self, ItWrWorldmap);
	CreateInvItems	(self, ItKeLockpick,20);
	CreateInvItems	(self, ItMiNugget,200);
	
	CreateInvItems	(self, ItMiJoint_1,23);
	CreateInvItems	(self, ItMiJoint_2,15);
	CreateInvItems	(self, ItMiJoint_3,8);
	
	CreateInvItems	(self, ItFo_Potion_Health_01,10);
	CreateInvItems	(self, ItFo_Potion_Health_02, 5);
	CreateInvItems	(self, ItFo_Potion_Mana_01,   8);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_329;
};

FUNC VOID Rtn_start_329 ()
{
	TA_Sleep			(23,30,07,30,"OCR_HUT_55");
	TA_Boss				(07,30,08,00,"OCR_OUTSIDE_HUT_55");
	TA_WashSelf 		(08,00,08,15,"OCR_WASH_8");
	TA_SitAround		(08,15,11,00,"OCR_OUTSIDE_HUT_55");
	TA_Smalltalk		(11,00,17,00,"OCR_OUTSIDE_HUT_47_SMALT1");
	TA_StandAround		(17,00,23,30,"OCR_MARKETPLACE_SCAVENGER");
};


