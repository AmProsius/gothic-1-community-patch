instance GRD_228_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	flags		=	NPC_FLAG_IMMORTAL;	// weil Windenwache !!! wird in Kapitel 4 gelöscht!
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	7;
	id 			=	228;
	
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_FatBald", 5,  1, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Prestart_228;
};

FUNC VOID Rtn_Prestart_228 ()
{
	TA_GuardWheelOpen		(07,55,19,55, "OCR_NORTHGATE_VWHEEL");
	TA_GuardWheelOpen		(19,55,07,55, "OCR_NORTHGATE_VWHEEL");
};

FUNC VOID Rtn_start_228 ()
{
/*
	TA_StandAround	(12,00,13,00,"OCC_MERCS_RIGHT_ROOM_FRONT");
	TA_SitAround (13,00,13,15,"OCC_FIGHTTRAINING");
	TA_PracticeSword (13,15,18,00,"OCC_FIGHTTRAINING");
	TA_SitAround	(18,00,21,00,"OCC_GATE_BEHIND_RIGHT_TOWER");
	TA_GuardPassage	(21,00,06,00,"OCR_MAINGATE_LEFT_GUARD");
	TA_Sleep	(06,00,12,00,"OCC_MERCS_UPPER_RIGHT_ROOM_FRONT");
*/
/*
	TA_GuardPassage		(00,00,04,00,"OCR_MAINGATE_LEFT_GUARD");
	TA_Sleep		(04,00,08,00,"OCR_MAINGATE_GUARDROOM");
	TA_GuardPassage		(08,00,12,00,"OCR_MAINGATE_LEFT_GUARD");
	TA_StandAround	(12,00,16,00,"OCR_MAINGATE_GUARDROOM");
	TA_GuardPassage		(16,00,20,00,"OCR_MAINGATE_LEFT_GUARD");
	TA_Sleep		(20,00,24,00,"OCR_MAINGATE_GUARDROOM");	
*/

//---- SN 05.10.00: Für Drehkreuzwachen-Prototyp ----
/*
    TA_StandAround	(08,00,23,00,"OCR_MAINGATE_GUARDROOM");
    TA_Sleep		        (23,00,08,00,"OCR_MAINGATE_GUARDROOM");	
*/

	TA_GuardWheelOpen		(07,55,19,55, "OCR_NORTHGATE_VWHEEL");
	TA_GuardWheelOpen		(19,55,07,55, "OCR_NORTHGATE_VWHEEL");		//SN 09.01.01: geändert, damit Tore rund um die Uhr offen sind
//-------------------------------------------------------------------
};

FUNC VOID Rtn_OMFull_228 ()
{
	TA_StandAround	(12,00,13,00,"OCC_MERCS_RIGHT_ROOM_FRONT");
	TA_SitAround 	(13,00,13,15,"OCC_FIGHTTRAINING");
	TA_PracticeSword(13,15,18,00,"OCC_FIGHTTRAINING");
	TA_SitAround	(18,00,21,00,"OCC_GATE_BEHIND_RIGHT_TOWER");
	TA_GuardPassage	(21,00,06,00,"OCR_MAINGATE_LEFT_GUARD");
	TA_Sleep		(06,00,12,00,"OCC_MERCS_UPPER_RIGHT_ROOM_FRONT");
};

FUNC VOID Rtn_FMTaken_228 ()
{
	TA_GuardWheelClosed		(07,00,20,00, "OCR_NORTHGATE_VWHEEL");
	TA_GuardWheelClosed		(20,00,07,00, "OCR_NORTHGATE_VWHEEL");
};

FUNC VOID Rtn_OrcAssault_228 ()
{
};




