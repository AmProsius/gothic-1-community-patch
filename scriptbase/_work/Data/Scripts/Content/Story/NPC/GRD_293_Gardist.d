instance Grd_293_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	guild 		=	GIL_GRD;
	npctype		=	npctype_guard;
	level 		=	30;
	voice		=	7;
	id 			=	293;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 70;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 280;
	attribute[ATR_HITPOINTS] 	= 280;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 18, 2, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_293;
};

FUNC VOID Rtn_FMstart_293 ()	//FM
{
	TA_Guard (0,00,13,00,  "FM_84");
	TA_Guard (13,00,00,00, "FM_84");
};

