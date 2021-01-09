instance GRD_217_Torwache (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Torwache;
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	6;
	id 			=	217;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 14,  1, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);      
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_217;
};

FUNC VOID Rtn_start_217 ()
{
	TA_Guard		(06,00,14,00,"OCR_NORTHGATE_RIGHT_GUARD");// in späteren Kapiteln, wenn SC nicht mehr durchdarf TA_GuardPassage
	TA_Guard		(14,00,06,00,"OCR_NORTHGATE_RIGHT_GUARD");// in späteren Kapiteln, wenn SC nicht mehr durchdarf TA_GuardPassage
};

FUNC VOID Rtn_FMTaken_217 ()
{
	TA_StayNeutral	(06,00,14,00,"OCR_NORTHGATE_RIGHT_GUARD");// in späteren Kapiteln, wenn SC nicht mehr durchdarf TA_GuardPassage
	TA_StayNeutral	(14,00,06,00,"OCR_NORTHGATE_RIGHT_GUARD");// in späteren Kapiteln, wenn SC nicht mehr durchdarf TA_GuardPassage
};

FUNC VOID Rtn_FMTaken2_217 ()
{
	TA_Guard		(06,00,14,00,"OCR_NORTHGATE_RIGHT_GUARD");// in späteren Kapiteln, wenn SC nicht mehr durchdarf TA_GuardPassage
	TA_Guard		(14,00,06,00,"OCR_NORTHGATE_RIGHT_GUARD");// in späteren Kapiteln, wenn SC nicht mehr durchdarf TA_GuardPassage
};
