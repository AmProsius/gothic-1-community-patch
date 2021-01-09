//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_Heal(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Heal");
	
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) 
	{
		Npc_ChangeAttribute	(self,ATR_HITPOINTS, +SPL_HEALING_HP_PER_MP);
		return SPL_NEXTLEVEL;
	};
	// Kein weiteres Invest mehr möglich -> Der Kerl ist geheilt.
	return SPL_SENDSTOP;
};