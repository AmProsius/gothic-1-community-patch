func void B_Orc_AssessSomethingEvil()
{
	PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssessSomethingEvil" );

	Npc_PercDisable( self, PERC_ASSESSTHREAT );		//vermeide Selbst-Aufrufe!	

	//wenn ein Nicht-Ork die Waffe zieht
	if ( other.guild < GIL_SEPERATOR_ORC )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssessSomethingEvil: other ist Nicht-Ork" );

		//Temp-Attitude eins hochsetzen
		var int att;
		att = Npc_GetPermAttitude( self, other );
		if ( att == ATT_ANGRY )
		{
			Npc_SetTempAttitude( self, ATT_HOSTILE );
		}
		else if ( att == ATT_NEUTRAL )
		{
			Npc_SetTempAttitude( self, ATT_ANGRY );
		}
		else if ( att == ATT_FRIENDLY )
		{
			Npc_SetTempAttitude( self, ATT_NEUTRAL );
		};

//		Npc_ClearAIQueue( self );
//		AI_StandUp( self );
//		B_Orc_ObserveIntruder();
	};

};
