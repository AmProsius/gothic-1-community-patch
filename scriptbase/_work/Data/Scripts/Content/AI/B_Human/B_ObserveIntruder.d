//////////////////////////////////////////////////////////////////////////
//	B_ObserveIntruder
//	=================
//	Wird aufgerufen durch:
//
//	- PERC_OBSERVEINTRUDER
//	- ZS_WakeUp 			(wenn der SC innerhalb von HAI_DIST_OBSERVEINTRUDER)
//
//	aufgerufen. Es passiert folgendes:
//
//	1.	Ignorieren wenn SC im Dialog
//	2.	Ignoriert, wenn NSC Durchgangswache
//	3.	Ignoriert den SC wenn NPCTYPE_FRIENDLY
//	4.	Wenn Intruder ein Mensch
//		- ATT_HOSTILE			-> B_AssessEnemy
//		- ATT_ANGRY/ATT_NEUTRAL	-> B_AssessSC, danach ZS_ObserveIntruder
//		- ATT_FRIENDLY			-> B_AssessSC
//	5.	Intruder ein Monster
//		- harmloses Monster		->	Ignorieren
//		- gefährliches Monster	->	ZS_AssessMonster  
//////////////////////////////////////////////////////////////////////////
func void B_ObserveIntruder ()
{
	PrintDebugNpc			(PD_ZS_FRAME, "B_ObserveIntruder");

	//-------- SC im Dialog ? --------
	if (other.aivar[AIV_INVINCIBLE])
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...SC im Dialog!");
		return;
	};

	//-------- NPC_TYPE_FRIENDLY ? --------
	if (self.Npctype ==	NPCTYPE_FRIEND)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...freundlich gesinnt!");
		return;
	};

	//-------- NSC ist Durchgangswache ? --------
	if (Npc_IsInState(self, ZS_GuardPassage))
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...NSC ist Durchgangswache!");
		return;
	};

	//-------- Eindringling ein MENSCH ? --------
	if (C_NpcIsHuman(other))
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...Eindringling ist Mensch!" );
	
		if (Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			B_FullStop		(self);
			B_AssessEnemy	();
			return;
		};

		if ((Npc_GetAttitude(self,other) != ATT_FRIENDLY) && (Npc_CanSeeNpc(self, other) || !C_BodyStateContains(other,BS_SNEAK)) )
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...SC ist Mensch und nicht FRIENDLY!");
			AI_StartState	(self, ZS_ObserveIntruder, 1, "");
			return;
		};
	}

	//-------- Eindringling ist ein MONSTER ! --------
	else
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...Eindringling ist Monster!" );

		if (C_NpcIsDangerousMonster(self, other))
		{
			B_FullStop		(self);
			AI_StartState 	(self, ZS_AssessMonster, 0, "");
		};
	};
};



