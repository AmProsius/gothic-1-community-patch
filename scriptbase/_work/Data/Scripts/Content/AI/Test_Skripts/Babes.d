
// Insgesamt gibt es 7 verschiedene Babegesichter und 6 verschiedene Körpertexturen
// werden mehr als 7 Babes benötigt?


///////////////////////////////////////////////////////
// Color 0: davon gibt's nur eine. PSI-Babe!? ;-)
///////////////////////////////////////////////////////

instance Babe (Npc_Default)
{
	//-------- primary data --------

	name =							"babe";
	guild =							GIL_NONE;
	level =							1;
	flags =							0;

	voice =							19;
	id =							110;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		6;
	attribute[ATR_DEXTERITY] =		8;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	10;
	attribute[ATR_HITPOINTS] =		10;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"Babe.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody	(self,	"Bab_body_Naked0",	0,			0,			"Bab_Head_Hair1",	0,			DEFAULT,	-1);


	fight_tactic	=	FAI_HUMAN_COWARD;

	
	//-------------Daily Routine-------------
};


///////////////////////////////////////////////////////
// Color 1: drei Körpertexturen, vier Kopftexturen
///////////////////////////////////////////////////////

instance Babe2 (Npc_Default)
{
	//-------- primary data --------

	name =							"babe2";
	guild =							GIL_NONE;
	level =							1;
	flags =							0;

	voice =							19;
	id =							110;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		6;
	attribute[ATR_DEXTERITY] =		8;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	10;
	attribute[ATR_HITPOINTS] =		10;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"Babe.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody	(self,	"Bab_body_Naked0",	0,			1,			"Bab_Head_Hair1",	0,			DEFAULT,	-1);


	fight_tactic	=	FAI_HUMAN_COWARD;

	CreateInvItem (self, BAB_ARMOR_NUDE);
	CreateInvItem (self, BAB_ARMOR_BIKINI);

	//-------------Daily Routine-------------
	start_aistate	= ZS_Babe_Sweep;
};




instance Babe3 (Npc_Default)
{
	//-------- primary data --------

	name =							"babe3";
	guild =							GIL_NONE;
	level =							1;
	flags =							0;

	voice =							19;
	id =							110;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		6;
	attribute[ATR_DEXTERITY] =		8;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	10;
	attribute[ATR_HITPOINTS] =		10;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"Babe.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody (self,	"Bab_body_Naked0",	1,			1,			"Bab_Head_Hair1",	1,			DEFAULT,	-1);


	fight_tactic	=	FAI_HUMAN_COWARD;


	//-------------Daily Routine-------------
	start_aistate	= ZS_Babe_SitAround;
};



instance Babe4 (Npc_Default)
{
	//-------- primary data --------

	name =							"babe4";
	guild =							GIL_NONE;
	level =							1;
	flags =							0;

	voice =							19;
	id =							110;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		6;
	attribute[ATR_DEXTERITY] =		8;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	10;
	attribute[ATR_HITPOINTS] =		10;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"Babe.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody (self,	"Bab_body_Naked0",	2,			1,			"Bab_Head_Hair1",	2,			DEFAULT,	-1);


	fight_tactic	=	FAI_HUMAN_COWARD;


	//-------------Daily Routine-------------
	start_aistate	= ZS_Babe_Dance;
};




instance Babe5 (Npc_Default)
{
	//-------- primary data --------

	name =							"babe5";
	guild =							GIL_NONE;
	level =							1;
	flags =							0;

	voice =							19;
	id =							110;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		6;
	attribute[ATR_DEXTERITY] =		8;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	10;
	attribute[ATR_HITPOINTS] =		10;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"Babe.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody (self,	"Bab_body_Naked0",	2,			1,			"Bab_Head_Hair1",	3,			DEFAULT,	-1);


	fight_tactic	=	FAI_HUMAN_COWARD;


	//-------------Daily Routine-------------
};



///////////////////////////////////////////////////////
// Color 2: nur eine Variante (Charlotte von VIVA 2)
///////////////////////////////////////////////////////

instance Babe6 (Npc_Default)
{
	//-------- primary data --------

	name =							"babe6";
	guild =							GIL_NONE;
	level =							1;
	flags =							0;

	voice =							19;
	id =							110;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		6;
	attribute[ATR_DEXTERITY] =		8;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	10;
	attribute[ATR_HITPOINTS] =		10;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"Babe.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody (self,	"Bab_body_Naked0",	0,			2,			"Bab_Head_Hair1",	0,			DEFAULT,	-1);


	fight_tactic	=	FAI_HUMAN_COWARD;


	//-------------Daily Routine-------------
};



///////////////////////////////////////////////////////
// Color 3: nur eine Variante
///////////////////////////////////////////////////////

instance Babe7 (Npc_Default)
{
	//-------- primary data --------

	name =							"babe7";
	guild =							GIL_NONE;
	level =							1;
	flags =							0;

	voice =							19;
	id =							110;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		6;
	attribute[ATR_DEXTERITY] =		8;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	10;
	attribute[ATR_HITPOINTS] =		10;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"Babe.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody (self,	"Bab_body_Naked0",	0,			3,			"Bab_Head_Hair1",	0,			DEFAULT,	-1);


	fight_tactic	=	FAI_HUMAN_COWARD;


	//-------------Daily Routine-------------
};




