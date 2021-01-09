instance STT_336_Cavalorn (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Cavalorn";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		5;
	
	
	voice 		=		12;
	id 			=		336;
		
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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Psionic", 10,  2, STT_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK, 1);
		
	//-------- inventory --------
	B_Give_CavalornChapter1Weapons ();
	EquipItem	(self,ItMw_1H_Sword_Short_02);
	EquipItem	(self, ItRw_Bow_Small_02);
	CreateInvItems	(self, ItAmArrow, 16);
	CreateInvItem	(self, ItFo_Potion_Water_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItem	(self, ItKeLockpick);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_336;
};

FUNC VOID Rtn_start_336 ()
{
    TA_Sleep		(23,00,06,30,"OW_CAVALORN_01");
	TA_StandAround 	(06,30,23,00,"OW_SAWHUT_SLEEP_01");
};

