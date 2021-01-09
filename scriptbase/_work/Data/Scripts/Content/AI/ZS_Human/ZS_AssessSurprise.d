func void ZS_AssessSurprise	()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_AssessSurprise" );	
	C_ZSInit();
	Npc_PercEnable  ( self,	PERC_ASSESSDAMAGE  		,	ZS_ReactToDamage	);		
	Npc_PercEnable  ( self, PERC_ASSESSMAGIC		,	B_AssessMagic		);		
	Npc_PercEnable  ( self,	PERC_ASSESSWARN			, 	B_AssessWarn 		);		
	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  ( self,	PERC_CATCHTHIEF			,	ZS_CatchThief 		);		
	Npc_PercEnable  ( self, PERC_OBSERVEINTRUDER	,	B_ObserveIntruder 	);	
	Npc_PercEnable  ( self, PERC_ASSESSTALK			,	B_AssessTalk 		);		

	if (Npc_GetDistToNpc(self, other) < PERC_DIST_DIALOG)
	{
		PrintDebugNpc		(PD_ZS_CHECK, "ZS_AssessSurprise dist Flee" );
		B_WhirlAround 		(self, other);
		B_Say				(self, other, "$WHATSTHAT");

		if	(Npc_GetAttitude(self, other) == ATT_HOSTILE)
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...Überrascher ist feindlich!");
			B_AssessEnemy	();
		}
		else
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...Überrascher ist NICHT feindlich!");
			B_AssessSC		();
		};
	}
	else
	{
		PrintDebugNpc		(PD_ZS_CHECK, ">= Dist Flee");	
		AI_Quicklook		(self, other);
		if (Npc_GetTempAttitude(self, other) == ATT_HOSTILE)
		{
			B_AssessEnemy	();
		};
	};
	AI_ContinueRoutine		(self);
};
	
	

