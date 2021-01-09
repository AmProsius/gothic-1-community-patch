func void B_MoveMob ()
// 5.5.00 Hier muß noch die Abfrage auf Türen rein, wenn sie fertig ist
{
	PrintDebugNpc			(PD_ZS_FRAME, "B_MoveMob");


	//-------- nach blockierendem MOB suchen --------
	var string door;
	door=Npc_GetDetectedMob	(self);
	PrintDebugNpc			(PD_ZS_CHECK, ConcatStrings("...mob: ", door ));



	//-------- blockierendes MOB eine Türe --------
	if (Hlp_StrCmp			(door,	"DOOR"))
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...mob is a door!");

		if (self.aivar[AIV_MOVINGMOB] == 0)							// versucht der NSC bereits die Tür zu öffnen?
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...Türe wurde noch NICHT versucht zu öffnen!");
			self.aivar[AIV_MOVINGMOB] = 1;
			Npc_ClearAIQueue(self);									// bleib stehen
			AI_UseMob		(self,	door, 1);						// falls sie geschlossen ist -> öffnen		
		}
		else
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...Türe wird schon versucht zu öffnen -> geht wohl nicht!");
			Npc_PercDisable	(self,	PERC_MOVEMOB);
			self.aivar[AIV_MOVINGMOB] = 0;
			AI_StartState	(self,	ZS_WaitForPassage ,0, "");
		};
	};
};