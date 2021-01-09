instance ORC_2200_Shaman (Mst_Default_OrcShaman)
{
	//-------- primary data --------
	name 		=		"Ur-Shak";
	Npctype 	=		NPCTYPE_FRIEND;
	flags	 	=		NPC_FLAG_IMMORTAL;
	guild 		=		GIL_NONE;
	level 		=		25;
	 	
	voice 		=		17;
	id 			=		2200;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	75;
	attribute[ATR_DEXTERITY] 		=	75;
	attribute[ATR_MANA_MAX] 		=	100;
	attribute[ATR_MANA] 			=	100;
	attribute[ATR_HITPOINTS_MAX] 	=	400;
	attribute[ATR_HITPOINTS] 		=	400;

	//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	90;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	90;
	protection	[PROT_MAGIC]		=	0;
	 	
	Mdl_SetVisual			(self,	"Orc.mds");
	Mdl_SetVisualBody		(self,	"Orc_BodyShaman",DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- Talente --------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);

	//-------- inventory --------
	EquipItem			(self,	ItRwOrcstaff);		// für Magiemodus
	CreateInvItem		(self,	ItArRuneFireball);
  	  
	//------------- ai -------------
	daily_routine 	= Rtn_FMTaken_2200;
	senses 			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_FMTaken_2200 ()
{
	TA_Stay		(07,00,12,00,"CASTLE_06");
	TA_Stay		(12,00,07,00,"CASTLE_06");
};

FUNC VOID Rtn_LeftFM_2200 ()
{
	TA_Stay		(07,00,12,00,"SPAWN_OW_WARAN_ORC_01");
	TA_Stay		(12,00,07,00,"SPAWN_OW_WARAN_ORC_01");
};
