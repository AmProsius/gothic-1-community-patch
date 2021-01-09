func void B_AssessQuietSound ()
// 5.5.00 --> SO soll es sein
{
	PrintDebugNpc				(PD_ZS_FRAME, "B_AssessQuietSound" );
	
	PrintGlobals				(PD_ZS_FRAME);
	// JP: Entfernungsabbruch
	if (Npc_GetDistToItem(self, item) > PERC_DIST_DIALOG)
	{
		PrintDebugNpc			(PD_ZS_FRAME, "... to far" );
		return;
	};
	
	if (Npc_CanSeeSource		(self))
	{
		PrintDebugNpc			(PD_ZS_CHECK, "...kann Geräuschquelle sehen!" );
		if (Snd_IsSourceNpc		(self))
		{
			PrintDebugNpc		(PD_ZS_CHECK, "...Geräuschquelle ist SC!" );
			if (Npc_GetTempAttitude (self, other) == ATT_HOSTILE)
			{
				PrintDebugNpc	(PD_ZS_CHECK, "...SC ist HOSTILE!" );
				Npc_ClearAIQueue(self);
				AI_StartState 	(self, ZS_AssessEnemy, 0, "");
			};
		};
	}
	else
	{
		PrintDebugNpc			(PD_ZS_CHECK, "...kann NICHT Geräuschquelle sehen!" );
		if (Snd_IsSourceNpc		(self))
		{
			Npc_ClearAIQueue	(self);
			AI_StartState 		(self, ZS_AssessQuietSound, 0, "");
		};
	};	
};	

