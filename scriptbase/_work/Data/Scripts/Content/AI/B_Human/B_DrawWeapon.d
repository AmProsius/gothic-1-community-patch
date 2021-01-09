//////////////////////////////////////////////////////////////////////////
//	B_DrawWeapon
//	============
//	Dieser Befehl wählt die derzeit am besten geeignete Waffe aus und
//	zieht sie.
//////////////////////////////////////////////////////////////////////////
func void B_DrawWeapon(var C_NPC slf, var C_NPC oth)
{
	PrintDebugNpc		(PD_ZS_DETAIL, "B_DrawWeapon");
	
	B_SelectWeapon		(slf, oth);
};

//////////////////////////////////////////////////////////////////////////
//	B_RemoveWeapon
//	============
//	Dieser Befehl steckt die derzeit gezogene Waffe wieder weg. Dabei
//	kann es sich um eine Nahkampf-, eine Fernkampfwaffe oder um einen
//	Zauberspruch handeln.
//////////////////////////////////////////////////////////////////////////
func void B_RemoveWeapon(var C_NPC slf)
{
	PrintDebugNpc			(PD_ZS_DETAIL, "B_RemoveWeapon");
	
	//SN 26.01.01: wieder auskommentiert, da es das Problem vom 11.01.01 sowieso nicht behoben hat, und dazu noch vorausgegangene AI-Befehle (z.B. AI_FinishingMove) abwürgt
	//B_FullStop			(slf);				// laut Ulf vom 11.01.01.: zur Sicherheit einbauen, da NSC-Caster oft in EV_UNREADY hängen blieb
	
	if (Npc_IsInFightMode(slf, FMODE_MAGIC))	// Zauber aktiv...
	{
		PrintDebugNpc		(PD_ZS_DETAIL,	"... Zauber wegstecken!");
		AI_UnreadySpell		(slf);				// ... dann weg damit!
	}
	else if (Npc_HasReadiedMeleeWeapon(slf))	// Nahkampfwaffe aktiv...
	{
		PrintDebugNpc		(PD_ZS_DETAIL,	"...Nahkampfwaffe gezogen!");
		AI_RemoveWeapon		(slf);				// ...dann weg damit!
	}
	else if (Npc_HasReadiedRangedWeapon(slf))	// Fernkampfwaffe aktiv...
	{
		PrintDebugNpc		(PD_ZS_DETAIL,	"...Nahkampfwaffe gezogen!");
		AI_StopAim			(slf);
		AI_RemoveWeapon		(slf);				// ...dann weg damit!
	}
	else
	{
		PrintDebugNpc		(PD_ZS_DETAIL,	"...nur Fäuste 'gezogen'!");
		AI_RemoveWeapon		(slf);
	};
};
