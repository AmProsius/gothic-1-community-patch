instance GRD_221_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	13;
	id 			=	221;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, GRD_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_221;
};

FUNC VOID Rtn_start_221 ()
{
    TA_PracticeSword	(07,40,20,10,"OCC_CENTER_4_TRAIN3");
    TA_ROASTSCAVENGER	(20,10,22,10,"OCC_SHADOWS_CORNER_MOVEMENT2");
    TA_StandAround		(22,10,00,10,"OCC_SHADOWS_CORNER_MOVEMENT");
    TA_Sleep            (00,10,07,40,"OCC_MERCS_UPPER_RIGHT_ROOM_BED3");
};


FUNC VOID Rtn_OT_221 ()
{
	TA_Guard ( 07, 00, 20, 00, "OCC_CHAPEL_UPSTAIRS_RIGHT" );
	TA_Guard ( 20, 00, 07, 00, "OCC_CHAPEL_UPSTAIRS_RIGHT" );
};