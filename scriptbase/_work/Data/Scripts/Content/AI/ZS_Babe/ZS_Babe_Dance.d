/****************************************************
*       										    *
****************************************************/
func void ZS_Babe_Dance ()  //### Wahrnehmungen?
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Babe_Dance");

	AI_UnequipArmor (self); // falls noch die Nacktr�stung angezogen ist, ausziehen!

	B_SetBabeDefaultPerceptions();
	AI_SetWalkMode(self, NPC_RUN);

	AI_GotoWP (self, self.wp);
	AI_AlignToWP (self);
};

func void ZS_Babe_Dance_Loop()
{
	PrintDebugNpc		(PD_TA_LOOP,	"ZS_Babe_Dance_Loop");

		var int danceStyle;
		danceStyle = Hlp_Random(9);

		if ( danceStyle == 0 )
		{
			AI_PlayAni(self, "S_DANCE1");
		};
		if ( danceStyle == 1 )
		{
			AI_PlayAni(self, "S_DANCE2");
		};
		if ( danceStyle == 2 )
		{
			AI_PlayAni(self, "S_DANCE3");
		};
		if ( danceStyle == 3 )
		{
			AI_PlayAni(self, "S_DANCE4");
		};
		if ( danceStyle == 4 )
		{
			AI_PlayAni(self, "S_DANCE5");
		};
		if ( danceStyle == 5 )
		{
			AI_PlayAni(self, "S_DANCE6");
		};
		if ( danceStyle == 6 )
		{
			AI_PlayAni(self, "S_DANCE7");
		};
		if ( danceStyle == 7 )
		{
			AI_PlayAni(self, "S_DANCE8");
		};
		if ( danceStyle == 8 )
		{
			AI_PlayAni(self, "S_DANCE9");
		};
	AI_GotoWP (self, self.wp);
};

func void ZS_Babe_Dance_End()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Babe_Dance_End");
};
