func int ZS_Orc_WatchFight()
{
	PrintDebugNpc( PD_ORC_FRAME, "ZS_Orc_WatchFight" );
	
	Npc_PercEnable( self, PERC_ASSESSOTHERSDAMAGE,	B_Orc_CheerFight );
	Npc_PercEnable( self, PERC_ASSESSENEMY,			B_Orc_ObserveIntruder );
	Npc_PercEnable( self, PERC_ASSESSDAMAGE,		B_Orc_AssessDamage );
	Npc_PercEnable( self, PERC_ASSESSMURDER,		B_Orc_AssessMurder );
	Npc_PercEnable( self, PERC_ASSESSDEFEAT,		B_Orc_AssessDefeat );
	Npc_PercEnable( self, PERC_ASSESSTHREAT,		B_Orc_AssessSomethingEvil );
	Npc_PercEnable( self, PERC_ASSESSCASTER,		B_Orc_AssessSomethingEvil );
	Npc_PercEnable( self, PERC_ASSESSMAGIC,			B_AssessMagic );	//B_Orc_AssessMagic
	Npc_PercEnable( self, PERC_ASSESSWARN,			B_Orc_AssessWarn );


	//wenn Ork-Sklave angegriffen wird, keine Reaktion (da dieser sofort weg rennt)
	if ( (other.guild == GIL_ORCSLAVE)  ||  (victim.guild == GIL_ORCSLAVE) )
	{
		PrintDebugNpc( PD_ORC_FRAME, "ZS_Orc_WatchFight: Orc-Slave -> Abbruch" );
		AI_ContinueRoutine( self );
		return 0;		//Abbruch
	};

	//evtl. Kommmentar geben
	if ( Hlp_Random( 20 ) < 4 )
	{
		AI_PointAtNpc( self, other );
		B_Say( self, NULL, "$THERESAFIGHT" );
	};

	AI_StandUp( self );
	
	//wenn HOSTILE|ANGRY -> Angriff
	if ( Npc_GetAttitude( self, other ) == ATT_HOSTILE  ||  Npc_GetAttitude( self, other ) == ATT_ANGRY )
	{
		PrintDebugNpc( PD_ORC_FRAME, "ZS_Orc_WatchFight: other HOSTILE|ANGRY -> Angriff!" );
		AI_StartState( self, ZS_Orc_Attack, 0, "" );
		return 0;	//Abbruch
	};
	if ( Npc_GetAttitude( self, victim ) == ATT_HOSTILE  ||  Npc_GetAttitude( self, victim ) == ATT_ANGRY )
	{
		PrintDebugNpc( PD_ORC_FRAME, "ZS_Orc_WatchFight: victim HOSTILE|ANGRY -> Angriff!" );
		var int i;
		i = Hlp_GetInstanceID( victim );
		other = Hlp_GetNpc( i );
		AI_StartState( self, ZS_Orc_Attack, 0, "" );
		return 0;	//Abbruch
	};

	//wenn Distanz-Waffen-Angriff auf einen Ork, direkt angreifen
	if ( Npc_HasReadiedRangedWeapon ( other )  &&  other.guild < GIL_SEPERATOR_ORC  &&  
		 ( victim.guild > GIL_SEPERATOR_ORC  ||  victim.guild == GIL_ORCDOG )  )
	{
		AI_StartState( self, ZS_Orc_Attack, 0, "" );
		return 0;	//Abbruch
	};	

	Npc_ClearAIQueue( self );
	Npc_SetPercTime( self, 1 );
	AI_GotoNpc( self, other );		//immer hingehen
	
	return 1;	//Loop starten
};


func int ZS_Orc_WatchFight_Loop ()
{
	PrintDebugNpc( PD_ORC_LOOP, "ZS_Orc_WatchFight_Loop" );


	//falls Attituden-Aenderung zwischendurch: wenn HOSTILE|ANGRY -> Angriff
	if ( Npc_GetAttitude( self, other ) == ATT_HOSTILE  ||  Npc_GetAttitude( self, other ) == ATT_ANGRY )
	{
		PrintDebugNpc( PD_ORC_FRAME, "ZS_Orc_WatchFight: other HOSTILE|ANGRY -> Angriff!" );
		AI_StartState( self, ZS_Orc_Attack, 0, "" );
		return 0;	//Abbruch
	};
	if ( Npc_GetAttitude( self, victim ) == ATT_HOSTILE  ||  Npc_GetAttitude( self, victim ) == ATT_ANGRY )
	{
		PrintDebugNpc( PD_ORC_FRAME, "ZS_Orc_WatchFight: victim HOSTILE|ANGRY -> Angriff!" );
		var int i;
		i = Hlp_GetInstanceID( victim );
		other = Hlp_GetNpc( i );
		AI_StartState( self, ZS_Orc_Attack, 0, "" );
		return 0;	//Abbruch
	};


	//hingehen, wenn weit weg, aber nicht, wenn zu weit
	if ( Npc_GetDistToNpc( self, other ) > (PERC_DIST_WATCHFIGHT+200)  &&
		 Npc_GetDistToNpc( self, other ) < (PERC_DIST_WATCHFIGHT*2) )
	{
		PrintDebugNpc( PD_ORC_LOOP, "ZS_Orc_WatchFight_Loop: gehe wieder naeher heran" );
		Npc_ClearAIQueue( self );
		AI_GotoNpc( self, other );
		AI_Dodge( self );
		return 0;		//raus, bleibe in Loop
	};

	
	//Mindestabstand einhalten bitteschoen!
	if ( Npc_GetDistToNpc( self, other ) < (PERC_DIST_WATCHFIGHT/2) )
	{
		Npc_ClearAIQueue( self );
		AI_StandUp( self );
		AI_Dodge( self );
	};

	//stets ausrichten! (absichtlich kein Orc_SmartTurn, sieht so besser aus)
	AI_TurnToNpc( self, other );		//nicht abwechselnd other/victim, damit kein "Gezappel"

	//Kampf beendet (jmd tot oder bewusstlos oder beide nicht mehr im FightModus)?
	if ( !Hlp_IsValidNpc( other ) || !Hlp_IsValidNpc( victim )  ||
		 Npc_IsDead( other ) || Npc_IsDead( victim )  || 		 
	     Npc_IsInState( other, ZS_Unconscious ) || Npc_IsInState( victim, ZS_Unconscious )  ||
	     ( !Npc_IsInFightMode( other, FMODE_FIST )  &&  !Npc_IsInFightMode( other, FMODE_MAGIC )  && !Npc_HasReadiedWeapon( other )  &&
		   !Npc_IsInFightMode( victim, FMODE_FIST )  &&  !Npc_IsInFightMode( victim, FMODE_MAGIC )  && !Npc_HasReadiedWeapon( victim ) 
		 )
       )
	{
		PrintDebugNpc( PD_ORC_LOOP, "ZS_Orc_WatchFight_Loop: einer der Kaempfer tot oder bewusstlos" );
		Npc_ClearAIQueue( self );
		return 1;	//Abbruch Loop
	};

	//hin & wieder Jubel zwischendurch
	if ( Hlp_Random( 100 ) < 10 )  
	{
		PrintDebugNpc( PD_ORC_LOOP, "ZS_Orc_WatchFight_Loop: Jubel" );
		AI_TurnToNpc( self, other );
		B_Say( self, NULL, "$HEYHEYHEY" );
	};

	// Random Anim
	var int anim;
	anim = Hlp_Random( 100 );
	if 		( anim < 5  )   {	AI_PlayAni( self, "T_DANCE_RANDOM1" );			}
	else if	( anim < 10 )	{	AI_PlayAni( self, "T_ANGRY" ); 					}
	else if	( anim < 15 )	{	AI_PlayAni( self, "T_HAPPY" );					}
	else if ( anim < 20 ) 	{	AI_PlayAni( self, "T_DCBITE" );					};
	
	return 0;	//bleibe in Loop
};



func void ZS_Orc_WatchFight_End ()
{	
	PrintDebugNpc		( PD_ORC_FRAME, "ZS_Orc_WatchFight_End" );
	Npc_ClearAIQueue	( self );
	Npc_SetPercTime		( self, 3 );
	AI_StandUp 			( self );
	AI_ContinueRoutine 	( self );
};
