//************************************************************************************************
// JP: Die Wahrnehmung ObsereveSuspect könnte raus und der schleichende über ObserveIntruder 
// und AssessSc identizifiert werden, wenn wir bei 0,5 sec für die aktiven Wahrnehmungen bleiben
// können
//************************************************************************************************
func void ZS_ObserveSuspect ()
{	
	PrintDebugNpc		( PD_ZS_FRAME, "ZS_ObserveSuspect" );			
	C_ZSInit();	

	Npc_PercEnable  	( self, PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  	( self, PERC_ASSESSFIGHTER		,	B_AssessFighter		);

	Npc_PercEnable    	( self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);		
	Npc_PercEnable    	( self, PERC_ASSESSMAGIC		,	B_AssessMagic		);		
	Npc_PercEnable  	( self,	PERC_DRAWWEAPON			, 	B_AssessFighter		);		
	Npc_PercEnable    	( self, PERC_OBSERVEINTRUDER	,	B_ObserveIntruder 	);	
	Npc_PercEnable    	( self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	// JP : Weil der Warn meistens von einer zweiten Person kommt, die direkt in der Nähe steht und so den Beobachtenden wieder rausreißt
	// JP: außerdem ist der Spieler sowieso der einzige, der Warns verursacht, ide für die AI wichtig sind
	//Npc_PercEnable    	(self,	PERC_ASSESSWARN			, 	B_AssessWarn 		);		
	Npc_PercEnable    	( self,	PERC_CATCHTHIEF			,	ZS_CatchThief 		);		
	Npc_PercEnable    	( self, PERC_ASSESSTALK			,	B_AssessTalk 			);		
	Npc_PercEnable    	( self, PERC_ASSESSTHREAT		,	B_AssessThreat		);
	Npc_PercEnable  	( self,	PERC_ASSESSUSEMOB		,	B_AssessUseMob 		);
	Npc_PercEnable  	( self,	PERC_ASSESSENTERROOM	,	B_AssessEnterRoom	);

	// JP: Irgendwie sah es mit dem B_SmartTurnToNpc nicht aus, deshalb hier die beiden Einzelbefehle
	AI_TurnToNpc		( self, other);
	AI_LookAtNpc		( self, other);
	AI_PointAtNpc		( self,	other);
	B_Say 				( self, 	other,	"$WHATSTHISSUPPOSEDTOBE");
	Npc_SendPassivePerc ( self, 	PERC_ASSESSWARN, self, other);
	// Jp: AUf beide Hostile Typen geändert
	if ((Npc_GetTempAttitude ( self,other) == ATT_HOSTILE) || ( Npc_GetPermAttitude (self,other) == ATT_HOSTILE))
	{
		B_AssessEnemy	();
		return;
	};
	B_AssessSc 			();
	AI_StopPointAt	( self);
};

func int ZS_ObserveSuspect_Loop ()
{
	PrintDebugNpc		( PD_ZS_LOOP, "ZS_ObserveSuspect_Loop" );				
	// JP: Hier mal einen B_SmartTurn rein, weil die Funktion hier noch als Code stand
	B_SmartTurnToNpc	( self, other);
	
	if (	(Npc_GetDistToNpc	( self,	other) > PERC_DIST_INTERMEDIAT) || 
			(!C_BodyStateContains	( other, BS_SNEAK))					) 
	{
		PrintDebugNpc		( PD_ZS_LOOP, "... loop end" );				
		return LOOP_END;
	};
	
	AI_Wait				( self, 1);
	return LOOP_CONTINUE;
};

func void ZS_ObserveSuspect_End ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_ObserveSuspect_End" );				
	AI_StopPointAt		(self);
	C_StopLookAt		(self);
	AI_TurnToNpc		(self,	other);
	AI_ContinueRoutine 	(self);
};