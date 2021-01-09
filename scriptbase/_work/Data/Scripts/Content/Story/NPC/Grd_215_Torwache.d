instance GRD_215_Torwache (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Torwache;
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	6;
	id 			=	215;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 12,  2, GRD_ARMOR_M);
        
        	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_215;
};

FUNC VOID Rtn_start_215 ()
{
    TA_Guard		(06,00,21,00,"OCR_MAINGATE_RIGHT_GUARD");
    TA_Guard		(21,00,06,00,"OCR_MAINGATE_RIGHT_GUARD");	
};

FUNC VOID Rtn_FMTaken_215 ()
{
    TA_StayNeutral	(06,00,21,00,"OCR_MAINGATE_RIGHT_GUARD");
    TA_StayNeutral	(21,00,06,00,"OCR_MAINGATE_RIGHT_GUARD");	
};

FUNC VOID Rtn_FMTaken2_215 ()
{
    TA_Guard		(06,00,21,00,"OCR_MAINGATE_RIGHT_GUARD");
    TA_Guard		(21,00,06,00,"OCR_MAINGATE_RIGHT_GUARD");	
};

