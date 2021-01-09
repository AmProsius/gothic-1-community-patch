func void B_Orc_SmartTurn ()
{
	PrintDebugNpc( PD_ORC_FRAME, "B_Orc_SmartTurn" );
	
	AI_LookAtNpc( self, other );

	if ( Npc_GetBodyState( self ) != BS_SIT  &&  !Npc_CanSeeNpc( self, other ) )
	{
		AI_TurnToNpc( self, other);
	};
};
