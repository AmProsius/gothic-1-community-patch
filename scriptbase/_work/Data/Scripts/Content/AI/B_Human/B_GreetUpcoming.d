func void B_GreetUpcoming ()
// Wie Konzept 5.5.00 // 9.5.00 Wieder wie im Konzept // 6.6.00 Und nochmal
{
	var int greet;
	PrintDebugNpc( PD_ZS_FRAME, "B_GreetUpcoming" );
	if (Npc_CanSeeNpc ( self, other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "B_GreetUpcoming see // First");
		if (Npc_CanSeeNpc	( other, self))
		{
			PrintDebugNpc(PD_ZS_CHECK, "B_GreetUpcoming see // Second");
			if (Npc_GetDistToNpc	(self, other) < PERC_DIST_DIALOG)
			{
				PrintDebugNpc( PD_ZS_CHECK, "B_GreetUpcoming see Dialog");
				B_AssessSc 			();
				B_GuildGreetings 	();
				return;
			};
		};
	};
};