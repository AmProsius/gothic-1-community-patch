func void ZS_ObservePerson ()
// 25.5.00 Ist wie Konzept und klappt
{	
	PrintDebugNpc( PD_ZS_FRAME, "ZS_ObservePerson" );		
	C_ZSInit();		

	Npc_PercEnable  ( self, PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  ( self, PERC_ASSESSFIGHTER		,	B_AssessFighter		);

	Npc_PercEnable  ( self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  ( self, PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  ( self,	PERC_DRAWWEAPON			,	B_AssessFighter		);
	Npc_PercEnable  ( self, PERC_ASSESSWARN			, 	B_AssessWarn 		);
	Npc_PercEnable  ( self, PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  ( self, PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  ( self, PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  ( self, PERC_CATCHTHIEF			,	ZS_CatchThief 		);
	Npc_PercEnable  ( self, PERC_ASSESSTHEFT		,	B_AssessTheft 		);
	Npc_PercEnable  ( self, PERC_OBSERVEINTRUDER	,	B_ObserveIntruder 	);
	Npc_PercEnable  ( self, PERC_ASSESSTALK			,	B_AssessTalk 			);
	Npc_PercEnable  ( self, PERC_ASSESSCALL			,	ZS_ReactToCall		);
	

	C_LookAtNpc 	(self,other);
};

func int  ZS_ObservePerson_Loop ()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_ObservePerson_Loop" );				
	if (Npc_GetStateTime ( self) > 5)
	{
		return 1;
	};
};

func void ZS_ObservePerson_End ()
{	
	PrintDebugNpc	( PD_ZS_LOOP, "ZS_ObservePerson_End" );				
	C_StopLookAt ( self);
};