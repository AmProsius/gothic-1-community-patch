//////////////////////////////////////////////////////////////////////////
//	B_AssessCaster
//	==============
//	Wird auschließlich aufgerufen durch:
//
//	- PERC_ASSESSCASTER
//
//	Macht folgendes:
//	1.	Zauberer ist nicht der Spieler		->	ignorieren
//	2.	NSC FRIENDLY zum Zauberer			->	ignorieren
//	3.	Zauber ist SPELL_NEUTRAL/SPELL_GOOD	->	ignorieren
//	4.	Zauber ist SPELL_BAD				->	ZS_AssessFighter
//	5.	Zauber ist SLEEP/CHARME und NSC ist Durchgangswache	->	ZS_AssessFighter
//	6.	Zauberer ist HOSTILE				->	ZS_AssessEnemy
//////////////////////////////////////////////////////////////////////////
func void B_AssessCaster()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_AssessCaster");
	PrintGlobals		(PD_ZS_CHECK);

	//-------- Reaktion nur auf Spieler! --------
	if (!Npc_IsPlayer(other))
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...Zauberer NICHT der Spieler!");
		return;
	};

	//-------- Freunde ignorieren das Zaubern ! --------
	if (C_NpcTypeIsFriend(self, other) || (Npc_GetAttitude(self, other)==ATT_FRIENDLY) ) 
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...NSC ist NPCTYPE_FRIEND oder ATT_FRIENDLY!" );				
		return;
	};
	
	//-------- Zauberkategorie untersuchen ! --------
	if	(Npc_GetActiveSpellCat(other) == SPELL_BAD  )
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...böser Zauber!");

		B_FullStop		(self);
		Npc_PercDisable	(self,	PERC_ASSESSCASTER);
		AI_StartState	(self,	ZS_AssessFighter, 0, "");
	}
	else if (Npc_GetAttitude(self, other) == ATT_HOSTILE)
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...böser Zauberer!");
		
		B_FullStop		(self);
		AI_StartState	(self,	ZS_AssessEnemy, 0, "");			//WICHTIG: kein B_AssessEnemy !!!
	}
	else if	(Npc_IsInState(self, ZS_GuardPassage) || Npc_WasInState(self, ZS_GuardPassage))
	&&		((Npc_GetActiveSpell(other) == SPL_SLEEP) || (Npc_GetActiveSpell(other) == SPL_CHARM))
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...Schlaf-/Charmezauber von Durchgangswache gesehen!");
		
		B_FullStop		(self);
		AI_StartState	(self,	ZS_AssessEnemy, 0, "");			//WICHTIG: kein B_AssessEnemy !!!
	}
	else
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...neutraler Zauber");
	};
};