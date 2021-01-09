func void B_Orc_DrawWeapon()
{
	PrintDebugNpc( PD_ORC_FRAME, "B_Orc_DrawWeapon" );
	
	//wenn ein Nicht-Ork die Waffe zieht
	if ( other.guild < GIL_SEPERATOR_ORC )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_DrawWeapon: Ein Nicht-Ork hat die Waffe gezogen!" );
		
		AI_TurnToNpc( self, other );
		if ( Hlp_Random( 20 ) < 4 )		//Say sollte nicht immer kommen
		{
			B_Say( self, other, "$REMOVEYOURWEAPON" );
		};
		
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
	};
};
