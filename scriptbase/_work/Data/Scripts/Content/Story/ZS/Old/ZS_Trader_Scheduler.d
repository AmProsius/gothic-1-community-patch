func void ZS_Trader_Scheduler ()
{
	if (Wld_IsTime				(9, 0, 17, 0) )
	{
		AI_StartState (self, ZS_HangAround, 	1, "");
	}
	else if (Wld_IsTime			(17, 0, 18, 0) )
	{
		AI_StartState (self, ZS_Eat, 		1, "");
	}
	else if (Wld_IsTime			(18, 0, 9, 0) )
	{
		AI_StartState (self, ZS_Sleep, 		1, "");
	};
};