/*************************************************************************
**	Demon Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Demon(C_Npc)			
{
	name							=	"Fire Demon";
	guild							=	GIL_DEMON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DEMON;
	level							=	50;
//--------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	75;
	attribute	[ATR_DEXTERITY]		=	75;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	35;
	protection	[PROT_FIRE]			=	500;
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	35;
//--------------------------------------------------------
	damagetype 						=	DAM_FIRE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//--------------------------------------------------------
	fight_tactic					=	FAI_DEMON;
	
//--------------------------------------------------------
	senses							=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range					=	3000;

	aivar[AIV_MM_Behaviour]			=	PASSIVE;
	
	aivar[AIV_MM_PercRange]			=	2800;
	aivar[AIV_MM_DrohRange]			=	2500;
	aivar[AIV_MM_AttackRange]		=	2000;
	aivar[AIV_MM_DrohTime]			=	3;
	aivar[AIV_MM_FollowTime]		=	10;
	aivar[AIV_MM_FollowInWater] 	=	TRUE;
	
//-------------------------------------------------------------
	start_aistate					=	ZS_MM_AllScheduler;

	//aivar[AIV_MM_RestStart] 		=	OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Demon_Visuals()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Demon    															**
*************************************************************************/

INSTANCE Demon (Mst_Default_Demon)
{
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
};


/*************************************************************************
**	Summoned Demon  													**
*************************************************************************/

INSTANCE SummonedByPC_Demon (Mst_Default_Demon)
{
	Set_Demon_Visuals();

	Npc_SetToFistMode(self);
	senses							= SENSE_HEAR | SENSE_SEE;
	start_aistate					= ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 400;
	self.aivar[AIV_MM_TimeLooseHP] 	= 1;
	self.aivar[AIV_MM_PARTYMEMBER]  = TRUE;
};

INSTANCE SummonedByNPC_Demon (Mst_Default_Demon)
{
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
//---------------------------------------
	start_aistate	=	ZS_MM_Summoned;
};



/*************************************************************************
**	Xardas' zahmer Dämon    															**
*************************************************************************/

INSTANCE XardasDemon (Mst_Default_Demon)
{
	flags 					= NPC_FLAG_IMMORTAL;
	npctype					= NPCTYPE_FRIEND;
	guild					= GIL_DEMON;

	aivar[AIV_MM_REAL_ID]	= ID_DEMON;

	Set_Demon_Visuals();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_XardasDemon;	//Einsetzen bei WP "DT_E1_06"
};


/*************************************************************************
**	OTDemon    															**
*************************************************************************/

INSTANCE OTDemon (Mst_Default_Demon)
{
	name							=	"Lesser Demon";
	guild							=	GIL_DEMON;
	level							=	60;
//--------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	130;
	attribute	[ATR_DEXTERITY]		=	130;
	
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_EDGE]			=	70;
	protection	[PROT_POINT]		=	70;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	70;
	protection	[PROT_MAGIC]		=	35;
//--------------------------------------------------------
	damagetype 						=	DAM_EDGE;

//--------------------------------------------------------
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
};

