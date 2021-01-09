func void B_CombatAssessDefeat ()
// 9.5.00 fertig
{
	PrintDebugNpc				(PD_ZS_FRAME,	"B_CombatAssessDefeat" );
	// JP : Ich habe das mal auf FreeLOS geändert, weil es zwar logisch nicht ganz richtig ist, dem Spieler vom Feedback her aber verständlicher, als wenn er grade aus dem Augenwinkel nicht mehr gesehen wird
	if (Npc_CanSeeNpcFreeLOS (self,other))
	{
		if (C_NpcIsHuman(other) && C_NpcIsHuman(victim))
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"...Mensch besiegt Mensch!" );
			B_AssessAndMemorize (NEWS_DEFEAT,NEWS_SOURCE_WITNESS, self, other, victim);

			//-------- evtl. Zielanlauf stoppen --------
			if (Npc_IsInState(self, ZS_ProclaimAndPunish))
			{
				PrintDebugNpc			(PD_ZS_CHECK,	"...NSC ist in ZS_ProclaimAndPunish!" );
				if (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(hero))
				{
					PrintDebugNpc		(PD_ZS_CHECK,	"...Besiegter ist auch eigenes Ziel!" );
					B_FullStop			(self);
					AI_ContinueRoutine	(self);
				};
			};
		};
	};

	//-------- Temporäre Attitüde werden wieder zurückgesetzt --------
	// JP: Nö wird in B_AssessAndMemorize schon gemacht, aber auch nur wenn die TempAttitude hostile ist
	/*
	if (Npc_IsPlayer(victim))
	{
		B_ResetTempAttitude(self);
	};
	*/
};