//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_Shrink		(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Shrink");
	
	if (C_NpcIsMonster(other) && (other.aivar[AIV_MM_ShrinkState]==0) )		// nur auf bisher ungeschrumpfte Monster!
	{
		PrintDebugNpc	(PD_MAGIC,	"...Ziel ist Monster!");
		if ( manaInvested >= SPL_SENDCAST_SHRINK	)
		{
			Npc_SendSinglePerc ( self, other, PERC_ASSESSMAGIC);
			return 		SPL_SENDCAST;
		};
		
		//	SPL_NEXTLEVEL wird benötigt um den Spell auf Level 1 zu setzen,
		//	da die Spells sonst Level0 haben und keinen Schaden machen, bzw. keinen Invest-PFX triggern
		return 			SPL_NEXTLEVEL;
	}
	else
	{	
		PrintDebugNpc	(PD_MAGIC,	"...Ziel ist KEIN Monster!");
		return 			SPL_SENDSTOP;
	};
};