//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_Sleep		(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Sleep");

	if (C_NpcIsHuman(other))
	{
		if (manaInvested >= SPL_SENDCAST_SLEEP)
		{
			AI_StartState	(other, ZS_MagicSleep, 0, "");
			
			return SPL_SENDCAST;
		};
	
		return SPL_RECEIVEINVEST;
	}
	else
	{
		return SPL_DONTINVEST;
	};

};



