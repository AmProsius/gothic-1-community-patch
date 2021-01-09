//////////////////////////////////////////////////////////////////////////
//	B_AssessEnemy
//	=============
//	Wird durch folgende Ereignisse angesprungen:
//
//	- PERC_ASSESSENEMY
//	- B_MoveNpc				(wenn hostile zum Kollisionspartner)
//	- B_ObserveIntruder		(wenn hostile zum Eindringling)
//	- ZS_AssessDefeat		(wenn hostile zum Sieger)
//	- ZS_AssessMurder		(wenn hostile zum Mˆrder)
//	- ZS_AssessSurprise		(wenn hostile zum Zur¸ckverwandelten)
//	- ZS_AssessThreat		(wenn permAngry zum Droher -> jetzt hostile)
//	- ZS_ObserveSuspect		(wenn hostile zum Schleichenden)
//	- ZS_ReactToCall		(wenn hostile zum Rufenden)
//
//	Die prim‰re Aufgabe von B_AssessEnemy ist es, festzustellen
//	ob der entdeckte Feind ein Monster ein Mensch oder aber garnicht
//	zu bek‰mpfen ist:
//
//	1.	Fighter ist MENSCH
//		- Ignorieren wenn NPCTYPE_FRIEND oder ATT_FRIENDLY
//		- Ignorieren Cutscene-Teilnehmer
//		- Ignorieren, wenn Enemy gerade im Dialog
//		- wenn AIV_TALKBEFOREATTACK: auf Important-Info checken
//		-> ZS_AssessEnemy
//	2. 	Enemy ist MONSTER
//		-> ZS_AssessMonster
//////////////////////////////////////////////////////////////////////////
func void B_AssessEnemy()
{
	PrintDebugNpc			(PD_ZS_FRAME, "B_AssessEnemy" );
	PrintGlobals			(PD_ZS_CHECK);
	if (Npc_CanSeeNpcFreeLOS( self, other))
	{
		//######## Ist Enemy ein MENSCH ? ########
		if ( C_NpcIsHuman(other) )
		{
			PrintDebugNpc		(PD_ZS_FRAME, "...Feind ist Mensch!" );
	
			//-------- Important-Info ! --------
			if (self.aivar[AIV_TALKBEFOREATTACK])							// Hat der NSC eine "letzte Nachricht" f¸r den Feind?
			{	
				PrintDebugNpc	(PD_ZS_CHECK, "...'letzte Nachricht' f¸r den Feind!");				
				if	(B_CheckForImportantInfo(self,other))
				{
					return;
				};
 			};
		
			//-------- NpcTypeFriends ignorieren das HOSTILE --------
			if (C_NpcTypeIsFriend(self, other) || (Npc_GetAttitude(self, other)==ATT_FRIENDLY) ) 
			{
				PrintDebugNpc	(PD_ZS_CHECK, "...NSC ist NPCTYPE_FRIEND oder ATT_FRIENDLY!" );				
				return;
			};
		
			//--------Feind wird toleriert --------
			if (C_OtherIsToleratedEnemy(self, other)) 
			{
				PrintDebugNpc	(PD_ZS_CHECK, "...Feind wird toleriert!" );				
				B_TolerateEnemy	(self, other);
				return;
			};
		
			//-------- Enemy spricht gerade --------
			if (other.aivar[AIV_INVINCIBLE]) 
			{
				PrintDebugNpc	(PD_ZS_CHECK, "...Feind spricht gerade!" );				
				AI_ContinueRoutine(self);
				return;
			};
		
			//-------- Cutscene-Teilnehmer wird das Waffeziehen verziehen --------
			if (Npc_IsInCutscene(other))									// Befindet sich der Feind in einer Cutscene?
			{	
				PrintDebugNpc	(PD_ZS_CHECK, "...Feind ist in Cutscene!" );				
				return;														//... dann verzeihen wir ihm nat¸rlich -> Abbruch des Checks
			};
		
			//-------- Also doch ein ganz ordin‰rer Feind! --------
			B_FullStop			(self);
			AI_StartState 		(self, 	ZS_AssessEnemy,	0,	"");
		}		
	
		//######## ...dann muﬂ der Enemy ein MONSTER sein ########
		else
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"... 'enemy' ist Monster/Orc!" );
	
			if	(Npc_GetDistToNpc(self, other) < HAI_DIST_ASSESS_MONSTER)
			&&	C_NpcIsDangerousMonster(self,other)
			{
				B_FullStop		(self);
				AI_StartState	(self, ZS_AssessMonster, 0, "");
				return;
			};
		};
	};
};