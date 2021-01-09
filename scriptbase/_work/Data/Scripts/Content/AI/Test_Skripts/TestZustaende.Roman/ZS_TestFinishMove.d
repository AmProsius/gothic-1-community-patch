func void ZS_TestFinishMove ()
{
	var C_NPC enemy;
	enemy = Hlp_GetNpc( SLD3_Testmodell );
	
	Npc_SetTarget( self, enemy );
};	

func void ZS_TestFinishMove_Loop ()
{
	AI_Attack( self );
	
	var C_NPC enemy;
	enemy = Hlp_GetNpc( SLD3_Testmodell );
	if ( Npc_IsInState( enemy, ZS_UNCONSCIOUS ) )
	{
		Print( "DIE SUCKER !!!");
		AI_FinishingMove( self, enemy );
	};
};

func void ZS_TestFinishMove_End ()
{
};

