/*************************************************************************
**	Zombie Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Zombie(C_Npc)			
{
	name							=	"Zombie";
	guild							=	GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID]			= 	ID_ZOMBIE;
	level							=	20;
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	140;
	attribute	[ATR_DEXTERITY]		=	140;
	
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	130;
	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	9999;	// immun
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	100;
//-----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-----------------------------------------------------------
	fight_tactic							=	FAI_ZOMBIE;
//-----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= HUNTER;
	
	aivar[AIV_MM_PercRange]		= 2000;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
// Zwei Hautfarben mit jeweils zwei Gesichtstexturen
//-------------------------------------------------------------
func void Set_Zombie_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie2_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie3_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie4_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		3,			-1);
};


/*************************************************************************
**	Zombie    															**
*************************************************************************/

INSTANCE Zombie		(Mst_Default_Zombie)
{
	Set_Zombie_Visuals();
	Npc_SetToFistMode(self);
};


/*************************************************************************
**	Zombie2   															**
*************************************************************************/

INSTANCE Zombie2	(Mst_Default_Zombie)
{
	Set_Zombie2_Visuals();
	Npc_SetToFistMode(self);
};


/*************************************************************************
**	Zombie3   															**
*************************************************************************/

INSTANCE Zombie3	(Mst_Default_Zombie)
{
	Set_Zombie3_Visuals();
	Npc_SetToFistMode(self);
};


/*************************************************************************
**	Zombie4   															**
*************************************************************************/

INSTANCE Zombie4	(Mst_Default_Zombie)
{
	Set_Zombie4_Visuals();
	Npc_SetToFistMode(self);
};

/*************************************************************************
**	ZombieOrkHunter														**
*************************************************************************/
// SN: Endgegner vor Fokus 5 unter dem Steinkreis (Ende Kapitel 3)
INSTANCE ZombieTheKeeper	(Mst_Default_Zombie)
{
	name	= "The Guardian";
	level	=	150;		// für XP!
	ID 		= MID_THEKEEPER;

	Set_Zombie4_Visuals();
	Npc_SetToFistMode(self);

	protection	[PROT_BLUNT]		=	150;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_FIRE]			=	9999;	//immun

	senses_range					= 1000;

	aivar[AIV_MM_Behaviour]			= HUNTER;
	
	aivar[AIV_MM_PercRange]			= 1000;
	aivar[AIV_MM_DrohRange]			= 1000;
	aivar[AIV_MM_AttackRange]		= 1000;
	aivar[AIV_MM_DrohTime]			= 0;
	aivar[AIV_MM_FollowTime]		= 10;
	aivar[AIV_MM_FollowInWater] 	= FALSE;



	CreateInvItem	(self,	ItMi_OrcTalisman);
	CreateInvItem	(self,	ItKe_Focus5);
};
