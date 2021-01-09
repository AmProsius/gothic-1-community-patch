func void ZS_ReactToCall ()
// 8.5.00 Wie Konzept 22.5. Perceptionänderungen
{	
	PrintDebugNpc( PD_ZS_FRAME, "ZS_ReactToCall" );			
	C_ZSInit();	

	Npc_PercEnable  ( self, PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTER		,	B_AssessFighter		);

	Npc_PercEnable  ( self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  ( self, PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  ( self,	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  ( self,	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  ( self, PERC_DRAWWEAPON			,	B_AssessFighter		);
	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  ( self, PERC_ASSESSSURPRISE		,	ZS_AssessSurprise	);
	Npc_PercEnable  ( self,	PERC_ASSESSTHREAT		,	B_AssessFighter		);
	Npc_PercEnable  ( self,	PERC_ASSESSWARN			, 	B_AssessWarn 		);
	Npc_PercEnable  ( self,	PERC_CATCHTHIEF			,	ZS_CatchThief 		);
	Npc_PercEnable  ( self,	PERC_ASSESSTHEFT		,	B_AssessTheft 		);
	Npc_PercEnable  ( self, PERC_ASSESSTALK			,	B_AssessTalk				);
	
	AI_TurnToNpc 	(self, other);
	C_LookAtNpc 	( self, other);
	if (Npc_GetTempAttitude ( self, other) == ATT_HOSTILE )
	{
		PrintDebugNpc			(PD_ZS_CHECK, "...feindlich!" );
		C_StopLookAt			(self);
		B_AssessEnemy			();
		return;
	}
	else 
	{
		PrintDebugNpc( PD_ZS_CHECK, "...nicht feindlich!");
		AI_PlayAni		(self,	"T_COMEOVERHERE");
		AI_StartState	(self,	ZS_ReactToCall_Wait, 0, "");
	};
	AI_ContinueRoutine	(self);
};

func void ZS_ReactToCall_Wait ()
{	
	PrintDebugNpc( PD_ZS_FRAME, "ZS_ReactToCall_Wait" );				
	Npc_PercEnable  ( self,	PERC_ASSESSDAMAGE,		ZS_ReactToDamage);
	Npc_PercEnable  ( self, PERC_ASSESSMAGIC,		B_AssessMagic);
	Npc_PercEnable  ( self, PERC_ASSESSSURPRISE	,	ZS_AssessSurprise	);
	Npc_PercEnable  ( self, PERC_ASSESSENEMY,		B_AssessEnemy);
	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTER,		B_AssessFighter);
	Npc_PercEnable  ( self, PERC_DRAWWEAPON		,	B_AssessFighter	);
	Npc_PercEnable  ( self,	PERC_ASSESSTHREAT,		B_AssessFighter);
	Npc_PercEnable  ( self,	PERC_ASSESSWARN, 		B_AssessWarn );
	Npc_PercEnable  ( self,	PERC_ASSESSMURDER,		ZS_AssessMurder);
	Npc_PercEnable  ( self,	PERC_ASSESSDEFEAT,		ZS_AssessDefeat);
	Npc_PercEnable  ( self,	PERC_ASSESSFIGHTSOUND,	B_AssessFightSound);
	Npc_PercEnable  ( self,	PERC_CATCHTHIEF,		ZS_CatchThief );
	Npc_PercEnable  ( self,	PERC_ASSESSTHEFT,		B_AssessTheft );
	Npc_PercEnable  ( self, PERC_ASSESSTALK,		B_AssessTalk);
};

func int ZS_ReactToCall_Wait_Loop ()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_ReactToCall_Wait_Loop" );
	B_SmartTurnToNpc (self, other);				
	if (Npc_GetStateTime	(self) > 10)
	{
		return 1;	
	};
};

func int ZS_ReactToCall_Wait_End ()
{	
	PrintDebugNpc( PD_ZS_FRAME, "ZS_ReactToCall_Wait_End" );				
	C_StopLookAt			( self);
};