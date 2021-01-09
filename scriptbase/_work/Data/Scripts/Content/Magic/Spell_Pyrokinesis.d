//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es k�nnen keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgef�hrt, es k�nnen weitere Invest kommen, zB.bei Heal nach jedem P�ppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den n�chsten Level

func int Spell_Logic_Pyrokinesis	(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Pyrokinesis");

	if	( Npc_IsDead(other) 			|| 
		  Npc_IsInState(other,ZS_Unconscious)	||
		(other.guild == GIL_SLF) 		||
		(other.guild == GIL_DEMON)		||
		(other.guild == GIL_GOLEM)		||
		(other.guild == GIL_SKELETON)	||
		(other.guild == GIL_ZOMBIE)	)

	{
		return SPL_SENDSTOP;
	};

	return SPL_NEXTLEVEL;
	
};