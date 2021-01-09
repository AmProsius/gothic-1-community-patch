/*************************************************************************
**	Skeleton Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Skeleton(C_Npc)			
{
	name							=	"Skelett";
	guild							=	GIL_SKELETON;
	//REAL ID IN INSTANZEN!
	level							=	25;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;		
//----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//----------------------------------------------------------
	fight_tactic					=	FAI_SKELETON;
//----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 2000;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	//aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Skeleton_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonWarrior_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body3",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonScout_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body2",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonMage_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton_fly.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Fly_Body",	01,			DEFAULT,	"",			01,  		DEFAULT,	-1);
};


/*************************************************************************
**	Skeleton    														**
*************************************************************************/

INSTANCE Skeleton			(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};

/*************************************************************************
**	SkeletonSH - für die Gruft unter den Stonehenge (SH) 														**
*************************************************************************/

INSTANCE SkeletonSH			(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);

	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!

	protection	[PROT_FIRE]		= 40;

	senses_range				= 1000;

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1000;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 1000;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = FALSE;

};


/*************************************************************************
**	Skeleton   Scout													**
*************************************************************************/

INSTANCE SkeletonScout		(Mst_Default_Skeleton)
{
	name							=	"Skelett Späher";
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETONSCOUT;
	Set_SkeletonScout_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Scythe_01);

	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};


/*************************************************************************
**	Skeleton  Warrior													**
*************************************************************************/

INSTANCE SkeletonWarrior	(Mst_Default_Skeleton)
{
	name							=	"Skelett Krieger";
	Set_SkeletonWarrior_Visuals();
	level							=	30;
	attribute	[ATR_STRENGTH]		=	120;
	aivar		[AIV_MM_REAL_ID]	= 	ID_SKELETONWARRIOR;

	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};


/*************************************************************************
**	Skeleton   Mage 													**
*************************************************************************/

INSTANCE SkeletonMage		(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name					=	"Skelett Magier";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	50;
	
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;		


	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneThunderbolt);
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	5);

};


/*************************************************************************
**	Skeleton   Mage 	im Nebelturm									**
*************************************************************************/

INSTANCE SkeletonMage_fogtower		(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name					=	"Skelett Magier des Nebelturms";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	50;
	
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;		


	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneThunderbolt);
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	5);
	CreateInvItem			(self,	theriddle1);
};


/*************************************************************************
**	Summoned Skeleton    												**
*************************************************************************/

INSTANCE SummonedByPC_Skeleton	(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
//-----------------------------------------
	Set_Skeleton_Visuals();

//-----------------------------------------
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
	senses						= SENSE_HEAR | SENSE_SEE;
	start_aistate	=	ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 300;
	self.aivar[AIV_MM_TimeLooseHP] 	= 5;
	self.aivar[AIV_MM_PARTYMEMBER] = TRUE;
};

INSTANCE SummonedByNPC_Skeleton	(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
//-----------------------------------------
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
//-----------------------------------------
	start_aistate	=	ZS_MM_Summoned;
};


/*************************************************************************
**	Summoned Skeleton Warrior											**
*************************************************************************/

INSTANCE SummonedByPC_SkeletonWarrior (Mst_Default_Skeleton)
{
	name							=	"Skelett Krieger";
	level							=	30;
	attribute	[ATR_STRENGTH]		=	120;
	senses						= SENSE_HEAR | SENSE_SEE;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETONWARRIOR;
//------------------------------------------
	Set_SkeletonWarrior_Visuals();

//------------------------------------------
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
	start_aistate	=	ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 300;
	self.aivar[AIV_MM_TimeLooseHP] 	= 5;
	self.aivar[AIV_MM_PARTYMEMBER] = TRUE;
};

INSTANCE SummonedByNPC_SkeletonWarrior (Mst_Default_Skeleton)
{
	name							=	"Skelett Krieger";
	level							=	30;
	attribute	[ATR_STRENGTH]		=	120;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETONWARRIOR;
//------------------------------------------
	Set_SkeletonWarrior_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
//------------------------------------------
	start_aistate	=	ZS_MM_Summoned;
};



