instance STT_301_Ian (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Ian";
	npctype 	=	  	NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		13;
	flags 		=		NPC_FLAG_IMMORTAL;
	
	voice 		=		13;
	id 			=		301;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	196;
	attribute[ATR_HITPOINTS] 		=	196;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_Pony",  14,  1, STT_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);			
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);			
	Npc_SetTalentSkill (self,NPC_TALENT_SNEAK,1);			
	Npc_SetTalentSkill (self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 		
	Npc_SetTalentSkill (self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 		
	
	//-------- inventory --------
	EquipItem	(self, ItMw_1H_Sword_04);
	EquipItem	(self, ItRw_Bow_Small_04);
	CreateInvItems	(self, ItAmArrow, 25);
	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_301;

	
};

FUNC VOID Rtn_start_301 ()
{

    TA_StandAround	(08,00,18,00,"OM_CAVE1_47_IAN");  
	TA_StandAround	(18,00,08,00,"OM_CAVE1_47_IAN");
};


func void Rtn_Kapitel2_301 ()
{
	TA_StandAround	(08,00,18,00,"OM_CAVE3_19");  
	TA_Standaround	(18,00,08,00,"OM_CAVE3_19");	
};
