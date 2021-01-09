func void B_Babe_AssessPlayer ()
{
	if ( Npc_GetDistToNpc (self, other) < PERC_DIST_FLEE && Npc_CanSeeNpcFreeLOS (self, other))
	{
		AI_StartState	( self, ZS_Babe_AssessPlayer, 0, "");
	}
	else
	{
		return;
	};
};
			