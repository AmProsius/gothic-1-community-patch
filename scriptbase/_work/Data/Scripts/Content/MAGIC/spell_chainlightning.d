//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_ChainLightning(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_ChainLightning");
	
	// Bei diesen 3: Standardverhalten: Kann ohne Obergrenze investiert werden.// Logik vom Programm
	// Windfaust
	// Lightning 	: Abbruchlogik "selber Treffen" und Auswaehlen der Opfer vom Programm (mehrere "other"--> other immer nur der erste)
	// Telekinese 	: 
	
	return SPL_NEXTLEVEL;
};