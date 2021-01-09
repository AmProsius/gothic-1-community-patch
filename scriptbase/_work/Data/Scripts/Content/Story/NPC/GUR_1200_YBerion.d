instance GUR_1200_YBerion (Npc_Default)
{
	//-------- primary data --------
	
	name 			=	"Y'Berion";
	npctype 		= 	npctype_main;
	guild 			=	GIL_GUR;
	level 			=	30;
	flags			= 	NPC_FLAG_IMMORTAL;
	voice 			= 	12;
	id 				=	1200;
			
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		= 60;
	attribute[ATR_DEXTERITY] 		= 45;
	attribute[ATR_MANA_MAX] 		= 50;
	attribute[ATR_MANA] 			= 50;
	attribute[ATR_HITPOINTS_MAX]	= 400;
	attribute[ATR_HITPOINTS]		= 400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 83,  0, GUR_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- Spells--------                                    


	//-------- Talente -------- 
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);

	//-------- inventory --------
	CreateInvItem(self, ItArRunePyrokinesis);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1200;
};

FUNC VOID Rtn_start_1200 ()
{
    TA_SitAround	(05,00,01,00,"PSI_TEMPLE_SITTING_PRIEST");
    TA_ReadBook		(01,00,05,00,"PSI_TEMPLE_ROOMS_IN_02");	
};

FUNC VOID Rtn_CallSleeper_1200 () 
{
	TA_Stay	(23,00,21,00,"PSI_TEMPLE_STAIRS_02");
    TA_Stay	(21,00,23,00,"PSI_TEMPLE_STAIRS_02");	
};

FUNC VOID Rtn_Drained_1200 () 
{
	TA_Drained_YBerion	(23,00,21,00,"PSI_TEMPLE_STAIRS_02");
    TA_Drained_YBerion	(21,00,23,00,"PSI_TEMPLE_STAIRS_02");	
};

FUNC VOID Rtn_dead_1200 () 
{
	TA_Drained_YBerion	(23,00,21,00,"PSI_TEMPLE_ROOMS_IN_03");
    TA_Drained_YBerion	(21,00,23,00,"PSI_TEMPLE_ROOMS_IN_03");	
};
