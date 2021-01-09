instance STT_302_Viper (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Viper";
	npctype 	=	        NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		7;
	
	voice 		=		11;
	id 			=		302;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	40;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	124;
	attribute[ATR_HITPOINTS] 		=	124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							body mesh     ,bdytex,skin,			head mesh     ,headtex,	teethtex,	ruestung
	Mdl_SetVisualBody (self,"hum_Body_CookSmith", 1, 	1,			"Hum_Head_Pony", 		58,  	1, 		-1);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);			
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_SNEAK,	1);			
	Npc_SetTalentSkill	(self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 		
	Npc_SetTalentSkill	(self,NPC_TALENT_PICKLOCK,	1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 		
	
	//-------- inventory --------
	
	CreateInvItems (self,ItMinugget,750);
	CreateInvItem  (self,ItMw_1H_Sword_Short_04);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_302;
};

FUNC VOID Rtn_start_302 () 
{

    TA_MineBellows	(08,00,18,00,"OM_CAVE1_82");  
	TA_MineBellows	(18,00,08,00,"OM_CAVE1_82"); 
	
};


