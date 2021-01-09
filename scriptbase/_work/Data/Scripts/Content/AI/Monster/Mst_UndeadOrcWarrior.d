/*************************************************************************
**	Undead Orc Warrior Prototype										**
*************************************************************************/

PROTOTYPE Mst_Default_UndeadOrcWarrior (C_Npc)			
{
	name							=	"Tempelwächter";
	guild							=	GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_UNDEADORCWARRIOR;
	level							=	25;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	50; //9999;	//immun
	protection	[PROT_EDGE]			=	50; //9999;	//immun
	protection	[PROT_POINT]		=	25; //9999;	//immun
	protection	[PROT_FIRE]			=	50; //9999;	//immun
	protection	[PROT_FLY]			=	50; //9999;	//immun
	protection	[PROT_MAGIC]		=	50; //120;
//----------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
	fight_tactic					=	FAI_ORC;
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

	//aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------

func void Set_UndeadOrcWarrior_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"UOW_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Orc Warrior Undead    												**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

INSTANCE UndeadOrcWarrior (Mst_Default_UndeadOrcWarrior)
{
	Set_UndeadOrcWarrior_Visuals();
	EquipItem 				(self, ItMw2hOrcMace01);
};


INSTANCE UndeadOWH (Mst_Default_UndeadOrcWarrior)
{
	name							=	"Hoher Tempelwächter";
	level							=	40;

	attribute	[ATR_STRENGTH]		=	120;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	70; //9999;	//immun
	protection	[PROT_EDGE]			=	70; //9999;	//immun
	protection	[PROT_POINT]		=	35; //9999;	//immun
	protection	[PROT_FIRE]			=	70; //9999;	//immun
	protection	[PROT_FLY]			=	70; //9999;	//immun
	protection	[PROT_MAGIC]		=	70; //120;
	
	Set_UndeadOrcWarrior_Visuals();
	EquipItem 				(self, ItMw2hOrcMace01);
};