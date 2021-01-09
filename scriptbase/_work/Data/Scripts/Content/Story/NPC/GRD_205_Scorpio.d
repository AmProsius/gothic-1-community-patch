instance Grd_205_Scorpio (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Scorpio";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	13;
	id 			=	205;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 18, 2, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	
	CreateInvItems	(self, ItMiNugget,200);
	CreateInvItems	(self, ItFo_Potion_Health_02,5);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_205;
};

FUNC VOID Rtn_start_205 ()
{
	TA_Boss			(07,25,20,00,"OCC_CENTER_4");
	TA_Smalltalk	(20,00,01,00,"OCC_STABLE_ENTRANCE_INSERT"); //mit Stone
	TA_Sleep		(20,00,07,25,"OCC_MERCS_UPPER_RIGHT_ROOM_BED4");
};
/*
FUNC VOID Rtn_OT_205 ()
{
	TA_Guard	(07,00,20,00,"OCC_WELL_FRONT");
	TA_Guard	(20,00,07,00,"OCC_WELL_FRONT");
};
*/
func void Rtn_Bannished_205 ()
{
	TA_Stay	(07,00,20,00,"OW_CAVALORN_01");
	TA_Stay	(20,00,07,00,"OW_CAVALORN_01");
};
