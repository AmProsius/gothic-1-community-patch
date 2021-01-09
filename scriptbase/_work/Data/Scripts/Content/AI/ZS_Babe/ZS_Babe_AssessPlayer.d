func void ZS_Babe_AssessPlayer ()
{	
	PrintDebugNpc	( PD_ZS_FRAME, "ZS_Babe_AssessPlayer" );

// falls noch die Nacktrüstung angezogen ist, ausziehen!
	AI_UnequipArmor (self);

	B_SetBabeDefaultPerceptions();
	C_LookAtNpc		(self, other );
};

func int ZS_Babe_AssessPlayer_Loop ()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_Babe_AssessPlayer_Loop" );
	if (!Npc_CanSeeNpc	( self, other))
	{
		B_SmartTurnToNpc (self, other);
	};
	if ( Npc_GetDistToNpc( self, other ) > PERC_DIST_DIALOG ) 
	{
		C_StopLookAt( self );
		AI_ContinueRoutine( self );
	};	
	return 0;
	
};

func void ZS_Babe_AssessPlayer_End ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Babe_AssessPlayer_End" );
};





	
	