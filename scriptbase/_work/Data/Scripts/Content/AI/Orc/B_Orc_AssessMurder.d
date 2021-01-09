func void B_Orc_AssessMurder()
{
	PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssesMurder" );
	
	//wenn ein Ork vom Player umgebracht wurde, Attitude auf HOSTILE
	if ( victim.guild > GIL_SEPERATOR_ORC  &&  Npc_IsPlayer( other ) )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssesMurder: Spieler hat Ork gekillt -> RAAAAAAAAAACHE!" );
		AI_TurnToNpc( self, other );
		if ( Hlp_Random( 10 ) < 5 )
		{
			AI_PlayAni( self, "T_ANGRY");
		};
		Npc_SetAttitude( self, ATT_HOSTILE );
		Npc_SetTempAttitude( self, ATT_HOSTILE );
		return;
	}
	//wenn Opfer ein Ork oder OrkHund, greife den Killer an
	else if ( victim.guild > GIL_SEPERATOR_ORC  ||  victim.guild == GIL_ORCDOG )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssesMurder: ein Ork(Hund) ist tot -> RAAAAAAAAAACHE!" );
		AI_TurnToNpc( self, other );
		if ( Hlp_Random( 10 ) < 5 )
		{
			AI_PlayAni( self, "T_ANGRY");
		}
		else if ( Hlp_Random( 10 ) < 5 )
		{
			B_Say( self, other, "$NEVERTRYTHATAGAIN" );
		};
		AI_StartState( self, ZS_Orc_Attack, 1, "" );		
	}
	//ansonsten Jubel (da Kaempfer-Natur)
	else if ( Npc_CanSeeNpc( self, other ) )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssesMurder: irgendwas ist tot -> cooool" );
		B_Say( self, NULL, "$CHEERFIGHT" );
		AI_PlayAni( self, "T_HAPPY" );
	};
};
