/*************************************************************************
**	TA    															**
*************************************************************************/
func void ZS_Sleeper()	// Immobile
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_Sleeper");
    
	Npc_PercEnable		(self,	PERC_ASSESSPLAYER,	B_Sleeper_AssessSC);
 	Npc_SetPercTime		(self,	0.5);

	AI_AlignToWP		(self);							// SN: Monster am Start am Wegpunkt ausrichten
};
func int ZS_Sleeper_loop()
{
	if (SLF_FIRE == TRUE)
	{
		AI_TurnToNpc(self,hero);
		
		if (Npc_GetStateTime(self) > 5)
		{
			Wld_PlayEffect("SPELLFX_SLEEPER_FIREBALL", self, hero, 2, 150, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
			Npc_SetStateTime(self,0);
		};
	};
	return 0;
};
func void ZS_Sleeper_end()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_Sleeper_end");
};


func void B_Sleeper_AssessSC ()
{
	if 	(Npc_GetDistToNpc(self,hero) < 800)
	&&	!Npc_IsInState(hero,ZS_MagicSleep)
	{
		B_FullStop		(hero);
		AI_StartState	(hero,	ZS_MagicSleep, 0, "");
	};
};
