instance Grd_200_Thorus (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Thorus";
	npctype		=	NPCTYPE_FRIEND;
	guild 		=	GIL_GRD;
	level 		=  	50;
	voice 		=  	9;
	id 			=   200;
	flags       =   NPC_FLAG_IMMORTAL;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 12,  0, GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

				
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);			
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);			
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);			
			
        
	//-------- inventory --------
	
	EquipItem	(self, Thorus_Schwert);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItems	(self, ItMiNugget,200);
	CreateInvItem	(self, ItFo_Potion_Health_02);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_200;
};

FUNC VOID Rtn_Start_200 ()
{	
	TA_Boss		(08,00,23,00,"OCR_THORUS");
    TA_Sleep	(23,00,08,00,"OCC_BARONS_UPPER_RIGHT_ROOM_BED1");
};

