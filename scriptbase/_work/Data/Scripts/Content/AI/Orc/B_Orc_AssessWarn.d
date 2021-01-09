func void B_Orc_AssessWarn()
{
	PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssessWarn" );

/*
	if ( Npc_GetDistToNpc( self, other ) > 1500)
	{
		return;		//damit nicht das ganze Lager angerannt kommt
	};	
*/
	if ( C_NpcIsOrc(victim))
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssessWarn: Von Ork geschickt -> hingehen" );
		Npc_ClearAIQueue( self );
		AI_StandUpQuick( self );
		AI_SetWalkmode( self, NPC_RUN );	
		if ( !Npc_HasReadiedWeapon( self ) )//waffe ziehen!!!
		{
			AI_EquipBestMeleeWeapon( self );
			AI_DrawWeapon( self );
		};

/*
		//wenn kein FP in der Naehe, gehe zum "Warner"
		if ( Wld_IsFPAvailable( self, "FP_ORC_GUARD" ) )
		{
			AI_GotoFP( self, "FP_ORC_GUARD" );
		}
		else
		{
*/
			AI_GotoNpc( self, victim );
//		};

		//spiele Waechter
//		AI_StartState( self, ZS_Orc_Guard, 0, "" );
	};
};
