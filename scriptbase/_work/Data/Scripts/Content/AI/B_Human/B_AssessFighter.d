//////////////////////////////////////////////////////////////////////////
//	B_AssessFighter
//	================
//	Wird durch folgende Ereignisse angesprungen:
//
//	- aktive Wahrnehmung PERC_ASSESSFIGHTER
//	- passive Wahrnehmung PERC_DRAWWEAPON
//	- ZS_ObserveIntruder (Intruder hat Waffe in der Hand)
//	- B_AssessFightSound (NSC ist Boss)
//
//	Die primäre Aufgabe von B_AssessFighter ist es, festzustellen
//	ob die gezogene Waffe des anderen eine Bedrohung ist. Dabei 
//	passiert folgendes:
//
//	1.	Fighter ist MENSCH
//		- Ignorieren wenn NPCTYPE_FRIEND oder ATT_FRIENDLY
//		- Ignorieren Cutscene-Teilnehmer
//		- Ignorieren Nicht-SCs
//		- Ignorieren wenn SC in magischem Schlaf
//		- Ignorieren wenn SC nur die Faust "gezogen" hat
//		- Nahkampfwaffe : ZS_AssessFighter wenn Fighter in HAI_DIST_MELEE
//		- Fernkampfwaffe: ZS_AssessFighter wenn Fighter in HAI_DIST_RANGED
//		- Magie:  		  ZS_AssessFighter wenn Fighter in HAI_DIST_RANGED
//						  und Zauber ein Kampfzauber ist 
//	2. 	Fighter ist MONSTER
//		- Ignorieren von harmlosen Monstern
//		- Ignorieren von Monstern außerhalb HAI_DIST_ASSESS_MONSTER
//		- sonst in ZS_AssessMonster (dort: Angriff, Abwarten oder Fliehen)
//////////////////////////////////////////////////////////////////////////
func void B_AssessFighter()
{
	PrintDebugNpc			(PD_ZS_FRAME, "B_AssessFighter" );
	
	//*********** Extra für Raeuberlager ************
	if (self.npctype == NPCTYPE_ROGUE)
	{
		B_SetRoguesToHostile();
	};
	//***********************************************
	
	//######## Ist Fighter ein MENSCH ? ########
	if ( C_NpcIsHuman(other) )
	{
		PrintDebugNpc		(PD_ZS_FRAME, "...'fighter' ist Mensch!" );

		//-------- Cutscene-Teilnehmer wird das Waffeziehen verzeihen --------
		if (Npc_IsInCutscene(other))									// Befindet sich der "Waffenzieher" in einer Cutscene?
		{	
			PrintDebugNpc	(PD_ZS_CHECK, "...Waffenziehender in Cutscene!" );				
			return;														//... dann verzeihen wir ihm natürlich -> Abbruch des Checks
		};
	
		//-------- Ignorieren, wenn SC in Magischem Schlaf --------
		if (Npc_IsInState(other, ZS_MagicSleep) )
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...SC in magischem Schlaf!" );				
			return;
		};
			
		//-------- Reaktion nur auf Spieler! --------
		if ( !Npc_IsPlayer(other) )
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...NSC ist kein Spieler!" );				
			return;
		}

		//-------- Durchgangswachen machen sofort B_AssessSC --------
		else if (Npc_IsInState(self, ZS_GuardPassage))
		{
			//-------- Auf Vergabe von Infos & Missionen checken --------
			B_CheckForImportantInfo(self,other);
		};

		//-------- Check auf Fäuste! --------
		if ( Npc_IsInFightMode(other, FMODE_FIST) )
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...Fighter hat nur Fäuste 'gezogen'!" );				
			return;
		};
			
		//-------- NpcTypeFriends ignorieren die gezogene Waffe --------
		if (C_NpcTypeIsFriend(self, other) || (Npc_GetAttitude(self, other)==ATT_FRIENDLY) ) 
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...NSC ist NPCTYPE_FRIEND oder ATT_FRIENDLY!" );				
			return;
		};
		
		//-------- Waffenzieher ist im Dialog --------
		if (other.aivar[AIV_INVINCIBLE] == TRUE) 
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...Fighter ist im Dialog!" );				
			return;
		};
		
		//-------- Check auf Nahkampfwaffe! --------
		if ( Npc_IsInFightMode(other, FMODE_MELEE) )
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...Fighter führt Nahkampfwaffe!" );				
		
			if (Npc_GetDistToNpc(self,other) < HAI_DIST_MELEE)
			{
				PrintDebugNpc		(PD_ZS_CHECK, "...und ist in Nahkampfreichweite");
	
				B_FullStop 			(self);
				//Npc_SendPassivePerc	(self, 	PERC_ASSESSWARN,	self,	other); 
				Npc_SetTarget		(self, 	other);
				
				Npc_GetTarget		( self);
				AI_StartState 		(self, 	ZS_AssessFighter,	0,	"");
				return;
			};
		};
		
		//-------- Check auf Fernkampfwaffe! --------
		if ( Npc_IsInFightMode(other, FMODE_FAR) )
		{
			PrintDebugNpc			(PD_ZS_CHECK, "...Fighter führt Fernkampfwaffe!");	
						
			if (Npc_GetDistToNpc(self,other) < HAI_DIST_RANGED)
			{
				PrintDebugNpc		(PD_ZS_CHECK, "...und ist in Fernkampfreichweite!");				
				
				B_FullStop 			(self);
				//Npc_SendPassivePerc	(self, 	PERC_ASSESSWARN,	self,	other); 
				AI_StartState 		(self, 	ZS_AssessFighter,	0,	"");
				return;
			};
		};
		
		//-------- Check auf Zauberspruch! --------
		if ( Npc_IsInFightMode(other, FMODE_MAGIC) )
		{
			PrintDebugNpc			(PD_ZS_CHECK, "...Fighter führt Zauberspruch!" );				

			if ((Npc_GetDistToNpc(self,other)<HAI_DIST_RANGED) && (Npc_GetActiveSpellCat(other)==SPELL_BAD) )
			{	
				PrintDebugNpc		(PD_ZS_CHECK, "...und zwar einen Kampfzauber & innerhalb Fernkampfreichweite!" );				
		
				B_FullStop 			(self);
				AI_StartState 		(self, 	ZS_AssessFighter, 0, "");
				return;
			}
			else if	(Npc_IsInState(self, ZS_GuardPassage) || Npc_WasInState(self, ZS_GuardPassage))
			&&		((Npc_GetActiveSpell(other) == SPL_SLEEP) || (Npc_GetActiveSpell(other) == SPL_CHARM))
			{
				PrintDebugNpc	(PD_ZS_CHECK,	"...Schlaf-/Charmezauber von Durchgangswache gesehen!");
		
				B_FullStop 			(self);
				AI_StartState 		(self, 	ZS_AssessFighter, 0, "");
				return;
			};
		};
	}

	//######## ...dann muß der Fighter ein MONSTER sein ########
	else
	{
		PrintDebugNpc			(PD_ZS_CHECK, "... 'fighter' ist Monster/Orc!" );

		if (C_NpcIsDangerousMonster(self,other))
		{
			PrintDebugNpc		(PD_ZS_CHECK, "... 'fighter' ist gefährliches Monster!" );
			
			if (Npc_GetDistToNpc(self, other) < HAI_DIST_ASSESS_MONSTER)
			{
				B_FullStop		(self);
				AI_StartState	(self, ZS_AssessMonster, 0, "");
				return;
			};
		};
	};
};