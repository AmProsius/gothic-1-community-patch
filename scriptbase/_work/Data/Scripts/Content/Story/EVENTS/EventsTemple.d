FUNC VOID EVT_TPL_01_FUNC_01 ()
{
	Wld_InsertNpc		(SKELETON,"EVT_TPL_01_SPAWN_01");
	Wld_InsertNpc		(SKELETON,"EVT_TPL_01_SPAWN_02");
};

FUNC VOID EVT_TPL_07_FUNC_01 ()
{
	Wld_InsertNpc  		(OTDEMON,"TPL_096");
};
 
FUNC VOID EVT_TPL_07_FUNC_02 ()
{
	Wld_InsertNpc  		(OTDEMON,"TPL_096");
};

FUNC VOID EVT_TPL_07_FUNC_03 ()
{
	Wld_InsertNpc		(ORC_PRIEST_2,"TPL_096");
};

func VOID EVT_TPL_08_FUNC_01 ()
{
	Wld_InsertNpc		(ORC_PRIEST_3,"TPL_124");
};



// *****************************************************************
// *                 RAUM ZU BESTER WAFFE ÖFFNET SICH              *
// *****************************************************************
FUNC VOID EVT_TPL_13_FUNC_01 ()
{
	Wld_InsertNpc		(OTMINECRAWLER,"EVT_TPL_13_SPAWN_RIGHT_03");
	Wld_InsertNpc		(OTMINECRAWLER,"EVT_TPL_13_SPAWN_RIGHT_04");
	Wld_InsertNpc		(OTMINECRAWLER,"EVT_TPL_13_SPAWN_LEFT_03");

};

FUNC VOID EVT_TPL_13_FUNC_02 ()
{
/*
	Wld_InsertNpc		(SWAMPSHARK,"EVT_TPL_13_SPAWN_RIGHT_01");
	Wld_InsertNpc		(SWAMPSHARK,"EVT_TPL_13_SPAWN_LEFT_01");
*/
};

FUNC VOID EVT_TPL_13_FUNC_03 ()
{
	Wld_InsertNpc		(OTDEMON,"EVT_TPL_13_SPAWN_FP_ROAM_ROOMRIGHT_01");
	Wld_InsertNpc		(OTDEMON,"EVT_TPL_13_SPAWN_FP_ROAM_ROOMLEFT_02");
	Wld_InsertNpc		(OTDEMON,"EVT_TPL_13_SPAWN_FP_ROAM_ROOMCENTER_01");
};

FUNC VOID EVT_TPL_16_FUNC_01 ()
{
	Wld_InsertNpc		(OTDEMON,"EVT_TPL_16_SPAWN_01");
};



// *****************************************************************
// *                 			ENDKAMPF                           *
// *****************************************************************
func VOID EVT_TPL_SLEEPERDEMON_01 ()
{
	AI_PlayAni 	( SLEEPER, "T_HURT" );
	Wld_InsertNpc	( DEMONLORD,"TPL_410" );
};

FUNC VOID EVT_TPL_SLEEPERDEMON_02 ()
{	
	AI_PlayAni 	( SLEEPER, "T_HURT" );
	Wld_InsertNpc	( DEMONLORD,"TPL_389" );
};

FUNC VOID EVT_TPL_SLEEPERDEMON_03 ()
{	 	
	AI_PlayAni 	( SLEEPER, "T_HURT" );
	Wld_InsertNpc	( DEMONLORD,"TPL_391" );
};

FUNC VOID EVT_TPL_SLEEPERDEMON_04 ()
{		
	AI_PlayAni 	( SLEEPER, "T_HURT" );
	Wld_InsertNpc	( DEMONLORD,"TPL_409" );
};

FUNC VOID EVT_TPL_SLEEPERDEMON_05 ()
{		
	AI_PlayAni 	( SLEEPER, "T_HURT" );
	Wld_InsertNpc	( DEMONLORD,"TPL_390" );
};