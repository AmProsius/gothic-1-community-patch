func void B_OccupiedObserveIntruder ()
{
	PrintDebugNpc			(PD_ZS_FRAME,	"B_OccupiedObserveIntruder");
	if (!C_NpcIsHuman(other))
	{
		PrintDebugNpc		(PD_ZS_FRAME,	"...Nsc ist Monster!");
		B_AssessFighter	();
	};
	if (Npc_GetDistToNpc	(self,	other) < PERC_DIST_CLOSE)
	{
		PrintDebugNpc		(PD_ZS_FRAME,	"... Eindringling zu nahe!");
		if (other.guild != GIL_MEATBUG)
		{
			PrintDebugNpc	(PD_ZS_FRAME,	"...und kein Meatbug!");
			AI_Quicklook 	(self,	other);
			B_AssessSC		();
		};
	};
};
	