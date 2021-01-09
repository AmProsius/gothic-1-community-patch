//////////////////////////////////////////////////////////////////////////
//	B_AssessFightSound
//	==================
//	Wird direkt durch die Wahrnehmung PERC_ASSESSFIGHTSOUND angesprungen,
//	die jedesmal ausgelöst wird, wenn SC/NSC attackiert werden (Nah-,
//	Fern-, Magiekampf).
//	Macht im Grunde folgende Fallunterscheidung
//	1. 	Monster kämft gegen Mensch
//		-> Monster bewerten in ZS_AssessMonster
//	2.	NSC ist Wache
//		-> greift ein, wenn ein Schützling angegriffen wird
//	3.	NSC ist eine Meister-Gilde
//		-> greift garnicht ein, ist aber wachsam
//	4.	NSC ist ein Normalbürger
//		-> beobachtet den Kampf (WatchFight)
//////////////////////////////////////////////////////////////////////////
func void B_AssessFightSound ()
{
	PrintDebugNpc			(PD_ZS_FRAME, "B_AssessFightSound" );

	//-------- Kampf Mensch gegen Monster ! --------
	if (C_NpcIsMonster(other) && C_NpcIsHuman(victim) )
	{
		PrintDebugNpc		(PD_ZS_FRAME, "...Monster greift Mensch an!" );
		if ((Npc_GetAttitude	(self, victim) == ATT_FRIENDLY) || (Npc_GetAttitude(self, victim) == ATT_NEUTRAL))
		{
			if (Npc_CanSeeNpcFreeLOS(self, other) && (Npc_GetDistToNpc(self, other) < HAI_DIST_ASSESS_MONSTER))
			{
				//Npc_SetTarget	(self, other);
				AI_StartState	(self, ZS_AssessMonster, 0, "");
				return;
			};
			/********************************************
			// Der  B wurde nicht abgebrochen, obwohl ein Monster beteiligt war, so daß sich die AI mit dem Monster als other weiter unten vertan hat
			/*************************************************/
			return;
		}
		else
		{
			B_SmartTurnToNpc(self, victim);
			PrintAttitudes 	(PD_ZS_CHECK);
			B_AssessFighter ();
			return;
		};
	}
	else if (C_NpcIsMonster(victim) && C_NpcIsHuman(other))
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...Mensch greift Monster an!" );
		if ((Npc_GetAttitude	(self, other) == ATT_FRIENDLY) || (Npc_GetAttitude(self, other) == ATT_NEUTRAL))
		{
			if (Npc_CanSeeNpcFreeLOS	( self, other))
			{
				Npc_SetTarget	(self, victim);
				Npc_GetTarget	( self);
				AI_StartState	(self, ZS_AssessMonster, 0, "");
				return;
			};
			/********************************************
			// Der  B wurde nicht abgebrochen, obwohl ein Monster beteiligt war, so daß sich die AI mit dem Monster als other weiter unten vertan hat
			/*************************************************/
			return;
		}
		else
		{
			B_SmartTurnToNpc(self, victim);
			PrintAttitudes 	(PD_ZS_CHECK);
			B_AssessFighter ();
			return;
		};
	};

	//-------- Wurde ich selbst angegriffen ? --------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(victim))
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...NSC selbst wurde getroffen!" );
		B_FullStop			(self);
		AI_StartState 		(self,	ZS_ReactToDamage, 0, "");
		return;
	};	

	//-------- WACHEN checken, ob einer ihrer Schützlinge angegriffen wird --------
	if (C_ChargeWasAttacked(self, victim, other))
	{ 
		PrintDebugNpc		(PD_ZS_CHECK,	"...NSC ist Wache und ein Schützling wurde attackiert!" );
		if (Npc_GetPermAttitude(victim,other) == ATT_FRIENDLY)		// HINWEIS: Bedingung für 'friendly fire' aus ZS_ReactToDamage!!!
		{
			PrintDebugNpc	(PD_ZS_CHECK,	"...war nur 'friendly fire'!" );
			return;
		}
		else
		{
			PrintGlobals	(PD_ZS_CHECK);
			PrintDebugNpc	(PD_ZS_CHECK,	"...und der ist auch sauer bzw. flieht!" );
			B_FullStop		(self);
			Npc_SetTarget	(self,	other);
			B_WhirlAround	(self,	other);
			B_DrawWeapon	(self,	other);
			AI_StartState 	(self,	ZS_ProclaimAndPunish, 0, "");
			return;
		};
	}

	//-------- BOSS-Gilden --------
	else if (C_NpcIsBoss(self)||C_NpcIsGuard(self)||C_NpcIsGuardArcher(self))
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...NSC gehört zu BOSS-Gilde!");
		B_SmartTurnToNpc	(self,	victim);
		B_AssessFighter		();
		return;
	}

	//-------- WORKER (kein Monster/WACHE/BOSS) --------
	else if (Npc_GetDistToNpc(self,victim) < PERC_DIST_WATCHFIGHT) 
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...Opfer in WatchFight-Range!" );

		B_WhirlAround		(self,	victim);
		AI_StartState 		(self,	ZS_WatchFight, 0, "");
		return;
	};	
};