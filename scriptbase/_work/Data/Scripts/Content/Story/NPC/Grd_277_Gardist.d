instance GRD_277_Gardist (Npc_Default)
{
	//-------- primary data --------
	//Wache in der Alten Mine
	name 		=	NAME_Gardist;
	npctype 	=	NPCTYPE_MINE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	11;
	voice 		=	6;
	id 			=	277;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 25;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 172;
	attribute[ATR_HITPOINTS] 	= 172;


	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Thief", 1,  2, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 45);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_277;
};

FUNC VOID Rtn_start_277 ()
{
    TA_Guard		(22,00,08,00,"OM_CAVE3_04");
	TA_Guard    	(08,00,22,00,"OM_CAVE3_04");
};


