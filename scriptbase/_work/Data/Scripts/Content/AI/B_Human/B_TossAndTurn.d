func void B_TossAndTurn ()
{
	PrintDebugNpc		(PD_ZS_FRAME, "B_TossAndTurn" );

	Npc_ClearAIQueue	(self);
	AI_PlayAni			(self,	"R_BED_RANDOM_2");
};
	