instance GRD_299_Gardist (Npc_Default) 

{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	guild 		=	GIL_GRD;
	npctype		=	npctype_guard;
	level 		=	20;
	voice 		=	7;
	id 			=	299;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald",3 ,  3, GRD_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_299;
};

FUNC VOID Rtn_FMstart_299 ()	//FM
{
	TA_Guard (0,00,13,00,  "FM_133");
	TA_Guard (13,00,00,00, "FM_133");
};

