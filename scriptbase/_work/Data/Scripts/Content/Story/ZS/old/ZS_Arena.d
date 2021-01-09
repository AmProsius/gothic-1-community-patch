func void ZS_ArenaFight	()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaFight");
	B_SetPerception(self);
	AI_SetWalkmode (self,NPC_WALK);
	AI_GotoWP (self,self.wp);
	AI_AlignToWP (self);
};

func void ZS_ArenaFight_Loop	()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_ArenaFight_Loop");
};

func void ZS_ArenaFight_End	()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaFight_End");
};