instance GRD_210_Scatty (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Scatty";
	npctype 	= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	1;
	id 			=	210;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_FatBald", 5, 2, STT_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_210;
};

FUNC VOID Rtn_start_210 ()
{
	TA_Sleep		(00,00,08,00,"OCR_HUT_19");
	TA_SitAround	(08,00,10,00,"OCR_ARENABATTLE_BENCH");
	TA_Smalltalk	(10,00,16,00,"OCR_SMALLTALK_A_OC_ARENA");
	TA_Stand		(16,00,20,00,"OCR_STAND_WETT");
	TA_SitAround	(20,00,00,00,"OCR_ARENABATTLE_BENCH");
};





