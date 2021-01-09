
func void ZS_OrcSlave_AssessDamage()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcSlave_AssessDamage: Weglaufen " );
	
	AI_TurnToNpc( self, other );
	AI_Dodge( self );
	AI_PlayAni( self, "T_FRIGHTENED" );

	//festlegen, vor wem gefluechtet werden soll
	Npc_SetTarget( self, other );
};


func int ZS_OrcSlave_AssessDamage_Loop()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcSlave_AssessDamage_Loop: Weglaufen " );
	
	if ( Npc_GetDistToNpc( self, other ) > 1200 )
	{
		//schluss jetzt mit weglaufen
		return 1;
	};
	
	AI_Flee( self );
	return 0;
};


func void ZS_OrcSlave_AssessDamage_End()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_OrcSlave_AssessDamage_End" );

	Npc_ClearAIQueue( self );
	AI_StandUp( self );
	AI_ContinueRoutine( self );
};
