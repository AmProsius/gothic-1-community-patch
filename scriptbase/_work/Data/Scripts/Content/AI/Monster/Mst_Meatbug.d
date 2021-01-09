/*************************************************************************
**	Meatbug Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Meatbug(C_Npc)			
{
	name							=	"Fleischwanze";
	guild							=	GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID]			= 	ID_MEATBUG;
	level							=	1;
//-------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	1;
	attribute	[ATR_DEXTERITY]		=	1;
	
	attribute	[ATR_HITPOINTS_MAX]	=	10;
	attribute	[ATR_HITPOINTS]		=	10;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//-------------------------------------------------------
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//-------------------------------------------------------
	damagetype 						= 	DAM_EDGE;
//-------------------------------------------------------
//	fight_tactic					= ;		// kämpfen nicht!
//-------------------------------------------------------
	senses							= SENSE_SMELL;
	senses_range					= 500;		// 5m
	
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------
	start_aistate					= ZS_MM_AllScheduler;
		
	aivar[AIV_MM_WuselStart] 		= OnlyRoutine;
};
//-------------------------------------------------------
func void Set_Meatbug_Visuals()
{
	Mdl_SetVisual			(self,	"Meatbug.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mbg_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

};


/*************************************************************************
**	Meatbug    														**
*************************************************************************/

INSTANCE Meatbug	(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	//Npc_SetToFistMode(self);  //SN: damit der Kleine keine unnötigen PERC_ASSESSFIGHTER auslöst!
	
	CreateInvItems (self, ItAt_Meatbug_01, 1);
};
