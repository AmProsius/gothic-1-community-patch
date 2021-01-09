func int ZS_AssessQuietSound ()
{	
	PrintDebugNpc			(PD_ZS_FRAME, "ZS_AssessQuietSound" );	
	C_ZSInit();
	
	if ( self.guild == GIL_MEATBUG )
	{
		AI_ContinueRoutine(self);
		return(0);
	};
	
	Npc_PercEnable  		(self,	PERC_ASSESSDAMAGE 		,	ZS_ReactToDamage	);
	Npc_PercEnable  		(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  		(self, 	PERC_ASSESSSURPRISE		,	ZS_AssessSurprise	);
	Npc_PercEnable  		(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  		(self,	PERC_ASSESSFIGHTER		,	B_AssessFighter		);
	Npc_PercEnable  		(self,	PERC_ASSESSTHREAT		,	B_AssessFighter		);
	Npc_PercEnable  		(self,	PERC_ASSESSWARN			, 	B_AssessWarn 		);
	Npc_PercEnable  		(self,	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  		(self,	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  		(self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  		(self,	PERC_CATCHTHIEF			,	ZS_CatchThief 		);
	Npc_PercEnable  		(self,	PERC_ASSESSTHEFT		,	B_AssessTheft 		);
	Npc_PercEnable  		(self, 	PERC_ASSESSTALK			,	B_RefuseTalk 		);
	Npc_PercEnable  		(self, 	PERC_ASSESSENTERROOM	,	B_AssessEnterRoom 		);
	Npc_PercEnable  		(self, 	PERC_ASSESSUSEMOB		,	B_AssessUseMob 		);
                            
	AI_TurnToNpc 			(self,	other);
};

func int ZS_AssessQuietSound_Loop ()
{
	PrintDebugNpc			(PD_ZS_LOOP, "ZS_AssessQuietSound_Loop" );	

	if (Npc_CanSeeNpc		(self,	other))
	{
		//---- SC entdeckt ----
		PrintDebugNpc		(PD_ZS_LOOP, "...SC entdeckt!" );	
		B_AssessSC			();
		if ((Npc_GetDistToNpc(self,	other)	< PERC_DIST_FLEE) && !(other.aivar[AIV_INVINCIBLE]))
		{
			PrintDebugNpc	(PD_ZS_LOOP, "...SC in Fluchtradius!" );	
			Npc_ClearAIQueue(self);
			AI_StartState 	(self,	ZS_ObserveIntruder, 0, "");
		}
		else
		{
			PrintDebugNpc	(PD_ZS_LOOP, "...SC außerhalb Fluchtradius oder in Gespräch!" );	
			//B_Say			(self,	other,	"$WHATSTHISSUPPOSEDTOBE");
			return		LOOP_END;
		};
	}
	else
	{
		//---- SC immer noch nicht entdeckt ----
		PrintDebugNpc		(PD_ZS_LOOP, "...SC immer noch nicht entdeckt!" );	
		if (Npc_GetStateTime(self) > 5)							//...insgesamt 5 Sekunden warten...
		{
			PrintDebugNpc	(PD_ZS_LOOP, "...nach 5 Sekunden genug gewartet!" );	
			return LOOP_END;												///...dann Tagesablauf fortsetzen!
		}
		else
		{
			AI_Wait	(self,1);
			return 0;												//...weiter warten
		};
	};
};

func int ZS_AssessQuietSound_End ()
{
	PrintDebugNpc			(PD_ZS_FRAME, "ZS_AssessQuietSound_End" );	
};