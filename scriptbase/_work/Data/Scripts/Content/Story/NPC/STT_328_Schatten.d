instance STT_328_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_AMBIENT;
	guild 		=		GIL_STT;
	level 		=		5;
	
	
	voice	 	=		12;
	id 			=		328;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	20;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	100;
	attribute[ATR_HITPOINTS] 		=	100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Bald", 14,  2, STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill 	( self, NPC_TALENT_BOW,1 );
	Npc_SetTalentSkill 	( self, NPC_TALENT_1H,1 );	
		
	//-------- inventory --------
	
	EquipItem	( self, ItMw_1H_Sword_Short_02 );
	EquipItem	( self, ItRw_Bow_Small_01 );
	CreateInvItems	(self, 	ItAmArrow, 20);
	
	
	

	//------------- Daily Routine -------------
	daily_routine = Rtn_start_328;
};

FUNC VOID Rtn_start_328 () //Arenaplatz
{
	TA_Sleep			(23,05,07,00,"OCR_HUT_22");
	TA_SitAround		(07,00,11,00,"OCR_OUTSIDE_ARENA_HANGAROUND");
	TA_RoastScavenger	(11,00,17,30,"OCR_OUTSIDE_ARENA_01");
	TA_SitAround		(17,30,19,00,"OCR_OUTSIDE_ARENA_HANGAROUND");
	TA_ArenaSpectator	(19,00,23,05,"OCR_ARENA_05");
};
