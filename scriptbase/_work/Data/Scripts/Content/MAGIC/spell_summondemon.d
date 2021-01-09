//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_SummonDemon(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_SummonDemon");
	
	if (manaInvested >= SPL_SENDCAST_SUMMONDEMON) 		
	{ 
		if (Npc_IsPlayer(self))
		{
			PrintDebugNpc		(PD_MAGIC,	"...beschwört von Spieler");
			Wld_SpawnNpcRange	(self,SummonedByPC_Demon,1,1000);
		}
		else
		{
			PrintDebugNpc		(PD_MAGIC,	"...beschwört von NSC");
			Wld_SpawnNpcRange	(self,SummonedByNPC_Demon,1,1000);
		};
		
		return SPL_SENDCAST;
	}
	else
	{ 
		return SPL_NEXTLEVEL;
	};
};