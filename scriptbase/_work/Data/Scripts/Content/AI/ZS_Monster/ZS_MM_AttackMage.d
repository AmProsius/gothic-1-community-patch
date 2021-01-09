func void ZS_MM_AttackMage ()
{	
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_MM_AttackMage" );		
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE,			B_MMM_CombatReactToDamage	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC,			B_AssessMagic				);			
    
	Npc_GetTarget		(self);
	B_SelectWeapon		(self,	other);
};

func int ZS_MM_AttackMage_Loop()
{
	PrintDebugNpc		(PD_ZS_LOOP,	"ZS_MM_AttackMage_Loop");		
	Npc_GetTarget		(self);
	
	/* -------- Wenn Gegner Bewußtlos oder Tod... -------- */
	if ( Npc_IsInState	(other, ZS_Unconscious) || Npc_IsDead(other) || Npc_IsInState(other, ZS_Dead)) // WORKAROUND: es kann vorkommen, daß der SC in Zustand ZS_Dead landet, aber noch bewußtlos ist!!!
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...Ziel bewußtlos oder tot!");

		if ( Npc_IsNextTargetAvailable(self) ) 
		{
			Npc_GetNextTarget	(self);
			PrintDebugString	(PD_ZS_CHECK, "...neues Ziel gefunden: ", other.name);
		}
		else
		{
			PrintDebugNpc		(PD_ZS_CHECK, "...kein Neues Ziel vorhanden!");
			return 				LOOP_END;
		};
	};

	if (Npc_GetStateTime(self) >= 3)
	{
		PrintGlobals	(PD_MST_DETAIL);
		/* -------- Auswahl/Wechsel der richtigen Waffe -------- */
		Npc_ClearAIQueue(self);					// falls sich FAI-Moves schneller ansammeln, als sie abgearbeitet werden können.
		B_SelectWeapon	(self,	other);
		Npc_SetStateTime(self, 	0);
	};

	/* -------- eigentliches Anwerfen der FAI -------- */
	AI_Attack			(self);
	AI_Wait				(self, 0.2);
	return				LOOP_CONTINUE;
};

func void ZS_MM_AttackMage_End()
{	
	PrintDebugNpc			(PD_ZS_FRAME, "ZS_MM_AttackMage_End" );		
	
	//-------- Waffe wegstecken --------
	B_RemoveWeapon			(self);
};

func void B_MMM_CombatReactToDamage ()
{
	PrintDebugNpc				(PD_ZS_FRAME, "B_MMM_CombatReactToDamage");
	
	Npc_SetTarget				(self,	other);				// neuen Angreifer aufs Korn nehmen!
};