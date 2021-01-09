//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es k�nnen keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgef�hrt, es k�nnen weitere Invest kommen, zB.bei Heal nach jedem P�ppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den n�chsten Level

func int Spell_Logic_Teleport4(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Teleport4");
	
	// -------- Teleportieren im Ork-Friedhof --------
	if (Kapitel < 5)
	{
		//---- funzt nur in der N�he der Geheimt�r ----
		if (Npc_GetDistToWP(self, "GRYD_060")>600)
		{
			return SPL_DONTINVEST;
		};
		
		if (manaInvested>= SPL_SENDCAST_TELEPORT)
		{
			AI_Teleport		(self, "GRYD_072");
			AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
			
			return SPL_SENDCAST;
		};
		
		return SPL_NEXTLEVEL;
	}

	// -------- Teleportieren in der Orkstadt --------
	else
	{
		if (manaInvested>= SPL_SENDCAST_TELEPORT)
		{
			AI_Teleport		(self, "OW_SLEEPERENTRANCE");		// in den Vorraum zum Alten Tempel
			AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
			
			return SPL_SENDCAST;
		};
		
		return SPL_NEXTLEVEL;
	};	
};