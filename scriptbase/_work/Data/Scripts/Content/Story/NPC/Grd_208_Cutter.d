instance GRD_208_Cutter (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Cutter";
	npctype 	= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice 		=	8;
	id 			=	208;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0 , 0,"Hum_Head_Bald", 3, 1, GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

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
	daily_routine = Rtn_start_208;
};

FUNC VOID Rtn_start_208 ()
{
	TA_Sleep		(23,35,08,35,"OCC_MERCS_UPPER_RIGHT_ROOM_BED6");
	TA_Smalltalk	(08,35,23,35,"OCC_MERCS_ENTRANCE");	
};

FUNC VOID Rtn_OT_208 ()
{
	TA_Guard	(07,00,20,00,"OCC_MERCS_ENTRANCE");
	TA_Guard	(20,00,07,00,"OCC_MERCS_ENTRANCE");
};