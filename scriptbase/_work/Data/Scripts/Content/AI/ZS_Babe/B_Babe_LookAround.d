// JP: Wird anscheinend nirgendwo benutzt, ist auch gut so, weil Babes keine Search-Ani haben
func void B_Babe_LookAround ()
{
	PrintDebugNpc( PD_ZS_FRAME, "B_Babe_LookAround" );		
	AI_StandUp ( self );
	AI_PlayAni ( self, "T_SEARCH");
};