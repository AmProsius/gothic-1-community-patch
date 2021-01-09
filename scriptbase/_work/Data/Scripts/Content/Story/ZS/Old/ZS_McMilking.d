func void ZS_MCMilking	()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_MCMilking" );
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode f¸r den Zustand
	AI_GotoWP (self,self.wp);			// Gehe zum Tagesablaufstart
};	

func void ZS_MCMilking_Loop ()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_MCMilking_Loop" );
    
	var string hlpwp1;					//Deklaration Hilfsvariablen des Types String f¸r die Zwischenspeicherung von Wegpunkten
	var string hlpwp2;					//Deklaration Hilfsvariablen des Types String f¸r die Zwischenspeicherung von Wegpunkten
	hlpwp1 = Npc_GetNearestWP (self);	// Definition der Hilfsvars
	hlpwp2 = Npc_GetNextWP (self);		// Definition der Hilfsvars
	AI_GotoWP (self,hlpwp1);			// Begib Dich zur Position der ersten Hilfsvariable
	AI_GotoWP (self,hlpwp2);			// Begib Dich zur Position der zweiten Hilfsvariable
	if (!(Hlp_StrCmp (Npc_GetNearestWP (self) ,hlpwp1)) && (!( Hlp_StrCmp (Npc_GetNearestWP (self) , hlpwp2))))
	/* 	Sollte der neu ermittelte Wegpunkt verschieden von den beiden schon ermittelten sein tu dies
		hier wird ein wenig Varianz in den angesteuerten Wegpunkten erreicht, um die Crawler besser 
		zu finden*/
	{
	
		AI_GotoWP (self,Npc_GetNearestWP (self)); // Da der alte nearestWp nicht der neue NearestWp ist --> ansteuern 
		if (Wld_DetectNpc (self,-1,NOFUNC,GIL_MINECRAWLER))// hier fehlt die Abfrage auf eine andere Npc Instanz
		{
			PrintDebugNpc(PD_TA_CHECK,"Wie soll ich die Zangen nehmen ?");// Hier muﬂ man das Inventory des Minecrawlers ausnehmen
			AI_PlayAni (self,"T_SEARCH");
		};
	}
	else // sollte das if nicht stimmen tu dies
	{
		AI_GotoWP (self,Npc_GetNextWP (other));	// Nimm den Next Waypoint des Players und gehe dorthin
		AI_Wait (self,10);
	};
};

func void ZS_MCMilking_End	()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_MCMilking_End" );
};