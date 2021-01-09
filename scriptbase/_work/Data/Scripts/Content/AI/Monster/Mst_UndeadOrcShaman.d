/*************************************************************************
**	Undead Orc Shaman Prototype											**
*************************************************************************/

PROTOTYPE Mst_Default_UndeadOrcShaman (C_Npc)			
{
	name							=	"Hohepriester";
	guild							=	GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_UNDEADORCSHAMAN;
	level							=	30;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	190;
	attribute	[ATR_DEXTERITY]		=	190;
	
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;

	attribute	[ATR_MANA_MAX] 		=	75;
	attribute	[ATR_MANA] 			=	75;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	9999;	// immun
	protection	[PROT_EDGE]			=	9999;	// immun
	protection	[PROT_POINT]		=	9999;	// immun
	protection	[PROT_FIRE]			=	9999;	// immun
	protection	[PROT_FLY]			=	9999;	// immun
	protection	[PROT_MAGIC]		=	150;
//----------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
	fight_tactic					=	FAI_HUMAN_MAGE;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_UndeadOrcShaman_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"UOS_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Undead Orc Shaman 		 											**
*************************************************************************/

INSTANCE UndeadOrcShaman	(Mst_Default_UndeadOrcShaman)
{
	Set_UndeadOrcShaman_Visuals();
	EquipItem		(self,	ItRwUdOrcstaff);		// für Magiemodus
	CreateInvItem	(self,	ItArRuneBreathOfDeath);
	CreateInvItems	(self,	ItArScrollSummonGolem,	20);

};

