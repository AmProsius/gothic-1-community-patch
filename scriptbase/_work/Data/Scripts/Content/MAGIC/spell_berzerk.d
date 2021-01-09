//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es k�nnen keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgef�hrt, es k�nnen weitere Invest kommen, zB.bei Heal nach jedem P�ppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den n�chsten Level

func int Spell_Logic_Berzerk	(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Berzerk");
	
	// Immunit�t f�r SLEEPER, DEMON, SKELETONS, ZOMBIES, GOLEM
	if (	(other.guild == GIL_SLF) 		||
			(other.guild == GIL_TROLL)		||
			(other.guild == GIL_DEMON)		||
			(other.guild == GIL_GOLEM)		||
			(other.guild == GIL_SKELETON)	||
			(other.guild == GIL_ZOMBIE)			)
	{
		PrintDebugNpc	(PD_MAGIC, "...Ziel immun!" );	

		return SPL_SENDSTOP;
	}
	else
	{
		if (manaInvested >= SPL_SENDCAST_BERZERK)
		{
			Npc_SendSinglePerc ( self, other, PERC_ASSESSMAGIC);
	
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_RECEIVEINVEST;
		};
	};
};