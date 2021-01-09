func void B_CombatAssessMurder ()
// 9.5. Fertig bis auf Perm Attitude --> Mike
{
	PrintDebugNpc	(PD_ZS_FRAME, "B_CombatAssessMurder" );
	PrintGlobals	(PD_ZS_CHECK);
	
	if (Npc_CanSeeNpc (self,other))
	{
		PrintDebugNpc( PD_ZS_CHECK, "B_CombatAssessMurder seen");
		if (C_NpcIsHuman(other) && C_NpcIsHuman(victim))
		{
			PrintDebugNpc( PD_ZS_CHECK,"B_CombatAssessMurder seen // Both human");
			B_AssessAndMemorize (NEWS_MURDER,NEWS_SOURCE_WITNESS, self, other, victim);

			//-------- evtl. Zielanlauf stoppen --------
			if (Npc_IsInState(self, ZS_ProclaimAndPunish))
			{
				PrintDebugNpc			(PD_ZS_CHECK,	"...NSC ist in ZS_ProclaimAndPunish!" );
				if (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(hero))
				{
					PrintDebugNpc		(PD_ZS_CHECK,	"...Getöteter ist auch eigenes Ziel!" );
					B_FullStop			(self);
					AI_ContinueRoutine	(self);
				};
			};
		};
		/****************************************************************************
		// Monster dürfen bei Tod die Attitüde der Nsc´s zum Spieler nicht verändern deshalb der Part ab &&
		/****************************************************************************/
		if (Npc_GetTempAttitude (self,victim) == ATT_FRIENDLY && (!C_NpcIsHuman(victim)) )
		{
			PrintDebugNpc( PD_ZS_CHECK, "B_CombatAssessMurder seen // friendly to victim ::");
			Npc_SetTempAttitude (self, ATT_HOSTILE);
		};
	}
	//JP: auch wenn der Täter nicht gesehen wird, sollten nur bei menschlichen Opfern Murder_News gemerkt werden
	else if (C_NpcIsHuman(other) && C_NpcIsHuman(victim))  
	{
		PrintDebugNpc		(PD_ZS_CHECK, "B_CombatAssessMurder // only heard");
		B_AssessAndMemorize (NEWS_MURDER,NEWS_SOURCE_WITNESS, self, NULL, victim);
	};
};

