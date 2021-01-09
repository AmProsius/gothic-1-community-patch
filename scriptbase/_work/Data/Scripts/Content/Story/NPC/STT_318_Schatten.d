instance Stt_318_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_AMBIENT	;
	guild 		=		GIL_STT;
	level 		=		7;

	
	voice 		=		12;
	id 			=		318;
		
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
	//			body mesh     ,bdytex,skin,head mesh     57,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic",108 ,  1, STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Short_04);
	EquipItem	(self, ItRw_Bow_Small_01);
	CreateInvItems	(self, ItAmArrow, 20);
	CreateInvItem	(self, ItKeLockpick);
	CreateInvItem	(self, ItFo_Potion_Water_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_318;
};

FUNC VOID Rtn_start_318 ()
{
	TA_Sleep	    (23,00,07,00,"OCR_HUT_60");
	TA_Boss			(07,00,07,30,"OCR_OUTSIDE_HUT_60");
	TA_StandAround	(07,30,15,00,"OCR_CAMPFIRE_F_1");
	TA_RepairHut	(15,00,17,00,"OCR_OUTSIDE_HUT_60");
	TA_StandAround 	(17,25,23,00,"OCR_CAMPFIRE_F_2");	
};


