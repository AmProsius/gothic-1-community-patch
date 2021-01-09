instance GRD_242_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice		=	7;
	id 			=	242;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 280;
	attribute[ATR_HITPOINTS] 	= 280;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Thief", 1,  2, GRD_ARMOR_H);
        
 	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_242;
};

FUNC VOID Rtn_start_242 ()
{
	TA_GuardPalisade	(06,00,21,00,"OCR_PALISADE_WALK_15"); 
	TA_GuardPalisade	(21,00,06,00,"OCR_PALISADE_WALK_15"); 
};

FUNC VOID Rtn_OMFull_242 ()
{
	TA_GuardPalisade	(06,00,21,00,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_GUARD");
	TA_SitAround	(21,00,24,00,"OCC_MERCS_RIGHT_ROOM_FRONT");
	TA_Sleep	(24,00,06,00,"OCC_MERCS_UPPER_RIGHT_ROOM_FRONT");
	
};
FUNC VOID Rtn_FMTaken_242 ()
{
};

FUNC VOID Rtn_OrcAssault_242 ()
{
};


