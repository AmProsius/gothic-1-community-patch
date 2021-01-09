instance STT_319_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_AMBIENT;
	guild 		=		GIL_STT;
	level 		=		5;
	
	
	voice 		=		10;
	id 			=		319;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	20;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	100;
	attribute[ATR_HITPOINTS] 		=	100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Thief", 57,  2, STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Short_03);
	EquipItem	(self, ItRw_Bow_Small_04);
	CreateInvItems	(self, ItAmArrow, 14);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_319;
};

FUNC VOID Rtn_start_319 ()
{
	TA_Sleep		(22,30,06,30,"OCR_HUT_9");
	TA_SitAround	(06,30,10,30,"OCR_OUTSIDE_HUT_9");
	TA_StandAround	(10,30,22,30,"OCR_OUTSIDE_HUT_9");
};



