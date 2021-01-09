instance GRD_229_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice		=	13;
	id 			=	229;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Psionic", 2,  1, GRD_ARMOR_H);
        
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
	daily_routine = Rtn_start_229;
};

FUNC VOID Rtn_start_229 ()//### unbeschäftigter Gardist!
{
	TA_GuardPalisade(08,00,22,00,"OCR_PALISADE_ABOVE_MARKETPLACE_01");
	TA_Sleep		(22,00,08,00,"OCC_MERCS_UPPER_RIGHT_ROOM_FRONT");
};

FUNC VOID Rtn_FMTaken_229 ()
{
	TA_StayNeutral	(07,00,20,00, "OCR_NORTHGATE_OUTSIDE_DOOR");
	TA_StayNeutral	(20,00,07,00, "OCR_NORTHGATE_OUTSIDE_DOOR");
};

FUNC VOID Rtn_FMTaken2_229 ()
{
	TA_Stay			(07,00,20,00, "OCR_NORTHGATE_OUTSIDE_DOOR");
	TA_Stay			(20,00,07,00, "OCR_NORTHGATE_OUTSIDE_DOOR");
};
