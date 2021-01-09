func void ZS_ArenaSpectator()
{
	OccupiedPerception();

	AI_GotoWP(self, self.wp);
	AI_GotoFP(self,"STAND");
	AI_AlignToFP( self );				//Richte Dich aus
};

func void ZS_ArenaSpectator_loop()
{
};

func void ZS_ArenaSpectator_end()
{
};